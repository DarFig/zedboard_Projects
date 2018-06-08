/******************************************************************************

******************************************************************************/

/*
 * helloworld.c: simple test application
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
//#include "printf.h"

// definiciones de los ocmponentes HW
//#include "xbasic_types.h"
#include "xparameters.h"
#include "xaxidma.h"
#include "Prueba_stream_lite.h"


// AXI DMA Instance
XAxiDma AxiDma;

#define M 8
#define N 8


const u8 matriz[M] = {0x64, 0xc9, 0x0b, 0x5a, 0x96, 0x2c, 0x51, 0xd6};
const u8 matriz1[M] = {0x96, 0x2c, 0x51, 0xd6, 0x64, 0xc9, 0x0b, 0x5a};
const u8 v0 = 0x69;
const u8 v1 = 0x96;
const u8 v2 = 0x51;
const u8 v3 = 0xa9;


u8 comprimirS(u8 sal[])
{
	return (sal[0] | sal[1] << 1 | sal[2] << 2 | sal[3] << 3 | sal[4] <<  4 | sal[5] << 5 | sal[6] << 6 | sal[7] <<  7 );
}
u16 comprimirDos(u8 sal0[], u8 sal1[])
{
	return (sal0[0] | sal0[1] << 1 | sal0[2] << 2 | sal0[3] << 3 | sal0[4] <<  4 | sal0[5] << 5 | sal0[6] << 6 | sal0[7] <<  7 | sal1[0] << 8 | sal1[1] << 9 | sal1[2] << 10 | sal1[3] << 11 | sal1[4] <<  12 | sal1[5] << 13 | sal1[6] << 14 | sal1[7] <<  15);

}
u8 s0[M], s1[M], s2[M], s3[M], s4[M], s5[M], s6[M], s7[M], s10[M], s11[M];
void pruebaC(u8 salida0[], u8 salida1[])
{
	u8 temp0;
	
	u8 vxnor = ~( v0 ^ v1 ^ v2 ^ v3);
	int cuenta = 0;
	int m = 0;
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


u32 PRUEBA_STREAM_LITE_Reg_SelfTest2(int baseaddr_p)
{
	u32 baseaddr;
	u32 data_read[5];
	int write_loop_index;
	int read_loop_index;
	int Index;

	//printf("******************************\n\r");
	//printf("* User Peripheral Self Test\n\r");
	//printf("******************************\n\n\r");

	/*
	 * Write to user logic slave module register(s) and read back
	 */
	//printf("User logic slave module test...\n\r");
	data_read[4] = PRUEBA_STREAM_LITE_mReadReg ((u32) baseaddr_p, 3*4);
	for (read_loop_index = 0 ; read_loop_index < 4; read_loop_index++){
		data_read[read_loop_index]=PRUEBA_STREAM_LITE_mReadReg ((u32) baseaddr_p, read_loop_index*4);
	}
	printf("\n AXI LITE\n\r");
	printf ("Salida %08x %08x\n",0x0, data_read[0]);
	printf ("Número de cilos %x\n", data_read[2]);
	printf ("Cuenta %x\n", data_read[3]);
	return data_read[3] - data_read[4];
	//printf("   - slave register write/read passed\n\n\r");
	}
