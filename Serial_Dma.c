#include "Serial_Dma.h"
#include "Protocol.h"
#include "Tcp_Ethernet.h"

Serial serial;
volatile char rxBuf[SERIAL_TX_SIZE] absolute RXBUFF;
char txBuf[SERIAL_TX_SIZE] = {0} absolute 0xA0002200;

static char serial_tx_dma;
static volatile char host_link = HOST_LINK_SERIAL;
static volatile unsigned int serial_realtime;
static volatile char serial_rx_fault;
static volatile char serial_rx_discard;
static volatile char serial_rx_boundary;
static volatile char serial_rx_bad_line;
static volatile char dma1int_flag;
static char serial_line[LINE_BUFFER_SIZE];
static unsigned int serial_line_length;
static char serial_line_overflow;
static char serial_line_fault;
static char serial_last_cr;

static unsigned long Serial_DisableRxInterrupt(){
#ifdef SERIAL_UART2
  unsigned long enabled = IEC4 & 0x00040000;
  IEC4CLR = 0x00040000;
#else
  unsigned long enabled = IEC5 & 0x00100000;
  IEC5CLR = 0x00100000;
#endif
  return enabled;
}

static void Serial_RestoreRxInterrupt(unsigned long enabled){
#ifdef SERIAL_UART2
  IEC4SET = enabled;
#else
  IEC5SET = enabled;
#endif
}

static void Serial_PollText(const char *text){
  while(*text){
#ifdef SERIAL_UART2
    UART2_Write(*text++);
#else
    UART5_Write(*text++);
#endif
  }
}

void Reset_Ring(){
  unsigned long enabled = Serial_DisableRxInterrupt();
  serial.tail = serial.head;
  serial_realtime = 0;
  serial_rx_fault = serial_rx_discard = serial_rx_boundary = 0;
  serial_rx_bad_line = 0;
  serial_line_length = 0;
  serial_line_overflow = serial_line_fault = serial_last_cr = 0;
  Serial_RestoreRxInterrupt(enabled);
}

char Host_GetLink(){
  return host_link;
}

// Switching drops anything half received from the old link
void Host_SetLink(char link){
  if(link == host_link) return;
  if(serial_tx_dma) while(DMA_IsOn(1));
  host_link = link;
  Reset_Ring();
}

void Serial_Init(char mode){
  IEC4CLR = 0xC0; // Neither DMA channel may consume RX bytes.
  IFS4CLR = 0xC0;
  DCH0CONCLR = 0x80;
  DCH0INTCLR = 0x00FF00FF;
  DCH1CONCLR = 0x80;
  DCH1INTCLR = 0x00FF00FF;
#ifdef SERIAL_UART2
  IEC4CLR = 0x000E0000;
  UART2_Init_Advanced(115200, 200000, _UART_LOW_SPEED, _UART_8BIT_NOPARITY, _UART_ONE_STOPBIT);
  UART_Set_Active(&UART2_Read, &UART2_Write, &UART2_Data_Ready, &UART2_Tx_Idle);
#else
  IEC5CLR = 0x00380000;
  UART5_Init_Advanced(115200, 200000, _UART_HIGH_SPEED, _UART_8BIT_NOPARITY, _UART_ONE_STOPBIT);
  UART_Set_Active(&UART5_Read, &UART5_Write, &UART5_Data_Ready, &UART5_Tx_Idle);
#endif
  Delay_ms(100);
  serial.head = serial.tail = 0;
  rxBuf[0] = 0;
  Reset_Ring();
  dma1int_flag = 0;
  serial_tx_dma = (mode == SERIAL_MODE_RX_IRQ_DMA_TX);
  if(mode != SERIAL_MODE_RX_IRQ_POLL_TX && mode != SERIAL_MODE_RX_IRQ_DMA_TX){
    Serial_PollText("error: Invalid serial mode\r\n");
    return;
  }
  if(serial_tx_dma){
    DMACONCLR = 0x1000;
    DMACONSET = 0x8000;
    DMA1();
  }
#ifdef SERIAL_UART2
  Uart2InterruptSetup();
#else
  Uart5InterruptSetup();
#endif
}

// Stores ch unless that would leave fewer than reserve free slots
static char Serial_Push(char ch, unsigned int reserve){
  unsigned int used;
  if(serial.head >= serial.tail) used = serial.head - serial.tail;
  else used = SERIAL_RX_SIZE - serial.tail + serial.head;
  if(used + 1 + reserve >= SERIAL_RX_SIZE) return 0;
  serial.temp_buffer[serial.head] = ch;
  if(++serial.head == SERIAL_RX_SIZE) serial.head = 0;
  return 1;
}

