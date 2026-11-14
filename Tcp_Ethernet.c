#include "Tcp_Ethernet.h"
#include "built_in.h"
#include "Pins.h"
#include "Serial_Dma.h"
#include "Timers.h"

// The installed __EthEnc28j60.h declares a 7 argument SPI_Ethernet_Init, but
// __Lib_EthEnc28j60.emcl takes (mac, ip, fullDuplex) and finds its pins through
// the SPI_Ethernet_CS/_Rst sbits in Pins.c. These mirror the library binary.
typedef struct {
    unsigned canCloseTCP: 1;
    unsigned isBroadcast: 1;
} TEthPktFlags;

#define SPI_Ethernet_HALFDUPLEX 0

extern void SPI_Ethernet_Init(unsigned char *mac, unsigned char *ip,
                              unsigned char fullDuplex);
extern unsigned char SPI_Ethernet_doPacket();
extern unsigned char SPI_Ethernet_getByte();
extern void SPI_Ethernet_putByte(unsigned char b);
// the library ages its ARP cache and TCP close wait on this, bumped each second
extern unsigned long SPI_Ethernet_UserTimerSec;
extern void SPI_Ethernet_confNetwork(unsigned char *ipMask,
                                     unsigned char *gwIpAddr,
                                     unsigned char *dnsIpAddr);

#define ETHERNET_TCP_PORT 23
#define ENC28J60_RCR_ESTAT 0x1D   // read control register opcode | ESTAT
#define ENC28J60_ESTAT_CLKRDY 0x01
#define ENC28J60_ESTAT_UNUSED 0x08 // unimplemented, always reads 0
#define ETHERNET_PROBE_MS 50
#define ETHERNET_TX_SIZE 2048      // power of two, holds a whole $$ listing
#define ETHERNET_TX_MAX 1024       // most bytes sent in one reply
#define ETHERNET_RX_CHUNK 64
// UGS polls '?' every 200 ms, so a quiet host has gone; serial takes over
#define ETHERNET_IDLE_SEC 5

static unsigned char ethernet_mac[6] = {0x02, 0x32, 0x00, 0x00, 0x00, 0x01};
// Addresses are 4 raw bytes, not text: the library reads them directly
static unsigned char ethernet_ip[4] = {10, 0, 0, 200};
static char ethernet_ip_text[] = "10.0.0.200";
static unsigned char ethernet_mask[4] = {255, 255, 255, 0};
static unsigned char ethernet_gateway[4] = {10, 0, 0, 1};
static unsigned char ethernet_dns[4] = {10, 0, 0, 1};

static char ethernet_ready;
static char ethernet_tx[ETHERNET_TX_SIZE];
static unsigned int ethernet_tx_head;
static unsigned int ethernet_tx_tail;
static unsigned char ethernet_host[4];
static unsigned int ethernet_host_port;
static unsigned int ethernet_idle_sec;
static char ethernet_last_tick;

static void Enc28_Config() {
    SPI_Ethernet_CS_Direction = 0;
    SPI_Ethernet_CS = 1;
    SPI_Ethernet_Rst_Direction = 0;
    SPI_Ethernet_Rst = 1;

    // PinMode makes all of PORTD outputs, SDI1 on RD2 must be an input
    TRISD1_bit = 0;
    TRISD2_bit = 1;
    TRISD3_bit = 0;

    SPI1_Init_Advanced(_SPI_MASTER, _SPI_8_BIT, 16,
                       _SPI_SS_DISABLE, _SPI_DATA_SAMPLE_MIDDLE,
                       _SPI_CLK_IDLE_LOW, _SPI_IDLE_2_ACTIVE);
}

static unsigned char Enc28_ReadEstat() {
    unsigned char estat;
    SPI_Ethernet_CS = 0;
    SPI1_Write(ENC28J60_RCR_ESTAT);
    estat = SPI1_Read(0);
    SPI_Ethernet_CS = 1;
    return estat;
}

// The library init waits on the chip forever, so only call it once the chip
// has answered. A missing board reads 0x00 (no CLKRDY) or 0xFF (bit 3 set).
static char Enc28_Present() {
    unsigned int ms;
    unsigned char estat;
    SPI_Ethernet_Rst = 0;
    Delay_ms(1);
    SPI_Ethernet_Rst = 1;
    Delay_ms(1);
    for (ms = 0; ms < ETHERNET_PROBE_MS; ms++) {
        estat = Enc28_ReadEstat();
        if (!(estat & ENC28J60_ESTAT_UNUSED) && (estat & ENC28J60_ESTAT_CLKRDY))
            return 1;
        Delay_ms(1);
    }
    return 0;
}

