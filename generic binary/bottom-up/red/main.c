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



u8 comprimirS(u8 sal[])
{
	return (sal[0] | sal[1] << 1 | sal[2] << 2 | sal[3] << 3 | sal[4] <<  4 | sal[5] << 5 | sal[6] << 6 | sal[7] <<  7 );
}
u16 comprimirDos(u8 sal0[], u8 sal1[])
{
	return  (sal0[0] | sal0[1] << 1 | sal0[2] << 2 | sal0[3] << 3 | sal0[4] <<  4 | sal0[5] << 5 | sal0[6] << 6 | sal0[7] <<  7 | sal1[0] << 8 | sal1[1] << 9 | sal1[2] << 10 | sal1[3] << 11 | sal1[4] <<  12 | sal1[5] << 13 | sal1[6] << 14 | sal1[7] <<  15);

}
//matrizz[1] = 0xd6512c96;
//	matrizz[0] = 0x5a0bc964;
//	u32 vector = 0xa9519669;
const u8 matriz[M] = {0x64, 0xc9, 0x0b, 0x5a, 0x96, 0x2c, 0x51, 0xd6};
const u8 matriz1[M] = {0x96, 0x2c, 0x51, 0xd6, 0x64, 0xc9, 0x0b, 0x5a};
const u8 v0 = 0x69;
const u8 v1 = 0x96;
const u8 v2 = 0x51;
const u8 v3 = 0xa9;

//dejar esto como global arregla la optimizacion de -o3 (:^|)
u8 s0[M], s1[M], s2[M], s3[M], s4[M], s5[M], s6[M], s7[M], s10[M], s11[M];