// Last resort: the reader flushes the whole ring and replies once
static void Serial_HardFault(){
  serial_rx_fault = 1;
  serial_rx_discard = 1;
  serial_rx_boundary = 0;
  serial_rx_bad_line = 0;
}

// A fault marks only the damaged line: the marker goes into the ring and the
// rest of the line is dropped up to its line end, so complete lines already
// queued are kept and the damaged line still gets exactly one reply.
static void Serial_ReceiveFault(){
  if(serial_rx_fault || serial_rx_discard || serial_rx_bad_line) return;
  if(Serial_Push(SERIAL_FAULT_MARK,0)) serial_rx_bad_line = 1;
  else Serial_HardFault();
}

// Line end of a damaged line: store it so the reader replies once
static void Serial_EndBadLine(char ch){
  serial_rx_bad_line = 0;
  if(!Serial_Push(ch,0)){
    Serial_HardFault();
    serial_rx_boundary = 1;
  }
}

static void Serial_ReceiveByte(char ch){
  switch(ch){
    case CMD_STATUS_REPORT: serial_realtime |= EXEC_STATUS_REPORT; return;
    case CMD_CYCLE_START: serial_realtime |= EXEC_CYCLE_START; return;
    case CMD_FEED_HOLD: serial_realtime |= EXEC_FEED_HOLD; return;
    case CMD_RESET: serial_realtime |= EXEC_RESET; return;
  }
  // TODO: Grbl 1.1 extended realtime bytes (0x84 door, 0x85 jog cancel,
  // 0x90-0x9D overrides) are dropped until they have something to drive.
  if((unsigned char)ch >= 0x80) return;
  if(ch == 0 || ch == SERIAL_FAULT_MARK){
    Serial_ReceiveFault();
    return;
  }
  if(serial_rx_bad_line){
    if(ch == '\r' || ch == '\n') Serial_EndBadLine(ch);
    return;
  }
  if(serial_rx_fault || serial_rx_discard){
    if(ch == '\r' || ch == '\n'){
      serial_rx_boundary = 1;
      if(!serial_rx_fault) serial_rx_discard = 0;
    }else{
      serial_rx_boundary = 0;
    }
    return;
  }
  // keep one slot free for a fault marker
  if(!Serial_Push(ch,1)){
    Serial_ReceiveFault();
    if(ch == '\r' || ch == '\n'){
      if(serial_rx_bad_line) Serial_EndBadLine(ch);
      else serial_rx_boundary = 1;
    }
  }
}

#ifdef SERIAL_UART2
void Uart2InterruptSetup(){
  IEC4CLR = 0x000E0000;
  U2STACLR = 0xC0;
  IPC36CLR = 0x001F0000;
  IPC36SET = 0x00150000;
  IFS4CLR = 0x000E0000;
  IEC4SET = 0x00040000;
}

void UART2() iv IVT_UART2_RX ilevel 5 ics ICS_SRS {
  unsigned long status;
  char ch;
  IFS4CLR = 0x00040000;
  if(U2STA & 0x2){
    if(host_link == HOST_LINK_SERIAL) Serial_ReceiveFault();
    U2STACLR = 0x2;
  }
  while(U2STA & 0x1){
    status = U2STA;
    ch = U2RXREG;
    if(host_link != HOST_LINK_SERIAL) continue;
    if(status & 0xC) Serial_ReceiveFault();
    else Serial_ReceiveByte(ch);
  }
}
#else
void Uart5InterruptSetup(){
  IEC5CLR = 0x00380000;
  U5STACLR = 0xC0;
  IPC45CLR = 0x1F;
  IPC45SET = 0x15;
  IFS5CLR = 0x00380000;
  IEC5SET = 0x00100000;
}

void UART5() iv IVT_UART5_RX ilevel 5 ics ICS_SRS {
  unsigned long status;
  char ch;
  IFS5CLR = 0x00100000;
  if(U5STA & 0x2){
    if(host_link == HOST_LINK_SERIAL) Serial_ReceiveFault();
    U5STACLR = 0x2;
  }
  while(U5STA & 0x1){
    status = U5STA;
    ch = U5RXREG;
    if(host_link != HOST_LINK_SERIAL) continue;
    if(status & 0xC) Serial_ReceiveFault();
    else Serial_ReceiveByte(ch);
  }
}
#endif