void Ethernet_Transport_Init() {
    ethernet_ready = 0;
    ethernet_tx_head = ethernet_tx_tail = 0;
    Enc28_Config();
    if (!Enc28_Present()) return;
    // the ENC28J60 cannot auto negotiate, half duplex suits any switch
    SPI_Ethernet_Init(ethernet_mac, ethernet_ip, SPI_Ethernet_HALFDUPLEX);
    SPI_Ethernet_confNetwork(ethernet_mask, ethernet_gateway, ethernet_dns);
    ethernet_ready = 1;
}

static void Ethernet_SetHost(char link) {
    Host_SetLink(link);
    ethernet_tx_head = ethernet_tx_tail = 0;
}

// TMR.clock bit 4 toggles once a second from the Timer1 10 ms tick
static void Ethernet_Seconds() {
    char tick = (TMR.clock >> 4) & 1;
    if (tick == ethernet_last_tick) return;
    ethernet_last_tick = tick;
    SPI_Ethernet_UserTimerSec++;
    if (Host_GetLink() != HOST_LINK_ETHERNET) return;
    if (++ethernet_idle_sec >= ETHERNET_IDLE_SEC) Ethernet_SetHost(HOST_LINK_SERIAL);
}

void Ethernet_Transport_Poll() {
    if (!ethernet_ready) return;
    Ethernet_Seconds();
    SPI_Ethernet_doPacket();
}

char Ethernet_Ready() {
    return ethernet_ready;
}

char *Ethernet_Address() {
    return ethernet_ip_text;
}

// Host replies wait here for the TCP sender; 0 when full
int Ethernet_HostPut(char ch) {
    unsigned int next = (ethernet_tx_head + 1) & (ETHERNET_TX_SIZE - 1);
    if (next == ethernet_tx_tail) return 0;
    ethernet_tx[ethernet_tx_head] = ch;
    ethernet_tx_head = next;
    return 1;
}

static char Ethernet_IsHost(unsigned char *remoteHost) {
    return remoteHost[0] == ethernet_host[0] && remoteHost[1] == ethernet_host[1] &&
           remoteHost[2] == ethernet_host[2] && remoteHost[3] == ethernet_host[3];
}

// The library has no send-at-will for TCP: data only leaves as the reply to an
// incoming segment. Host_ServiceNow answers the segment's own request before
// the reply goes; later output (a deferred ok) rides on the next segment, and
// UGS's 200 ms '?' poll keeps segments coming. One computer owns the link;
// another is ignored until the owner goes quiet. A new connection from the
// owner (a UGS reconnect) starts a fresh session.
unsigned int SPI_Ethernet_UserTCP(unsigned char *remoteHost,
                                  unsigned int remotePort,
                                  unsigned int localPort,
                                  unsigned int reqLength,
                                  TEthPktFlags *flags) {
    char bytes[ETHERNET_RX_CHUNK];
    unsigned int n, sent;

    if (localPort != ETHERNET_TCP_PORT) return 0;
    if (Host_GetLink() == HOST_LINK_ETHERNET && !Ethernet_IsHost(remoteHost))
        return 0;
    flags->canCloseTCP = 0;
    if (reqLength == 0 && Host_GetLink() != HOST_LINK_ETHERNET) return 0;

    if (Host_GetLink() != HOST_LINK_ETHERNET) {
        memcpy(ethernet_host, remoteHost, 4);
        ethernet_host_port = remotePort;
        Ethernet_SetHost(HOST_LINK_ETHERNET);
    } else if (remotePort != ethernet_host_port) {
        if (reqLength == 0) return 0;
        ethernet_host_port = remotePort;
        Reset_Ring();
        ethernet_tx_head = ethernet_tx_tail = 0;
    }
    ethernet_idle_sec = 0;

    while (reqLength > 0) {
        n = reqLength < ETHERNET_RX_CHUNK ? reqLength : ETHERNET_RX_CHUNK;
        reqLength -= n;
        sent = 0;
        while (sent < n) bytes[sent++] = SPI_Ethernet_getByte();
        Host_ReceiveBytes(bytes, n);
    }
    Host_ServiceNow();

    sent = 0;
    while (ethernet_tx_tail != ethernet_tx_head && sent < ETHERNET_TX_MAX) {
        SPI_Ethernet_putByte(ethernet_tx[ethernet_tx_tail]);
        ethernet_tx_tail = (ethernet_tx_tail + 1) & (ETHERNET_TX_SIZE - 1);
        sent++;
    }
    return sent;
}

unsigned int SPI_Ethernet_UserUDP(unsigned char *remoteHost,
                                  unsigned int remotePort,
                                  unsigned int localPort,
                                  unsigned int reqLength,
                                  TEthPktFlags *flags) {
    return 0;
}