// función para inicializar el DMA
int init_DMA(){
	XAxiDma_Config *CfgPtr;
	int status;

	CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_0_DEVICE_ID);
	if (!CfgPtr){
		print("Error looking for AXI DMA config\n\r");
		return XST_FAILURE;
	}

	status = XAxiDma_CfgInitialize(&AxiDma, CfgPtr);
	if (status != XST_SUCCESS){
		printf("Error initializing DMA\n\r");
		return XST_FAILURE;
	}

	// Disable interrupts, we use polling mode
	XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);
	XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);

	return XST_SUCCESS;
}
#define TRANSFER_SIZE 4*4 //4 palabras de 4 bytes
#define TRANSFER_SIZE_DEVICE_TO_DMA 4*4 //4 palabras de 4 bytes
int main()
{

    init_platform();
    init_DMA();
    u32 row[4]={0x5a0bc964, 0xd6512c96, 0xa9519669, 0x8};
    volatile u32 c1, c2, c3, c4, c5, cc1, cc2 = 0x0;
    u8 salc0[M];
    u8 salc1[M];

	if (init_DMA() != XST_SUCCESS){
		printf("Error: DMA init failed\n");
		return XST_FAILURE;
	}
	printf("DMA init done\n");
	int status;

	c1 = PRUEBA_STREAM_LITE_mReadReg (XPAR_PRUEBA_STREAM_LITE_0_S00_AXI_BASEADDR, PRUEBA_STREAM_LITE_S00_AXI_SLV_REG3_OFFSET);

	status = XAxiDma_SimpleTransfer(&AxiDma,  (u32) row, TRANSFER_SIZE, XAXIDMA_DMA_TO_DEVICE);
		if (status != XST_SUCCESS) {
			printf("Error: DMA transfer from CPU to ACC failed\n");
			return XST_FAILURE;
		}
		// Wait for transfer to be done
		while (XAxiDma_Busy(&AxiDma, XAXIDMA_DMA_TO_DEVICE))
			;

	c2 = PRUEBA_STREAM_LITE_mReadReg (XPAR_PRUEBA_STREAM_LITE_0_S00_AXI_BASEADDR, PRUEBA_STREAM_LITE_S00_AXI_SLV_REG3_OFFSET);
	u32 map_from_HW[4];
	status = XAxiDma_SimpleTransfer(&AxiDma,  (u32) map_from_HW, TRANSFER_SIZE_DEVICE_TO_DMA, XAXIDMA_DEVICE_TO_DMA);
	if (status != XST_SUCCESS) {
		printf("Error: DMA transfer from ACC to CPU failed\n");
		return XST_FAILURE;
	}
	c3 = PRUEBA_STREAM_LITE_mReadReg (XPAR_PRUEBA_STREAM_LITE_0_S00_AXI_BASEADDR, PRUEBA_STREAM_LITE_S00_AXI_SLV_REG3_OFFSET);


    print("Datos enviados\n\r");
    printf("%08x, %08x, %08x, %08x\n", row[0], row[1], row[2], row[3]);
    //print("Datos recibidos\n\r");
    //printf("%d,%d,%d,%d\n", map_from_HW[0], map_from_HW[1], map_from_HW[2], map_from_HW[3]);
    //PRUEBA_STREAM_LITE_Reg_SelfTest2(XPAR_PRUEBA_STREAM_LITE_0_S00_AXI_BASEADDR);

    printf("tiempo : %d - %d = %d ciclos a 100MHz\n\r", c2, c1, c2-c1);
    printf("tiempo con vuelta por DMA : %d - %d = %d ciclos a 100MHz\n\r", c3, c1, c3-c1);


    //Recoger los datos por AXI_LITE
    //c4 = PRUEBA_STREAM_LITE_mReadReg (XPAR_PRUEBA_STREAM_LITE_0_S00_AXI_BASEADDR, PRUEBA_STREAM_LITE_S00_AXI_SLV_REG3_OFFSET);
    c4 = PRUEBA_STREAM_LITE_mReadReg (XPAR_PRUEBA_STREAM_LITE_0_S00_AXI_BASEADDR, PRUEBA_STREAM_LITE_S00_AXI_SLV_REG3_OFFSET);
    u32 salAXI = PRUEBA_STREAM_LITE_mReadReg (XPAR_PRUEBA_STREAM_LITE_0_S00_AXI_BASEADDR, PRUEBA_STREAM_LITE_S00_AXI_SLV_REG0_OFFSET);
    c5 = PRUEBA_STREAM_LITE_mReadReg (XPAR_PRUEBA_STREAM_LITE_0_S00_AXI_BASEADDR, PRUEBA_STREAM_LITE_S00_AXI_SLV_REG3_OFFSET);
    printf("\ntiempo con vuelta por AXI LITE : %d - %d + (%d - %d ) = %d ciclos a 100MHz\n\r", c2, c1, c5, c4, c2 - c1 +  (c5 - c4));
    printf ("Salida: %08x\n", salAXI);

    cc1 = PRUEBA_STREAM_LITE_mReadReg (XPAR_PRUEBA_STREAM_LITE_0_S00_AXI_BASEADDR, PRUEBA_STREAM_LITE_S00_AXI_SLV_REG3_OFFSET);
    pruebaC(salc0, salc1);
    cc2 = PRUEBA_STREAM_LITE_mReadReg (XPAR_PRUEBA_STREAM_LITE_0_S00_AXI_BASEADDR, PRUEBA_STREAM_LITE_S00_AXI_SLV_REG3_OFFSET);
    printf("\n----------------\nSalida codigo c:\n");
    printf("%08x\n", comprimirDos(salc0, salc1));
    printf("tiempo : %d - %d = %d ciclos a 100MHz\n\r", cc2, cc1, cc2-cc1);

    cleanup_platform();
    return 0;
}
