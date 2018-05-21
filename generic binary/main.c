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

#include "unidad_general"

int main()
{
	init_platform();
	
	u32 baseaddr = 0x43c00000;
    u32 matriz[20];
	for(int i = 0; i < 20; i++)
	{
		matriz[i] = 0x00000000;
	}
	matriz[7] = 0xd6; matriz[6]=0x51; matriz[5]= 0x2c; matriz[4]=0x96;
    matriz[3] = 0x5a; matriz[2]=0x0b; matriz[1]= 0xc9; matriz[0]=0x64;
	

    u32 vector1 = 0x00;
	u32 vector0 = 0x69;
    u32 salida1 = 0x0;
	u32 salida0 = 0x0;
	
	print("....\n\r");
    NEURONA_mWriteReg(baseaddr, , matriz[0]);
    NEURONA_mWriteReg(baseaddr, , matriz[1]);
    NEURONA_mWriteReg(baseaddr, , vector1);
	NEURONA_mWriteReg(baseaddr, , vector0);


    salida = NEURONA_mReadReg(baseaddr, XXXX_S00_AXI_SLV_REG1_OFFSET);
    printf("resultado: %08x\n\r", salida);


	cleanup_platform();
	return 0;
}