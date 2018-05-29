/*
 * main.c
 *
 *  Created on: 23 may. 2018
 *      Author: Dariel
  * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */


 #include <stdio.h>
#include "xil_types.h"
#include <stdio.h>
#include "xparameters.h"
#include "xil_io.h"
#include "platform.h"

#include "unidad_general1.h"

#define DIR_MAX 508
#define DOSM 20


int main()
{
	init_platform();

	u32 baseaddr = 0x43c00000;
	const u32 zero = 0x00000000;

    u32 matriz[DOSM];
	for(int i = 0; i < DOSM; i++)
	{
		matriz[i] = zero;
	}
	matriz[7] = 0xd6; matriz[6]=0x51; matriz[5]= 0x2c; matriz[4]=0x96;
    matriz[3] = 0x5a; matriz[2]=0x0b; matriz[1]= 0xc9; matriz[0]=0x64;

    u32 cuenta1 = 0x00;
    u32 cuenta2 = 0x00;
    u32 vector1 = 0x00;
	u32 vector0 = 0x69;
    u32 salida1 = 0x0;
	u32 salida0 = 0x0;

	print("....\n\r");


	cuenta1 = UNIDAD_GENERAL1_mReadReg(baseaddr, UNIDAD_GENERAL1_S00_AXI_SLV_REG24_OFFSET);

    UNIDAD_GENERAL1_mWriteReg(baseaddr, UNIDAD_GENERAL1_S00_AXI_SLV_REG0_OFFSET, matriz[0]);
    UNIDAD_GENERAL1_mWriteReg(baseaddr, UNIDAD_GENERAL1_S00_AXI_SLV_REG1_OFFSET, matriz[1]);
    UNIDAD_GENERAL1_mWriteReg(baseaddr, UNIDAD_GENERAL1_S00_AXI_SLV_REG2_OFFSET, matriz[2]);
    UNIDAD_GENERAL1_mWriteReg(baseaddr, UNIDAD_GENERAL1_S00_AXI_SLV_REG3_OFFSET, matriz[3]);
    UNIDAD_GENERAL1_mWriteReg(baseaddr, UNIDAD_GENERAL1_S00_AXI_SLV_REG4_OFFSET, matriz[4]);
    UNIDAD_GENERAL1_mWriteReg(baseaddr, UNIDAD_GENERAL1_S00_AXI_SLV_REG5_OFFSET, matriz[5]);
    UNIDAD_GENERAL1_mWriteReg(baseaddr, UNIDAD_GENERAL1_S00_AXI_SLV_REG6_OFFSET, matriz[6]);
    UNIDAD_GENERAL1_mWriteReg(baseaddr, UNIDAD_GENERAL1_S00_AXI_SLV_REG7_OFFSET, matriz[7]);
    UNIDAD_GENERAL1_mWriteReg(baseaddr, UNIDAD_GENERAL1_S00_AXI_SLV_REG8_OFFSET, matriz[8]);
    UNIDAD_GENERAL1_mWriteReg(baseaddr, UNIDAD_GENERAL1_S00_AXI_SLV_REG9_OFFSET, matriz[9]);
    UNIDAD_GENERAL1_mWriteReg(baseaddr, UNIDAD_GENERAL1_S00_AXI_SLV_REG10_OFFSET, matriz[10]);
    UNIDAD_GENERAL1_mWriteReg(baseaddr, UNIDAD_GENERAL1_S00_AXI_SLV_REG11_OFFSET, matriz[11]);
    UNIDAD_GENERAL1_mWriteReg(baseaddr, UNIDAD_GENERAL1_S00_AXI_SLV_REG12_OFFSET, matriz[12]);
    UNIDAD_GENERAL1_mWriteReg(baseaddr, UNIDAD_GENERAL1_S00_AXI_SLV_REG13_OFFSET, matriz[13]);
    UNIDAD_GENERAL1_mWriteReg(baseaddr, UNIDAD_GENERAL1_S00_AXI_SLV_REG14_OFFSET, matriz[14]);
    UNIDAD_GENERAL1_mWriteReg(baseaddr, UNIDAD_GENERAL1_S00_AXI_SLV_REG15_OFFSET, matriz[15]);
    UNIDAD_GENERAL1_mWriteReg(baseaddr, UNIDAD_GENERAL1_S00_AXI_SLV_REG16_OFFSET, matriz[16]);
    UNIDAD_GENERAL1_mWriteReg(baseaddr, UNIDAD_GENERAL1_S00_AXI_SLV_REG17_OFFSET, matriz[17]);
    UNIDAD_GENERAL1_mWriteReg(baseaddr, UNIDAD_GENERAL1_S00_AXI_SLV_REG18_OFFSET, matriz[18]);
    UNIDAD_GENERAL1_mWriteReg(baseaddr, UNIDAD_GENERAL1_S00_AXI_SLV_REG19_OFFSET, matriz[19]);

    UNIDAD_GENERAL1_mWriteReg(baseaddr, UNIDAD_GENERAL1_S00_AXI_SLV_REG21_OFFSET , vector1);
    UNIDAD_GENERAL1_mWriteReg(baseaddr, UNIDAD_GENERAL1_S00_AXI_SLV_REG20_OFFSET, vector0);

    cuenta2 = UNIDAD_GENERAL1_mReadReg(baseaddr, UNIDAD_GENERAL1_S00_AXI_SLV_REG24_OFFSET);


    salida1 = UNIDAD_GENERAL1_mReadReg(baseaddr, UNIDAD_GENERAL1_S00_AXI_SLV_REG23_OFFSET);
    salida0 = UNIDAD_GENERAL1_mReadReg(baseaddr, UNIDAD_GENERAL1_S00_AXI_SLV_REG22_OFFSET);

    printf("resultado: %08x %08x\n\r", salida1, salida0);
    printf("tiempo : %d - %d = %d ciclos a 100MHz\n\r", cuenta2, cuenta1, cuenta2-cuenta1);


	cleanup_platform();
	return 0;
}
