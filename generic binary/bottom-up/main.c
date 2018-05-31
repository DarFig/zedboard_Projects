/******************************************************************************
*
*
******************************************************************************/

/*
 * main.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"

#include "xil_types.h"
#include "xparameters.h"
#include "xil_io.h"
#include "platform.h"

#include "u_general.h"

#define M 8
#define N 8

void pruebaC(u8 matriz[], u8 vector, u8 salida[])
{
	u8 temp0;
	int cuenta = 0;
	int m = 0;
	for(int i = 0; i < M; i++)
	{
		temp0 = ~(matriz[i] ^ vector);
		//printf("%08x\n", temp0);
		cuenta = 0;
		while (temp0 != 0) {
		    temp0 &= (temp0 - 1);
		    cuenta++;
		}
		if(cuenta >= 4) salida[m] = 1;
		else salida[m] = 0;
		m++;
	}
}
u8 comprimirS(u8 sal[])
{
	u8 salida;
	salida = sal[0] | sal[1] << 1 | sal[2] << 2 | sal[3] << 3 | sal[4] <<  4 | sal[5] << 5 | sal[6] << 6 | sal[7] <<  7 ;
	return salida;
}

int main()
{
    init_platform();

    u32 baseaddr = 0x43c00000;
	u32 matriz[2];

	u8 matrizc[M] = {0x64, 0xc9, 0x0b, 0x5a, 0x96, 0x2c, 0x51, 0xd6};
	u8 vecc = 0x69;
	u8 salc[M] = {0x0, 0x0,0x0,0x0,0x0,0x0,0x0,0x0};
	u32 tc1, tc2  = 0x0;
	///-- salida == 0xff para 8x8
	/*
	matriz[1] = 0x0;
	matriz[0] = 0x0;
	u32 vector = 0x0;
	*/
	///-- -- salida == 0x6f para 8x8
	/***/
	matriz[1] = 0xd6512c96;
	matriz[0] = 0x5a0bc964;
	u32 vector = 0x69;



	u32 salida = 0x0;
	u32 c2, c1 = 0x0;

	c1  = U_GENERAL_mReadReg(baseaddr, U_GENERAL_S00_AXI_SLV_REG4_OFFSET);
	U_GENERAL_mWriteReg(baseaddr,U_GENERAL_S00_AXI_SLV_REG0_OFFSET, matriz[0]);
	U_GENERAL_mWriteReg(baseaddr,U_GENERAL_S00_AXI_SLV_REG1_OFFSET,matriz[1]);
	U_GENERAL_mWriteReg(baseaddr,U_GENERAL_S00_AXI_SLV_REG2_OFFSET,vector);

	salida = U_GENERAL_mReadReg(baseaddr,U_GENERAL_S00_AXI_SLV_REG3_OFFSET);

	c2  = U_GENERAL_mReadReg(baseaddr,U_GENERAL_S00_AXI_SLV_REG4_OFFSET);

	printf("resultado: %08x\n\r", salida);
	printf("tiempo : %d - %d = %d ciclos a 100MHz\n\r", c2, c1, c2-c1);


	tc1 = U_GENERAL_mReadReg(baseaddr,U_GENERAL_S00_AXI_SLV_REG4_OFFSET);
	pruebaC(matrizc, vecc, salc);
	tc2 = U_GENERAL_mReadReg(baseaddr,U_GENERAL_S00_AXI_SLV_REG4_OFFSET);
	printf("\n----------------\nSalida codigo c:\n");
	printf("%08x\n", comprimirS(salc));
	printf("tiempo : %d - %d = %d ciclos a 100MHz\n\r", tc2, tc1, tc2-tc1);

    cleanup_platform();
    return 0;
}
