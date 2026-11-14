#ifndef TCP_ETHERNET_H
#define TCP_ETHERNET_H

// ENC28J60 on SPI1 (Flip&Click mikroBUS C), CS RD12, reset RG14, 10.0.0.200
void Ethernet_Transport_Init();
void Ethernet_Transport_Poll();
char Ethernet_Ready();
char *Ethernet_Address();
int Ethernet_HostPut(char ch);

#endif