// Same path as the RX interrupt, with that interrupt held off meanwhile
void Host_ReceiveBytes(char *bytes, unsigned int n){
  unsigned long enabled;
  if(host_link != HOST_LINK_ETHERNET) return;
  enabled = Serial_DisableRxInterrupt();
  while(n--) Serial_ReceiveByte(*bytes++);
  Serial_RestoreRxInterrupt(enabled);
}

unsigned int Serial_TakeRealtime(){
  unsigned int flags;
  unsigned long enabled = Serial_DisableRxInterrupt();
  flags = serial_realtime;
  serial_realtime = 0;
  Serial_RestoreRxInterrupt(enabled);
  return flags;
}

unsigned int Serial_PeekRealtime(){
  return serial_realtime;
}

char Serial_TakeStatusRequest(){
  char taken;
  unsigned long enabled = Serial_DisableRxInterrupt();
  taken = (serial_realtime & EXEC_STATUS_REPORT) != 0;
  serial_realtime &= ~EXEC_STATUS_REPORT;
  Serial_RestoreRxInterrupt(enabled);
  return taken;
}

int Get_Head_Value(){
  return serial.head;
}

int Get_Tail_Value(){
  return serial.tail;
}

int Get_Difference(){
  unsigned int head = serial.head;
  if(head >= serial.tail) return head - serial.tail;
  return SERIAL_RX_SIZE - serial.tail + head;
}

// Fault acknowledgement and reading a byte share the same RX interrupt lock.
static int Serial_ReadByte(char *ch){
  unsigned long enabled = Serial_DisableRxInterrupt();
  int result = 0;
  if(serial_rx_fault){
    serial.tail = serial.head;
    serial_rx_discard = !serial_rx_boundary;
    serial_rx_fault = serial_rx_boundary = 0;
    result = SERIAL_LINE_RX_ERROR;
  }else if(serial.tail != serial.head){
    *ch = serial.temp_buffer[serial.tail];
    serial.tail++;
    if(serial.tail == SERIAL_RX_SIZE) serial.tail = 0;
    result = SERIAL_LINE_READY;
  }
  Serial_RestoreRxInterrupt(enabled);
  return result;
}

int Serial_ReadLine(char *line){
  char ch;
  int result;
  while((result = Serial_ReadByte(&ch)) != SERIAL_LINE_NONE){
    if(result == SERIAL_LINE_RX_ERROR){
      serial_line_length = 0;
      serial_line_overflow = serial_line_fault = serial_last_cr = 0;
      return result;
    }
    if(ch == SERIAL_FAULT_MARK){
      serial_line_fault = 1;
      continue;
    }
    if(ch == '\n' && serial_last_cr){
      serial_last_cr = 0;
      continue;
    }
    serial_last_cr = (ch == '\r');
    if(ch == '\r' || ch == '\n'){
      if(serial_line_fault){
        serial_line_length = 0;
        serial_line_overflow = serial_line_fault = 0;
        return SERIAL_LINE_RX_ERROR;
      }
      if(serial_line_overflow){
        serial_line_length = 0;
        serial_line_overflow = 0;
        return SERIAL_LINE_TOO_LONG;
      }
      serial_line[serial_line_length] = 0;
      strcpy(line, serial_line);
      serial_line_length = 0;
      return SERIAL_LINE_READY;
    }
    if(serial_line_length < LINE_BUFFER_SIZE - 1){
      serial_line[serial_line_length++] = ch;
    }else{
      serial_line_overflow = 1;
    }
  }
  return SERIAL_LINE_NONE;
}

void DMA1(){
  IEC4CLR = 0x80;
  IFS4CLR = 0x80;
  DCH1CON = 0x3;
#ifdef SERIAL_UART2
  U2STACLR = 0xC000;
  DCH1ECON = (147 << 8) | 0x10;
  DCH1DSA = KVA_TO_PA(0xBF822220);
#else
  U5STACLR = 0xC000;
  DCH1ECON = (181 << 8) | 0x10;
  DCH1DSA = KVA_TO_PA(0xBF822820);
#endif
  DCH1SSA = KVA_TO_PA(0xA0002200);
  DCH1SSIZ = SERIAL_TX_SIZE;
  DCH1DSIZ = 1;
  DCH1CSIZ = 1;
  IPC33CLR = 0x1F000000;
  IPC33SET = 0x16000000;
  DCH1INTCLR = 0x00FF00FF;
  DCH1INTSET = 0x00090000;
  IEC4SET = 0x80;
}

char DMA1_Flag(){
  return dma1int_flag;
}