void pruebaC(u8 salida0[], u8 salida1[])
{

	u8 temp0 = 0;
	int cuenta = 0;
	int m = 0;
	u8 vxnor = ~( v0 ^ v1 ^ v2 ^ v3);

	for(int i = 0; i < M; i++)//0
	{
		temp0 = ~(matriz[i] ^ v0);
		//printf("%08x\n", temp0);
		cuenta = 0;
		while (temp0 != 0) {
		    temp0 &= (temp0 - 1);
		    cuenta++;
		}
		if(cuenta >= 4) s0[m] = 1;
		else s0[m] = 0;
		m++;
	}
	m = 0;
	for(int i = 0; i < M; i++)//1
	{
		temp0 = ~(matriz[i] ^ v1);
		//printf("%08x\n", temp0);
		cuenta = 0;
		while (temp0 != 0) {
			temp0 &= (temp0 - 1);
			cuenta++;
		}
		if(cuenta >= 4) s1[m] = 1;
		else s1[m] = 0;
		m++;
	}
	m = 0;
	for(int i = 0; i < M; i++)//2
	{
		temp0 = ~(matriz[i] ^ v2);
		//printf("%08x\n", temp0);
		cuenta = 0;
		while (temp0 != 0) {
			temp0 &= (temp0 - 1);
			cuenta++;
		}
		if(cuenta >= 4) s2[m] = 1;
		else s3[m] = 0;
		m++;
	}
	m = 0;
	for(int i = 0; i < M; i++)//3
	{
		temp0 = ~(matriz[i] ^ v3);
		//printf("%08x\n", temp0);
		cuenta = 0;
		while (temp0 != 0) {
			temp0 &= (temp0 - 1);
			cuenta++;
		}
		if(cuenta >= 4) s3[m] = 1;
		else s3[m] = 0;
		m++;
	}
	///	---
	m = 0;
	for(int i = 0; i < M; i++)
	{
		temp0 = ~(matriz1[i] ^ v0);
		//printf("%08x\n", temp0);
		cuenta = 0;
		while (temp0 != 0) {
		    temp0 &= (temp0 - 1);
		    cuenta++;
		}
		if(cuenta >= 4) s4[m] = 1;
		else s4[m] = 0;
		m++;
	}
	m = 0;
	for(int i = 0; i < M; i++)
	{
		temp0 = ~(matriz1[i] ^ v1);
		//printf("%08x\n", temp0);
		cuenta = 0;
		while (temp0 != 0) {
			temp0 &= (temp0 - 1);
			cuenta++;
		}
		if(cuenta >= 4) s5[m] = 1;
		else s5[m] = 0;
		m++;
	}
	m = 0;
	for(int i = 0; i < M; i++)
	{
		temp0 = ~(matriz1[i] ^ v2);
		//printf("%08x\n", temp0);
		cuenta = 0;
		while (temp0 != 0) {
			temp0 &= (temp0 - 1);
			cuenta++;
		}
		if(cuenta >= 4) s6[m] = 1;
		else s6[m] = 0;
		m++;
	}
	m = 0;
	for(int i = 0; i < M; i++)
	{
		temp0 = ~(matriz1[i] ^ v3);
		//printf("%08x\n", temp0);
		cuenta = 0;
		while (temp0 != 0) {
			temp0 &= (temp0 - 1);
			cuenta++;
		}
		if(cuenta >= 4) s7[m] = 1;
		else s7[m] = 0;
		m++;
	}
	s10[0] = comprimirS(s0);
	s10[1] = comprimirS(s1);
	s10[2] = comprimirS(s2);
	s10[3] = comprimirS(s3);
	s10[4] = comprimirS(s4);
	s10[5] = comprimirS(s5);
	s10[6] = comprimirS(s6);
	s10[7] = comprimirS(s7);

	s11[0] = comprimirS(s4);
	s11[1] = comprimirS(s5);
	s11[2] = comprimirS(s6);
	s11[3] = comprimirS(s7);
	s11[4] = comprimirS(s0);
	s11[5] = comprimirS(s1);
	s11[6] = comprimirS(s2);
	s11[7] = comprimirS(s3);
	m = 0;
	for(int i = 0; i < M; i++)
	{
		temp0 = ~(s10[i] ^ vxnor);
		//printf("%08x\n", temp0);
		cuenta = 0;
		while (temp0 != 0) {
			temp0 &= (temp0 - 1);
			cuenta++;
		}
		if(cuenta >= 4) salida0[m] = 1;
		else salida0[m] = 0;
		m++;
	}
	m = 0;
	for(int i = 0; i < M; i++)
	{
		temp0 = ~(s11[i] ^ vxnor);
		//printf("%08x\n", temp0);
		cuenta = 0;
		while (temp0 != 0) {
			temp0 &= (temp0 - 1);
			cuenta++;
		}
		if(cuenta >= 4) salida1[m] = 1;
		else salida1[m] = 0;
		m++;
	}

}
int main()
{
    init_platform();

    u32 baseaddr = 0x43c00000;
	u32 matrizz[2];

	//u8 matrizc[M] = {0x64, 0xc9, 0x0b, 0x5a, 0x96, 0x2c, 0x51, 0xd6};
	//u8 vecc = 0x69;
	//u8 salc[M] = {0x0, 0x0,0x0,0x0,0x0,0x0,0x0,0x0};
	u32 tc1, tc2  = 0x0;
	///-- salida == 0xff para 8x8
	/*
	matriz[1] = 0x0;
	matriz[0] = 0x0;
	u32 vector = 0x0;
	*/
	///-- -- salida == 0x6f para 8x8
	/***/
	matrizz[1] = 0xd6512c96;
	matrizz[0] = 0x5a0bc964;
	u32 vector = 0xa9519669;


	u8  sal01[M], sal02[M] = {0x0, 0x0,0x0,0x0,0x0,0x0,0x0,0x0};
	u32 salida = 0x0;
	u32 c2, c1 = 0x0;

	c1  = U_GENERAL_mReadReg(baseaddr, U_GENERAL_S00_AXI_SLV_REG4_OFFSET);
	U_GENERAL_mWriteReg(baseaddr,U_GENERAL_S00_AXI_SLV_REG0_OFFSET, matrizz[0]);
	U_GENERAL_mWriteReg(baseaddr,U_GENERAL_S00_AXI_SLV_REG1_OFFSET,matrizz[1]);
	U_GENERAL_mWriteReg(baseaddr,U_GENERAL_S00_AXI_SLV_REG2_OFFSET,vector);

	salida = U_GENERAL_mReadReg(baseaddr,U_GENERAL_S00_AXI_SLV_REG3_OFFSET);

	c2  = U_GENERAL_mReadReg(baseaddr,U_GENERAL_S00_AXI_SLV_REG4_OFFSET);

	printf("resultado: %08x\n\r", salida);
	printf("tiempo : %d - %d = %d ciclos a 100MHz\n\r", c2, c1, c2-c1);


	tc1 = U_GENERAL_mReadReg(baseaddr,U_GENERAL_S00_AXI_SLV_REG4_OFFSET);
	pruebaC(sal01, sal02);
	tc2 = U_GENERAL_mReadReg(baseaddr,U_GENERAL_S00_AXI_SLV_REG4_OFFSET);
	printf("\n----------------\nSalida codigo c:\n");
	printf("%08x\n", comprimirDos(sal01, sal02));
	printf("tiempo : %d - %d = %d ciclos a 100MHz\n\r", tc2, tc1, tc2-tc1);

    cleanup_platform();
    return 0;
}
