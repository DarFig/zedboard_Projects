/*
 * main.c
 *
 *  Created on: 18 may. 2018
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

#include "unidad_general.h"

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


    u32 vector1 = 0x00;
	u32 vector0 = 0x69;
    u32 salida1 = 0x0;
	u32 salida0 = 0x0;

	print("....\n\r");


    int dir = 0;
    for(int i = 0; i < DOSM; i++)
	{
    	UNIDAD_GENERAL_mWriteReg(baseaddr, UNIDAD_GENERAL_S00_AXI_SLV_REG0_OFFSET + dir, matriz[i]);
		dir += 4;
	}
    while(DIR_MAX > dir)//--
    {
    	UNIDAD_GENERAL_mWriteReg(baseaddr, UNIDAD_GENERAL_S00_AXI_SLV_REG0_OFFSET + dir, zero);
    	dir += 4;
    }

    UNIDAD_GENERAL_mWriteReg(baseaddr, UNIDAD_GENERAL_S00_AXI_SLV_REG129_OFFSET , vector1);
    UNIDAD_GENERAL_mWriteReg(baseaddr, UNIDAD_GENERAL_S00_AXI_SLV_REG128_OFFSET, vector0);


    salida1 = UNIDAD_GENERAL_mReadReg(baseaddr, UNIDAD_GENERAL_S00_AXI_SLV_REG131_OFFSET);
    salida0 = UNIDAD_GENERAL_mReadReg(baseaddr, UNIDAD_GENERAL_S00_AXI_SLV_REG130_OFFSET);
    printf("resultado: %08x %08x\n\r", salida1, salida0);


	cleanup_platform();
	return 0;
}