unsigned int DMA1_Enable(){
  DCH1CONSET = 0x80;
  return (DCH1CON & 0x80) >> 7;
}

void DMA1_Disable(){
  DCH1ECONSET = 0x40;
}

// CHEN remains set between cells, unlike CHBUSY. Include the last active cell.
unsigned int DMA_IsOn(int channel){
  if(channel == 0) return (DCH0CON & 0x8080) != 0;
  return (DCH1CON & 0x8080) != 0;
}

unsigned int DMA_Suspend(){
  DMACONSET = 0x1000;
  return (DMACON & 0x1000) >> 12;
}

unsigned int DMA_Resume(){
  DMACONCLR = 0x1000;
  return (DMACON & 0x1000) >> 12;
}

unsigned int DMA_Busy(){
  return (DMACON & 0x800) >> 11;
}

void DMA_CH1_ISR() iv IVT_DMA1 ilevel 5 ics ICS_SRS {
  dma1int_flag |= DCH1INT & 0xFF;
  if(DCH1INT & 0x8){
    DCH1CONCLR = 0x80;
  }
  if(DCH1INT & 0x1){
    DCH1ECONSET = 0x40;
    DCH1CONCLR = 0x80;
  }
  DCH1INTCLR = 0xFF;
  IFS4CLR = 0x80;
}

static int Serial_WaitTx(){
  while(DMA_IsOn(1));
  if((dma1int_flag | DCH1INT) & 0x1){
    dma1int_flag = 0;
    Serial_PollText("error: DMA transmit failure\r\n");
    return 0;
  }
  return 1;
}

static void Serial_FlushTx(unsigned int *used){
  if(*used){
    dma1int_flag = 0;
    DCH1INTCLR = 0xFF;
    IFS4CLR = 0x80;
    DCH1SSIZ = *used;
    DMA1_Enable();
    *used = 0;
  }
}

static int Serial_PutChar(char ch, unsigned int *used){
  if(host_link == HOST_LINK_ETHERNET) return Ethernet_HostPut(ch);
  if(!serial_tx_dma){
#ifdef SERIAL_UART2
    UART2_Write(ch);
#else
    UART5_Write(ch);
#endif
    return 1;
  }
  if(*used == 0 && !Serial_WaitTx()) return 0;
  txBuf[(*used)++] = ch;
  if(*used == SERIAL_TX_SIZE) Serial_FlushTx(used);
  return 1;
}

int dma_printf(const char *str,...){
  va_list va;
  unsigned int used = 0;
  int count = 0;
  char tmp[384];
  char *text;
  char ch;
  if(!str){
    Serial_PollText("error: Invalid serial format\r\n");
    return -1;
  }
  va_start(va,str);
  while(*str){
    ch = *str++;
    if(ch != '%'){
      if(!Serial_PutChar(ch,&used)) goto tx_error;
      count++;
      continue;
    }
    ch = *str++;
    text = tmp;
    switch(ch){
      case '%': tmp[0] = '%'; tmp[1] = 0; break;
      case 'c':
        if(!Serial_PutChar(va_arg(va,char),&used)) goto tx_error;
        count++;
        continue;
      case 'd': sprintf(tmp,"%d",va_arg(va,int)); break;
      case 'u': sprintf(tmp,"%u",va_arg(va,unsigned int)); break;
      case 'l': sprintf(tmp,"%ld",va_arg(va,long)); break;
      case 'X': sprintf(tmp,"%X",va_arg(va,unsigned int)); break;
      case 'f': sprintf(tmp,"%08.3f",va_arg(va,float)); break;
      case 'F': sprintf(tmp,"%E",va_arg(va,double)); break;
      case 'p': sprintf(tmp,"%p",va_arg(va,void*)); break;
      case 's':
        text = va_arg(va,char*);
        if(!text) text = "(null)";
        break;
      default:
        if(serial_tx_dma && !Serial_WaitTx()) return -1;
        Serial_PollText("error: Invalid serial format\r\n");
        return -1;
    }
    while(*text){
      if(!Serial_PutChar(*text++,&used)) goto tx_error;
      count++;
    }
  }
  if(serial_tx_dma) Serial_FlushTx(&used);
  return count;

tx_error:
  return -1;
}

void lTrim(char *d,char *s){
  int i = 0, j, k = 0;
  j = strlen(s);
  while(*s != '\0'){
    if((*s > 0x30) || k > 0){
      k = 1;
      *d++ = *s;
    }else{
      i++;
    }
    s++;
  }
  if(i == j) *d++ = '0';
  *d = 0;
}
