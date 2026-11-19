#pragma once

/*
 * AUTO GENERATED
 * Source: P32MZ2048EFH100.cp
 * Do not edit manually.
 */

#ifdef __INTELLISENSE__

#define _FLASH_ERASE 0x4000
#define _FLASH_WRITE_LATCH 0x0800
#define IVT_CORE_TIMER 0x0000
#define IVT_CORE_SOFTWARE_0 0x0001
#define IVT_CORE_SOFTWARE_1 0x0002
#define IVT_EXTERNAL_0 0x0003
#define IVT_TIMER_1 0x0004
#define IVT_INPUT_CAPTURE_1_ERROR 0x0005
#define IVT_INPUT_CAPTURE_1 0x0006
#define IVT_OUTPUT_COMPARE_1 0x0007
#define IVT_EXTERNAL_1 0x0008
#define IVT_TIMER_2 0x0009
#define IVT_INPUT_CAPTURE_2_ERROR 0x000A
#define IVT_INPUT_CAPTURE_2 0x000B
#define IVT_OUTPUT_COMPARE_2 0x000C
#define IVT_EXTERNAL_2 0x000D
#define IVT_TIMER_3 0x000E
#define IVT_INPUT_CAPTURE_3_ERROR 0x000F
#define IVT_INPUT_CAPTURE_3 0x0010
#define IVT_OUTPUT_COMPARE_3 0x0011
#define IVT_EXTERNAL_3 0x0012
#define IVT_TIMER_4 0x0013
#define IVT_INPUT_CAPTURE_4_ERROR 0x0014
#define IVT_INPUT_CAPTURE_4 0x0015
#define IVT_OUTPUT_COMPARE_4 0x0016
#define IVT_EXTERNAL_4 0x0017
#define IVT_TIMER_5 0x0018
#define IVT_INPUT_CAPTURE_5_ERROR 0x0019
#define IVT_INPUT_CAPTURE_5 0x001A
#define IVT_OUTPUT_COMPARE_5 0x001B
#define IVT_TIMER_6 0x001C
#define IVT_INPUT_CAPTURE_6_ERROR 0x001D
#define IVT_INPUT_CAPTURE_6 0x001E
#define IVT_OUTPUT_COMPARE_6 0x001F
#define IVT_TIMER_7 0x0020
#define IVT_INPUT_CAPTURE_7_ERROR 0x0021
#define IVT_INPUT_CAPTURE_7 0x0022
#define IVT_OUTPUT_COMPARE_7 0x0023
#define IVT_TIMER_8 0x0024
#define IVT_INPUT_CAPTURE_8_ERROR 0x0025
#define IVT_INPUT_CAPTURE_8 0x0026
#define IVT_OUTPUT_COMPARE_8 0x0027
#define IVT_TIMER_9 0x0028
#define IVT_INPUT_CAPTURE_9_ERROR 0x0029
#define IVT_INPUT_CAPTURE_9 0x002A
#define IVT_OUTPUT_COMPARE_9 0x002B
#define IVT_ADC 0x002C
#define IVT_ADC_FIFO 0x002D
#define IVT_ADC_DC1 0x002E
#define IVT_ADC_DC2 0x002F
#define IVT_ADC_DC3 0x0030
#define IVT_ADC_DC4 0x0031
#define IVT_ADC_DC5 0x0032
#define IVT_ADC_DC6 0x0033
#define IVT_ADC_DF1 0x0034
#define IVT_ADC_DF2 0x0035
#define IVT_ADC_DF3 0x0036
#define IVT_ADC_DF4 0x0037
#define IVT_ADC_DF5 0x0038
#define IVT_ADC_DF6 0x0039
#define IVT_ADC_FAULT 0x003A
#define IVT_ADC_DATA0 0x003B
#define IVT_ADC_DATA1 0x003C
#define IVT_ADC_DATA2 0x003D
#define IVT_ADC_DATA3 0x003E
#define IVT_ADC_DATA4 0x003F
#define IVT_ADC_DATA5 0x0040
#define IVT_ADC_DATA6 0x0041
#define IVT_ADC_DATA7 0x0042
#define IVT_ADC_DATA8 0x0043
#define IVT_ADC_DATA9 0x0044
#define IVT_ADC_DATA10 0x0045
#define IVT_ADC_DATA11 0x0046
#define IVT_ADC_DATA12 0x0047
#define IVT_ADC_DATA13 0x0048
#define IVT_ADC_DATA14 0x0049
#define IVT_ADC_DATA15 0x004A
#define IVT_ADC_DATA16 0x004B
#define IVT_ADC_DATA17 0x004C
#define IVT_ADC_DATA18 0x004D
#define IVT_ADC_DATA19 0x004E
#define IVT_ADC_DATA20 0x004F
#define IVT_ADC_DATA21 0x0050
#define IVT_ADC_DATA22 0x0051
#define IVT_ADC_DATA23 0x0052
#define IVT_ADC_DATA24 0x0053
#define IVT_ADC_DATA25 0x0054
#define IVT_ADC_DATA26 0x0055
#define IVT_ADC_DATA27 0x0056
#define IVT_ADC_DATA28 0x0057
#define IVT_ADC_DATA29 0x0058
#define IVT_ADC_DATA30 0x0059
#define IVT_ADC_DATA31 0x005A
#define IVT_ADC_DATA32 0x005B
#define IVT_ADC_DATA33 0x005C
#define IVT_ADC_DATA34 0x005D
#define IVT_RESERVED94 0x005E
#define IVT_RESERVED95 0x005F
#define IVT_RESERVED96 0x0060
#define IVT_RESERVED97 0x0061
#define IVT_RESERVED98 0x0062
#define IVT_RESERVED99 0x0063
#define IVT_RESERVED100 0x0064
#define IVT_RESERVED101 0x0065
#define IVT_ADC_DATA43 0x0066
#define IVT_ADC_DATA44 0x0067
#define IVT_CORE_PERF_COUNT 0x0068
#define IVT_CORE_FAST_DEBUG_CHAN 0x0069
#define IVT_SYSTEM_BUS_PROTECTION 0x006A
#define IVT_RESERVED107 0x006B
#define IVT_RESERVED108 0x006C
#define IVT_SPI1_FAULT 0x006D
#define IVT_SPI1_RX 0x006E
#define IVT_SPI1_TX 0x006F
#define IVT_UART1_FAULT 0x0070
#define IVT_UART1_RX 0x0071
#define IVT_UART1_TX 0x0072
#define IVT_I2C1_BUS 0x0073
#define IVT_I2C1_SLAVE 0x0074
#define IVT_I2C1_MASTER 0x0075
#define IVT_CHANGE_NOTICE_A 0x0076
#define IVT_CHANGE_NOTICE_B 0x0077
#define IVT_CHANGE_NOTICE_C 0x0078
#define IVT_CHANGE_NOTICE_D 0x0079
#define IVT_CHANGE_NOTICE_E 0x007A
#define IVT_CHANGE_NOTICE_F 0x007B
#define IVT_CHANGE_NOTICE_G 0x007C
#define IVT_RESERVED125 0x007D
#define IVT_RESERVED126 0x007E
#define IVT_RESERVED127 0x007F
#define IVT_PMP 0x0080
#define IVT_PMP_ERROR 0x0081
#define IVT_COMPARATOR_1 0x0082
#define IVT_COMPARATOR_2 0x0083
#define IVT_USB 0x0084
#define IVT_USB_DMA 0x0085
#define IVT_DMA0 0x0086
#define IVT_DMA1 0x0087
#define IVT_DMA2 0x0088
#define IVT_DMA3 0x0089
#define IVT_DMA4 0x008A
#define IVT_DMA5 0x008B
#define IVT_DMA6 0x008C
#define IVT_DMA7 0x008D
#define IVT_SPI2_FAULT 0x008E
#define IVT_SPI2_RX 0x008F
#define IVT_SPI2_TX 0x0090
#define IVT_UART2_FAULT 0x0091
#define IVT_UART2_RX 0x0092
#define IVT_UART2_TX 0x0093
#define IVT_I2C2_BUS 0x0094
#define IVT_I2C2_SLAVE 0x0095
#define IVT_I2C2_MASTER 0x0096
#define IVT_CAN1 0x0097
#define IVT_CAN2 0x0098
#define IVT_ETHERNET 0x0099
#define IVT_SPI3_FAULT 0x009A
#define IVT_SPI3_RX 0x009B
#define IVT_SPI3_TX 0x009C
#define IVT_UART3_FAULT 0x009D
#define IVT_UART3_RX 0x009E
#define IVT_UART3_TX 0x009F
#define IVT_I2C3_BUS 0x00A0
#define IVT_I2C3_SLAVE 0x00A1
#define IVT_I2C3_MASTER 0x00A2
#define IVT_SPI4_FAULT 0x00A3
#define IVT_SPI4_RX 0x00A4
#define IVT_SPI4_TX 0x00A5
#define IVT_RTCC 0x00A6
#define IVT_FLASH_CONTROL 0x00A7
#define IVT_PREFETCH 0x00A8
#define IVT_SQI1 0x00A9
#define IVT_UART4_FAULT 0x00AA
#define IVT_UART4_RX 0x00AB
#define IVT_UART4_TX 0x00AC
#define IVT_I2C4_BUS 0x00AD
#define IVT_I2C4_SLAVE 0x00AE
#define IVT_I2C4_MASTER 0x00AF
#define IVT_SPI5_FAULT 0x00B0
#define IVT_SPI5_RX 0x00B1
#define IVT_SPI5_TX 0x00B2
#define IVT_UART5_FAULT 0x00B3
#define IVT_UART5_RX 0x00B4
#define IVT_UART5_TX 0x00B5
#define IVT_I2C5_BUS 0x00B6
#define IVT_I2C5_SLAVE 0x00B7
#define IVT_I2C5_MASTER 0x00B8
#define IVT_SPI6_FAULT 0x00B9
#define IVT_SPI6_RX 0x00BA
#define IVT_SPI6_TX 0x00BB
#define IVT_UART6_FAULT 0x00BC
#define IVT_UART6_RX 0x00BD
#define IVT_UART6_TX 0x00BE
#define IVT_RESERVED191 0x00BF
#define IVT_ADC_EOS 0x00C0
#define IVT_ADC_ARDY 0x00C1
#define IVT_ADC_URDY 0x00C2
#define IVT_RESERVED195 0x00C3
#define IVT_ADC_EARLY 0x00C4
#define IVT_RESERVED197 0x00C5
#define IVT_ADC0_EARLY 0x00C6
#define IVT_ADC1_EARLY 0x00C7
#define IVT_ADC2_EARLY 0x00C8
#define IVT_ADC3_EARLY 0x00C9
#define IVT_ADC4_EARLY 0x00CA
#define IVT_RESERVED203 0x00CB
#define IVT_RESERVED204 0x00CC
#define IVT_ADC7_EARLY 0x00CD
#define IVT_ADC0_WARM 0x00CE
#define IVT_ADC1_WARM 0x00CF
#define IVT_ADC2_WARM 0x00D0
#define IVT_ADC3_WARM 0x00D1
#define IVT_ADC4_WARM 0x00D2
#define IVT_RESERVED211 0x00D3
#define IVT_RESERVED212 0x00D4
#define IVT_ADC7_WARM 0x00D5
#define TDOEN 0
extern volatile unsigned int TDOEN_bit;
#define TROEN 2
extern volatile unsigned int TROEN_bit;
#define JTAGEN 3
extern volatile unsigned int JTAGEN_bit;
#define ECCCON0 4
extern volatile unsigned int ECCCON0_bit;
#define ECCCON1 5
extern volatile unsigned int ECCCON1_bit;
#define IOANCPN 7
extern volatile unsigned int IOANCPN_bit;
#define USBSSEN 8
extern volatile unsigned int USBSSEN_bit;
#define PGLOCK 11
extern volatile unsigned int PGLOCK_bit;
#define PMDLOCK 12
extern volatile unsigned int PMDLOCK_bit;
#define IOLOCK 13
extern volatile unsigned int IOLOCK_bit;
#define OCACLK 16
extern volatile unsigned int OCACLK_bit;
#define ICACLK 17
extern volatile unsigned int ICACLK_bit;
#define CPUPRI 24
extern volatile unsigned int CPUPRI_bit;
#define DMAPRI 25
extern volatile unsigned int DMAPRI_bit;
#define IOANCPEN 7
extern volatile unsigned int IOANCPEN_bit;
#define DEVID0 0
extern volatile unsigned int DEVID0_bit;
#define DEVID1 1
extern volatile unsigned int DEVID1_bit;
#define DEVID2 2
extern volatile unsigned int DEVID2_bit;
#define DEVID3 3
extern volatile unsigned int DEVID3_bit;
#define DEVID4 4
extern volatile unsigned int DEVID4_bit;
#define DEVID5 5
extern volatile unsigned int DEVID5_bit;
#define DEVID6 6
extern volatile unsigned int DEVID6_bit;
#define DEVID7 7
extern volatile unsigned int DEVID7_bit;
#define DEVID8 8
extern volatile unsigned int DEVID8_bit;
#define DEVID9 9
extern volatile unsigned int DEVID9_bit;
#define DEVID10 10
extern volatile unsigned int DEVID10_bit;
#define DEVID11 11
extern volatile unsigned int DEVID11_bit;
#define DEVID12 12
extern volatile unsigned int DEVID12_bit;
#define DEVID13 13
extern volatile unsigned int DEVID13_bit;
#define DEVID14 14
extern volatile unsigned int DEVID14_bit;
#define DEVID15 15
extern volatile unsigned int DEVID15_bit;
#define DEVID16 16
extern volatile unsigned int DEVID16_bit;
#define DEVID17 17
extern volatile unsigned int DEVID17_bit;
#define DEVID18 18
extern volatile unsigned int DEVID18_bit;
#define DEVID19 19
extern volatile unsigned int DEVID19_bit;
#define DEVID20 20
extern volatile unsigned int DEVID20_bit;
#define DEVID21 21
extern volatile unsigned int DEVID21_bit;
#define DEVID22 22
extern volatile unsigned int DEVID22_bit;
#define DEVID23 23
extern volatile unsigned int DEVID23_bit;
#define DEVID24 24
extern volatile unsigned int DEVID24_bit;
#define DEVID25 25
extern volatile unsigned int DEVID25_bit;
#define DEVID26 26
extern volatile unsigned int DEVID26_bit;
#define DEVID27 27
extern volatile unsigned int DEVID27_bit;
#define VER0 28
extern volatile unsigned int VER0_bit;
#define VER1 29
extern volatile unsigned int VER1_bit;
#define VER2 30
extern volatile unsigned int VER2_bit;
#define VER3 31
extern volatile unsigned int VER3_bit;
#define SYSKEY0 0
extern volatile unsigned int SYSKEY0_bit;
#define SYSKEY1 1
extern volatile unsigned int SYSKEY1_bit;
#define SYSKEY2 2
extern volatile unsigned int SYSKEY2_bit;
#define SYSKEY3 3
extern volatile unsigned int SYSKEY3_bit;
#define SYSKEY4 4
extern volatile unsigned int SYSKEY4_bit;
#define SYSKEY5 5
extern volatile unsigned int SYSKEY5_bit;
#define SYSKEY6 6
extern volatile unsigned int SYSKEY6_bit;
#define SYSKEY7 7
extern volatile unsigned int SYSKEY7_bit;
#define SYSKEY8 8
extern volatile unsigned int SYSKEY8_bit;
#define SYSKEY9 9
extern volatile unsigned int SYSKEY9_bit;
#define SYSKEY10 10
extern volatile unsigned int SYSKEY10_bit;
#define SYSKEY11 11
extern volatile unsigned int SYSKEY11_bit;
#define SYSKEY12 12
extern volatile unsigned int SYSKEY12_bit;
#define SYSKEY13 13
extern volatile unsigned int SYSKEY13_bit;
#define SYSKEY14 14
extern volatile unsigned int SYSKEY14_bit;
#define SYSKEY15 15
extern volatile unsigned int SYSKEY15_bit;
#define SYSKEY16 16
extern volatile unsigned int SYSKEY16_bit;
#define SYSKEY17 17
extern volatile unsigned int SYSKEY17_bit;
#define SYSKEY18 18
extern volatile unsigned int SYSKEY18_bit;
#define SYSKEY19 19
extern volatile unsigned int SYSKEY19_bit;
#define SYSKEY20 20
extern volatile unsigned int SYSKEY20_bit;
#define SYSKEY21 21
extern volatile unsigned int SYSKEY21_bit;
#define SYSKEY22 22
extern volatile unsigned int SYSKEY22_bit;
#define SYSKEY23 23
extern volatile unsigned int SYSKEY23_bit;
#define SYSKEY24 24
extern volatile unsigned int SYSKEY24_bit;
#define SYSKEY25 25
extern volatile unsigned int SYSKEY25_bit;
#define SYSKEY26 26
extern volatile unsigned int SYSKEY26_bit;
#define SYSKEY27 27
extern volatile unsigned int SYSKEY27_bit;
#define SYSKEY28 28
extern volatile unsigned int SYSKEY28_bit;
#define SYSKEY29 29
extern volatile unsigned int SYSKEY29_bit;
#define SYSKEY30 30
extern volatile unsigned int SYSKEY30_bit;
#define SYSKEY31 31
extern volatile unsigned int SYSKEY31_bit;
#define ADCMD 0
extern volatile unsigned int ADCMD_bit;
#define CVRMD 12
extern volatile unsigned int CVRMD_bit;
#define CMP1MD 0
extern volatile unsigned int CMP1MD_bit;
#define CMP2MD 1
extern volatile unsigned int CMP2MD_bit;
#define IC1MD 0
extern volatile unsigned int IC1MD_bit;
#define IC2MD 1
extern volatile unsigned int IC2MD_bit;
#define IC3MD 2
extern volatile unsigned int IC3MD_bit;
#define IC4MD 3
extern volatile unsigned int IC4MD_bit;
#define IC5MD 4
extern volatile unsigned int IC5MD_bit;
#define IC6MD 5
extern volatile unsigned int IC6MD_bit;
#define IC7MD 6
extern volatile unsigned int IC7MD_bit;
#define IC8MD 7
extern volatile unsigned int IC8MD_bit;
#define IC9MD 8
extern volatile unsigned int IC9MD_bit;
#define OC1MD 16
extern volatile unsigned int OC1MD_bit;
#define OC2MD 17
extern volatile unsigned int OC2MD_bit;
#define OC3MD 18
extern volatile unsigned int OC3MD_bit;
#define OC4MD 19
extern volatile unsigned int OC4MD_bit;
#define OC5MD 20
extern volatile unsigned int OC5MD_bit;
#define OC6MD 21
extern volatile unsigned int OC6MD_bit;
#define OC7MD 22
extern volatile unsigned int OC7MD_bit;
#define OC8MD 23
extern volatile unsigned int OC8MD_bit;
#define OC9MD 24
extern volatile unsigned int OC9MD_bit;
#define T1MD 0
extern volatile unsigned int T1MD_bit;
#define T2MD 1
extern volatile unsigned int T2MD_bit;
#define T3MD 2
extern volatile unsigned int T3MD_bit;
#define T4MD 3
extern volatile unsigned int T4MD_bit;
#define T5MD 4
extern volatile unsigned int T5MD_bit;
#define T6MD 5
extern volatile unsigned int T6MD_bit;
#define T7MD 6
extern volatile unsigned int T7MD_bit;
#define T8MD 7
extern volatile unsigned int T8MD_bit;
#define T9MD 8
extern volatile unsigned int T9MD_bit;
#define U1MD 0
extern volatile unsigned int U1MD_bit;
#define U2MD 1
extern volatile unsigned int U2MD_bit;
#define U3MD 2
extern volatile unsigned int U3MD_bit;
#define U4MD 3
extern volatile unsigned int U4MD_bit;
#define U5MD 4
extern volatile unsigned int U5MD_bit;
#define U6MD 5
extern volatile unsigned int U6MD_bit;
#define SPI1MD 8
extern volatile unsigned int SPI1MD_bit;
#define SPI2MD 9
extern volatile unsigned int SPI2MD_bit;
#define SPI3MD 10
extern volatile unsigned int SPI3MD_bit;
#define SPI4MD 11
extern volatile unsigned int SPI4MD_bit;
#define SPI5MD 12
extern volatile unsigned int SPI5MD_bit;
#define SPI6MD 13
extern volatile unsigned int SPI6MD_bit;
#define I2C1MD 16
extern volatile unsigned int I2C1MD_bit;
#define I2C2MD 17
extern volatile unsigned int I2C2MD_bit;
#define I2C3MD 18
extern volatile unsigned int I2C3MD_bit;
#define I2C4MD 19
extern volatile unsigned int I2C4MD_bit;
#define I2C5MD 20
extern volatile unsigned int I2C5MD_bit;
#define USBMD 24
extern volatile unsigned int USBMD_bit;
#define CAN1MD 28
extern volatile unsigned int CAN1MD_bit;
#define CAN2MD 29
extern volatile unsigned int CAN2MD_bit;
#define RTCCMD 0
extern volatile unsigned int RTCCMD_bit;
#define REFO1MD 8
extern volatile unsigned int REFO1MD_bit;
#define REFO2MD 9
extern volatile unsigned int REFO2MD_bit;
#define REFO3MD 10
extern volatile unsigned int REFO3MD_bit;
#define REFO4MD 11
extern volatile unsigned int REFO4MD_bit;
#define PMPMD 16
extern volatile unsigned int PMPMD_bit;
#define EBIMD 17
extern volatile unsigned int EBIMD_bit;
#define SQI1MD 23
extern volatile unsigned int SQI1MD_bit;
#define ETHMD 28
extern volatile unsigned int ETHMD_bit;
#define DMAMD 4
extern volatile unsigned int DMAMD_bit;
#define RNGMD 20
extern volatile unsigned int RNGMD_bit;
#define EBIA0EN 0
extern volatile unsigned int EBIA0EN_bit;
#define EBIA1EN 1
extern volatile unsigned int EBIA1EN_bit;
#define EBIA2EN 2
extern volatile unsigned int EBIA2EN_bit;
#define EBIA3EN 3
extern volatile unsigned int EBIA3EN_bit;
#define EBIA4EN 4
extern volatile unsigned int EBIA4EN_bit;
#define EBIA5EN 5
extern volatile unsigned int EBIA5EN_bit;
#define EBIA6EN 6
extern volatile unsigned int EBIA6EN_bit;
#define EBIA7EN 7
extern volatile unsigned int EBIA7EN_bit;
#define EBIA8EN 8
extern volatile unsigned int EBIA8EN_bit;
#define EBIA9EN 9
extern volatile unsigned int EBIA9EN_bit;
#define EBIA10EN 10
extern volatile unsigned int EBIA10EN_bit;
#define EBIA11EN 11
extern volatile unsigned int EBIA11EN_bit;
#define EBIA12EN 12
extern volatile unsigned int EBIA12EN_bit;
#define EBIA13EN 13
extern volatile unsigned int EBIA13EN_bit;
#define EBIA14EN 14
extern volatile unsigned int EBIA14EN_bit;
#define EBIA15EN 15
extern volatile unsigned int EBIA15EN_bit;
#define EBIA16EN 16
extern volatile unsigned int EBIA16EN_bit;
#define EBIA17EN 17
extern volatile unsigned int EBIA17EN_bit;
#define EBIA18EN 18
extern volatile unsigned int EBIA18EN_bit;
#define EBIA19EN 19
extern volatile unsigned int EBIA19EN_bit;
#define EBIPINEN 31
extern volatile unsigned int EBIPINEN_bit;
#define EBIDEN0 0
extern volatile unsigned int EBIDEN0_bit;
#define EBIDEN1 1
extern volatile unsigned int EBIDEN1_bit;
#define EBICSEN0 4
extern volatile unsigned int EBICSEN0_bit;
#define EBIOEEN 12
extern volatile unsigned int EBIOEEN_bit;
#define EBIWEEN 13
extern volatile unsigned int EBIWEEN_bit;
#define EBIRDYLVL 17
extern volatile unsigned int EBIRDYLVL_bit;
#define EBIRDYEN1 25
extern volatile unsigned int EBIRDYEN1_bit;
#define EBIRDYEN2 26
extern volatile unsigned int EBIRDYEN2_bit;
#define EBIRDYEN3 27
extern volatile unsigned int EBIRDYEN3_bit;
#define EBIRDYINV1 29
extern volatile unsigned int EBIRDYINV1_bit;
#define EBIRDYINV2 30
extern volatile unsigned int EBIRDYINV2_bit;
#define EBIRDYINV3 31
extern volatile unsigned int EBIRDYINV3_bit;
#define CPUPG0 0
extern volatile unsigned int CPUPG0_bit;
#define CPUPG1 1
extern volatile unsigned int CPUPG1_bit;
#define DMAPG0 4
extern volatile unsigned int DMAPG0_bit;
#define DMAPG1 5
extern volatile unsigned int DMAPG1_bit;
#define USBPG0 8
extern volatile unsigned int USBPG0_bit;
#define USBPG1 9
extern volatile unsigned int USBPG1_bit;
#define CAN1PG0 12
extern volatile unsigned int CAN1PG0_bit;
#define CAN1PG1 13
extern volatile unsigned int CAN1PG1_bit;
#define CAN2PG0 14
extern volatile unsigned int CAN2PG0_bit;
#define CAN2PG1 15
extern volatile unsigned int CAN2PG1_bit;
#define ETHPG0 16
extern volatile unsigned int ETHPG0_bit;
#define ETHPG1 17
extern volatile unsigned int ETHPG1_bit;
#define SQI1PG0 20
extern volatile unsigned int SQI1PG0_bit;
#define SQI1PG1 21
extern volatile unsigned int SQI1PG1_bit;
#define FCPG0 22
extern volatile unsigned int FCPG0_bit;
#define FCPG1 23
extern volatile unsigned int FCPG1_bit;
#define ICD1PG0 30
extern volatile unsigned int ICD1PG0_bit;
#define ICD1PG1 31
extern volatile unsigned int ICD1PG1_bit;
#define NVMOP0 0
extern volatile unsigned int NVMOP0_bit;
#define NVMOP1 1
extern volatile unsigned int NVMOP1_bit;
#define NVMOP2 2
extern volatile unsigned int NVMOP2_bit;
#define NVMOP3 3
extern volatile unsigned int NVMOP3_bit;
#define BFSWAP 6
extern volatile unsigned int BFSWAP_bit;
#define PFSWAP 7
extern volatile unsigned int PFSWAP_bit;
#define LVDERR 12
extern volatile unsigned int LVDERR_bit;
#define WRERR 13
extern volatile unsigned int WRERR_bit;
#define WREN 14
extern volatile unsigned int WREN_bit;
#define WR 15
extern volatile unsigned int WR_bit;
extern volatile unsigned int NVMOP0_NVMCON_bit;
extern volatile unsigned int NVMOP1_NVMCON_bit;
extern volatile unsigned int NVMOP2_NVMCON_bit;
extern volatile unsigned int NVMOP3_NVMCON_bit;
#define SWAP_ 7
extern volatile unsigned int SWAP_bit;
#define PROGOP0 0
extern volatile unsigned int PROGOP0_bit;
#define PROGOP1 1
extern volatile unsigned int PROGOP1_bit;
#define PROGOP2 2
extern volatile unsigned int PROGOP2_bit;
#define PROGOP3 3
extern volatile unsigned int PROGOP3_bit;
extern volatile unsigned int PROGOP0_NVMCON_bit;
extern volatile unsigned int PROGOP1_NVMCON_bit;
extern volatile unsigned int PROGOP2_NVMCON_bit;
extern volatile unsigned int PROGOP3_NVMCON_bit;
#define PWP0 0
extern volatile unsigned int PWP0_bit;
#define PWP1 1
extern volatile unsigned int PWP1_bit;
#define PWP2 2
extern volatile unsigned int PWP2_bit;
#define PWP3 3
extern volatile unsigned int PWP3_bit;
#define PWP4 4
extern volatile unsigned int PWP4_bit;
#define PWP5 5
extern volatile unsigned int PWP5_bit;
#define PWP6 6
extern volatile unsigned int PWP6_bit;
#define PWP7 7
extern volatile unsigned int PWP7_bit;
#define PWP8 8
extern volatile unsigned int PWP8_bit;
#define PWP9 9
extern volatile unsigned int PWP9_bit;
#define PWP10 10
extern volatile unsigned int PWP10_bit;
#define PWP11 11
extern volatile unsigned int PWP11_bit;
#define PWP12 12
extern volatile unsigned int PWP12_bit;
#define PWP13 13
extern volatile unsigned int PWP13_bit;
#define PWP14 14
extern volatile unsigned int PWP14_bit;
#define PWP15 15
extern volatile unsigned int PWP15_bit;
#define PWP16 16
extern volatile unsigned int PWP16_bit;
#define PWP17 17
extern volatile unsigned int PWP17_bit;
#define PWP18 18
extern volatile unsigned int PWP18_bit;
#define PWP19 19
extern volatile unsigned int PWP19_bit;
#define PWP20 20
extern volatile unsigned int PWP20_bit;
#define PWP21 21
extern volatile unsigned int PWP21_bit;
#define PWP22 22
extern volatile unsigned int PWP22_bit;
#define PWP23 23
extern volatile unsigned int PWP23_bit;
#define PWPULOCK 31
extern volatile unsigned int PWPULOCK_bit;
#define UBWP0 0
extern volatile unsigned int UBWP0_bit;
#define UBWP1 1
extern volatile unsigned int UBWP1_bit;
#define UBWP2 2
extern volatile unsigned int UBWP2_bit;
#define UBWP3 3
extern volatile unsigned int UBWP3_bit;
#define UBWP4 4
extern volatile unsigned int UBWP4_bit;
#define UBWPULOCK 7
extern volatile unsigned int UBWPULOCK_bit;
#define LBWP0 8
extern volatile unsigned int LBWP0_bit;
#define LBWP1 9
extern volatile unsigned int LBWP1_bit;
#define LBWP2 10
extern volatile unsigned int LBWP2_bit;
#define LBWP3 11
extern volatile unsigned int LBWP3_bit;
#define LBWP4 12
extern volatile unsigned int LBWP4_bit;
#define LBWPULOCK 15
extern volatile unsigned int LBWPULOCK_bit;
#define SWAPLOCK0 6
extern volatile unsigned int SWAPLOCK0_bit;
#define SWAPLOCK1 7
extern volatile unsigned int SWAPLOCK1_bit;
#define WDTWINEN 0
extern volatile unsigned int WDTWINEN_bit;
#define RUNDIV0 8
extern volatile unsigned int RUNDIV0_bit;
#define RUNDIV1 9
extern volatile unsigned int RUNDIV1_bit;
#define RUNDIV2 10
extern volatile unsigned int RUNDIV2_bit;
#define RUNDIV3 11
extern volatile unsigned int RUNDIV3_bit;
#define RUNDIV4 12
extern volatile unsigned int RUNDIV4_bit;
#define ON_ 15
extern volatile unsigned int ON_bit;
#define WDTCLRKEY0 16
extern volatile unsigned int WDTCLRKEY0_bit;
#define WDTCLRKEY1 17
extern volatile unsigned int WDTCLRKEY1_bit;
#define WDTCLRKEY2 18
extern volatile unsigned int WDTCLRKEY2_bit;
#define WDTCLRKEY3 19
extern volatile unsigned int WDTCLRKEY3_bit;
#define WDTCLRKEY4 20
extern volatile unsigned int WDTCLRKEY4_bit;
#define WDTCLRKEY5 21
extern volatile unsigned int WDTCLRKEY5_bit;
#define WDTCLRKEY6 22
extern volatile unsigned int WDTCLRKEY6_bit;
#define WDTCLRKEY7 23
extern volatile unsigned int WDTCLRKEY7_bit;
#define WDTCLRKEY8 24
extern volatile unsigned int WDTCLRKEY8_bit;
#define WDTCLRKEY9 25
extern volatile unsigned int WDTCLRKEY9_bit;
#define WDTCLRKEY10 26
extern volatile unsigned int WDTCLRKEY10_bit;
#define WDTCLRKEY11 27
extern volatile unsigned int WDTCLRKEY11_bit;
#define WDTCLRKEY12 28
extern volatile unsigned int WDTCLRKEY12_bit;
#define WDTCLRKEY13 29
extern volatile unsigned int WDTCLRKEY13_bit;
#define WDTCLRKEY14 30
extern volatile unsigned int WDTCLRKEY14_bit;
#define WDTCLRKEY15 31
extern volatile unsigned int WDTCLRKEY15_bit;
extern volatile unsigned int ON_DMTCON_bit;
#define STEP10 8
extern volatile unsigned int STEP10_bit;
#define STEP11 9
extern volatile unsigned int STEP11_bit;
#define STEP12 10
extern volatile unsigned int STEP12_bit;
#define STEP13 11
extern volatile unsigned int STEP13_bit;
#define STEP14 12
extern volatile unsigned int STEP14_bit;
#define STEP15 13
extern volatile unsigned int STEP15_bit;
#define STEP16 14
extern volatile unsigned int STEP16_bit;
#define STEP17 15
extern volatile unsigned int STEP17_bit;
#define STEP20 0
extern volatile unsigned int STEP20_bit;
#define STEP21 1
extern volatile unsigned int STEP21_bit;
#define STEP22 2
extern volatile unsigned int STEP22_bit;
#define STEP23 3
extern volatile unsigned int STEP23_bit;
#define STEP24 4
extern volatile unsigned int STEP24_bit;
#define STEP25 5
extern volatile unsigned int STEP25_bit;
#define STEP26 6
extern volatile unsigned int STEP26_bit;
#define STEP27 7
extern volatile unsigned int STEP27_bit;
#define WINOPN 0
extern volatile unsigned int WINOPN_bit;
#define DMTEVENT 5
extern volatile unsigned int DMTEVENT_bit;
#define BAD0 6
extern volatile unsigned int BAD0_bit;
#define BAD1 7
extern volatile unsigned int BAD1_bit;
#define BAD2 6
extern volatile unsigned int BAD2_bit;
extern volatile unsigned int BAD1_DMTSTAT_bit;
#define COUNTER0 0
extern volatile unsigned int COUNTER0_bit;
#define COUNTER1 1
extern volatile unsigned int COUNTER1_bit;
#define COUNTER2 2
extern volatile unsigned int COUNTER2_bit;
#define COUNTER3 3
extern volatile unsigned int COUNTER3_bit;
#define COUNTER4 4
extern volatile unsigned int COUNTER4_bit;
#define COUNTER5 5
extern volatile unsigned int COUNTER5_bit;
#define COUNTER6 6
extern volatile unsigned int COUNTER6_bit;
#define COUNTER7 7
extern volatile unsigned int COUNTER7_bit;
#define COUNTER8 8
extern volatile unsigned int COUNTER8_bit;
#define COUNTER9 9
extern volatile unsigned int COUNTER9_bit;
#define COUNTER10 10
extern volatile unsigned int COUNTER10_bit;
#define COUNTER11 11
extern volatile unsigned int COUNTER11_bit;
#define COUNTER12 12
extern volatile unsigned int COUNTER12_bit;
#define COUNTER13 13
extern volatile unsigned int COUNTER13_bit;
#define COUNTER14 14
extern volatile unsigned int COUNTER14_bit;
#define COUNTER15 15
extern volatile unsigned int COUNTER15_bit;
#define COUNTER16 16
extern volatile unsigned int COUNTER16_bit;
#define COUNTER17 17
extern volatile unsigned int COUNTER17_bit;
#define COUNTER18 18
extern volatile unsigned int COUNTER18_bit;
#define COUNTER19 19
extern volatile unsigned int COUNTER19_bit;
#define COUNTER20 20
extern volatile unsigned int COUNTER20_bit;
#define COUNTER21 21
extern volatile unsigned int COUNTER21_bit;
#define COUNTER22 22
extern volatile unsigned int COUNTER22_bit;
#define COUNTER23 23
extern volatile unsigned int COUNTER23_bit;
#define COUNTER24 24
extern volatile unsigned int COUNTER24_bit;
#define COUNTER25 25
extern volatile unsigned int COUNTER25_bit;
#define COUNTER26 26
extern volatile unsigned int COUNTER26_bit;
#define COUNTER27 27
extern volatile unsigned int COUNTER27_bit;
#define COUNTER28 28
extern volatile unsigned int COUNTER28_bit;
#define COUNTER29 29
extern volatile unsigned int COUNTER29_bit;
#define COUNTER30 30
extern volatile unsigned int COUNTER30_bit;
#define COUNTER31 31
extern volatile unsigned int COUNTER31_bit;
#define PSCNT0 0
extern volatile unsigned int PSCNT0_bit;
#define PSCNT1 1
extern volatile unsigned int PSCNT1_bit;
#define PSCNT2 2
extern volatile unsigned int PSCNT2_bit;
#define PSCNT3 3
extern volatile unsigned int PSCNT3_bit;
#define PSCNT4 4
extern volatile unsigned int PSCNT4_bit;
#define PSCNT5 5
extern volatile unsigned int PSCNT5_bit;
#define PSCNT6 6
extern volatile unsigned int PSCNT6_bit;
#define PSCNT7 7
extern volatile unsigned int PSCNT7_bit;
#define PSCNT8 8
extern volatile unsigned int PSCNT8_bit;
#define PSCNT9 9
extern volatile unsigned int PSCNT9_bit;
#define PSCNT10 10
extern volatile unsigned int PSCNT10_bit;
#define PSCNT11 11
extern volatile unsigned int PSCNT11_bit;
#define PSCNT12 12
extern volatile unsigned int PSCNT12_bit;
#define PSCNT13 13
extern volatile unsigned int PSCNT13_bit;
#define PSCNT14 14
extern volatile unsigned int PSCNT14_bit;
#define PSCNT15 15
extern volatile unsigned int PSCNT15_bit;
#define PSCNT16 16
extern volatile unsigned int PSCNT16_bit;
#define PSCNT17 17
extern volatile unsigned int PSCNT17_bit;
#define PSCNT18 18
extern volatile unsigned int PSCNT18_bit;
#define PSCNT19 19
extern volatile unsigned int PSCNT19_bit;
#define PSCNT20 20
extern volatile unsigned int PSCNT20_bit;
#define PSCNT21 21
extern volatile unsigned int PSCNT21_bit;
#define PSCNT22 22
extern volatile unsigned int PSCNT22_bit;
#define PSCNT23 23
extern volatile unsigned int PSCNT23_bit;
#define PSCNT24 24
extern volatile unsigned int PSCNT24_bit;
#define PSCNT25 25
extern volatile unsigned int PSCNT25_bit;
#define PSCNT26 26
extern volatile unsigned int PSCNT26_bit;
#define PSCNT27 27
extern volatile unsigned int PSCNT27_bit;
#define PSCNT28 28
extern volatile unsigned int PSCNT28_bit;
#define PSCNT29 29
extern volatile unsigned int PSCNT29_bit;
#define PSCNT30 30
extern volatile unsigned int PSCNT30_bit;
#define PSCNT31 31
extern volatile unsigned int PSCNT31_bit;
#define PSINTV0 0
extern volatile unsigned int PSINTV0_bit;
#define PSINTV1 1
extern volatile unsigned int PSINTV1_bit;
#define PSINTV2 2
extern volatile unsigned int PSINTV2_bit;
#define PSINTV3 3
extern volatile unsigned int PSINTV3_bit;
#define PSINTV4 4
extern volatile unsigned int PSINTV4_bit;
#define PSINTV5 5
extern volatile unsigned int PSINTV5_bit;
#define PSINTV6 6
extern volatile unsigned int PSINTV6_bit;
#define PSINTV7 7
extern volatile unsigned int PSINTV7_bit;
#define PSINTV8 8
extern volatile unsigned int PSINTV8_bit;
#define PSINTV9 9
extern volatile unsigned int PSINTV9_bit;
#define PSINTV10 10
extern volatile unsigned int PSINTV10_bit;
#define PSINTV11 11
extern volatile unsigned int PSINTV11_bit;
#define PSINTV12 12
extern volatile unsigned int PSINTV12_bit;
#define PSINTV13 13
extern volatile unsigned int PSINTV13_bit;
#define PSINTV14 14
extern volatile unsigned int PSINTV14_bit;
#define PSINTV15 15
extern volatile unsigned int PSINTV15_bit;
#define PSINTV16 16
extern volatile unsigned int PSINTV16_bit;
#define PSINTV17 17
extern volatile unsigned int PSINTV17_bit;
#define PSINTV18 18
extern volatile unsigned int PSINTV18_bit;
#define PSINTV19 19
extern volatile unsigned int PSINTV19_bit;
#define PSINTV20 20
extern volatile unsigned int PSINTV20_bit;
#define PSINTV21 21
extern volatile unsigned int PSINTV21_bit;
#define PSINTV22 22
extern volatile unsigned int PSINTV22_bit;
#define PSINTV23 23
extern volatile unsigned int PSINTV23_bit;
#define PSINTV24 24
extern volatile unsigned int PSINTV24_bit;
#define PSINTV25 25
extern volatile unsigned int PSINTV25_bit;
#define PSINTV26 26
extern volatile unsigned int PSINTV26_bit;
#define PSINTV27 27
extern volatile unsigned int PSINTV27_bit;
#define PSINTV28 28
extern volatile unsigned int PSINTV28_bit;
#define PSINTV29 29
extern volatile unsigned int PSINTV29_bit;
#define PSINTV30 30
extern volatile unsigned int PSINTV30_bit;
#define PSINTV31 31
extern volatile unsigned int PSINTV31_bit;
#define RTCOE 0
extern volatile unsigned int RTCOE_bit;
#define HALFSEC 1
extern volatile unsigned int HALFSEC_bit;
#define RTCSYNC 2
extern volatile unsigned int RTCSYNC_bit;
#define RTCWREN 3
extern volatile unsigned int RTCWREN_bit;
#define RTCCLKON 6
extern volatile unsigned int RTCCLKON_bit;
#define RTCOUTSEL0 7
extern volatile unsigned int RTCOUTSEL0_bit;
#define RTCOUTSEL1 8
extern volatile unsigned int RTCOUTSEL1_bit;
#define RTCCLKSEL0 9
extern volatile unsigned int RTCCLKSEL0_bit;
#define RTCCLKSEL1 10
extern volatile unsigned int RTCCLKSEL1_bit;
#define SIDL 13
extern volatile unsigned int SIDL_bit;
extern volatile unsigned int ON_RTCCON_bit;
#define CAL0 16
extern volatile unsigned int CAL0_bit;
#define CAL1 17
extern volatile unsigned int CAL1_bit;
#define CAL2 18
extern volatile unsigned int CAL2_bit;
#define CAL3 19
extern volatile unsigned int CAL3_bit;
#define CAL4 20
extern volatile unsigned int CAL4_bit;
#define CAL5 21
extern volatile unsigned int CAL5_bit;
#define CAL6 22
extern volatile unsigned int CAL6_bit;
#define CAL7 23
extern volatile unsigned int CAL7_bit;
#define CAL8 24
extern volatile unsigned int CAL8_bit;
#define CAL9 25
extern volatile unsigned int CAL9_bit;
#define ARPT0 0
extern volatile unsigned int ARPT0_bit;
#define ARPT1 1
extern volatile unsigned int ARPT1_bit;
#define ARPT2 2
extern volatile unsigned int ARPT2_bit;
#define ARPT3 3
extern volatile unsigned int ARPT3_bit;
#define ARPT4 4
extern volatile unsigned int ARPT4_bit;
#define ARPT5 5
extern volatile unsigned int ARPT5_bit;
#define ARPT6 6
extern volatile unsigned int ARPT6_bit;
#define ARPT7 7
extern volatile unsigned int ARPT7_bit;
#define AMASK0 8
extern volatile unsigned int AMASK0_bit;
#define AMASK1 9
extern volatile unsigned int AMASK1_bit;
#define AMASK2 10
extern volatile unsigned int AMASK2_bit;
#define AMASK3 11
extern volatile unsigned int AMASK3_bit;
#define ALRMSYNC 12
extern volatile unsigned int ALRMSYNC_bit;
#define PIV 13
extern volatile unsigned int PIV_bit;
#define CHIME 14
extern volatile unsigned int CHIME_bit;
#define ALRMEN 15
extern volatile unsigned int ALRMEN_bit;
#define SEC010 8
extern volatile unsigned int SEC010_bit;
#define SEC011 9
extern volatile unsigned int SEC011_bit;
#define SEC012 10
extern volatile unsigned int SEC012_bit;
#define SEC013 11
extern volatile unsigned int SEC013_bit;
#define SEC100 12
extern volatile unsigned int SEC100_bit;
#define SEC101 13
extern volatile unsigned int SEC101_bit;
#define SEC102 14
extern volatile unsigned int SEC102_bit;
#define SEC103 15
extern volatile unsigned int SEC103_bit;
#define MIN010 16
extern volatile unsigned int MIN010_bit;
#define MIN011 17
extern volatile unsigned int MIN011_bit;
#define MIN012 18
extern volatile unsigned int MIN012_bit;
#define MIN013 19
extern volatile unsigned int MIN013_bit;
#define MIN100 20
extern volatile unsigned int MIN100_bit;
#define MIN101 21
extern volatile unsigned int MIN101_bit;
#define MIN102 22
extern volatile unsigned int MIN102_bit;
#define MIN103 23
extern volatile unsigned int MIN103_bit;
#define HR010 24
extern volatile unsigned int HR010_bit;
#define HR011 25
extern volatile unsigned int HR011_bit;
#define HR012 26
extern volatile unsigned int HR012_bit;
#define HR013 27
extern volatile unsigned int HR013_bit;
#define HR100 28
extern volatile unsigned int HR100_bit;
#define HR101 29
extern volatile unsigned int HR101_bit;
#define HR102 30
extern volatile unsigned int HR102_bit;
#define HR103 31
extern volatile unsigned int HR103_bit;
#define WDAY010 0
extern volatile unsigned int WDAY010_bit;
#define WDAY011 1
extern volatile unsigned int WDAY011_bit;
#define WDAY012 2
extern volatile unsigned int WDAY012_bit;
#define WDAY013 3
extern volatile unsigned int WDAY013_bit;
#define DAY010 8
extern volatile unsigned int DAY010_bit;
#define DAY011 9
extern volatile unsigned int DAY011_bit;
#define DAY012 10
extern volatile unsigned int DAY012_bit;
#define DAY013 11
extern volatile unsigned int DAY013_bit;
#define DAY100 12
extern volatile unsigned int DAY100_bit;
#define DAY101 13
extern volatile unsigned int DAY101_bit;
#define DAY102 14
extern volatile unsigned int DAY102_bit;
#define DAY103 15
extern volatile unsigned int DAY103_bit;
#define MONTH010 16
extern volatile unsigned int MONTH010_bit;
#define MONTH011 17
extern volatile unsigned int MONTH011_bit;
#define MONTH012 18
extern volatile unsigned int MONTH012_bit;
#define MONTH013 19
extern volatile unsigned int MONTH013_bit;
#define MONTH100 20
extern volatile unsigned int MONTH100_bit;
#define MONTH101 21
extern volatile unsigned int MONTH101_bit;
#define MONTH102 22
extern volatile unsigned int MONTH102_bit;
#define MONTH103 23
extern volatile unsigned int MONTH103_bit;
#define YEAR010 24
extern volatile unsigned int YEAR010_bit;
#define YEAR011 25
extern volatile unsigned int YEAR011_bit;
#define YEAR012 26
extern volatile unsigned int YEAR012_bit;
#define YEAR013 27
extern volatile unsigned int YEAR013_bit;
#define YEAR100 28
extern volatile unsigned int YEAR100_bit;
#define YEAR101 29
extern volatile unsigned int YEAR101_bit;
#define YEAR102 30
extern volatile unsigned int YEAR102_bit;
#define YEAR103 31
extern volatile unsigned int YEAR103_bit;
extern volatile unsigned int SEC010_ALRMTIME_bit;
extern volatile unsigned int SEC011_ALRMTIME_bit;
extern volatile unsigned int SEC012_ALRMTIME_bit;
extern volatile unsigned int SEC013_ALRMTIME_bit;
extern volatile unsigned int SEC100_ALRMTIME_bit;
extern volatile unsigned int SEC101_ALRMTIME_bit;
extern volatile unsigned int SEC102_ALRMTIME_bit;
extern volatile unsigned int SEC103_ALRMTIME_bit;
extern volatile unsigned int MIN010_ALRMTIME_bit;
extern volatile unsigned int MIN011_ALRMTIME_bit;
extern volatile unsigned int MIN012_ALRMTIME_bit;
extern volatile unsigned int MIN013_ALRMTIME_bit;
extern volatile unsigned int MIN100_ALRMTIME_bit;
extern volatile unsigned int MIN101_ALRMTIME_bit;
extern volatile unsigned int MIN102_ALRMTIME_bit;
extern volatile unsigned int MIN103_ALRMTIME_bit;
extern volatile unsigned int HR010_ALRMTIME_bit;
extern volatile unsigned int HR011_ALRMTIME_bit;
extern volatile unsigned int HR012_ALRMTIME_bit;
extern volatile unsigned int HR013_ALRMTIME_bit;
extern volatile unsigned int HR100_ALRMTIME_bit;
extern volatile unsigned int HR101_ALRMTIME_bit;
extern volatile unsigned int HR102_ALRMTIME_bit;
extern volatile unsigned int HR103_ALRMTIME_bit;
extern volatile unsigned int WDAY010_ALRMDATE_bit;
extern volatile unsigned int WDAY011_ALRMDATE_bit;
extern volatile unsigned int WDAY012_ALRMDATE_bit;
extern volatile unsigned int WDAY013_ALRMDATE_bit;
extern volatile unsigned int DAY010_ALRMDATE_bit;
extern volatile unsigned int DAY011_ALRMDATE_bit;
extern volatile unsigned int DAY012_ALRMDATE_bit;
extern volatile unsigned int DAY013_ALRMDATE_bit;
extern volatile unsigned int DAY100_ALRMDATE_bit;
extern volatile unsigned int DAY101_ALRMDATE_bit;
extern volatile unsigned int DAY102_ALRMDATE_bit;
extern volatile unsigned int DAY103_ALRMDATE_bit;
extern volatile unsigned int MONTH010_ALRMDATE_bit;
extern volatile unsigned int MONTH011_ALRMDATE_bit;
extern volatile unsigned int MONTH012_ALRMDATE_bit;
extern volatile unsigned int MONTH013_ALRMDATE_bit;
extern volatile unsigned int MONTH100_ALRMDATE_bit;
extern volatile unsigned int MONTH101_ALRMDATE_bit;
extern volatile unsigned int MONTH102_ALRMDATE_bit;
extern volatile unsigned int MONTH103_ALRMDATE_bit;
#define CVR0 0
extern volatile unsigned int CVR0_bit;
#define CVR1 1
extern volatile unsigned int CVR1_bit;
#define CVR2 2
extern volatile unsigned int CVR2_bit;
#define CVR3 3
extern volatile unsigned int CVR3_bit;
#define CVRSS 4
extern volatile unsigned int CVRSS_bit;
#define CVRR 5
extern volatile unsigned int CVRR_bit;
#define CVROE 6
extern volatile unsigned int CVROE_bit;
extern volatile unsigned int ON_CVRCON_bit;
extern volatile unsigned int CVR0_CVRCON_bit;
extern volatile unsigned int CVR1_CVRCON_bit;
extern volatile unsigned int CVR2_CVRCON_bit;
extern volatile unsigned int CVR3_CVRCON_bit;
#define OSWEN 0
extern volatile unsigned int OSWEN_bit;
#define SOSCEN 1
extern volatile unsigned int SOSCEN_bit;
#define CF 3
extern volatile unsigned int CF_bit;
#define SLPEN 4
extern volatile unsigned int SLPEN_bit;
#define CLKLOCK 7
extern volatile unsigned int CLKLOCK_bit;
#define NOSC0 8
extern volatile unsigned int NOSC0_bit;
#define NOSC1 9
extern volatile unsigned int NOSC1_bit;
#define NOSC2 10
extern volatile unsigned int NOSC2_bit;
#define COSC0 12
extern volatile unsigned int COSC0_bit;
#define COSC1 13
extern volatile unsigned int COSC1_bit;
#define COSC2 14
extern volatile unsigned int COSC2_bit;
#define SLP2SPD 21
extern volatile unsigned int SLP2SPD_bit;
#define DRMEN 23
extern volatile unsigned int DRMEN_bit;
#define FRCDIV0 24
extern volatile unsigned int FRCDIV0_bit;
#define FRCDIV1 25
extern volatile unsigned int FRCDIV1_bit;
#define FRCDIV2 26
extern volatile unsigned int FRCDIV2_bit;
#define TUN0 0
extern volatile unsigned int TUN0_bit;
#define TUN1 1
extern volatile unsigned int TUN1_bit;
#define TUN2 2
extern volatile unsigned int TUN2_bit;
#define TUN3 3
extern volatile unsigned int TUN3_bit;
#define TUN4 4
extern volatile unsigned int TUN4_bit;
#define TUN5 5
extern volatile unsigned int TUN5_bit;
#define PLLRANGE0 0
extern volatile unsigned int PLLRANGE0_bit;
#define PLLRANGE1 1
extern volatile unsigned int PLLRANGE1_bit;
#define PLLRANGE2 2
extern volatile unsigned int PLLRANGE2_bit;
#define PLLICLK 7
extern volatile unsigned int PLLICLK_bit;
#define PLLIDIV0 8
extern volatile unsigned int PLLIDIV0_bit;
#define PLLIDIV1 9
extern volatile unsigned int PLLIDIV1_bit;
#define PLLIDIV2 10
extern volatile unsigned int PLLIDIV2_bit;
#define PLLMULT0 16
extern volatile unsigned int PLLMULT0_bit;
#define PLLMULT1 17
extern volatile unsigned int PLLMULT1_bit;
#define PLLMULT2 18
extern volatile unsigned int PLLMULT2_bit;
#define PLLMULT3 19
extern volatile unsigned int PLLMULT3_bit;
#define PLLMULT4 20
extern volatile unsigned int PLLMULT4_bit;
#define PLLMULT5 21
extern volatile unsigned int PLLMULT5_bit;
#define PLLMULT6 22
extern volatile unsigned int PLLMULT6_bit;
#define PLLODIV0 24
extern volatile unsigned int PLLODIV0_bit;
#define PLLODIV1 25
extern volatile unsigned int PLLODIV1_bit;
#define PLLODIV2 26
extern volatile unsigned int PLLODIV2_bit;
#define POR 0
extern volatile unsigned int POR_bit;
#define BOR 1
extern volatile unsigned int BOR_bit;
#define IDLE 2
extern volatile unsigned int IDLE_bit;
#define SLEEP 3
extern volatile unsigned int SLEEP_bit;
#define WDTO 4
extern volatile unsigned int WDTO_bit;
#define DMTO 5
extern volatile unsigned int DMTO_bit;
#define SWR 6
extern volatile unsigned int SWR_bit;
#define EXTR 7
extern volatile unsigned int EXTR_bit;
#define CMR 9
extern volatile unsigned int CMR_bit;
#define BCFGFAIL 26
extern volatile unsigned int BCFGFAIL_bit;
#define BCFGERR 27
extern volatile unsigned int BCFGERR_bit;
#define SWRST 0
extern volatile unsigned int SWRST_bit;
#define NMICNT0 0
extern volatile unsigned int NMICNT0_bit;
#define NMICNT1 1
extern volatile unsigned int NMICNT1_bit;
#define NMICNT2 2
extern volatile unsigned int NMICNT2_bit;
#define NMICNT3 3
extern volatile unsigned int NMICNT3_bit;
#define NMICNT4 4
extern volatile unsigned int NMICNT4_bit;
#define NMICNT5 5
extern volatile unsigned int NMICNT5_bit;
#define NMICNT6 6
extern volatile unsigned int NMICNT6_bit;
#define NMICNT7 7
extern volatile unsigned int NMICNT7_bit;
#define NMICNT8 8
extern volatile unsigned int NMICNT8_bit;
#define NMICNT9 9
extern volatile unsigned int NMICNT9_bit;
#define NMICNT10 10
extern volatile unsigned int NMICNT10_bit;
#define NMICNT11 11
extern volatile unsigned int NMICNT11_bit;
#define NMICNT12 12
extern volatile unsigned int NMICNT12_bit;
#define NMICNT13 13
extern volatile unsigned int NMICNT13_bit;
#define NMICNT14 14
extern volatile unsigned int NMICNT14_bit;
#define NMICNT15 15
extern volatile unsigned int NMICNT15_bit;
#define WDTS 16
extern volatile unsigned int WDTS_bit;
extern volatile unsigned int CF_RNMICON_bit;
#define GNMI 19
extern volatile unsigned int GNMI_bit;
#define SWNMI 23
extern volatile unsigned int SWNMI_bit;
extern volatile unsigned int WDTO_RNMICON_bit;
extern volatile unsigned int DMTO_RNMICON_bit;
#define WDTR 24
extern volatile unsigned int WDTR_bit;
#define VREGS 0
extern volatile unsigned int VREGS_bit;
#define ROSEL0 0
extern volatile unsigned int ROSEL0_bit;
#define ROSEL1 1
extern volatile unsigned int ROSEL1_bit;
#define ROSEL2 2
extern volatile unsigned int ROSEL2_bit;
#define ROSEL3 3
extern volatile unsigned int ROSEL3_bit;
#define ACTIVE 8
extern volatile unsigned int ACTIVE_bit;
#define DIVSWEN 9
extern volatile unsigned int DIVSWEN_bit;
#define RSLP 11
extern volatile unsigned int RSLP_bit;
#define OE 12
extern volatile unsigned int OE_bit;
extern volatile unsigned int SIDL_REFO1CON_bit;
extern volatile unsigned int ON_REFO1CON_bit;
#define RODIV0 16
extern volatile unsigned int RODIV0_bit;
#define RODIV1 17
extern volatile unsigned int RODIV1_bit;
#define RODIV2 18
extern volatile unsigned int RODIV2_bit;
#define RODIV3 19
extern volatile unsigned int RODIV3_bit;
#define RODIV4 20
extern volatile unsigned int RODIV4_bit;
#define RODIV5 21
extern volatile unsigned int RODIV5_bit;
#define RODIV6 22
extern volatile unsigned int RODIV6_bit;
#define RODIV7 23
extern volatile unsigned int RODIV7_bit;
#define RODIV8 24
extern volatile unsigned int RODIV8_bit;
#define RODIV9 25
extern volatile unsigned int RODIV9_bit;
#define RODIV10 26
extern volatile unsigned int RODIV10_bit;
#define RODIV11 27
extern volatile unsigned int RODIV11_bit;
#define RODIV12 28
extern volatile unsigned int RODIV12_bit;
#define RODIV13 29
extern volatile unsigned int RODIV13_bit;
#define RODIV14 30
extern volatile unsigned int RODIV14_bit;
#define ROTRIM0 23
extern volatile unsigned int ROTRIM0_bit;
#define ROTRIM1 24
extern volatile unsigned int ROTRIM1_bit;
#define ROTRIM2 25
extern volatile unsigned int ROTRIM2_bit;
#define ROTRIM3 26
extern volatile unsigned int ROTRIM3_bit;
#define ROTRIM4 27
extern volatile unsigned int ROTRIM4_bit;
#define ROTRIM5 28
extern volatile unsigned int ROTRIM5_bit;
#define ROTRIM6 29
extern volatile unsigned int ROTRIM6_bit;
#define ROTRIM7 30
extern volatile unsigned int ROTRIM7_bit;
#define ROTRIM8 31
extern volatile unsigned int ROTRIM8_bit;
extern volatile unsigned int ROSEL0_REFO2CON_bit;
extern volatile unsigned int ROSEL1_REFO2CON_bit;
extern volatile unsigned int ROSEL2_REFO2CON_bit;
extern volatile unsigned int ROSEL3_REFO2CON_bit;
extern volatile unsigned int ACTIVE_REFO2CON_bit;
extern volatile unsigned int DIVSWEN_REFO2CON_bit;
extern volatile unsigned int RSLP_REFO2CON_bit;
extern volatile unsigned int OE_REFO2CON_bit;
extern volatile unsigned int SIDL_REFO2CON_bit;
extern volatile unsigned int ON_REFO2CON_bit;
extern volatile unsigned int RODIV0_REFO2CON_bit;
extern volatile unsigned int RODIV1_REFO2CON_bit;
extern volatile unsigned int RODIV2_REFO2CON_bit;
extern volatile unsigned int RODIV3_REFO2CON_bit;
extern volatile unsigned int RODIV4_REFO2CON_bit;
extern volatile unsigned int RODIV5_REFO2CON_bit;
extern volatile unsigned int RODIV6_REFO2CON_bit;
extern volatile unsigned int RODIV7_REFO2CON_bit;
extern volatile unsigned int RODIV8_REFO2CON_bit;
extern volatile unsigned int RODIV9_REFO2CON_bit;
extern volatile unsigned int RODIV10_REFO2CON_bit;
extern volatile unsigned int RODIV11_REFO2CON_bit;
extern volatile unsigned int RODIV12_REFO2CON_bit;
extern volatile unsigned int RODIV13_REFO2CON_bit;
extern volatile unsigned int RODIV14_REFO2CON_bit;
extern volatile unsigned int ROTRIM0_REFO2TRIM_bit;
extern volatile unsigned int ROTRIM1_REFO2TRIM_bit;
extern volatile unsigned int ROTRIM2_REFO2TRIM_bit;
extern volatile unsigned int ROTRIM3_REFO2TRIM_bit;
extern volatile unsigned int ROTRIM4_REFO2TRIM_bit;
extern volatile unsigned int ROTRIM5_REFO2TRIM_bit;
extern volatile unsigned int ROTRIM6_REFO2TRIM_bit;
extern volatile unsigned int ROTRIM7_REFO2TRIM_bit;
extern volatile unsigned int ROTRIM8_REFO2TRIM_bit;
extern volatile unsigned int ROSEL0_REFO3CON_bit;
extern volatile unsigned int ROSEL1_REFO3CON_bit;
extern volatile unsigned int ROSEL2_REFO3CON_bit;
extern volatile unsigned int ROSEL3_REFO3CON_bit;
extern volatile unsigned int ACTIVE_REFO3CON_bit;
extern volatile unsigned int DIVSWEN_REFO3CON_bit;
extern volatile unsigned int RSLP_REFO3CON_bit;
extern volatile unsigned int OE_REFO3CON_bit;
extern volatile unsigned int SIDL_REFO3CON_bit;
extern volatile unsigned int ON_REFO3CON_bit;
extern volatile unsigned int RODIV0_REFO3CON_bit;
extern volatile unsigned int RODIV1_REFO3CON_bit;
extern volatile unsigned int RODIV2_REFO3CON_bit;
extern volatile unsigned int RODIV3_REFO3CON_bit;
extern volatile unsigned int RODIV4_REFO3CON_bit;
extern volatile unsigned int RODIV5_REFO3CON_bit;
extern volatile unsigned int RODIV6_REFO3CON_bit;
extern volatile unsigned int RODIV7_REFO3CON_bit;
extern volatile unsigned int RODIV8_REFO3CON_bit;
extern volatile unsigned int RODIV9_REFO3CON_bit;
extern volatile unsigned int RODIV10_REFO3CON_bit;
extern volatile unsigned int RODIV11_REFO3CON_bit;
extern volatile unsigned int RODIV12_REFO3CON_bit;
extern volatile unsigned int RODIV13_REFO3CON_bit;
extern volatile unsigned int RODIV14_REFO3CON_bit;
extern volatile unsigned int ROTRIM0_REFO3TRIM_bit;
extern volatile unsigned int ROTRIM1_REFO3TRIM_bit;
extern volatile unsigned int ROTRIM2_REFO3TRIM_bit;
extern volatile unsigned int ROTRIM3_REFO3TRIM_bit;
extern volatile unsigned int ROTRIM4_REFO3TRIM_bit;
extern volatile unsigned int ROTRIM5_REFO3TRIM_bit;
extern volatile unsigned int ROTRIM6_REFO3TRIM_bit;
extern volatile unsigned int ROTRIM7_REFO3TRIM_bit;
extern volatile unsigned int ROTRIM8_REFO3TRIM_bit;
extern volatile unsigned int ROSEL0_REFO4CON_bit;
extern volatile unsigned int ROSEL1_REFO4CON_bit;
extern volatile unsigned int ROSEL2_REFO4CON_bit;
extern volatile unsigned int ROSEL3_REFO4CON_bit;
extern volatile unsigned int ACTIVE_REFO4CON_bit;
extern volatile unsigned int DIVSWEN_REFO4CON_bit;
extern volatile unsigned int RSLP_REFO4CON_bit;
extern volatile unsigned int OE_REFO4CON_bit;
extern volatile unsigned int SIDL_REFO4CON_bit;
extern volatile unsigned int ON_REFO4CON_bit;
extern volatile unsigned int RODIV0_REFO4CON_bit;
extern volatile unsigned int RODIV1_REFO4CON_bit;
extern volatile unsigned int RODIV2_REFO4CON_bit;
extern volatile unsigned int RODIV3_REFO4CON_bit;
extern volatile unsigned int RODIV4_REFO4CON_bit;
extern volatile unsigned int RODIV5_REFO4CON_bit;
extern volatile unsigned int RODIV6_REFO4CON_bit;
extern volatile unsigned int RODIV7_REFO4CON_bit;
extern volatile unsigned int RODIV8_REFO4CON_bit;
extern volatile unsigned int RODIV9_REFO4CON_bit;
extern volatile unsigned int RODIV10_REFO4CON_bit;
extern volatile unsigned int RODIV11_REFO4CON_bit;
extern volatile unsigned int RODIV12_REFO4CON_bit;
extern volatile unsigned int RODIV13_REFO4CON_bit;
extern volatile unsigned int RODIV14_REFO4CON_bit;
extern volatile unsigned int ROTRIM0_REFO4TRIM_bit;
extern volatile unsigned int ROTRIM1_REFO4TRIM_bit;
extern volatile unsigned int ROTRIM2_REFO4TRIM_bit;
extern volatile unsigned int ROTRIM3_REFO4TRIM_bit;
extern volatile unsigned int ROTRIM4_REFO4TRIM_bit;
extern volatile unsigned int ROTRIM5_REFO4TRIM_bit;
extern volatile unsigned int ROTRIM6_REFO4TRIM_bit;
extern volatile unsigned int ROTRIM7_REFO4TRIM_bit;
extern volatile unsigned int ROTRIM8_REFO4TRIM_bit;
#define PBDIV0 0
extern volatile unsigned int PBDIV0_bit;
#define PBDIV1 1
extern volatile unsigned int PBDIV1_bit;
#define PBDIV2 2
extern volatile unsigned int PBDIV2_bit;
#define PBDIV3 3
extern volatile unsigned int PBDIV3_bit;
#define PBDIV4 4
extern volatile unsigned int PBDIV4_bit;
#define PBDIV5 5
extern volatile unsigned int PBDIV5_bit;
#define PBDIV6 6
extern volatile unsigned int PBDIV6_bit;
#define PBDIVRDY 11
extern volatile unsigned int PBDIVRDY_bit;
extern volatile unsigned int PBDIV0_PB2DIV_bit;
extern volatile unsigned int PBDIV1_PB2DIV_bit;
extern volatile unsigned int PBDIV2_PB2DIV_bit;
extern volatile unsigned int PBDIV3_PB2DIV_bit;
extern volatile unsigned int PBDIV4_PB2DIV_bit;
extern volatile unsigned int PBDIV5_PB2DIV_bit;
extern volatile unsigned int PBDIV6_PB2DIV_bit;
extern volatile unsigned int PBDIVRDY_PB2DIV_bit;
extern volatile unsigned int ON_PB2DIV_bit;
extern volatile unsigned int PBDIV0_PB3DIV_bit;
extern volatile unsigned int PBDIV1_PB3DIV_bit;
extern volatile unsigned int PBDIV2_PB3DIV_bit;
extern volatile unsigned int PBDIV3_PB3DIV_bit;
extern volatile unsigned int PBDIV4_PB3DIV_bit;
extern volatile unsigned int PBDIV5_PB3DIV_bit;
extern volatile unsigned int PBDIV6_PB3DIV_bit;
extern volatile unsigned int PBDIVRDY_PB3DIV_bit;
extern volatile unsigned int ON_PB3DIV_bit;
extern volatile unsigned int PBDIV0_PB4DIV_bit;
extern volatile unsigned int PBDIV1_PB4DIV_bit;
extern volatile unsigned int PBDIV2_PB4DIV_bit;
extern volatile unsigned int PBDIV3_PB4DIV_bit;
extern volatile unsigned int PBDIV4_PB4DIV_bit;
extern volatile unsigned int PBDIV5_PB4DIV_bit;
extern volatile unsigned int PBDIV6_PB4DIV_bit;
extern volatile unsigned int PBDIVRDY_PB4DIV_bit;
extern volatile unsigned int ON_PB4DIV_bit;
extern volatile unsigned int PBDIV0_PB5DIV_bit;
extern volatile unsigned int PBDIV1_PB5DIV_bit;
extern volatile unsigned int PBDIV2_PB5DIV_bit;
extern volatile unsigned int PBDIV3_PB5DIV_bit;
extern volatile unsigned int PBDIV4_PB5DIV_bit;
extern volatile unsigned int PBDIV5_PB5DIV_bit;
extern volatile unsigned int PBDIV6_PB5DIV_bit;
extern volatile unsigned int PBDIVRDY_PB5DIV_bit;
extern volatile unsigned int ON_PB5DIV_bit;
extern volatile unsigned int PBDIV0_PB7DIV_bit;
extern volatile unsigned int PBDIV1_PB7DIV_bit;
extern volatile unsigned int PBDIV2_PB7DIV_bit;
extern volatile unsigned int PBDIV3_PB7DIV_bit;
extern volatile unsigned int PBDIV4_PB7DIV_bit;
extern volatile unsigned int PBDIV5_PB7DIV_bit;
extern volatile unsigned int PBDIV6_PB7DIV_bit;
extern volatile unsigned int PBDIVRDY_PB7DIV_bit;
extern volatile unsigned int ON_PB7DIV_bit;
extern volatile unsigned int PBDIV0_PB8DIV_bit;
extern volatile unsigned int PBDIV1_PB8DIV_bit;
extern volatile unsigned int PBDIV2_PB8DIV_bit;
extern volatile unsigned int PBDIV3_PB8DIV_bit;
extern volatile unsigned int PBDIV4_PB8DIV_bit;
extern volatile unsigned int PBDIV5_PB8DIV_bit;
extern volatile unsigned int PBDIV6_PB8DIV_bit;
extern volatile unsigned int PBDIVRDY_PB8DIV_bit;
extern volatile unsigned int ON_PB8DIV_bit;
#define BUSY 0
extern volatile unsigned int BUSY_bit;
#define DNEN 1
extern volatile unsigned int DNEN_bit;
#define UPEN 2
extern volatile unsigned int UPEN_bit;
#define SLWDIV0 8
extern volatile unsigned int SLWDIV0_bit;
#define SLWDIV1 9
extern volatile unsigned int SLWDIV1_bit;
#define SLWDIV2 10
extern volatile unsigned int SLWDIV2_bit;
#define SYSDIV0 16
extern volatile unsigned int SYSDIV0_bit;
#define SYSDIV1 17
extern volatile unsigned int SYSDIV1_bit;
#define SYSDIV2 18
extern volatile unsigned int SYSDIV2_bit;
#define SYSDIV3 19
extern volatile unsigned int SYSDIV3_bit;
#define FRCRDY 0
extern volatile unsigned int FRCRDY_bit;
#define SPDIVRDY 1
extern volatile unsigned int SPDIVRDY_bit;
#define POSCRDY 2
extern volatile unsigned int POSCRDY_bit;
#define SOSCRDY 4
extern volatile unsigned int SOSCRDY_bit;
#define LPRCRDY 5
extern volatile unsigned int LPRCRDY_bit;
#define DIVSPLLRDY 1
extern volatile unsigned int DIVSPLLRDY_bit;
#define INT1R0 0
extern volatile unsigned int INT1R0_bit;
#define INT1R1 1
extern volatile unsigned int INT1R1_bit;
#define INT1R2 2
extern volatile unsigned int INT1R2_bit;
#define INT1R3 3
extern volatile unsigned int INT1R3_bit;
#define INT2R0 0
extern volatile unsigned int INT2R0_bit;
#define INT2R1 1
extern volatile unsigned int INT2R1_bit;
#define INT2R2 2
extern volatile unsigned int INT2R2_bit;
#define INT2R3 3
extern volatile unsigned int INT2R3_bit;
#define INT3R0 0
extern volatile unsigned int INT3R0_bit;
#define INT3R1 1
extern volatile unsigned int INT3R1_bit;
#define INT3R2 2
extern volatile unsigned int INT3R2_bit;
#define INT3R3 3
extern volatile unsigned int INT3R3_bit;
#define INT4R0 0
extern volatile unsigned int INT4R0_bit;
#define INT4R1 1
extern volatile unsigned int INT4R1_bit;
#define INT4R2 2
extern volatile unsigned int INT4R2_bit;
#define INT4R3 3
extern volatile unsigned int INT4R3_bit;
#define T2CKR0 0
extern volatile unsigned int T2CKR0_bit;
#define T2CKR1 1
extern volatile unsigned int T2CKR1_bit;
#define T2CKR2 2
extern volatile unsigned int T2CKR2_bit;
#define T2CKR3 3
extern volatile unsigned int T2CKR3_bit;
#define T3CKR0 0
extern volatile unsigned int T3CKR0_bit;
#define T3CKR1 1
extern volatile unsigned int T3CKR1_bit;
#define T3CKR2 2
extern volatile unsigned int T3CKR2_bit;
#define T3CKR3 3
extern volatile unsigned int T3CKR3_bit;
#define T4CKR0 0
extern volatile unsigned int T4CKR0_bit;
#define T4CKR1 1
extern volatile unsigned int T4CKR1_bit;
#define T4CKR2 2
extern volatile unsigned int T4CKR2_bit;
#define T4CKR3 3
extern volatile unsigned int T4CKR3_bit;
#define T5CKR0 0
extern volatile unsigned int T5CKR0_bit;
#define T5CKR1 1
extern volatile unsigned int T5CKR1_bit;
#define T5CKR2 2
extern volatile unsigned int T5CKR2_bit;
#define T5CKR3 3
extern volatile unsigned int T5CKR3_bit;
#define T6CKR0 0
extern volatile unsigned int T6CKR0_bit;
#define T6CKR1 1
extern volatile unsigned int T6CKR1_bit;
#define T6CKR2 2
extern volatile unsigned int T6CKR2_bit;
#define T6CKR3 3
extern volatile unsigned int T6CKR3_bit;
#define T7CKR0 0
extern volatile unsigned int T7CKR0_bit;
#define T7CKR1 1
extern volatile unsigned int T7CKR1_bit;
#define T7CKR2 2
extern volatile unsigned int T7CKR2_bit;
#define T7CKR3 3
extern volatile unsigned int T7CKR3_bit;
#define T8CKR0 0
extern volatile unsigned int T8CKR0_bit;
#define T8CKR1 1
extern volatile unsigned int T8CKR1_bit;
#define T8CKR2 2
extern volatile unsigned int T8CKR2_bit;
#define T8CKR3 3
extern volatile unsigned int T8CKR3_bit;
#define T9CKR0 0
extern volatile unsigned int T9CKR0_bit;
#define T9CKR1 1
extern volatile unsigned int T9CKR1_bit;
#define T9CKR2 2
extern volatile unsigned int T9CKR2_bit;
#define T9CKR3 3
extern volatile unsigned int T9CKR3_bit;
#define IC1R0 0
extern volatile unsigned int IC1R0_bit;
#define IC1R1 1
extern volatile unsigned int IC1R1_bit;
#define IC1R2 2
extern volatile unsigned int IC1R2_bit;
#define IC1R3 3
extern volatile unsigned int IC1R3_bit;
#define IC2R0 0
extern volatile unsigned int IC2R0_bit;
#define IC2R1 1
extern volatile unsigned int IC2R1_bit;
#define IC2R2 2
extern volatile unsigned int IC2R2_bit;
#define IC2R3 3
extern volatile unsigned int IC2R3_bit;
#define IC3R0 0
extern volatile unsigned int IC3R0_bit;
#define IC3R1 1
extern volatile unsigned int IC3R1_bit;
#define IC3R2 2
extern volatile unsigned int IC3R2_bit;
#define IC3R3 3
extern volatile unsigned int IC3R3_bit;
#define IC4R0 0
extern volatile unsigned int IC4R0_bit;
#define IC4R1 1
extern volatile unsigned int IC4R1_bit;
#define IC4R2 2
extern volatile unsigned int IC4R2_bit;
#define IC4R3 3
extern volatile unsigned int IC4R3_bit;
#define IC5R0 0
extern volatile unsigned int IC5R0_bit;
#define IC5R1 1
extern volatile unsigned int IC5R1_bit;
#define IC5R2 2
extern volatile unsigned int IC5R2_bit;
#define IC5R3 3
extern volatile unsigned int IC5R3_bit;
#define IC6R0 0
extern volatile unsigned int IC6R0_bit;
#define IC6R1 1
extern volatile unsigned int IC6R1_bit;
#define IC6R2 2
extern volatile unsigned int IC6R2_bit;
#define IC6R3 3
extern volatile unsigned int IC6R3_bit;
#define IC7R0 0
extern volatile unsigned int IC7R0_bit;
#define IC7R1 1
extern volatile unsigned int IC7R1_bit;
#define IC7R2 2
extern volatile unsigned int IC7R2_bit;
#define IC7R3 3
extern volatile unsigned int IC7R3_bit;
#define IC8R0 0
extern volatile unsigned int IC8R0_bit;
#define IC8R1 1
extern volatile unsigned int IC8R1_bit;
#define IC8R2 2
extern volatile unsigned int IC8R2_bit;
#define IC8R3 3
extern volatile unsigned int IC8R3_bit;
#define IC9R0 0
extern volatile unsigned int IC9R0_bit;
#define IC9R1 1
extern volatile unsigned int IC9R1_bit;
#define IC9R2 2
extern volatile unsigned int IC9R2_bit;
#define IC9R3 3
extern volatile unsigned int IC9R3_bit;
#define OCFAR0 0
extern volatile unsigned int OCFAR0_bit;
#define OCFAR1 1
extern volatile unsigned int OCFAR1_bit;
#define OCFAR2 2
extern volatile unsigned int OCFAR2_bit;
#define OCFAR3 3
extern volatile unsigned int OCFAR3_bit;
#define U1RXR0 0
extern volatile unsigned int U1RXR0_bit;
#define U1RXR1 1
extern volatile unsigned int U1RXR1_bit;
#define U1RXR2 2
extern volatile unsigned int U1RXR2_bit;
#define U1RXR3 3
extern volatile unsigned int U1RXR3_bit;
#define U1CTSR0 0
extern volatile unsigned int U1CTSR0_bit;
#define U1CTSR1 1
extern volatile unsigned int U1CTSR1_bit;
#define U1CTSR2 2
extern volatile unsigned int U1CTSR2_bit;
#define U1CTSR3 3
extern volatile unsigned int U1CTSR3_bit;
#define U2RXR0 0
extern volatile unsigned int U2RXR0_bit;
#define U2RXR1 1
extern volatile unsigned int U2RXR1_bit;
#define U2RXR2 2
extern volatile unsigned int U2RXR2_bit;
#define U2RXR3 3
extern volatile unsigned int U2RXR3_bit;
#define U2CTSR0 0
extern volatile unsigned int U2CTSR0_bit;
#define U2CTSR1 1
extern volatile unsigned int U2CTSR1_bit;
#define U2CTSR2 2
extern volatile unsigned int U2CTSR2_bit;
#define U2CTSR3 3
extern volatile unsigned int U2CTSR3_bit;
#define U3RXR0 0
extern volatile unsigned int U3RXR0_bit;
#define U3RXR1 1
extern volatile unsigned int U3RXR1_bit;
#define U3RXR2 2
extern volatile unsigned int U3RXR2_bit;
#define U3RXR3 3
extern volatile unsigned int U3RXR3_bit;
#define U3CTSR0 0
extern volatile unsigned int U3CTSR0_bit;
#define U3CTSR1 1
extern volatile unsigned int U3CTSR1_bit;
#define U3CTSR2 2
extern volatile unsigned int U3CTSR2_bit;
#define U3CTSR3 3
extern volatile unsigned int U3CTSR3_bit;
#define U4RXR0 0
extern volatile unsigned int U4RXR0_bit;
#define U4RXR1 1
extern volatile unsigned int U4RXR1_bit;
#define U4RXR2 2
extern volatile unsigned int U4RXR2_bit;
#define U4RXR3 3
extern volatile unsigned int U4RXR3_bit;
#define U4CTSR0 0
extern volatile unsigned int U4CTSR0_bit;
#define U4CTSR1 1
extern volatile unsigned int U4CTSR1_bit;
#define U4CTSR2 2
extern volatile unsigned int U4CTSR2_bit;
#define U4CTSR3 3
extern volatile unsigned int U4CTSR3_bit;
#define U5RXR0 0
extern volatile unsigned int U5RXR0_bit;
#define U5RXR1 1
extern volatile unsigned int U5RXR1_bit;
#define U5RXR2 2
extern volatile unsigned int U5RXR2_bit;
#define U5RXR3 3
extern volatile unsigned int U5RXR3_bit;
#define U5CTSR0 0
extern volatile unsigned int U5CTSR0_bit;
#define U5CTSR1 1
extern volatile unsigned int U5CTSR1_bit;
#define U5CTSR2 2
extern volatile unsigned int U5CTSR2_bit;
#define U5CTSR3 3
extern volatile unsigned int U5CTSR3_bit;
#define U6RXR0 0
extern volatile unsigned int U6RXR0_bit;
#define U6RXR1 1
extern volatile unsigned int U6RXR1_bit;
#define U6RXR2 2
extern volatile unsigned int U6RXR2_bit;
#define U6RXR3 3
extern volatile unsigned int U6RXR3_bit;
#define U6CTSR0 0
extern volatile unsigned int U6CTSR0_bit;
#define U6CTSR1 1
extern volatile unsigned int U6CTSR1_bit;
#define U6CTSR2 2
extern volatile unsigned int U6CTSR2_bit;
#define U6CTSR3 3
extern volatile unsigned int U6CTSR3_bit;
#define SDI1R0 0
extern volatile unsigned int SDI1R0_bit;
#define SDI1R1 1
extern volatile unsigned int SDI1R1_bit;
#define SDI1R2 2
extern volatile unsigned int SDI1R2_bit;
#define SDI1R3 3
extern volatile unsigned int SDI1R3_bit;
#define SS1R0 0
extern volatile unsigned int SS1R0_bit;
#define SS1R1 1
extern volatile unsigned int SS1R1_bit;
#define SS1R2 2
extern volatile unsigned int SS1R2_bit;
#define SS1R3 3
extern volatile unsigned int SS1R3_bit;
#define SDI2R0 0
extern volatile unsigned int SDI2R0_bit;
#define SDI2R1 1
extern volatile unsigned int SDI2R1_bit;
#define SDI2R2 2
extern volatile unsigned int SDI2R2_bit;
#define SDI2R3 3
extern volatile unsigned int SDI2R3_bit;
#define SS2R0 0
extern volatile unsigned int SS2R0_bit;
#define SS2R1 1
extern volatile unsigned int SS2R1_bit;
#define SS2R2 2
extern volatile unsigned int SS2R2_bit;
#define SS2R3 3
extern volatile unsigned int SS2R3_bit;
#define SDI3R0 0
extern volatile unsigned int SDI3R0_bit;
#define SDI3R1 1
extern volatile unsigned int SDI3R1_bit;
#define SDI3R2 2
extern volatile unsigned int SDI3R2_bit;
#define SDI3R3 3
extern volatile unsigned int SDI3R3_bit;
#define SS3R0 0
extern volatile unsigned int SS3R0_bit;
#define SS3R1 1
extern volatile unsigned int SS3R1_bit;
#define SS3R2 2
extern volatile unsigned int SS3R2_bit;
#define SS3R3 3
extern volatile unsigned int SS3R3_bit;
#define SDI4R0 0
extern volatile unsigned int SDI4R0_bit;
#define SDI4R1 1
extern volatile unsigned int SDI4R1_bit;
#define SDI4R2 2
extern volatile unsigned int SDI4R2_bit;
#define SDI4R3 3
extern volatile unsigned int SDI4R3_bit;
#define SS4R0 0
extern volatile unsigned int SS4R0_bit;
#define SS4R1 1
extern volatile unsigned int SS4R1_bit;
#define SS4R2 2
extern volatile unsigned int SS4R2_bit;
#define SS4R3 3
extern volatile unsigned int SS4R3_bit;
#define SDI5R0 0
extern volatile unsigned int SDI5R0_bit;
#define SDI5R1 1
extern volatile unsigned int SDI5R1_bit;
#define SDI5R2 2
extern volatile unsigned int SDI5R2_bit;
#define SDI5R3 3
extern volatile unsigned int SDI5R3_bit;
#define SS5R0 0
extern volatile unsigned int SS5R0_bit;
#define SS5R1 1
extern volatile unsigned int SS5R1_bit;
#define SS5R2 2
extern volatile unsigned int SS5R2_bit;
#define SS5R3 3
extern volatile unsigned int SS5R3_bit;
#define SDI6R0 0
extern volatile unsigned int SDI6R0_bit;
#define SDI6R1 1
extern volatile unsigned int SDI6R1_bit;
#define SDI6R2 2
extern volatile unsigned int SDI6R2_bit;
#define SDI6R3 3
extern volatile unsigned int SDI6R3_bit;
#define SS6R0 0
extern volatile unsigned int SS6R0_bit;
#define SS6R1 1
extern volatile unsigned int SS6R1_bit;
#define SS6R2 2
extern volatile unsigned int SS6R2_bit;
#define SS6R3 3
extern volatile unsigned int SS6R3_bit;
#define C1RXR0 0
extern volatile unsigned int C1RXR0_bit;
#define C1RXR1 1
extern volatile unsigned int C1RXR1_bit;
#define C1RXR2 2
extern volatile unsigned int C1RXR2_bit;
#define C1RXR3 3
extern volatile unsigned int C1RXR3_bit;
#define C2RXR0 0
extern volatile unsigned int C2RXR0_bit;
#define C2RXR1 1
extern volatile unsigned int C2RXR1_bit;
#define C2RXR2 2
extern volatile unsigned int C2RXR2_bit;
#define C2RXR3 3
extern volatile unsigned int C2RXR3_bit;
#define REFCLKI1R0 0
extern volatile unsigned int REFCLKI1R0_bit;
#define REFCLKI1R1 1
extern volatile unsigned int REFCLKI1R1_bit;
#define REFCLKI1R2 2
extern volatile unsigned int REFCLKI1R2_bit;
#define REFCLKI1R3 3
extern volatile unsigned int REFCLKI1R3_bit;
#define REFCLKI3R0 0
extern volatile unsigned int REFCLKI3R0_bit;
#define REFCLKI3R1 1
extern volatile unsigned int REFCLKI3R1_bit;
#define REFCLKI3R2 2
extern volatile unsigned int REFCLKI3R2_bit;
#define REFCLKI3R3 3
extern volatile unsigned int REFCLKI3R3_bit;
#define REFCLKI4R0 0
extern volatile unsigned int REFCLKI4R0_bit;
#define REFCLKI4R1 1
extern volatile unsigned int REFCLKI4R1_bit;
#define REFCLKI4R2 2
extern volatile unsigned int REFCLKI4R2_bit;
#define REFCLKI4R3 3
extern volatile unsigned int REFCLKI4R3_bit;
#define RPA14R0 0
extern volatile unsigned int RPA14R0_bit;
#define RPA14R1 1
extern volatile unsigned int RPA14R1_bit;
#define RPA14R2 2
extern volatile unsigned int RPA14R2_bit;
#define RPA14R3 3
extern volatile unsigned int RPA14R3_bit;
#define RPA15R0 0
extern volatile unsigned int RPA15R0_bit;
#define RPA15R1 1
extern volatile unsigned int RPA15R1_bit;
#define RPA15R2 2
extern volatile unsigned int RPA15R2_bit;
#define RPA15R3 3
extern volatile unsigned int RPA15R3_bit;
#define RPB0R0 0
extern volatile unsigned int RPB0R0_bit;
#define RPB0R1 1
extern volatile unsigned int RPB0R1_bit;
#define RPB0R2 2
extern volatile unsigned int RPB0R2_bit;
#define RPB0R3 3
extern volatile unsigned int RPB0R3_bit;
#define RPB1R0 0
extern volatile unsigned int RPB1R0_bit;
#define RPB1R1 1
extern volatile unsigned int RPB1R1_bit;
#define RPB1R2 2
extern volatile unsigned int RPB1R2_bit;
#define RPB1R3 3
extern volatile unsigned int RPB1R3_bit;
#define RPB2R0 0
extern volatile unsigned int RPB2R0_bit;
#define RPB2R1 1
extern volatile unsigned int RPB2R1_bit;
#define RPB2R2 2
extern volatile unsigned int RPB2R2_bit;
#define RPB2R3 3
extern volatile unsigned int RPB2R3_bit;
#define RPB3R0 0
extern volatile unsigned int RPB3R0_bit;
#define RPB3R1 1
extern volatile unsigned int RPB3R1_bit;
#define RPB3R2 2
extern volatile unsigned int RPB3R2_bit;
#define RPB3R3 3
extern volatile unsigned int RPB3R3_bit;
#define RPB5R0 0
extern volatile unsigned int RPB5R0_bit;
#define RPB5R1 1
extern volatile unsigned int RPB5R1_bit;
#define RPB5R2 2
extern volatile unsigned int RPB5R2_bit;
#define RPB5R3 3
extern volatile unsigned int RPB5R3_bit;
#define RPB6R0 0
extern volatile unsigned int RPB6R0_bit;
#define RPB6R1 1
extern volatile unsigned int RPB6R1_bit;
#define RPB6R2 2
extern volatile unsigned int RPB6R2_bit;
#define RPB6R3 3
extern volatile unsigned int RPB6R3_bit;
#define RPB7R0 0
extern volatile unsigned int RPB7R0_bit;
#define RPB7R1 1
extern volatile unsigned int RPB7R1_bit;
#define RPB7R2 2
extern volatile unsigned int RPB7R2_bit;
#define RPB7R3 3
extern volatile unsigned int RPB7R3_bit;
#define RPB8R0 0
extern volatile unsigned int RPB8R0_bit;
#define RPB8R1 1
extern volatile unsigned int RPB8R1_bit;
#define RPB8R2 2
extern volatile unsigned int RPB8R2_bit;
#define RPB8R3 3
extern volatile unsigned int RPB8R3_bit;
#define RPB9R0 0
extern volatile unsigned int RPB9R0_bit;
#define RPB9R1 1
extern volatile unsigned int RPB9R1_bit;
#define RPB9R2 2
extern volatile unsigned int RPB9R2_bit;
#define RPB9R3 3
extern volatile unsigned int RPB9R3_bit;
#define RPB10R0 0
extern volatile unsigned int RPB10R0_bit;
#define RPB10R1 1
extern volatile unsigned int RPB10R1_bit;
#define RPB10R2 2
extern volatile unsigned int RPB10R2_bit;
#define RPB10R3 3
extern volatile unsigned int RPB10R3_bit;
#define RPB14R0 0
extern volatile unsigned int RPB14R0_bit;
#define RPB14R1 1
extern volatile unsigned int RPB14R1_bit;
#define RPB14R2 2
extern volatile unsigned int RPB14R2_bit;
#define RPB14R3 3
extern volatile unsigned int RPB14R3_bit;
#define RPB15R0 0
extern volatile unsigned int RPB15R0_bit;
#define RPB15R1 1
extern volatile unsigned int RPB15R1_bit;
#define RPB15R2 2
extern volatile unsigned int RPB15R2_bit;
#define RPB15R3 3
extern volatile unsigned int RPB15R3_bit;
#define RPC1R0 0
extern volatile unsigned int RPC1R0_bit;
#define RPC1R1 1
extern volatile unsigned int RPC1R1_bit;
#define RPC1R2 2
extern volatile unsigned int RPC1R2_bit;
#define RPC1R3 3
extern volatile unsigned int RPC1R3_bit;
#define RPC2R0 0
extern volatile unsigned int RPC2R0_bit;
#define RPC2R1 1
extern volatile unsigned int RPC2R1_bit;
#define RPC2R2 2
extern volatile unsigned int RPC2R2_bit;
#define RPC2R3 3
extern volatile unsigned int RPC2R3_bit;
#define RPC3R0 0
extern volatile unsigned int RPC3R0_bit;
#define RPC3R1 1
extern volatile unsigned int RPC3R1_bit;
#define RPC3R2 2
extern volatile unsigned int RPC3R2_bit;
#define RPC3R3 3
extern volatile unsigned int RPC3R3_bit;
#define RPC4R0 0
extern volatile unsigned int RPC4R0_bit;
#define RPC4R1 1
extern volatile unsigned int RPC4R1_bit;
#define RPC4R2 2
extern volatile unsigned int RPC4R2_bit;
#define RPC4R3 3
extern volatile unsigned int RPC4R3_bit;
#define RPC13R0 0
extern volatile unsigned int RPC13R0_bit;
#define RPC13R1 1
extern volatile unsigned int RPC13R1_bit;
#define RPC13R2 2
extern volatile unsigned int RPC13R2_bit;
#define RPC13R3 3
extern volatile unsigned int RPC13R3_bit;
#define RPC14R0 0
extern volatile unsigned int RPC14R0_bit;
#define RPC14R1 1
extern volatile unsigned int RPC14R1_bit;
#define RPC14R2 2
extern volatile unsigned int RPC14R2_bit;
#define RPC14R3 3
extern volatile unsigned int RPC14R3_bit;
#define RPD0R0 0
extern volatile unsigned int RPD0R0_bit;
#define RPD0R1 1
extern volatile unsigned int RPD0R1_bit;
#define RPD0R2 2
extern volatile unsigned int RPD0R2_bit;
#define RPD0R3 3
extern volatile unsigned int RPD0R3_bit;
#define RPD1R0 0
extern volatile unsigned int RPD1R0_bit;
#define RPD1R1 1
extern volatile unsigned int RPD1R1_bit;
#define RPD1R2 2
extern volatile unsigned int RPD1R2_bit;
#define RPD1R3 3
extern volatile unsigned int RPD1R3_bit;
#define RPD2R0 0
extern volatile unsigned int RPD2R0_bit;
#define RPD2R1 1
extern volatile unsigned int RPD2R1_bit;
#define RPD2R2 2
extern volatile unsigned int RPD2R2_bit;
#define RPD2R3 3
extern volatile unsigned int RPD2R3_bit;
#define RPD3R0 0
extern volatile unsigned int RPD3R0_bit;
#define RPD3R1 1
extern volatile unsigned int RPD3R1_bit;
#define RPD3R2 2
extern volatile unsigned int RPD3R2_bit;
#define RPD3R3 3
extern volatile unsigned int RPD3R3_bit;
#define RPD4R0 0
extern volatile unsigned int RPD4R0_bit;
#define RPD4R1 1
extern volatile unsigned int RPD4R1_bit;
#define RPD4R2 2
extern volatile unsigned int RPD4R2_bit;
#define RPD4R3 3
extern volatile unsigned int RPD4R3_bit;
#define RPD5R0 0
extern volatile unsigned int RPD5R0_bit;
#define RPD5R1 1
extern volatile unsigned int RPD5R1_bit;
#define RPD5R2 2
extern volatile unsigned int RPD5R2_bit;
#define RPD5R3 3
extern volatile unsigned int RPD5R3_bit;
#define RPD9R0 0
extern volatile unsigned int RPD9R0_bit;
#define RPD9R1 1
extern volatile unsigned int RPD9R1_bit;
#define RPD9R2 2
extern volatile unsigned int RPD9R2_bit;
#define RPD9R3 3
extern volatile unsigned int RPD9R3_bit;
#define RPD10R0 0
extern volatile unsigned int RPD10R0_bit;
#define RPD10R1 1
extern volatile unsigned int RPD10R1_bit;
#define RPD10R2 2
extern volatile unsigned int RPD10R2_bit;
#define RPD10R3 3
extern volatile unsigned int RPD10R3_bit;
#define RPD11R0 0
extern volatile unsigned int RPD11R0_bit;
#define RPD11R1 1
extern volatile unsigned int RPD11R1_bit;
#define RPD11R2 2
extern volatile unsigned int RPD11R2_bit;
#define RPD11R3 3
extern volatile unsigned int RPD11R3_bit;
#define RPD12R0 0
extern volatile unsigned int RPD12R0_bit;
#define RPD12R1 1
extern volatile unsigned int RPD12R1_bit;
#define RPD12R2 2
extern volatile unsigned int RPD12R2_bit;
#define RPD12R3 3
extern volatile unsigned int RPD12R3_bit;
#define RPD14R0 0
extern volatile unsigned int RPD14R0_bit;
#define RPD14R1 1
extern volatile unsigned int RPD14R1_bit;
#define RPD14R2 2
extern volatile unsigned int RPD14R2_bit;
#define RPD14R3 3
extern volatile unsigned int RPD14R3_bit;
#define RPD15R0 0
extern volatile unsigned int RPD15R0_bit;
#define RPD15R1 1
extern volatile unsigned int RPD15R1_bit;
#define RPD15R2 2
extern volatile unsigned int RPD15R2_bit;
#define RPD15R3 3
extern volatile unsigned int RPD15R3_bit;
#define RPE3R0 0
extern volatile unsigned int RPE3R0_bit;
#define RPE3R1 1
extern volatile unsigned int RPE3R1_bit;
#define RPE3R2 2
extern volatile unsigned int RPE3R2_bit;
#define RPE3R3 3
extern volatile unsigned int RPE3R3_bit;
#define RPE5R0 0
extern volatile unsigned int RPE5R0_bit;
#define RPE5R1 1
extern volatile unsigned int RPE5R1_bit;
#define RPE5R2 2
extern volatile unsigned int RPE5R2_bit;
#define RPE5R3 3
extern volatile unsigned int RPE5R3_bit;
#define RPE8R0 0
extern volatile unsigned int RPE8R0_bit;
#define RPE8R1 1
extern volatile unsigned int RPE8R1_bit;
#define RPE8R2 2
extern volatile unsigned int RPE8R2_bit;
#define RPE8R3 3
extern volatile unsigned int RPE8R3_bit;
#define RPE9R0 0
extern volatile unsigned int RPE9R0_bit;
#define RPE9R1 1
extern volatile unsigned int RPE9R1_bit;
#define RPE9R2 2
extern volatile unsigned int RPE9R2_bit;
#define RPE9R3 3
extern volatile unsigned int RPE9R3_bit;
#define RPF0R0 0
extern volatile unsigned int RPF0R0_bit;
#define RPF0R1 1
extern volatile unsigned int RPF0R1_bit;
#define RPF0R2 2
extern volatile unsigned int RPF0R2_bit;
#define RPF0R3 3
extern volatile unsigned int RPF0R3_bit;
#define RPF1R0 0
extern volatile unsigned int RPF1R0_bit;
#define RPF1R1 1
extern volatile unsigned int RPF1R1_bit;
#define RPF1R2 2
extern volatile unsigned int RPF1R2_bit;
#define RPF1R3 3
extern volatile unsigned int RPF1R3_bit;
#define RPF2R0 0
extern volatile unsigned int RPF2R0_bit;
#define RPF2R1 1
extern volatile unsigned int RPF2R1_bit;
#define RPF2R2 2
extern volatile unsigned int RPF2R2_bit;
#define RPF2R3 3
extern volatile unsigned int RPF2R3_bit;
#define RPF3R0 0
extern volatile unsigned int RPF3R0_bit;
#define RPF3R1 1
extern volatile unsigned int RPF3R1_bit;
#define RPF3R2 2
extern volatile unsigned int RPF3R2_bit;
#define RPF3R3 3
extern volatile unsigned int RPF3R3_bit;
#define RPF4R0 0
extern volatile unsigned int RPF4R0_bit;
#define RPF4R1 1
extern volatile unsigned int RPF4R1_bit;
#define RPF4R2 2
extern volatile unsigned int RPF4R2_bit;
#define RPF4R3 3
extern volatile unsigned int RPF4R3_bit;
#define RPF5R0 0
extern volatile unsigned int RPF5R0_bit;
#define RPF5R1 1
extern volatile unsigned int RPF5R1_bit;
#define RPF5R2 2
extern volatile unsigned int RPF5R2_bit;
#define RPF5R3 3
extern volatile unsigned int RPF5R3_bit;
#define RPF8R0 0
extern volatile unsigned int RPF8R0_bit;
#define RPF8R1 1
extern volatile unsigned int RPF8R1_bit;
#define RPF8R2 2
extern volatile unsigned int RPF8R2_bit;
#define RPF8R3 3
extern volatile unsigned int RPF8R3_bit;
#define RPF12R0 0
extern volatile unsigned int RPF12R0_bit;
#define RPF12R1 1
extern volatile unsigned int RPF12R1_bit;
#define RPF12R2 2
extern volatile unsigned int RPF12R2_bit;
#define RPF12R3 3
extern volatile unsigned int RPF12R3_bit;
#define RPF13R0 0
extern volatile unsigned int RPF13R0_bit;
#define RPF13R1 1
extern volatile unsigned int RPF13R1_bit;
#define RPF13R2 2
extern volatile unsigned int RPF13R2_bit;
#define RPF13R3 3
extern volatile unsigned int RPF13R3_bit;
#define RPG0R0 0
extern volatile unsigned int RPG0R0_bit;
#define RPG0R1 1
extern volatile unsigned int RPG0R1_bit;
#define RPG0R2 2
extern volatile unsigned int RPG0R2_bit;
#define RPG0R3 3
extern volatile unsigned int RPG0R3_bit;
#define RPG1R0 0
extern volatile unsigned int RPG1R0_bit;
#define RPG1R1 1
extern volatile unsigned int RPG1R1_bit;
#define RPG1R2 2
extern volatile unsigned int RPG1R2_bit;
#define RPG1R3 3
extern volatile unsigned int RPG1R3_bit;
#define RPG6R0 0
extern volatile unsigned int RPG6R0_bit;
#define RPG6R1 1
extern volatile unsigned int RPG6R1_bit;
#define RPG6R2 2
extern volatile unsigned int RPG6R2_bit;
#define RPG6R3 3
extern volatile unsigned int RPG6R3_bit;
#define RPG7R0 0
extern volatile unsigned int RPG7R0_bit;
#define RPG7R1 1
extern volatile unsigned int RPG7R1_bit;
#define RPG7R2 2
extern volatile unsigned int RPG7R2_bit;
#define RPG7R3 3
extern volatile unsigned int RPG7R3_bit;
#define RPG8R0 0
extern volatile unsigned int RPG8R0_bit;
#define RPG8R1 1
extern volatile unsigned int RPG8R1_bit;
#define RPG8R2 2
extern volatile unsigned int RPG8R2_bit;
#define RPG8R3 3
extern volatile unsigned int RPG8R3_bit;
#define RPG9R0 0
extern volatile unsigned int RPG9R0_bit;
#define RPG9R1 1
extern volatile unsigned int RPG9R1_bit;
#define RPG9R2 2
extern volatile unsigned int RPG9R2_bit;
#define RPG9R3 3
extern volatile unsigned int RPG9R3_bit;
#define INT0EP 0
extern volatile unsigned int INT0EP_bit;
#define INT1EP 1
extern volatile unsigned int INT1EP_bit;
#define INT2EP 2
extern volatile unsigned int INT2EP_bit;
#define INT3EP 3
extern volatile unsigned int INT3EP_bit;
#define INT4EP 4
extern volatile unsigned int INT4EP_bit;
#define TPC0 8
extern volatile unsigned int TPC0_bit;
#define TPC1 9
extern volatile unsigned int TPC1_bit;
#define TPC2 10
extern volatile unsigned int TPC2_bit;
#define MVEC 12
extern volatile unsigned int MVEC_bit;
#define NMIKEY0 24
extern volatile unsigned int NMIKEY0_bit;
#define NMIKEY1 25
extern volatile unsigned int NMIKEY1_bit;
#define NMIKEY2 26
extern volatile unsigned int NMIKEY2_bit;
#define NMIKEY3 27
extern volatile unsigned int NMIKEY3_bit;
#define NMIKEY4 28
extern volatile unsigned int NMIKEY4_bit;
#define NMIKEY5 29
extern volatile unsigned int NMIKEY5_bit;
#define NMIKEY6 30
extern volatile unsigned int NMIKEY6_bit;
#define NMIKEY7 31
extern volatile unsigned int NMIKEY7_bit;
#define SS0 0
extern volatile unsigned int SS0_bit;
#define PRI1SS0 4
extern volatile unsigned int PRI1SS0_bit;
#define PRI1SS1 5
extern volatile unsigned int PRI1SS1_bit;
#define PRI1SS2 6
extern volatile unsigned int PRI1SS2_bit;
#define PRI1SS3 7
extern volatile unsigned int PRI1SS3_bit;
#define PRI2SS0 8
extern volatile unsigned int PRI2SS0_bit;
#define PRI2SS1 9
extern volatile unsigned int PRI2SS1_bit;
#define PRI2SS2 10
extern volatile unsigned int PRI2SS2_bit;
#define PRI2SS3 11
extern volatile unsigned int PRI2SS3_bit;
#define PRI3SS0 12
extern volatile unsigned int PRI3SS0_bit;
#define PRI3SS1 13
extern volatile unsigned int PRI3SS1_bit;
#define PRI3SS2 14
extern volatile unsigned int PRI3SS2_bit;
#define PRI3SS3 15
extern volatile unsigned int PRI3SS3_bit;
#define PRI4SS0 16
extern volatile unsigned int PRI4SS0_bit;
#define PRI4SS1 17
extern volatile unsigned int PRI4SS1_bit;
#define PRI4SS2 18
extern volatile unsigned int PRI4SS2_bit;
#define PRI4SS3 19
extern volatile unsigned int PRI4SS3_bit;
#define PRI5SS0 20
extern volatile unsigned int PRI5SS0_bit;
#define PRI5SS1 21
extern volatile unsigned int PRI5SS1_bit;
#define PRI5SS2 22
extern volatile unsigned int PRI5SS2_bit;
#define PRI5SS3 23
extern volatile unsigned int PRI5SS3_bit;
#define PRI6SS0 24
extern volatile unsigned int PRI6SS0_bit;
#define PRI6SS1 25
extern volatile unsigned int PRI6SS1_bit;
#define PRI6SS2 26
extern volatile unsigned int PRI6SS2_bit;
#define PRI6SS3 27
extern volatile unsigned int PRI6SS3_bit;
#define PRI7SS0 28
extern volatile unsigned int PRI7SS0_bit;
#define PRI7SS1 29
extern volatile unsigned int PRI7SS1_bit;
#define PRI7SS2 30
extern volatile unsigned int PRI7SS2_bit;
#define PRI7SS3 31
extern volatile unsigned int PRI7SS3_bit;
#define SIRQ0 0
extern volatile unsigned int SIRQ0_bit;
#define SIRQ1 1
extern volatile unsigned int SIRQ1_bit;
#define SIRQ2 2
extern volatile unsigned int SIRQ2_bit;
#define SIRQ3 3
extern volatile unsigned int SIRQ3_bit;
#define SIRQ4 4
extern volatile unsigned int SIRQ4_bit;
#define SIRQ5 5
extern volatile unsigned int SIRQ5_bit;
#define SIRQ6 6
extern volatile unsigned int SIRQ6_bit;
#define SIRQ7 7
extern volatile unsigned int SIRQ7_bit;
#define SRIPL0 8
extern volatile unsigned int SRIPL0_bit;
#define SRIPL1 9
extern volatile unsigned int SRIPL1_bit;
#define SRIPL2 10
extern volatile unsigned int SRIPL2_bit;
#define IPTMR0 0
extern volatile unsigned int IPTMR0_bit;
#define IPTMR1 1
extern volatile unsigned int IPTMR1_bit;
#define IPTMR2 2
extern volatile unsigned int IPTMR2_bit;
#define IPTMR3 3
extern volatile unsigned int IPTMR3_bit;
#define IPTMR4 4
extern volatile unsigned int IPTMR4_bit;
#define IPTMR5 5
extern volatile unsigned int IPTMR5_bit;
#define IPTMR6 6
extern volatile unsigned int IPTMR6_bit;
#define IPTMR7 7
extern volatile unsigned int IPTMR7_bit;
#define IPTMR8 8
extern volatile unsigned int IPTMR8_bit;
#define IPTMR9 9
extern volatile unsigned int IPTMR9_bit;
#define IPTMR10 10
extern volatile unsigned int IPTMR10_bit;
#define IPTMR11 11
extern volatile unsigned int IPTMR11_bit;
#define IPTMR12 12
extern volatile unsigned int IPTMR12_bit;
#define IPTMR13 13
extern volatile unsigned int IPTMR13_bit;
#define IPTMR14 14
extern volatile unsigned int IPTMR14_bit;
#define IPTMR15 15
extern volatile unsigned int IPTMR15_bit;
#define IPTMR16 16
extern volatile unsigned int IPTMR16_bit;
#define IPTMR17 17
extern volatile unsigned int IPTMR17_bit;
#define IPTMR18 18
extern volatile unsigned int IPTMR18_bit;
#define IPTMR19 19
extern volatile unsigned int IPTMR19_bit;
#define IPTMR20 20
extern volatile unsigned int IPTMR20_bit;
#define IPTMR21 21
extern volatile unsigned int IPTMR21_bit;
#define IPTMR22 22
extern volatile unsigned int IPTMR22_bit;
#define IPTMR23 23
extern volatile unsigned int IPTMR23_bit;
#define IPTMR24 24
extern volatile unsigned int IPTMR24_bit;
#define IPTMR25 25
extern volatile unsigned int IPTMR25_bit;
#define IPTMR26 26
extern volatile unsigned int IPTMR26_bit;
#define IPTMR27 27
extern volatile unsigned int IPTMR27_bit;
#define IPTMR28 28
extern volatile unsigned int IPTMR28_bit;
#define IPTMR29 29
extern volatile unsigned int IPTMR29_bit;
#define IPTMR30 30
extern volatile unsigned int IPTMR30_bit;
#define IPTMR31 31
extern volatile unsigned int IPTMR31_bit;
#define CTIF 0
extern volatile unsigned int CTIF_bit;
#define CS0IF 1
extern volatile unsigned int CS0IF_bit;
#define CS1IF 2
extern volatile unsigned int CS1IF_bit;
#define INT0IF 3
extern volatile unsigned int INT0IF_bit;
#define T1IF 4
extern volatile unsigned int T1IF_bit;
#define IC1EIF 5
extern volatile unsigned int IC1EIF_bit;
#define IC1IF 6
extern volatile unsigned int IC1IF_bit;
#define OC1IF 7
extern volatile unsigned int OC1IF_bit;
#define INT1IF 8
extern volatile unsigned int INT1IF_bit;
#define T2IF 9
extern volatile unsigned int T2IF_bit;
#define IC2EIF 10
extern volatile unsigned int IC2EIF_bit;
#define IC2IF 11
extern volatile unsigned int IC2IF_bit;
#define OC2IF 12
extern volatile unsigned int OC2IF_bit;
#define INT2IF 13
extern volatile unsigned int INT2IF_bit;
#define T3IF 14
extern volatile unsigned int T3IF_bit;
#define IC3EIF 15
extern volatile unsigned int IC3EIF_bit;
#define IC3IF 16
extern volatile unsigned int IC3IF_bit;
#define OC3IF 17
extern volatile unsigned int OC3IF_bit;
#define INT3IF 18
extern volatile unsigned int INT3IF_bit;
#define T4IF 19
extern volatile unsigned int T4IF_bit;
#define IC4EIF 20
extern volatile unsigned int IC4EIF_bit;
#define IC4IF 21
extern volatile unsigned int IC4IF_bit;
#define OC4IF 22
extern volatile unsigned int OC4IF_bit;
#define INT4IF 23
extern volatile unsigned int INT4IF_bit;
#define T5IF 24
extern volatile unsigned int T5IF_bit;
#define IC5EIF 25
extern volatile unsigned int IC5EIF_bit;
#define IC5IF 26
extern volatile unsigned int IC5IF_bit;
#define OC5IF 27
extern volatile unsigned int OC5IF_bit;
#define T6IF 28
extern volatile unsigned int T6IF_bit;
#define IC6EIF 29
extern volatile unsigned int IC6EIF_bit;
#define IC6IF 30
extern volatile unsigned int IC6IF_bit;
#define OC6IF 31
extern volatile unsigned int OC6IF_bit;
#define T7IF 0
extern volatile unsigned int T7IF_bit;
#define IC7EIF 1
extern volatile unsigned int IC7EIF_bit;
#define IC7IF 2
extern volatile unsigned int IC7IF_bit;
#define OC7IF 3
extern volatile unsigned int OC7IF_bit;
#define T8IF 4
extern volatile unsigned int T8IF_bit;
#define IC8EIF 5
extern volatile unsigned int IC8EIF_bit;
#define IC8IF 6
extern volatile unsigned int IC8IF_bit;
#define OC8IF 7
extern volatile unsigned int OC8IF_bit;
#define T9IF 8
extern volatile unsigned int T9IF_bit;
#define IC9EIF 9
extern volatile unsigned int IC9EIF_bit;
#define IC9IF 10
extern volatile unsigned int IC9IF_bit;
#define OC9IF 11
extern volatile unsigned int OC9IF_bit;
#define ADCIF 12
extern volatile unsigned int ADCIF_bit;
#define ADCFIFOIF 13
extern volatile unsigned int ADCFIFOIF_bit;
#define ADCDC1IF 14
extern volatile unsigned int ADCDC1IF_bit;
#define ADCDC2IF 15
extern volatile unsigned int ADCDC2IF_bit;
#define ADCDC3IF 16
extern volatile unsigned int ADCDC3IF_bit;
#define ADCDC4IF 17
extern volatile unsigned int ADCDC4IF_bit;
#define ADCDC5IF 18
extern volatile unsigned int ADCDC5IF_bit;
#define ADCDC6IF 19
extern volatile unsigned int ADCDC6IF_bit;
#define ADCDF1IF 20
extern volatile unsigned int ADCDF1IF_bit;
#define ADCDF2IF 21
extern volatile unsigned int ADCDF2IF_bit;
#define ADCDF3IF 22
extern volatile unsigned int ADCDF3IF_bit;
#define ADCDF4IF 23
extern volatile unsigned int ADCDF4IF_bit;
#define ADCDF5IF 24
extern volatile unsigned int ADCDF5IF_bit;
#define ADCDF6IF 25
extern volatile unsigned int ADCDF6IF_bit;
#define ADCFLTIF 26
extern volatile unsigned int ADCFLTIF_bit;
#define ADCD0IF 27
extern volatile unsigned int ADCD0IF_bit;
#define ADCD1IF 28
extern volatile unsigned int ADCD1IF_bit;
#define ADCD2IF 29
extern volatile unsigned int ADCD2IF_bit;
#define ADCD3IF 30
extern volatile unsigned int ADCD3IF_bit;
#define ADCD4IF 31
extern volatile unsigned int ADCD4IF_bit;
#define ADCD5IF 0
extern volatile unsigned int ADCD5IF_bit;
#define ADCD6IF 1
extern volatile unsigned int ADCD6IF_bit;
#define ADCD7IF 2
extern volatile unsigned int ADCD7IF_bit;
#define ADCD8IF 3
extern volatile unsigned int ADCD8IF_bit;
#define ADCD9IF 4
extern volatile unsigned int ADCD9IF_bit;
#define ADCD10IF 5
extern volatile unsigned int ADCD10IF_bit;
#define ADCD11IF 6
extern volatile unsigned int ADCD11IF_bit;
#define ADCD12IF 7
extern volatile unsigned int ADCD12IF_bit;
#define ADCD13IF 8
extern volatile unsigned int ADCD13IF_bit;
#define ADCD14IF 9
extern volatile unsigned int ADCD14IF_bit;
#define ADCD15IF 10
extern volatile unsigned int ADCD15IF_bit;
#define ADCD16IF 11
extern volatile unsigned int ADCD16IF_bit;
#define ADCD17IF 12
extern volatile unsigned int ADCD17IF_bit;
#define ADCD18IF 13
extern volatile unsigned int ADCD18IF_bit;
#define ADCD19IF 14
extern volatile unsigned int ADCD19IF_bit;
#define ADCD20IF 15
extern volatile unsigned int ADCD20IF_bit;
#define ADCD21IF 16
extern volatile unsigned int ADCD21IF_bit;
#define ADCD22IF 17
extern volatile unsigned int ADCD22IF_bit;
#define ADCD23IF 18
extern volatile unsigned int ADCD23IF_bit;
#define ADCD24IF 19
extern volatile unsigned int ADCD24IF_bit;
#define ADCD25IF 20
extern volatile unsigned int ADCD25IF_bit;
#define ADCD26IF 21
extern volatile unsigned int ADCD26IF_bit;
#define ADCD27IF 22
extern volatile unsigned int ADCD27IF_bit;
#define ADCD28IF 23
extern volatile unsigned int ADCD28IF_bit;
#define ADCD29IF 24
extern volatile unsigned int ADCD29IF_bit;
#define ADCD30IF 25
extern volatile unsigned int ADCD30IF_bit;
#define ADCD31IF 26
extern volatile unsigned int ADCD31IF_bit;
#define ADCD32IF 27
extern volatile unsigned int ADCD32IF_bit;
#define ADCD33IF 28
extern volatile unsigned int ADCD33IF_bit;
#define ADCD34IF 29
extern volatile unsigned int ADCD34IF_bit;
#define ADCD43IF 6
extern volatile unsigned int ADCD43IF_bit;
#define ADCD44IF 7
extern volatile unsigned int ADCD44IF_bit;
#define CPCIF 8
extern volatile unsigned int CPCIF_bit;
#define CFDCIF 9
extern volatile unsigned int CFDCIF_bit;
#define SBIF 10
extern volatile unsigned int SBIF_bit;
#define SPI1EIF 13
extern volatile unsigned int SPI1EIF_bit;
#define SPI1RXIF 14
extern volatile unsigned int SPI1RXIF_bit;
#define SPI1TXIF 15
extern volatile unsigned int SPI1TXIF_bit;
#define U1EIF 16
extern volatile unsigned int U1EIF_bit;
#define U1RXIF 17
extern volatile unsigned int U1RXIF_bit;
#define U1TXIF 18
extern volatile unsigned int U1TXIF_bit;
#define I2C1BIF 19
extern volatile unsigned int I2C1BIF_bit;
#define I2C1SIF 20
extern volatile unsigned int I2C1SIF_bit;
#define I2C1MIF 21
extern volatile unsigned int I2C1MIF_bit;
#define CNAIF 22
extern volatile unsigned int CNAIF_bit;
#define CNBIF 23
extern volatile unsigned int CNBIF_bit;
#define CNCIF 24
extern volatile unsigned int CNCIF_bit;
#define CNDIF 25
extern volatile unsigned int CNDIF_bit;
#define CNEIF 26
extern volatile unsigned int CNEIF_bit;
#define CNFIF 27
extern volatile unsigned int CNFIF_bit;
#define CNGIF 28
extern volatile unsigned int CNGIF_bit;
#define PMPIF 0
extern volatile unsigned int PMPIF_bit;
#define PMPEIF 1
extern volatile unsigned int PMPEIF_bit;
#define CMP1IF 2
extern volatile unsigned int CMP1IF_bit;
#define CMP2IF 3
extern volatile unsigned int CMP2IF_bit;
#define USBIF 4
extern volatile unsigned int USBIF_bit;
#define USBDMAIF 5
extern volatile unsigned int USBDMAIF_bit;
#define DMA0IF 6
extern volatile unsigned int DMA0IF_bit;
#define DMA1IF 7
extern volatile unsigned int DMA1IF_bit;
#define DMA2IF 8
extern volatile unsigned int DMA2IF_bit;
#define DMA3IF 9
extern volatile unsigned int DMA3IF_bit;
#define DMA4IF 10
extern volatile unsigned int DMA4IF_bit;
#define DMA5IF 11
extern volatile unsigned int DMA5IF_bit;
#define DMA6IF 12
extern volatile unsigned int DMA6IF_bit;
#define DMA7IF 13
extern volatile unsigned int DMA7IF_bit;
#define SPI2EIF 14
extern volatile unsigned int SPI2EIF_bit;
#define SPI2RXIF 15
extern volatile unsigned int SPI2RXIF_bit;
#define SPI2TXIF 16
extern volatile unsigned int SPI2TXIF_bit;
#define U2EIF 17
extern volatile unsigned int U2EIF_bit;
#define U2RXIF 18
extern volatile unsigned int U2RXIF_bit;
#define U2TXIF 19
extern volatile unsigned int U2TXIF_bit;
#define I2C2BIF 20
extern volatile unsigned int I2C2BIF_bit;
#define I2C2SIF 21
extern volatile unsigned int I2C2SIF_bit;
#define I2C2MIF 22
extern volatile unsigned int I2C2MIF_bit;
#define CAN1IF 23
extern volatile unsigned int CAN1IF_bit;
#define CAN2IF 24
extern volatile unsigned int CAN2IF_bit;
#define ETHIF 25
extern volatile unsigned int ETHIF_bit;
#define SPI3EIF 26
extern volatile unsigned int SPI3EIF_bit;
#define SPI3RXIF 27
extern volatile unsigned int SPI3RXIF_bit;
#define SPI3TXIF 28
extern volatile unsigned int SPI3TXIF_bit;
#define U3EIF 29
extern volatile unsigned int U3EIF_bit;
#define U3RXIF 30
extern volatile unsigned int U3RXIF_bit;
#define U3TXIF 31
extern volatile unsigned int U3TXIF_bit;
#define I2C3BIF 0
extern volatile unsigned int I2C3BIF_bit;
#define I2C3SIF 1
extern volatile unsigned int I2C3SIF_bit;
#define I2C3MIF 2
extern volatile unsigned int I2C3MIF_bit;
#define SPI4EIF 3
extern volatile unsigned int SPI4EIF_bit;
#define SPI4RXIF 4
extern volatile unsigned int SPI4RXIF_bit;
#define SPI4TXIF 5
extern volatile unsigned int SPI4TXIF_bit;
#define RTCCIF 6
extern volatile unsigned int RTCCIF_bit;
#define FCEIF 7
extern volatile unsigned int FCEIF_bit;
#define PREIF 8
extern volatile unsigned int PREIF_bit;
#define SQI1IF 9
extern volatile unsigned int SQI1IF_bit;
#define U4EIF 10
extern volatile unsigned int U4EIF_bit;
#define U4RXIF 11
extern volatile unsigned int U4RXIF_bit;
#define U4TXIF 12
extern volatile unsigned int U4TXIF_bit;
#define I2C4BIF 13
extern volatile unsigned int I2C4BIF_bit;
#define I2C4SIF 14
extern volatile unsigned int I2C4SIF_bit;
#define I2C4MIF 15
extern volatile unsigned int I2C4MIF_bit;
#define SPI5EIF 16
extern volatile unsigned int SPI5EIF_bit;
#define SPI5RXIF 17
extern volatile unsigned int SPI5RXIF_bit;
#define SPI5TXIF 18
extern volatile unsigned int SPI5TXIF_bit;
#define U5EIF 19
extern volatile unsigned int U5EIF_bit;
#define U5RXIF 20
extern volatile unsigned int U5RXIF_bit;
#define U5TXIF 21
extern volatile unsigned int U5TXIF_bit;
#define I2C5BIF 22
extern volatile unsigned int I2C5BIF_bit;
#define I2C5SIF 23
extern volatile unsigned int I2C5SIF_bit;
#define I2C5MIF 24
extern volatile unsigned int I2C5MIF_bit;
#define SPI6IF 25
extern volatile unsigned int SPI6IF_bit;
#define SPI6RXIF 26
extern volatile unsigned int SPI6RXIF_bit;
#define SPI6TX 27
extern volatile unsigned int SPI6TX_bit;
#define U6EIF 28
extern volatile unsigned int U6EIF_bit;
#define U6RXIF 29
extern volatile unsigned int U6RXIF_bit;
#define U6TXIF 30
extern volatile unsigned int U6TXIF_bit;
#define ADCEOSIF 0
extern volatile unsigned int ADCEOSIF_bit;
#define ADCARDYIF 1
extern volatile unsigned int ADCARDYIF_bit;
#define ADCURDYIF 2
extern volatile unsigned int ADCURDYIF_bit;
#define ADCGRPIF 4
extern volatile unsigned int ADCGRPIF_bit;
#define ADC0EIF 6
extern volatile unsigned int ADC0EIF_bit;
#define ADC1EIF 7
extern volatile unsigned int ADC1EIF_bit;
#define ADC2EIF 8
extern volatile unsigned int ADC2EIF_bit;
#define ADC3EIF 9
extern volatile unsigned int ADC3EIF_bit;
#define ADC4EIF 10
extern volatile unsigned int ADC4EIF_bit;
#define ADC7EIF 13
extern volatile unsigned int ADC7EIF_bit;
#define ADC0WIF 14
extern volatile unsigned int ADC0WIF_bit;
#define ADC1WIF 15
extern volatile unsigned int ADC1WIF_bit;
#define ADC2WIF 16
extern volatile unsigned int ADC2WIF_bit;
#define ADC3WIF 17
extern volatile unsigned int ADC3WIF_bit;
#define ADC4WIF 18
extern volatile unsigned int ADC4WIF_bit;
#define ADC7WIF 21
extern volatile unsigned int ADC7WIF_bit;
#define CTIE 0
extern volatile unsigned int CTIE_bit;
#define CS0IE 1
extern volatile unsigned int CS0IE_bit;
#define CS1IE 2
extern volatile unsigned int CS1IE_bit;
#define INT0IE 3
extern volatile unsigned int INT0IE_bit;
#define T1IE 4
extern volatile unsigned int T1IE_bit;
#define IC1EIE 5
extern volatile unsigned int IC1EIE_bit;
#define IC1IE 6
extern volatile unsigned int IC1IE_bit;
#define OC1IE 7
extern volatile unsigned int OC1IE_bit;
#define INT1IE 8
extern volatile unsigned int INT1IE_bit;
#define T2IE 9
extern volatile unsigned int T2IE_bit;
#define IC2EIE 10
extern volatile unsigned int IC2EIE_bit;
#define IC2IE 11
extern volatile unsigned int IC2IE_bit;
#define OC2IE 12
extern volatile unsigned int OC2IE_bit;
#define INT2IE 13
extern volatile unsigned int INT2IE_bit;
#define T3IE 14
extern volatile unsigned int T3IE_bit;
#define IC3EIE 15
extern volatile unsigned int IC3EIE_bit;
#define IC3IE 16
extern volatile unsigned int IC3IE_bit;
#define OC3IE 17
extern volatile unsigned int OC3IE_bit;
#define INT3IE 18
extern volatile unsigned int INT3IE_bit;
#define T4IE 19
extern volatile unsigned int T4IE_bit;
#define IC4EIE 20
extern volatile unsigned int IC4EIE_bit;
#define IC4IE 21
extern volatile unsigned int IC4IE_bit;
#define OC4IE 22
extern volatile unsigned int OC4IE_bit;
#define INT4IE 23
extern volatile unsigned int INT4IE_bit;
#define T5IE 24
extern volatile unsigned int T5IE_bit;
#define IC5EIE 25
extern volatile unsigned int IC5EIE_bit;
#define IC5IE 26
extern volatile unsigned int IC5IE_bit;
#define OC5IE 27
extern volatile unsigned int OC5IE_bit;
#define T6IE 28
extern volatile unsigned int T6IE_bit;
#define IC6EIE 29
extern volatile unsigned int IC6EIE_bit;
#define IC6IE 30
extern volatile unsigned int IC6IE_bit;
#define OC6IE 31
extern volatile unsigned int OC6IE_bit;
#define T7IE 0
extern volatile unsigned int T7IE_bit;
#define IC7EIE 1
extern volatile unsigned int IC7EIE_bit;
#define IC7IE 2
extern volatile unsigned int IC7IE_bit;
#define OC7IE 3
extern volatile unsigned int OC7IE_bit;
#define T8IE 4
extern volatile unsigned int T8IE_bit;
#define IC8EIE 5
extern volatile unsigned int IC8EIE_bit;
#define IC8IE 6
extern volatile unsigned int IC8IE_bit;
#define OC8IE 7
extern volatile unsigned int OC8IE_bit;
#define T9IE 8
extern volatile unsigned int T9IE_bit;
#define IC9EIE 9
extern volatile unsigned int IC9EIE_bit;
#define IC9IE 10
extern volatile unsigned int IC9IE_bit;
#define OC9IE 11
extern volatile unsigned int OC9IE_bit;
#define ADCIE 12
extern volatile unsigned int ADCIE_bit;
#define ADCFIFOIE 13
extern volatile unsigned int ADCFIFOIE_bit;
#define ADCDC1IE 14
extern volatile unsigned int ADCDC1IE_bit;
#define ADCDC2IE 15
extern volatile unsigned int ADCDC2IE_bit;
#define ADCDC3IE 16
extern volatile unsigned int ADCDC3IE_bit;
#define ADCDC4IE 17
extern volatile unsigned int ADCDC4IE_bit;
#define ADCDC5IE 18
extern volatile unsigned int ADCDC5IE_bit;
#define ADCDC6IE 19
extern volatile unsigned int ADCDC6IE_bit;
#define ADCDF1IE 20
extern volatile unsigned int ADCDF1IE_bit;
#define ADCDF2IE 21
extern volatile unsigned int ADCDF2IE_bit;
#define ADCDF3IE 22
extern volatile unsigned int ADCDF3IE_bit;
#define ADCDF4IE 23
extern volatile unsigned int ADCDF4IE_bit;
#define ADCDF5IE 24
extern volatile unsigned int ADCDF5IE_bit;
#define ADCDF6IE 25
extern volatile unsigned int ADCDF6IE_bit;
#define ADCFLTIE 26
extern volatile unsigned int ADCFLTIE_bit;
#define ADCD0IE 27
extern volatile unsigned int ADCD0IE_bit;
#define ADCD1IE 28
extern volatile unsigned int ADCD1IE_bit;
#define ADCD2IE 29
extern volatile unsigned int ADCD2IE_bit;
#define ADCD3IE 30
extern volatile unsigned int ADCD3IE_bit;
#define ADCD4IE 31
extern volatile unsigned int ADCD4IE_bit;
#define ADCD5IE 0
extern volatile unsigned int ADCD5IE_bit;
#define ADCD6IE 1
extern volatile unsigned int ADCD6IE_bit;
#define ADCD7IE 2
extern volatile unsigned int ADCD7IE_bit;
#define ADCD8IE 3
extern volatile unsigned int ADCD8IE_bit;
#define ADCD9IE 4
extern volatile unsigned int ADCD9IE_bit;
#define ADCD10IE 5
extern volatile unsigned int ADCD10IE_bit;
#define ADCD11IE 6
extern volatile unsigned int ADCD11IE_bit;
#define ADCD12IE 7
extern volatile unsigned int ADCD12IE_bit;
#define ADCD13IE 8
extern volatile unsigned int ADCD13IE_bit;
#define ADCD14IE 9
extern volatile unsigned int ADCD14IE_bit;
#define ADCD15IE 10
extern volatile unsigned int ADCD15IE_bit;
#define ADCD16IE 11
extern volatile unsigned int ADCD16IE_bit;
#define ADCD17IE 12
extern volatile unsigned int ADCD17IE_bit;
#define ADCD18IE 13
extern volatile unsigned int ADCD18IE_bit;
#define ADCD19IE 14
extern volatile unsigned int ADCD19IE_bit;
#define ADCD20IE 15
extern volatile unsigned int ADCD20IE_bit;
#define ADCD21IE 16
extern volatile unsigned int ADCD21IE_bit;
#define ADCD22IE 17
extern volatile unsigned int ADCD22IE_bit;
#define ADCD23IE 18
extern volatile unsigned int ADCD23IE_bit;
#define ADCD24IE 19
extern volatile unsigned int ADCD24IE_bit;
#define ADCD25IE 20
extern volatile unsigned int ADCD25IE_bit;
#define ADCD26IE 21
extern volatile unsigned int ADCD26IE_bit;
#define ADCD27IE 22
extern volatile unsigned int ADCD27IE_bit;
#define ADCD28IE 23
extern volatile unsigned int ADCD28IE_bit;
#define ADCD29IE 24
extern volatile unsigned int ADCD29IE_bit;
#define ADCD30IE 25
extern volatile unsigned int ADCD30IE_bit;
#define ADCD31IE 26
extern volatile unsigned int ADCD31IE_bit;
#define ADCD32IE 27
extern volatile unsigned int ADCD32IE_bit;
#define ADCD33IE 28
extern volatile unsigned int ADCD33IE_bit;
#define ADCD34IE 29
extern volatile unsigned int ADCD34IE_bit;
#define ADCD43IE 6
extern volatile unsigned int ADCD43IE_bit;
#define ADCD44IE 7
extern volatile unsigned int ADCD44IE_bit;
#define CPCIE 8
extern volatile unsigned int CPCIE_bit;
#define CFDCIE 9
extern volatile unsigned int CFDCIE_bit;
#define SBIE 10
extern volatile unsigned int SBIE_bit;
#define SPI1EIE 13
extern volatile unsigned int SPI1EIE_bit;
#define SPI1RXIE 14
extern volatile unsigned int SPI1RXIE_bit;
#define SPI1TXIE 15
extern volatile unsigned int SPI1TXIE_bit;
#define U1EIE 16
extern volatile unsigned int U1EIE_bit;
#define U1RXIE 17
extern volatile unsigned int U1RXIE_bit;
#define U1TXIE 18
extern volatile unsigned int U1TXIE_bit;
#define I2C1BIE 19
extern volatile unsigned int I2C1BIE_bit;
#define I2C1SIE 20
extern volatile unsigned int I2C1SIE_bit;
#define I2C1MIE 21
extern volatile unsigned int I2C1MIE_bit;
#define CNAIE 22
extern volatile unsigned int CNAIE_bit;
#define CNBIE 23
extern volatile unsigned int CNBIE_bit;
#define CNCIE 24
extern volatile unsigned int CNCIE_bit;
#define CNDIE 25
extern volatile unsigned int CNDIE_bit;
#define CNEIE 26
extern volatile unsigned int CNEIE_bit;
#define CNFIE 27
extern volatile unsigned int CNFIE_bit;
#define CNGIE 28
extern volatile unsigned int CNGIE_bit;
#define PMPIE 0
extern volatile unsigned int PMPIE_bit;
#define PMPEIE 1
extern volatile unsigned int PMPEIE_bit;
#define CMP1IE 2
extern volatile unsigned int CMP1IE_bit;
#define CMP2IE 3
extern volatile unsigned int CMP2IE_bit;
#define USBIE 4
extern volatile unsigned int USBIE_bit;
#define USBDMAIE 5
extern volatile unsigned int USBDMAIE_bit;
#define DMA0IE 6
extern volatile unsigned int DMA0IE_bit;
#define DMA1IE 7
extern volatile unsigned int DMA1IE_bit;
#define DMA2IE 8
extern volatile unsigned int DMA2IE_bit;
#define DMA3IE 9
extern volatile unsigned int DMA3IE_bit;
#define DMA4IE 10
extern volatile unsigned int DMA4IE_bit;
#define DMA5IE 11
extern volatile unsigned int DMA5IE_bit;
#define DMA6IE 12
extern volatile unsigned int DMA6IE_bit;
#define DMA7IE 13
extern volatile unsigned int DMA7IE_bit;
#define SPI2EIE 14
extern volatile unsigned int SPI2EIE_bit;
#define SPI2RXIE 15
extern volatile unsigned int SPI2RXIE_bit;
#define SPI2TXIE 16
extern volatile unsigned int SPI2TXIE_bit;
#define U2EIE 17
extern volatile unsigned int U2EIE_bit;
#define U2RXIE 18
extern volatile unsigned int U2RXIE_bit;
#define U2TXIE 19
extern volatile unsigned int U2TXIE_bit;
#define I2C2BIE 20
extern volatile unsigned int I2C2BIE_bit;
#define I2C2SIE 21
extern volatile unsigned int I2C2SIE_bit;
#define I2C2MIE 22
extern volatile unsigned int I2C2MIE_bit;
#define CAN1IE 23
extern volatile unsigned int CAN1IE_bit;
#define CAN2IE 24
extern volatile unsigned int CAN2IE_bit;
#define ETHIE 25
extern volatile unsigned int ETHIE_bit;
#define SPI3EIE 26
extern volatile unsigned int SPI3EIE_bit;
#define SPI3RXIE 27
extern volatile unsigned int SPI3RXIE_bit;
#define SPI3TXIE 28
extern volatile unsigned int SPI3TXIE_bit;
#define U3EIE 29
extern volatile unsigned int U3EIE_bit;
#define U3RXIE 30
extern volatile unsigned int U3RXIE_bit;
#define U3TXIE 31
extern volatile unsigned int U3TXIE_bit;
#define I2C3BIE 0
extern volatile unsigned int I2C3BIE_bit;
#define I2C3SIE 1
extern volatile unsigned int I2C3SIE_bit;
#define I2C3MIE 2
extern volatile unsigned int I2C3MIE_bit;
#define SPI4EIE 3
extern volatile unsigned int SPI4EIE_bit;
#define SPI4RXIE 4
extern volatile unsigned int SPI4RXIE_bit;
#define SPI4TXIE 5
extern volatile unsigned int SPI4TXIE_bit;
#define RTCCIE 6
extern volatile unsigned int RTCCIE_bit;
#define FCEIE 7
extern volatile unsigned int FCEIE_bit;
#define PREIE 8
extern volatile unsigned int PREIE_bit;
#define SQI1IE 9
extern volatile unsigned int SQI1IE_bit;
#define U4EIE 10
extern volatile unsigned int U4EIE_bit;
#define U4RXIE 11
extern volatile unsigned int U4RXIE_bit;
#define U4TXIE 12
extern volatile unsigned int U4TXIE_bit;
#define I2C4BIE 13
extern volatile unsigned int I2C4BIE_bit;
#define I2C4SIE 14
extern volatile unsigned int I2C4SIE_bit;
#define I2C4MIE 15
extern volatile unsigned int I2C4MIE_bit;
#define SPI5EIE 16
extern volatile unsigned int SPI5EIE_bit;
#define SPI5RXIE 17
extern volatile unsigned int SPI5RXIE_bit;
#define SPI5TXIE 18
extern volatile unsigned int SPI5TXIE_bit;
#define U5EIE 19
extern volatile unsigned int U5EIE_bit;
#define U5RXIE 20
extern volatile unsigned int U5RXIE_bit;
#define U5TXIE 21
extern volatile unsigned int U5TXIE_bit;
#define I2C5BIE 22
extern volatile unsigned int I2C5BIE_bit;
#define I2C5SIE 23
extern volatile unsigned int I2C5SIE_bit;
#define I2C5MIE 24
extern volatile unsigned int I2C5MIE_bit;
#define SPI6IE 25
extern volatile unsigned int SPI6IE_bit;
#define SPI6RXIE 26
extern volatile unsigned int SPI6RXIE_bit;
#define SPI6TXIE 27
extern volatile unsigned int SPI6TXIE_bit;
#define U6EIE 28
extern volatile unsigned int U6EIE_bit;
#define U6RXIE 29
extern volatile unsigned int U6RXIE_bit;
#define U6TXIE 30
extern volatile unsigned int U6TXIE_bit;
#define ADCEOSIE 0
extern volatile unsigned int ADCEOSIE_bit;
#define ADCARDYIE 1
extern volatile unsigned int ADCARDYIE_bit;
#define ADCURDYIE 2
extern volatile unsigned int ADCURDYIE_bit;
#define ADCGRPIE 4
extern volatile unsigned int ADCGRPIE_bit;
#define ADC0EIE 6
extern volatile unsigned int ADC0EIE_bit;
#define ADC1EIE 7
extern volatile unsigned int ADC1EIE_bit;
#define ADC2EIE 8
extern volatile unsigned int ADC2EIE_bit;
#define ADC3EIE 9
extern volatile unsigned int ADC3EIE_bit;
#define ADC4EIE 10
extern volatile unsigned int ADC4EIE_bit;
#define ADC7EIE 13
extern volatile unsigned int ADC7EIE_bit;
#define ADC0WIE 14
extern volatile unsigned int ADC0WIE_bit;
#define ADC1WIE 15
extern volatile unsigned int ADC1WIE_bit;
#define ADC2WIE 16
extern volatile unsigned int ADC2WIE_bit;
#define ADC3WIE 17
extern volatile unsigned int ADC3WIE_bit;
#define ADC4WIE 18
extern volatile unsigned int ADC4WIE_bit;
#define ADC7WIE 21
extern volatile unsigned int ADC7WIE_bit;
#define CTIS0 0
extern volatile unsigned int CTIS0_bit;
#define CTIS1 1
extern volatile unsigned int CTIS1_bit;
#define CTIP0 2
extern volatile unsigned int CTIP0_bit;
#define CTIP1 3
extern volatile unsigned int CTIP1_bit;
#define CTIP2 4
extern volatile unsigned int CTIP2_bit;
#define CS0IS0 8
extern volatile unsigned int CS0IS0_bit;
#define CS0IS1 9
extern volatile unsigned int CS0IS1_bit;
#define CS0IP0 10
extern volatile unsigned int CS0IP0_bit;
#define CS0IP1 11
extern volatile unsigned int CS0IP1_bit;
#define CS0IP2 12
extern volatile unsigned int CS0IP2_bit;
#define CS1IS0 16
extern volatile unsigned int CS1IS0_bit;
#define CS1IS1 17
extern volatile unsigned int CS1IS1_bit;
#define CS1IP0 18
extern volatile unsigned int CS1IP0_bit;
#define CS1IP1 19
extern volatile unsigned int CS1IP1_bit;
#define CS1IP2 20
extern volatile unsigned int CS1IP2_bit;
#define INT0IS0 24
extern volatile unsigned int INT0IS0_bit;
#define INT0IS1 25
extern volatile unsigned int INT0IS1_bit;
#define INT0IP0 26
extern volatile unsigned int INT0IP0_bit;
#define INT0IP1 27
extern volatile unsigned int INT0IP1_bit;
#define INT0IP2 28
extern volatile unsigned int INT0IP2_bit;
#define T1IS0 0
extern volatile unsigned int T1IS0_bit;
#define T1IS1 1
extern volatile unsigned int T1IS1_bit;
#define T1IP0 2
extern volatile unsigned int T1IP0_bit;
#define T1IP1 3
extern volatile unsigned int T1IP1_bit;
#define T1IP2 4
extern volatile unsigned int T1IP2_bit;
#define IC1EIS0 8
extern volatile unsigned int IC1EIS0_bit;
#define IC1EIS1 9
extern volatile unsigned int IC1EIS1_bit;
#define IC1EIP0 10
extern volatile unsigned int IC1EIP0_bit;
#define IC1EIP1 11
extern volatile unsigned int IC1EIP1_bit;
#define IC1EIP2 12
extern volatile unsigned int IC1EIP2_bit;
#define IC1IS0 16
extern volatile unsigned int IC1IS0_bit;
#define IC1IS1 17
extern volatile unsigned int IC1IS1_bit;
#define IC1IP0 18
extern volatile unsigned int IC1IP0_bit;
#define IC1IP1 19
extern volatile unsigned int IC1IP1_bit;
#define IC1IP2 20
extern volatile unsigned int IC1IP2_bit;
#define OC1IS0 24
extern volatile unsigned int OC1IS0_bit;
#define OC1IS1 25
extern volatile unsigned int OC1IS1_bit;
#define OC1IP0 26
extern volatile unsigned int OC1IP0_bit;
#define OC1IP1 27
extern volatile unsigned int OC1IP1_bit;
#define OC1IP2 28
extern volatile unsigned int OC1IP2_bit;
#define INT1IS0 0
extern volatile unsigned int INT1IS0_bit;
#define INT1IS1 1
extern volatile unsigned int INT1IS1_bit;
#define INT1IP0 2
extern volatile unsigned int INT1IP0_bit;
#define INT1IP1 3
extern volatile unsigned int INT1IP1_bit;
#define INT1IP2 4
extern volatile unsigned int INT1IP2_bit;
#define T2IS0 8
extern volatile unsigned int T2IS0_bit;
#define T2IS1 9
extern volatile unsigned int T2IS1_bit;
#define T2IP0 10
extern volatile unsigned int T2IP0_bit;
#define T2IP1 11
extern volatile unsigned int T2IP1_bit;
#define T2IP2 12
extern volatile unsigned int T2IP2_bit;
#define IC2EIS0 16
extern volatile unsigned int IC2EIS0_bit;
#define IC2EIS1 17
extern volatile unsigned int IC2EIS1_bit;
#define IC2EIP0 18
extern volatile unsigned int IC2EIP0_bit;
#define IC2EIP1 19
extern volatile unsigned int IC2EIP1_bit;
#define IC2EIP2 20
extern volatile unsigned int IC2EIP2_bit;
#define IC2IS0 24
extern volatile unsigned int IC2IS0_bit;
#define IC2IS1 25
extern volatile unsigned int IC2IS1_bit;
#define IC2IP0 26
extern volatile unsigned int IC2IP0_bit;
#define IC2IP1 27
extern volatile unsigned int IC2IP1_bit;
#define IC2IP2 28
extern volatile unsigned int IC2IP2_bit;
#define OC2IS0 0
extern volatile unsigned int OC2IS0_bit;
#define OC2IS1 1
extern volatile unsigned int OC2IS1_bit;
#define OC2IP0 2
extern volatile unsigned int OC2IP0_bit;
#define OC2IP1 3
extern volatile unsigned int OC2IP1_bit;
#define OC2IP2 4
extern volatile unsigned int OC2IP2_bit;
#define INT2IS0 8
extern volatile unsigned int INT2IS0_bit;
#define INT2IS1 9
extern volatile unsigned int INT2IS1_bit;
#define INT2IP0 10
extern volatile unsigned int INT2IP0_bit;
#define INT2IP1 11
extern volatile unsigned int INT2IP1_bit;
#define INT2IP2 12
extern volatile unsigned int INT2IP2_bit;
#define T3IS0 16
extern volatile unsigned int T3IS0_bit;
#define T3IS1 17
extern volatile unsigned int T3IS1_bit;
#define T3IP0 18
extern volatile unsigned int T3IP0_bit;
#define T3IP1 19
extern volatile unsigned int T3IP1_bit;
#define T3IP2 20
extern volatile unsigned int T3IP2_bit;
#define IC3EIS0 24
extern volatile unsigned int IC3EIS0_bit;
#define IC3EIS1 25
extern volatile unsigned int IC3EIS1_bit;
#define IC3EIP0 26
extern volatile unsigned int IC3EIP0_bit;
#define IC3EIP1 27
extern volatile unsigned int IC3EIP1_bit;
#define IC3EIP2 28
extern volatile unsigned int IC3EIP2_bit;
#define IC3IS0 0
extern volatile unsigned int IC3IS0_bit;
#define IC3IS1 1
extern volatile unsigned int IC3IS1_bit;
#define IC3IP0 2
extern volatile unsigned int IC3IP0_bit;
#define IC3IP1 3
extern volatile unsigned int IC3IP1_bit;
#define IC3IP2 4
extern volatile unsigned int IC3IP2_bit;
#define OC3IS0 8
extern volatile unsigned int OC3IS0_bit;
#define OC3IS1 9
extern volatile unsigned int OC3IS1_bit;
#define OC3IP0 10
extern volatile unsigned int OC3IP0_bit;
#define OC3IP1 11
extern volatile unsigned int OC3IP1_bit;
#define OC3IP2 12
extern volatile unsigned int OC3IP2_bit;
#define INT3IS0 16
extern volatile unsigned int INT3IS0_bit;
#define INT3IS1 17
extern volatile unsigned int INT3IS1_bit;
#define INT3IP0 18
extern volatile unsigned int INT3IP0_bit;
#define INT3IP1 19
extern volatile unsigned int INT3IP1_bit;
#define INT3IP2 20
extern volatile unsigned int INT3IP2_bit;
#define T4IS0 24
extern volatile unsigned int T4IS0_bit;
#define T4IS1 25
extern volatile unsigned int T4IS1_bit;
#define T4IP0 26
extern volatile unsigned int T4IP0_bit;
#define T4IP1 27
extern volatile unsigned int T4IP1_bit;
#define T4IP2 28
extern volatile unsigned int T4IP2_bit;
#define IC4EIS0 0
extern volatile unsigned int IC4EIS0_bit;
#define IC4EIS1 1
extern volatile unsigned int IC4EIS1_bit;
#define IC4EIP0 2
extern volatile unsigned int IC4EIP0_bit;
#define IC4EIP1 3
extern volatile unsigned int IC4EIP1_bit;
#define IC4EIP2 4
extern volatile unsigned int IC4EIP2_bit;
#define IC4IS0 8
extern volatile unsigned int IC4IS0_bit;
#define IC4IS1 9
extern volatile unsigned int IC4IS1_bit;
#define IC4IP0 10
extern volatile unsigned int IC4IP0_bit;
#define IC4IP1 11
extern volatile unsigned int IC4IP1_bit;
#define IC4IP2 12
extern volatile unsigned int IC4IP2_bit;
#define OC4IS0 16
extern volatile unsigned int OC4IS0_bit;
#define OC4IS1 17
extern volatile unsigned int OC4IS1_bit;
#define OC4IP0 18
extern volatile unsigned int OC4IP0_bit;
#define OC4IP1 19
extern volatile unsigned int OC4IP1_bit;
#define OC4IP2 20
extern volatile unsigned int OC4IP2_bit;
#define INT4IS0 24
extern volatile unsigned int INT4IS0_bit;
#define INT4IS1 25
extern volatile unsigned int INT4IS1_bit;
#define INT4IP0 26
extern volatile unsigned int INT4IP0_bit;
#define INT4IP1 27
extern volatile unsigned int INT4IP1_bit;
#define INT4IP2 28
extern volatile unsigned int INT4IP2_bit;
#define T5IS0 0
extern volatile unsigned int T5IS0_bit;
#define T5IS1 1
extern volatile unsigned int T5IS1_bit;
#define T5IP0 2
extern volatile unsigned int T5IP0_bit;
#define T5IP1 3
extern volatile unsigned int T5IP1_bit;
#define T5IP2 4
extern volatile unsigned int T5IP2_bit;
#define IC5EIS0 8
extern volatile unsigned int IC5EIS0_bit;
#define IC5EIS1 9
extern volatile unsigned int IC5EIS1_bit;
#define IC5EIP0 10
extern volatile unsigned int IC5EIP0_bit;
#define IC5EIP1 11
extern volatile unsigned int IC5EIP1_bit;
#define IC5EIP2 12
extern volatile unsigned int IC5EIP2_bit;
#define IC5IS0 16
extern volatile unsigned int IC5IS0_bit;
#define IC5IS1 17
extern volatile unsigned int IC5IS1_bit;
#define IC5IP0 18
extern volatile unsigned int IC5IP0_bit;
#define IC5IP1 19
extern volatile unsigned int IC5IP1_bit;
#define IC5IP2 20
extern volatile unsigned int IC5IP2_bit;
#define OC5IS0 24
extern volatile unsigned int OC5IS0_bit;
#define OC5IS1 25
extern volatile unsigned int OC5IS1_bit;
#define OC5IP0 26
extern volatile unsigned int OC5IP0_bit;
#define OC5IP1 27
extern volatile unsigned int OC5IP1_bit;
#define OC5IP2 28
extern volatile unsigned int OC5IP2_bit;
#define T6IS0 0
extern volatile unsigned int T6IS0_bit;
#define T6IS1 1
extern volatile unsigned int T6IS1_bit;
#define T6IP0 2
extern volatile unsigned int T6IP0_bit;
#define T6IP1 3
extern volatile unsigned int T6IP1_bit;
#define T6IP2 4
extern volatile unsigned int T6IP2_bit;
#define IC6EIS0 8
extern volatile unsigned int IC6EIS0_bit;
#define IC6EIS1 9
extern volatile unsigned int IC6EIS1_bit;
#define IC6EIP0 10
extern volatile unsigned int IC6EIP0_bit;
#define IC6EIP1 11
extern volatile unsigned int IC6EIP1_bit;
#define IC6EIP2 12
extern volatile unsigned int IC6EIP2_bit;
#define IC6IS0 16
extern volatile unsigned int IC6IS0_bit;
#define IC6IS1 17
extern volatile unsigned int IC6IS1_bit;
#define IC6IP0 18
extern volatile unsigned int IC6IP0_bit;
#define IC6IP1 19
extern volatile unsigned int IC6IP1_bit;
#define IC6IP2 20
extern volatile unsigned int IC6IP2_bit;
#define OC6IS0 24
extern volatile unsigned int OC6IS0_bit;
#define OC6IS1 25
extern volatile unsigned int OC6IS1_bit;
#define OC6IP0 26
extern volatile unsigned int OC6IP0_bit;
#define OC6IP1 27
extern volatile unsigned int OC6IP1_bit;
#define OC6IP2 28
extern volatile unsigned int OC6IP2_bit;
#define T7IS0 0
extern volatile unsigned int T7IS0_bit;
#define T7IS1 1
extern volatile unsigned int T7IS1_bit;
#define T7IP0 2
extern volatile unsigned int T7IP0_bit;
#define T7IP1 3
extern volatile unsigned int T7IP1_bit;
#define T7IP2 4
extern volatile unsigned int T7IP2_bit;
#define IC7EIS0 8
extern volatile unsigned int IC7EIS0_bit;
#define IC7EIS1 9
extern volatile unsigned int IC7EIS1_bit;
#define IC7EIP0 10
extern volatile unsigned int IC7EIP0_bit;
#define IC7EIP1 11
extern volatile unsigned int IC7EIP1_bit;
#define IC7EIP2 12
extern volatile unsigned int IC7EIP2_bit;
#define IC7IS0 16
extern volatile unsigned int IC7IS0_bit;
#define IC7IS1 17
extern volatile unsigned int IC7IS1_bit;
#define IC7IP0 18
extern volatile unsigned int IC7IP0_bit;
#define IC7IP1 19
extern volatile unsigned int IC7IP1_bit;
#define IC7IP2 20
extern volatile unsigned int IC7IP2_bit;
#define OC7IS0 24
extern volatile unsigned int OC7IS0_bit;
#define OC7IS1 25
extern volatile unsigned int OC7IS1_bit;
#define OC7IP0 26
extern volatile unsigned int OC7IP0_bit;
#define OC7IP1 27
extern volatile unsigned int OC7IP1_bit;
#define OC7IP2 28
extern volatile unsigned int OC7IP2_bit;
#define T8IS0 0
extern volatile unsigned int T8IS0_bit;
#define T8IS1 1
extern volatile unsigned int T8IS1_bit;
#define T8IP0 2
extern volatile unsigned int T8IP0_bit;
#define T8IP1 3
extern volatile unsigned int T8IP1_bit;
#define T8IP2 4
extern volatile unsigned int T8IP2_bit;
#define IC8EIS0 8
extern volatile unsigned int IC8EIS0_bit;
#define IC8EIS1 9
extern volatile unsigned int IC8EIS1_bit;
#define IC8EIP0 10
extern volatile unsigned int IC8EIP0_bit;
#define IC8EIP1 11
extern volatile unsigned int IC8EIP1_bit;
#define IC8EIP2 12
extern volatile unsigned int IC8EIP2_bit;
#define IC8IS0 16
extern volatile unsigned int IC8IS0_bit;
#define IC8IS1 17
extern volatile unsigned int IC8IS1_bit;
#define IC8IP0 18
extern volatile unsigned int IC8IP0_bit;
#define IC8IP1 19
extern volatile unsigned int IC8IP1_bit;
#define IC8IP2 20
extern volatile unsigned int IC8IP2_bit;
#define OC8IS0 24
extern volatile unsigned int OC8IS0_bit;
#define OC8IS1 25
extern volatile unsigned int OC8IS1_bit;
#define OC8IP0 26
extern volatile unsigned int OC8IP0_bit;
#define OC8IP1 27
extern volatile unsigned int OC8IP1_bit;
#define OC8IP2 28
extern volatile unsigned int OC8IP2_bit;
#define T9IS0 0
extern volatile unsigned int T9IS0_bit;
#define T9IS1 1
extern volatile unsigned int T9IS1_bit;
#define T9IP0 2
extern volatile unsigned int T9IP0_bit;
#define T9IP1 3
extern volatile unsigned int T9IP1_bit;
#define T9IP2 4
extern volatile unsigned int T9IP2_bit;
#define IC9EIS0 8
extern volatile unsigned int IC9EIS0_bit;
#define IC9EIS1 9
extern volatile unsigned int IC9EIS1_bit;
#define IC9EIP0 10
extern volatile unsigned int IC9EIP0_bit;
#define IC9EIP1 11
extern volatile unsigned int IC9EIP1_bit;
#define IC9EIP2 12
extern volatile unsigned int IC9EIP2_bit;
#define IC9IS0 16
extern volatile unsigned int IC9IS0_bit;
#define IC9IS1 17
extern volatile unsigned int IC9IS1_bit;
#define IC9IP0 18
extern volatile unsigned int IC9IP0_bit;
#define IC9IP1 19
extern volatile unsigned int IC9IP1_bit;
#define IC9IP2 20
extern volatile unsigned int IC9IP2_bit;
#define OC9IS0 24
extern volatile unsigned int OC9IS0_bit;
#define OC9IS1 25
extern volatile unsigned int OC9IS1_bit;
#define OC9IP0 26
extern volatile unsigned int OC9IP0_bit;
#define OC9IP1 27
extern volatile unsigned int OC9IP1_bit;
#define OC9IP2 28
extern volatile unsigned int OC9IP2_bit;
#define ADCIS0 0
extern volatile unsigned int ADCIS0_bit;
#define ADCIS1 1
extern volatile unsigned int ADCIS1_bit;
#define ADCIP0 2
extern volatile unsigned int ADCIP0_bit;
#define ADCIP1 3
extern volatile unsigned int ADCIP1_bit;
#define ADCIP2 4
extern volatile unsigned int ADCIP2_bit;
#define ADCFIFOIS0 8
extern volatile unsigned int ADCFIFOIS0_bit;
#define ADCFIFOIS1 9
extern volatile unsigned int ADCFIFOIS1_bit;
#define ADCFIFOIP0 10
extern volatile unsigned int ADCFIFOIP0_bit;
#define ADCFIFOIP1 11
extern volatile unsigned int ADCFIFOIP1_bit;
#define ADCFIFOIP2 12
extern volatile unsigned int ADCFIFOIP2_bit;
#define ADCDC1IS0 16
extern volatile unsigned int ADCDC1IS0_bit;
#define ADCDC1IS1 17
extern volatile unsigned int ADCDC1IS1_bit;
#define ADCDC1IP0 18
extern volatile unsigned int ADCDC1IP0_bit;
#define ADCDC1IP1 19
extern volatile unsigned int ADCDC1IP1_bit;
#define ADCDC1IP2 20
extern volatile unsigned int ADCDC1IP2_bit;
#define ADCDC2IS0 24
extern volatile unsigned int ADCDC2IS0_bit;
#define ADCDC2IS1 25
extern volatile unsigned int ADCDC2IS1_bit;
#define ADCDC2IP0 26
extern volatile unsigned int ADCDC2IP0_bit;
#define ADCDC2IP1 27
extern volatile unsigned int ADCDC2IP1_bit;
#define ADCDC2IP2 28
extern volatile unsigned int ADCDC2IP2_bit;
#define ADCDC3IS0 0
extern volatile unsigned int ADCDC3IS0_bit;
#define ADCDC3IS1 1
extern volatile unsigned int ADCDC3IS1_bit;
#define ADCDC3IP0 2
extern volatile unsigned int ADCDC3IP0_bit;
#define ADCDC3IP1 3
extern volatile unsigned int ADCDC3IP1_bit;
#define ADCDC3IP2 4
extern volatile unsigned int ADCDC3IP2_bit;
#define ADCDC4IS0 8
extern volatile unsigned int ADCDC4IS0_bit;
#define ADCDC4IS1 9
extern volatile unsigned int ADCDC4IS1_bit;
#define ADCDC4IP0 10
extern volatile unsigned int ADCDC4IP0_bit;
#define ADCDC4IP1 11
extern volatile unsigned int ADCDC4IP1_bit;
#define ADCDC4IP2 12
extern volatile unsigned int ADCDC4IP2_bit;
#define ADCDC5IS0 16
extern volatile unsigned int ADCDC5IS0_bit;
#define ADCDC5IS1 17
extern volatile unsigned int ADCDC5IS1_bit;
#define ADCDC5IP0 18
extern volatile unsigned int ADCDC5IP0_bit;
#define ADCDC5IP1 19
extern volatile unsigned int ADCDC5IP1_bit;
#define ADCDC5IP2 20
extern volatile unsigned int ADCDC5IP2_bit;
#define ADCDC6IS0 24
extern volatile unsigned int ADCDC6IS0_bit;
#define ADCDC6IS1 25
extern volatile unsigned int ADCDC6IS1_bit;
#define ADCDC6IP0 26
extern volatile unsigned int ADCDC6IP0_bit;
#define ADCDC6IP1 27
extern volatile unsigned int ADCDC6IP1_bit;
#define ADCDC6IP2 28
extern volatile unsigned int ADCDC6IP2_bit;
#define ADCDF1IS0 0
extern volatile unsigned int ADCDF1IS0_bit;
#define ADCDF1IS1 1
extern volatile unsigned int ADCDF1IS1_bit;
#define ADCDF1IP0 2
extern volatile unsigned int ADCDF1IP0_bit;
#define ADCDF1IP1 3
extern volatile unsigned int ADCDF1IP1_bit;
#define ADCDF1IP2 4
extern volatile unsigned int ADCDF1IP2_bit;
#define ADCDF2IS0 8
extern volatile unsigned int ADCDF2IS0_bit;
#define ADCDF2IS1 9
extern volatile unsigned int ADCDF2IS1_bit;
#define ADCDF2IP0 10
extern volatile unsigned int ADCDF2IP0_bit;
#define ADCDF2IP1 11
extern volatile unsigned int ADCDF2IP1_bit;
#define ADCDF2IP2 12
extern volatile unsigned int ADCDF2IP2_bit;
#define ADCDF3IS0 16
extern volatile unsigned int ADCDF3IS0_bit;
#define ADCDF3IS1 17
extern volatile unsigned int ADCDF3IS1_bit;
#define ADCDF3IP0 18
extern volatile unsigned int ADCDF3IP0_bit;
#define ADCDF3IP1 19
extern volatile unsigned int ADCDF3IP1_bit;
#define ADCDF3IP2 20
extern volatile unsigned int ADCDF3IP2_bit;
#define ADCDF4IS0 24
extern volatile unsigned int ADCDF4IS0_bit;
#define ADCDF4IS1 25
extern volatile unsigned int ADCDF4IS1_bit;
#define ADCDF4IP0 26
extern volatile unsigned int ADCDF4IP0_bit;
#define ADCDF4IP1 27
extern volatile unsigned int ADCDF4IP1_bit;
#define ADCDF4IP2 28
extern volatile unsigned int ADCDF4IP2_bit;
#define ADCDF5IS0 0
extern volatile unsigned int ADCDF5IS0_bit;
#define ADCDF5IS1 1
extern volatile unsigned int ADCDF5IS1_bit;
#define ADCDF5IP0 2
extern volatile unsigned int ADCDF5IP0_bit;
#define ADCDF5IP1 3
extern volatile unsigned int ADCDF5IP1_bit;
#define ADCDF5IP2 4
extern volatile unsigned int ADCDF5IP2_bit;
#define ADCDF6IS0 8
extern volatile unsigned int ADCDF6IS0_bit;
#define ADCDF6IS1 9
extern volatile unsigned int ADCDF6IS1_bit;
#define ADCDF6IP0 10
extern volatile unsigned int ADCDF6IP0_bit;
#define ADCDF6IP1 11
extern volatile unsigned int ADCDF6IP1_bit;
#define ADCDF6IP2 12
extern volatile unsigned int ADCDF6IP2_bit;
#define ADCFLTIS0 16
extern volatile unsigned int ADCFLTIS0_bit;
#define ADCFLTIS1 17
extern volatile unsigned int ADCFLTIS1_bit;
#define ADCFLTIP0 18
extern volatile unsigned int ADCFLTIP0_bit;
#define ADCFLTIP1 19
extern volatile unsigned int ADCFLTIP1_bit;
#define ADCFLTIP2 20
extern volatile unsigned int ADCFLTIP2_bit;
#define ADCD0IS0 24
extern volatile unsigned int ADCD0IS0_bit;
#define ADCD0IS1 25
extern volatile unsigned int ADCD0IS1_bit;
#define ADCD0IP0 26
extern volatile unsigned int ADCD0IP0_bit;
#define ADCD0IP1 27
extern volatile unsigned int ADCD0IP1_bit;
#define ADCD0IP2 28
extern volatile unsigned int ADCD0IP2_bit;
#define ADCD1IS0 0
extern volatile unsigned int ADCD1IS0_bit;
#define ADCD1IS1 1
extern volatile unsigned int ADCD1IS1_bit;
#define ADCD1IP0 2
extern volatile unsigned int ADCD1IP0_bit;
#define ADCD1IP1 3
extern volatile unsigned int ADCD1IP1_bit;
#define ADCD1IP2 4
extern volatile unsigned int ADCD1IP2_bit;
#define ADCD2IS0 8
extern volatile unsigned int ADCD2IS0_bit;
#define ADCD2IS1 9
extern volatile unsigned int ADCD2IS1_bit;
#define ADCD2IP0 10
extern volatile unsigned int ADCD2IP0_bit;
#define ADCD2IP1 11
extern volatile unsigned int ADCD2IP1_bit;
#define ADCD2IP2 12
extern volatile unsigned int ADCD2IP2_bit;
#define ADCD3IS0 16
extern volatile unsigned int ADCD3IS0_bit;
#define ADCD3IS1 17
extern volatile unsigned int ADCD3IS1_bit;
#define ADCD3IP0 18
extern volatile unsigned int ADCD3IP0_bit;
#define ADCD3IP1 19
extern volatile unsigned int ADCD3IP1_bit;
#define ADCD3IP2 20
extern volatile unsigned int ADCD3IP2_bit;
#define ADCD4IS0 24
extern volatile unsigned int ADCD4IS0_bit;
#define ADCD4IS1 25
extern volatile unsigned int ADCD4IS1_bit;
#define ADCD4IP0 26
extern volatile unsigned int ADCD4IP0_bit;
#define ADCD4IP1 27
extern volatile unsigned int ADCD4IP1_bit;
#define ADCD4IP2 28
extern volatile unsigned int ADCD4IP2_bit;
#define ADCD5IS0 0
extern volatile unsigned int ADCD5IS0_bit;
#define ADCD5IS1 1
extern volatile unsigned int ADCD5IS1_bit;
#define ADCD5IP0 2
extern volatile unsigned int ADCD5IP0_bit;
#define ADCD5IP1 3
extern volatile unsigned int ADCD5IP1_bit;
#define ADCD5IP2 4
extern volatile unsigned int ADCD5IP2_bit;
#define ADCD6IS0 8
extern volatile unsigned int ADCD6IS0_bit;
#define ADCD6IS1 9
extern volatile unsigned int ADCD6IS1_bit;
#define ADCD6IP0 10
extern volatile unsigned int ADCD6IP0_bit;
#define ADCD6IP1 11
extern volatile unsigned int ADCD6IP1_bit;
#define ADCD6IP2 12
extern volatile unsigned int ADCD6IP2_bit;
#define ADCD7IS0 16
extern volatile unsigned int ADCD7IS0_bit;
#define ADCD7IS1 17
extern volatile unsigned int ADCD7IS1_bit;
#define ADCD7IP0 18
extern volatile unsigned int ADCD7IP0_bit;
#define ADCD7IP1 19
extern volatile unsigned int ADCD7IP1_bit;
#define ADCD7IP2 20
extern volatile unsigned int ADCD7IP2_bit;
#define ADCD8IS0 24
extern volatile unsigned int ADCD8IS0_bit;
#define ADCD8IS1 25
extern volatile unsigned int ADCD8IS1_bit;
#define ADCD8IP0 26
extern volatile unsigned int ADCD8IP0_bit;
#define ADCD8IP1 27
extern volatile unsigned int ADCD8IP1_bit;
#define ADCD8IP2 28
extern volatile unsigned int ADCD8IP2_bit;
#define ADCD9IS0 0
extern volatile unsigned int ADCD9IS0_bit;
#define ADCD9IS1 1
extern volatile unsigned int ADCD9IS1_bit;
#define ADCD9IP0 2
extern volatile unsigned int ADCD9IP0_bit;
#define ADCD9IP1 3
extern volatile unsigned int ADCD9IP1_bit;
#define ADCD9IP2 4
extern volatile unsigned int ADCD9IP2_bit;
#define ADCD10IS0 8
extern volatile unsigned int ADCD10IS0_bit;
#define ADCD10IS1 9
extern volatile unsigned int ADCD10IS1_bit;
#define ADCD10IP0 10
extern volatile unsigned int ADCD10IP0_bit;
#define ADCD10IP1 11
extern volatile unsigned int ADCD10IP1_bit;
#define ADCD10IP2 12
extern volatile unsigned int ADCD10IP2_bit;
#define ADCD11IS0 16
extern volatile unsigned int ADCD11IS0_bit;
#define ADCD11IS1 17
extern volatile unsigned int ADCD11IS1_bit;
#define ADCD11IP0 18
extern volatile unsigned int ADCD11IP0_bit;
#define ADCD11IP1 19
extern volatile unsigned int ADCD11IP1_bit;
#define ADCD11IP2 20
extern volatile unsigned int ADCD11IP2_bit;
#define ADCD12IS0 24
extern volatile unsigned int ADCD12IS0_bit;
#define ADCD12IS1 25
extern volatile unsigned int ADCD12IS1_bit;
#define ADCD12IP0 26
extern volatile unsigned int ADCD12IP0_bit;
#define ADCD12IP1 27
extern volatile unsigned int ADCD12IP1_bit;
#define ADCD12IP2 28
extern volatile unsigned int ADCD12IP2_bit;
#define ADCD13IS0 0
extern volatile unsigned int ADCD13IS0_bit;
#define ADCD13IS1 1
extern volatile unsigned int ADCD13IS1_bit;
#define ADCD13IP0 2
extern volatile unsigned int ADCD13IP0_bit;
#define ADCD13IP1 3
extern volatile unsigned int ADCD13IP1_bit;
#define ADCD13IP2 4
extern volatile unsigned int ADCD13IP2_bit;
#define ADCD14IS0 8
extern volatile unsigned int ADCD14IS0_bit;
#define ADCD14IS1 9
extern volatile unsigned int ADCD14IS1_bit;
#define ADCD14IP0 10
extern volatile unsigned int ADCD14IP0_bit;
#define ADCD14IP1 11
extern volatile unsigned int ADCD14IP1_bit;
#define ADCD14IP2 12
extern volatile unsigned int ADCD14IP2_bit;
#define ADCD15IS0 16
extern volatile unsigned int ADCD15IS0_bit;
#define ADCD15IS1 17
extern volatile unsigned int ADCD15IS1_bit;
#define ADCD15IP0 18
extern volatile unsigned int ADCD15IP0_bit;
#define ADCD15IP1 19
extern volatile unsigned int ADCD15IP1_bit;
#define ADCD15IP2 20
extern volatile unsigned int ADCD15IP2_bit;
#define ADCD16IS0 24
extern volatile unsigned int ADCD16IS0_bit;
#define ADCD16IS1 25
extern volatile unsigned int ADCD16IS1_bit;
#define ADCD16IP0 26
extern volatile unsigned int ADCD16IP0_bit;
#define ADCD16IP1 27
extern volatile unsigned int ADCD16IP1_bit;
#define ADCD16IP2 28
extern volatile unsigned int ADCD16IP2_bit;
#define ADCD17IS0 0
extern volatile unsigned int ADCD17IS0_bit;
#define ADCD17IS1 1
extern volatile unsigned int ADCD17IS1_bit;
#define ADCD17IP0 2
extern volatile unsigned int ADCD17IP0_bit;
#define ADCD17IP1 3
extern volatile unsigned int ADCD17IP1_bit;
#define ADCD17IP2 4
extern volatile unsigned int ADCD17IP2_bit;
#define ADCD18IS0 8
extern volatile unsigned int ADCD18IS0_bit;
#define ADCD18IS1 9
extern volatile unsigned int ADCD18IS1_bit;
#define ADCD18IP0 10
extern volatile unsigned int ADCD18IP0_bit;
#define ADCD18IP1 11
extern volatile unsigned int ADCD18IP1_bit;
#define ADCD18IP2 12
extern volatile unsigned int ADCD18IP2_bit;
#define ADCD19IS0 16
extern volatile unsigned int ADCD19IS0_bit;
#define ADCD19IS1 17
extern volatile unsigned int ADCD19IS1_bit;
#define ADCD19IP0 18
extern volatile unsigned int ADCD19IP0_bit;
#define ADCD19IP1 19
extern volatile unsigned int ADCD19IP1_bit;
#define ADCD19IP2 20
extern volatile unsigned int ADCD19IP2_bit;
#define ADCD20IS0 24
extern volatile unsigned int ADCD20IS0_bit;
#define ADCD20IS1 25
extern volatile unsigned int ADCD20IS1_bit;
#define ADCD20IP0 26
extern volatile unsigned int ADCD20IP0_bit;
#define ADCD20IP1 27
extern volatile unsigned int ADCD20IP1_bit;
#define ADCD20IP2 28
extern volatile unsigned int ADCD20IP2_bit;
#define ADCD21IS0 0
extern volatile unsigned int ADCD21IS0_bit;
#define ADCD21IS1 1
extern volatile unsigned int ADCD21IS1_bit;
#define ADCD21IP0 2
extern volatile unsigned int ADCD21IP0_bit;
#define ADCD21IP1 3
extern volatile unsigned int ADCD21IP1_bit;
#define ADCD21IP2 4
extern volatile unsigned int ADCD21IP2_bit;
#define ADCD22IS0 8
extern volatile unsigned int ADCD22IS0_bit;
#define ADCD22IS1 9
extern volatile unsigned int ADCD22IS1_bit;
#define ADCD22IP0 10
extern volatile unsigned int ADCD22IP0_bit;
#define ADCD22IP1 11
extern volatile unsigned int ADCD22IP1_bit;
#define ADCD22IP2 12
extern volatile unsigned int ADCD22IP2_bit;
#define ADCD23IS0 16
extern volatile unsigned int ADCD23IS0_bit;
#define ADCD23IS1 17
extern volatile unsigned int ADCD23IS1_bit;
#define ADCD23IP0 18
extern volatile unsigned int ADCD23IP0_bit;
#define ADCD23IP1 19
extern volatile unsigned int ADCD23IP1_bit;
#define ADCD23IP2 20
extern volatile unsigned int ADCD23IP2_bit;
#define ADCD24IS0 24
extern volatile unsigned int ADCD24IS0_bit;
#define ADCD24IS1 25
extern volatile unsigned int ADCD24IS1_bit;
#define ADCD24IP0 26
extern volatile unsigned int ADCD24IP0_bit;
#define ADCD24IP1 27
extern volatile unsigned int ADCD24IP1_bit;
#define ADCD24IP2 28
extern volatile unsigned int ADCD24IP2_bit;
#define ADCD25IS0 0
extern volatile unsigned int ADCD25IS0_bit;
#define ADCD25IS1 1
extern volatile unsigned int ADCD25IS1_bit;
#define ADCD25IP0 2
extern volatile unsigned int ADCD25IP0_bit;
#define ADCD25IP1 3
extern volatile unsigned int ADCD25IP1_bit;
#define ADCD25IP2 4
extern volatile unsigned int ADCD25IP2_bit;
#define ADCD26IS0 8
extern volatile unsigned int ADCD26IS0_bit;
#define ADCD26IS1 9
extern volatile unsigned int ADCD26IS1_bit;
#define ADCD26IP0 10
extern volatile unsigned int ADCD26IP0_bit;
#define ADCD26IP1 11
extern volatile unsigned int ADCD26IP1_bit;
#define ADCD26IP2 12
extern volatile unsigned int ADCD26IP2_bit;
#define ADCD27IS0 16
extern volatile unsigned int ADCD27IS0_bit;
#define ADCD27IS1 17
extern volatile unsigned int ADCD27IS1_bit;
#define ADCD27IP0 18
extern volatile unsigned int ADCD27IP0_bit;
#define ADCD27IP1 19
extern volatile unsigned int ADCD27IP1_bit;
#define ADCD27IP2 20
extern volatile unsigned int ADCD27IP2_bit;
#define ADCD28IS0 24
extern volatile unsigned int ADCD28IS0_bit;
#define ADCD28IS1 25
extern volatile unsigned int ADCD28IS1_bit;
#define ADCD28IP0 26
extern volatile unsigned int ADCD28IP0_bit;
#define ADCD28IP1 27
extern volatile unsigned int ADCD28IP1_bit;
#define ADCD28IP2 28
extern volatile unsigned int ADCD28IP2_bit;
#define ADCD29IS0 0
extern volatile unsigned int ADCD29IS0_bit;
#define ADCD29IS1 1
extern volatile unsigned int ADCD29IS1_bit;
#define ADCD29IP0 2
extern volatile unsigned int ADCD29IP0_bit;
#define ADCD29IP1 3
extern volatile unsigned int ADCD29IP1_bit;
#define ADCD29IP2 4
extern volatile unsigned int ADCD29IP2_bit;
#define ADCD30IS0 8
extern volatile unsigned int ADCD30IS0_bit;
#define ADCD30IS1 9
extern volatile unsigned int ADCD30IS1_bit;
#define ADCD30IP0 10
extern volatile unsigned int ADCD30IP0_bit;
#define ADCD30IP1 11
extern volatile unsigned int ADCD30IP1_bit;
#define ADCD30IP2 12
extern volatile unsigned int ADCD30IP2_bit;
#define ADCD31IS0 16
extern volatile unsigned int ADCD31IS0_bit;
#define ADCD31IS1 17
extern volatile unsigned int ADCD31IS1_bit;
#define ADCD31IP0 18
extern volatile unsigned int ADCD31IP0_bit;
#define ADCD31IP1 19
extern volatile unsigned int ADCD31IP1_bit;
#define ADCD31IP2 20
extern volatile unsigned int ADCD31IP2_bit;
#define ADCD32IS0 24
extern volatile unsigned int ADCD32IS0_bit;
#define ADCD32IS1 25
extern volatile unsigned int ADCD32IS1_bit;
#define ADCD32IP0 26
extern volatile unsigned int ADCD32IP0_bit;
#define ADCD32IP1 27
extern volatile unsigned int ADCD32IP1_bit;
#define ADCD32IP2 28
extern volatile unsigned int ADCD32IP2_bit;
#define ADCD33IS0 0
extern volatile unsigned int ADCD33IS0_bit;
#define ADCD33IS1 1
extern volatile unsigned int ADCD33IS1_bit;
#define ADCD33IP0 2
extern volatile unsigned int ADCD33IP0_bit;
#define ADCD33IP1 3
extern volatile unsigned int ADCD33IP1_bit;
#define ADCD33IP2 4
extern volatile unsigned int ADCD33IP2_bit;
#define ADCD34IS0 8
extern volatile unsigned int ADCD34IS0_bit;
#define ADCD34IS1 9
extern volatile unsigned int ADCD34IS1_bit;
#define ADCD34IP0 10
extern volatile unsigned int ADCD34IP0_bit;
#define ADCD34IP1 11
extern volatile unsigned int ADCD34IP1_bit;
#define ADCD34IP2 12
extern volatile unsigned int ADCD34IP2_bit;
#define ADCD43IS0 16
extern volatile unsigned int ADCD43IS0_bit;
#define ADCD43IS1 17
extern volatile unsigned int ADCD43IS1_bit;
#define ADCD43IP0 18
extern volatile unsigned int ADCD43IP0_bit;
#define ADCD43IP1 19
extern volatile unsigned int ADCD43IP1_bit;
#define ADCD43IP2 20
extern volatile unsigned int ADCD43IP2_bit;
#define ADCD44IS0 24
extern volatile unsigned int ADCD44IS0_bit;
#define ADCD44IS1 25
extern volatile unsigned int ADCD44IS1_bit;
#define ADCD44IP0 26
extern volatile unsigned int ADCD44IP0_bit;
#define ADCD44IP1 27
extern volatile unsigned int ADCD44IP1_bit;
#define ADCD44IP2 28
extern volatile unsigned int ADCD44IP2_bit;
#define CPCIS0 0
extern volatile unsigned int CPCIS0_bit;
#define CPCIS1 1
extern volatile unsigned int CPCIS1_bit;
#define CPCIP0 2
extern volatile unsigned int CPCIP0_bit;
#define CPCIP1 3
extern volatile unsigned int CPCIP1_bit;
#define CPCIP2 4
extern volatile unsigned int CPCIP2_bit;
#define CFDCIS0 8
extern volatile unsigned int CFDCIS0_bit;
#define CFDCIS1 9
extern volatile unsigned int CFDCIS1_bit;
#define CFDCIP0 10
extern volatile unsigned int CFDCIP0_bit;
#define CFDCIP1 11
extern volatile unsigned int CFDCIP1_bit;
#define CFDCIP2 12
extern volatile unsigned int CFDCIP2_bit;
#define SBIS0 16
extern volatile unsigned int SBIS0_bit;
#define SBIS1 17
extern volatile unsigned int SBIS1_bit;
#define SBIP0 18
extern volatile unsigned int SBIP0_bit;
#define SBIP1 19
extern volatile unsigned int SBIP1_bit;
#define SBIP2 20
extern volatile unsigned int SBIP2_bit;
#define SPI1EIS0 8
extern volatile unsigned int SPI1EIS0_bit;
#define SPI1EIS1 9
extern volatile unsigned int SPI1EIS1_bit;
#define SPI1EIP0 10
extern volatile unsigned int SPI1EIP0_bit;
#define SPI1EIP1 11
extern volatile unsigned int SPI1EIP1_bit;
#define SPI1EIP2 12
extern volatile unsigned int SPI1EIP2_bit;
#define SPI1RXIS0 16
extern volatile unsigned int SPI1RXIS0_bit;
#define SPI1RXIS1 17
extern volatile unsigned int SPI1RXIS1_bit;
#define SPI1RXIP0 18
extern volatile unsigned int SPI1RXIP0_bit;
#define SPI1RXIP1 19
extern volatile unsigned int SPI1RXIP1_bit;
#define SPI1RXIP2 20
extern volatile unsigned int SPI1RXIP2_bit;
#define SPI1TXIS0 24
extern volatile unsigned int SPI1TXIS0_bit;
#define SPI1TXIS1 25
extern volatile unsigned int SPI1TXIS1_bit;
#define SPI1TXIP0 26
extern volatile unsigned int SPI1TXIP0_bit;
#define SPI1TXIP1 27
extern volatile unsigned int SPI1TXIP1_bit;
#define SPI1TXIP2 28
extern volatile unsigned int SPI1TXIP2_bit;
#define U1EIS0 0
extern volatile unsigned int U1EIS0_bit;
#define U1EIS1 1
extern volatile unsigned int U1EIS1_bit;
#define U1EIP0 2
extern volatile unsigned int U1EIP0_bit;
#define U1EIP1 3
extern volatile unsigned int U1EIP1_bit;
#define U1EIP2 4
extern volatile unsigned int U1EIP2_bit;
#define U1RXIS0 8
extern volatile unsigned int U1RXIS0_bit;
#define U1RXIS1 9
extern volatile unsigned int U1RXIS1_bit;
#define U1RXIP0 10
extern volatile unsigned int U1RXIP0_bit;
#define U1RXIP1 11
extern volatile unsigned int U1RXIP1_bit;
#define U1RXIP2 12
extern volatile unsigned int U1RXIP2_bit;
#define U1TXIS0 16
extern volatile unsigned int U1TXIS0_bit;
#define U1TXIS1 17
extern volatile unsigned int U1TXIS1_bit;
#define U1TXIP0 18
extern volatile unsigned int U1TXIP0_bit;
#define U1TXIP1 19
extern volatile unsigned int U1TXIP1_bit;
#define U1TXIP2 20
extern volatile unsigned int U1TXIP2_bit;
#define I2C1BIS0 24
extern volatile unsigned int I2C1BIS0_bit;
#define I2C1BIS1 25
extern volatile unsigned int I2C1BIS1_bit;
#define I2C1BIP0 26
extern volatile unsigned int I2C1BIP0_bit;
#define I2C1BIP1 27
extern volatile unsigned int I2C1BIP1_bit;
#define I2C1BIP2 28
extern volatile unsigned int I2C1BIP2_bit;
#define I2C1SIS0 0
extern volatile unsigned int I2C1SIS0_bit;
#define I2C1SIS1 1
extern volatile unsigned int I2C1SIS1_bit;
#define I2C1SIP0 2
extern volatile unsigned int I2C1SIP0_bit;
#define I2C1SIP1 3
extern volatile unsigned int I2C1SIP1_bit;
#define I2C1SIP2 4
extern volatile unsigned int I2C1SIP2_bit;
#define I2C1MIS0 8
extern volatile unsigned int I2C1MIS0_bit;
#define I2C1MIS1 9
extern volatile unsigned int I2C1MIS1_bit;
#define I2C1MIP0 10
extern volatile unsigned int I2C1MIP0_bit;
#define I2C1MIP1 11
extern volatile unsigned int I2C1MIP1_bit;
#define I2C1MIP2 12
extern volatile unsigned int I2C1MIP2_bit;
#define CNAIS0 16
extern volatile unsigned int CNAIS0_bit;
#define CNAIS1 17
extern volatile unsigned int CNAIS1_bit;
#define CNAIP0 18
extern volatile unsigned int CNAIP0_bit;
#define CNAIP1 19
extern volatile unsigned int CNAIP1_bit;
#define CNAIP2 20
extern volatile unsigned int CNAIP2_bit;
#define CNBIS0 24
extern volatile unsigned int CNBIS0_bit;
#define CNBIS1 25
extern volatile unsigned int CNBIS1_bit;
#define CNBIP0 26
extern volatile unsigned int CNBIP0_bit;
#define CNBIP1 27
extern volatile unsigned int CNBIP1_bit;
#define CNBIP2 28
extern volatile unsigned int CNBIP2_bit;
#define CNCIS0 0
extern volatile unsigned int CNCIS0_bit;
#define CNCIS1 1
extern volatile unsigned int CNCIS1_bit;
#define CNCIP0 2
extern volatile unsigned int CNCIP0_bit;
#define CNCIP1 3
extern volatile unsigned int CNCIP1_bit;
#define CNCIP2 4
extern volatile unsigned int CNCIP2_bit;
#define CNDIS0 8
extern volatile unsigned int CNDIS0_bit;
#define CNDIS1 9
extern volatile unsigned int CNDIS1_bit;
#define CNDIP0 10
extern volatile unsigned int CNDIP0_bit;
#define CNDIP1 11
extern volatile unsigned int CNDIP1_bit;
#define CNDIP2 12
extern volatile unsigned int CNDIP2_bit;
#define CNEIS0 16
extern volatile unsigned int CNEIS0_bit;
#define CNEIS1 17
extern volatile unsigned int CNEIS1_bit;
#define CNEIP0 18
extern volatile unsigned int CNEIP0_bit;
#define CNEIP1 19
extern volatile unsigned int CNEIP1_bit;
#define CNEIP2 20
extern volatile unsigned int CNEIP2_bit;
#define CNFIS0 24
extern volatile unsigned int CNFIS0_bit;
#define CNFIS1 25
extern volatile unsigned int CNFIS1_bit;
#define CNFIP0 26
extern volatile unsigned int CNFIP0_bit;
#define CNFIP1 27
extern volatile unsigned int CNFIP1_bit;
#define CNFIP2 28
extern volatile unsigned int CNFIP2_bit;
#define CNGIS0 0
extern volatile unsigned int CNGIS0_bit;
#define CNGIS1 1
extern volatile unsigned int CNGIS1_bit;
#define CNGIP0 2
extern volatile unsigned int CNGIP0_bit;
#define CNGIP1 3
extern volatile unsigned int CNGIP1_bit;
#define CNGIP2 4
extern volatile unsigned int CNGIP2_bit;
#define PMPIS0 0
extern volatile unsigned int PMPIS0_bit;
#define PMPIS1 1
extern volatile unsigned int PMPIS1_bit;
#define PMPIP0 2
extern volatile unsigned int PMPIP0_bit;
#define PMPIP1 3
extern volatile unsigned int PMPIP1_bit;
#define PMPIP2 4
extern volatile unsigned int PMPIP2_bit;
#define PMPEIS0 8
extern volatile unsigned int PMPEIS0_bit;
#define PMPEIS1 9
extern volatile unsigned int PMPEIS1_bit;
#define PMPEIP0 10
extern volatile unsigned int PMPEIP0_bit;
#define PMPEIP1 11
extern volatile unsigned int PMPEIP1_bit;
#define PMPEIP2 12
extern volatile unsigned int PMPEIP2_bit;
#define CMP1IS0 16
extern volatile unsigned int CMP1IS0_bit;
#define CMP1IS1 17
extern volatile unsigned int CMP1IS1_bit;
#define CMP1IP0 18
extern volatile unsigned int CMP1IP0_bit;
#define CMP1IP1 19
extern volatile unsigned int CMP1IP1_bit;
#define CMP1IP2 20
extern volatile unsigned int CMP1IP2_bit;
#define CMP2IS0 24
extern volatile unsigned int CMP2IS0_bit;
#define CMP2IS1 25
extern volatile unsigned int CMP2IS1_bit;
#define CMP2IP0 26
extern volatile unsigned int CMP2IP0_bit;
#define CMP2IP1 27
extern volatile unsigned int CMP2IP1_bit;
#define CMP2IP2 28
extern volatile unsigned int CMP2IP2_bit;
#define USBIS0 0
extern volatile unsigned int USBIS0_bit;
#define USBIS1 1
extern volatile unsigned int USBIS1_bit;
#define USBIP0 2
extern volatile unsigned int USBIP0_bit;
#define USBIP1 3
extern volatile unsigned int USBIP1_bit;
#define USBIP2 4
extern volatile unsigned int USBIP2_bit;
#define USBDMAIS0 8
extern volatile unsigned int USBDMAIS0_bit;
#define USBDMAIS1 9
extern volatile unsigned int USBDMAIS1_bit;
#define USBDMAIP0 10
extern volatile unsigned int USBDMAIP0_bit;
#define USBDMAIP1 11
extern volatile unsigned int USBDMAIP1_bit;
#define USBDMAIP2 12
extern volatile unsigned int USBDMAIP2_bit;
#define DMA0IS0 16
extern volatile unsigned int DMA0IS0_bit;
#define DMA0IS1 17
extern volatile unsigned int DMA0IS1_bit;
#define DMA0IP0 18
extern volatile unsigned int DMA0IP0_bit;
#define DMA0IP1 19
extern volatile unsigned int DMA0IP1_bit;
#define DMA0IP2 20
extern volatile unsigned int DMA0IP2_bit;
#define DMA1IS0 24
extern volatile unsigned int DMA1IS0_bit;
#define DMA1IS1 25
extern volatile unsigned int DMA1IS1_bit;
#define DMA1IP0 26
extern volatile unsigned int DMA1IP0_bit;
#define DMA1IP1 27
extern volatile unsigned int DMA1IP1_bit;
#define DMA1IP2 28
extern volatile unsigned int DMA1IP2_bit;
#define DMA2IS0 0
extern volatile unsigned int DMA2IS0_bit;
#define DMA2IS1 1
extern volatile unsigned int DMA2IS1_bit;
#define DMA2IP0 2
extern volatile unsigned int DMA2IP0_bit;
#define DMA2IP1 3
extern volatile unsigned int DMA2IP1_bit;
#define DMA2IP2 4
extern volatile unsigned int DMA2IP2_bit;
#define DMA3IS0 8
extern volatile unsigned int DMA3IS0_bit;
#define DMA3IS1 9
extern volatile unsigned int DMA3IS1_bit;
#define DMA3IP0 10
extern volatile unsigned int DMA3IP0_bit;
#define DMA3IP1 11
extern volatile unsigned int DMA3IP1_bit;
#define DMA3IP2 12
extern volatile unsigned int DMA3IP2_bit;
#define DMA4IS0 16
extern volatile unsigned int DMA4IS0_bit;
#define DMA4IS1 17
extern volatile unsigned int DMA4IS1_bit;
#define DMA4IP0 18
extern volatile unsigned int DMA4IP0_bit;
#define DMA4IP1 19
extern volatile unsigned int DMA4IP1_bit;
#define DMA4IP2 20
extern volatile unsigned int DMA4IP2_bit;
#define DMA5IS0 24
extern volatile unsigned int DMA5IS0_bit;
#define DMA5IS1 25
extern volatile unsigned int DMA5IS1_bit;
#define DMA5IP0 26
extern volatile unsigned int DMA5IP0_bit;
#define DMA5IP1 27
extern volatile unsigned int DMA5IP1_bit;
#define DMA5IP2 28
extern volatile unsigned int DMA5IP2_bit;
#define DMA6IS0 0
extern volatile unsigned int DMA6IS0_bit;
#define DMA6IS1 1
extern volatile unsigned int DMA6IS1_bit;
#define DMA6IP0 2
extern volatile unsigned int DMA6IP0_bit;
#define DMA6IP1 3
extern volatile unsigned int DMA6IP1_bit;
#define DMA6IP2 4
extern volatile unsigned int DMA6IP2_bit;
#define DMA7IS0 8
extern volatile unsigned int DMA7IS0_bit;
#define DMA7IS1 9
extern volatile unsigned int DMA7IS1_bit;
#define DMA7IP0 10
extern volatile unsigned int DMA7IP0_bit;
#define DMA7IP1 11
extern volatile unsigned int DMA7IP1_bit;
#define DMA7IP2 12
extern volatile unsigned int DMA7IP2_bit;
#define SPI2EIS0 16
extern volatile unsigned int SPI2EIS0_bit;
#define SPI2EIS1 17
extern volatile unsigned int SPI2EIS1_bit;
#define SPI2EIP0 18
extern volatile unsigned int SPI2EIP0_bit;
#define SPI2EIP1 19
extern volatile unsigned int SPI2EIP1_bit;
#define SPI2EIP2 20
extern volatile unsigned int SPI2EIP2_bit;
#define SPI2RXIS0 24
extern volatile unsigned int SPI2RXIS0_bit;
#define SPI2RXIS1 25
extern volatile unsigned int SPI2RXIS1_bit;
#define SPI2RXIP0 26
extern volatile unsigned int SPI2RXIP0_bit;
#define SPI2RXIP1 27
extern volatile unsigned int SPI2RXIP1_bit;
#define SPI2RXIP2 28
extern volatile unsigned int SPI2RXIP2_bit;
#define SPI2TXIS0 0
extern volatile unsigned int SPI2TXIS0_bit;
#define SPI2TXIS1 1
extern volatile unsigned int SPI2TXIS1_bit;
#define SPI2TXIP0 2
extern volatile unsigned int SPI2TXIP0_bit;
#define SPI2TXIP1 3
extern volatile unsigned int SPI2TXIP1_bit;
#define SPI2TXIP2 4
extern volatile unsigned int SPI2TXIP2_bit;
#define U2EIS0 8
extern volatile unsigned int U2EIS0_bit;
#define U2EIS1 9
extern volatile unsigned int U2EIS1_bit;
#define U2EIP0 10
extern volatile unsigned int U2EIP0_bit;
#define U2EIP1 11
extern volatile unsigned int U2EIP1_bit;
#define U2EIP2 12
extern volatile unsigned int U2EIP2_bit;
#define U2RXIS0 16
extern volatile unsigned int U2RXIS0_bit;
#define U2RXIS1 17
extern volatile unsigned int U2RXIS1_bit;
#define U2RXIP0 18
extern volatile unsigned int U2RXIP0_bit;
#define U2RXIP1 19
extern volatile unsigned int U2RXIP1_bit;
#define U2RXIP2 20
extern volatile unsigned int U2RXIP2_bit;
#define U2TXIS0 24
extern volatile unsigned int U2TXIS0_bit;
#define U2TXIS1 25
extern volatile unsigned int U2TXIS1_bit;
#define U2TXIP0 26
extern volatile unsigned int U2TXIP0_bit;
#define U2TXIP1 27
extern volatile unsigned int U2TXIP1_bit;
#define U2TXIP2 28
extern volatile unsigned int U2TXIP2_bit;
#define I2C2BIS0 0
extern volatile unsigned int I2C2BIS0_bit;
#define I2C2BIS1 1
extern volatile unsigned int I2C2BIS1_bit;
#define I2C2BIP0 2
extern volatile unsigned int I2C2BIP0_bit;
#define I2C2BIP1 3
extern volatile unsigned int I2C2BIP1_bit;
#define I2C2BIP2 4
extern volatile unsigned int I2C2BIP2_bit;
#define I2C2SIS0 8
extern volatile unsigned int I2C2SIS0_bit;
#define I2C2SIS1 9
extern volatile unsigned int I2C2SIS1_bit;
#define I2C2SIP0 10
extern volatile unsigned int I2C2SIP0_bit;
#define I2C2SIP1 11
extern volatile unsigned int I2C2SIP1_bit;
#define I2C2SIP2 12
extern volatile unsigned int I2C2SIP2_bit;
#define I2C2MIS0 16
extern volatile unsigned int I2C2MIS0_bit;
#define I2C2MIS1 17
extern volatile unsigned int I2C2MIS1_bit;
#define I2C2MIP0 18
extern volatile unsigned int I2C2MIP0_bit;
#define I2C2MIP1 19
extern volatile unsigned int I2C2MIP1_bit;
#define I2C2MIP2 20
extern volatile unsigned int I2C2MIP2_bit;
#define CAN1IS0 24
extern volatile unsigned int CAN1IS0_bit;
#define CAN1IS1 25
extern volatile unsigned int CAN1IS1_bit;
#define CAN1IP0 26
extern volatile unsigned int CAN1IP0_bit;
#define CAN1IP1 27
extern volatile unsigned int CAN1IP1_bit;
#define CAN1IP2 28
extern volatile unsigned int CAN1IP2_bit;
#define CAN2IS0 0
extern volatile unsigned int CAN2IS0_bit;
#define CAN2IS1 1
extern volatile unsigned int CAN2IS1_bit;
#define CAN2IP0 2
extern volatile unsigned int CAN2IP0_bit;
#define CAN2IP1 3
extern volatile unsigned int CAN2IP1_bit;
#define CAN2IP2 4
extern volatile unsigned int CAN2IP2_bit;
#define ETHIS0 8
extern volatile unsigned int ETHIS0_bit;
#define ETHIS1 9
extern volatile unsigned int ETHIS1_bit;
#define ETHIP0 10
extern volatile unsigned int ETHIP0_bit;
#define ETHIP1 11
extern volatile unsigned int ETHIP1_bit;
#define ETHIP2 12
extern volatile unsigned int ETHIP2_bit;
#define SPI3EIS0 16
extern volatile unsigned int SPI3EIS0_bit;
#define SPI3EIS1 17
extern volatile unsigned int SPI3EIS1_bit;
#define SPI3EIP0 18
extern volatile unsigned int SPI3EIP0_bit;
#define SPI3EIP1 19
extern volatile unsigned int SPI3EIP1_bit;
#define SPI3EIP2 20
extern volatile unsigned int SPI3EIP2_bit;
#define SPI3RXIS0 24
extern volatile unsigned int SPI3RXIS0_bit;
#define SPI3RXIS1 25
extern volatile unsigned int SPI3RXIS1_bit;
#define SPI3RXIP0 26
extern volatile unsigned int SPI3RXIP0_bit;
#define SPI3RXIP1 27
extern volatile unsigned int SPI3RXIP1_bit;
#define SPI3RXIP2 28
extern volatile unsigned int SPI3RXIP2_bit;
#define SPI3TXIS0 0
extern volatile unsigned int SPI3TXIS0_bit;
#define SPI3TXIS1 1
extern volatile unsigned int SPI3TXIS1_bit;
#define SPI3TXIP0 2
extern volatile unsigned int SPI3TXIP0_bit;
#define SPI3TXIP1 3
extern volatile unsigned int SPI3TXIP1_bit;
#define SPI3TXIP2 4
extern volatile unsigned int SPI3TXIP2_bit;
#define U3EIS0 8
extern volatile unsigned int U3EIS0_bit;
#define U3EIS1 9
extern volatile unsigned int U3EIS1_bit;
#define U3EIP0 10
extern volatile unsigned int U3EIP0_bit;
#define U3EIP1 11
extern volatile unsigned int U3EIP1_bit;
#define U3EIP2 12
extern volatile unsigned int U3EIP2_bit;
#define U3RXIS0 16
extern volatile unsigned int U3RXIS0_bit;
#define U3RXIS1 17
extern volatile unsigned int U3RXIS1_bit;
#define U3RXIP0 18
extern volatile unsigned int U3RXIP0_bit;
#define U3RXIP1 19
extern volatile unsigned int U3RXIP1_bit;
#define U3RXIP2 20
extern volatile unsigned int U3RXIP2_bit;
#define U3TXIS0 24
extern volatile unsigned int U3TXIS0_bit;
#define U3TXIS1 25
extern volatile unsigned int U3TXIS1_bit;
#define U3TXIP0 26
extern volatile unsigned int U3TXIP0_bit;
#define U3TXIP1 27
extern volatile unsigned int U3TXIP1_bit;
#define U3TXIP2 28
extern volatile unsigned int U3TXIP2_bit;
#define I2C3BIS0 0
extern volatile unsigned int I2C3BIS0_bit;
#define I2C3BIS1 1
extern volatile unsigned int I2C3BIS1_bit;
#define I2C3BIP0 2
extern volatile unsigned int I2C3BIP0_bit;
#define I2C3BIP1 3
extern volatile unsigned int I2C3BIP1_bit;
#define I2C3BIP2 4
extern volatile unsigned int I2C3BIP2_bit;
#define I2C3SIS0 8
extern volatile unsigned int I2C3SIS0_bit;
#define I2C3SIS1 9
extern volatile unsigned int I2C3SIS1_bit;
#define I2C3SIP0 10
extern volatile unsigned int I2C3SIP0_bit;
#define I2C3SIP1 11
extern volatile unsigned int I2C3SIP1_bit;
#define I2C3SIP2 12
extern volatile unsigned int I2C3SIP2_bit;
