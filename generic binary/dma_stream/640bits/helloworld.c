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
#define ROWSIZE 22

u32 PRUEBA_STREAM_LITE_Reg_SelfTest2(int baseaddr_p)
{
	u32 data_read[5];
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
		data_read[read_loop_index] = PRUEBA_STREAM_LITE_mReadReg ((u32) baseaddr_p, read_loop_index*4);
	  }
	printf("* AXI LITE\n\r");
	printf ("Salida %08x %08x\n",data_read[1], data_read[0]);
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
#define TRANSFER_SIZE ROWSIZE*4 //22 palabras de 4 bytes
#define TRANSFER_SIZE_DEVICE_TO_DMA 4*4 //4 palabras de 4 bytes
int main()
{

    init_platform();
    init_DMA();
    u32 row[ROWSIZE] = {
    	0x11111111,//0
		0x01110,//1
		0x05555550,//2
		0x55555500,	//3
		0x00,//4
		0x55555500,	//5
		0x00,//6
		0x00,	//7
		0xfffffff0,//8
		0x0ffffff0,//9
		0x00,//10
		0x00,//11
		0x00,//12
		0x55,//13
		0x00,//14
		0x03333330,//15
		0x04444440,//16
		0x05555550,//17
		0x0ffffff0,//18
		0x00,//19
		0x11111111,//20 vector0
		0x55555555,//21 vector1
	};
    //0xffffffff;
    //0x00000000;
    u32 c1, c2, c3 = 0x0;

    /*for(int i = 0; i < ROWSIZE; i++)
    {
    		row[i] =  0x00000000;
    }*
    row[7] = 0xd6; row[6]=0x51; row[5]= 0xffffffff; row[4]=0xffffffff;
    row[3] = 0x5a; row[2]=0x0b; row[1]= 0xffffffff; row[0]=0xffffffff;
    row[17] = 0xd6; row[16]=0x51; row[15]= 0xffffffff; row[14]=0xffffffff;
    row[13] = 0x5a; row[12]=0x0b; row[11]= 0xffffffff; row[10]=0xffffffff;
    row[20] = 0x00000000; row[21] = 0xffffffff;*/

	if (init_DMA() != XST_SUCCESS){
		printf("Error: DMA init failed\n");
		return XST_FAILURE;
	}
	printf("DMA init done\n");
	int status;

	//----- tiempo init
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



    print("Datos enviados\n\r");
    printf("-------\n\r");
    for(int i = 0; i < ROWSIZE; i++)
    {
    	 printf("%08x ", row[i]);
    }
    printf("-------\n\r");
    print("Datos recibidos\n\r");
    printf("Primer dato enviado: %08x \nvector: %08x %08x \nsalida0: %08x\n", map_from_HW[0], map_from_HW[2], map_from_HW[1], map_from_HW[3]);
    //----- tiempo fin
    printf("-------\n\r");
    printf("-------\n\r");

    //Recoger los datos por AXI_LITE
    c3 = PRUEBA_STREAM_LITE_Reg_SelfTest2(XPAR_PRUEBA_STREAM_LITE_0_S00_AXI_BASEADDR);

    printf("tiempo : %d - %d = %d ciclos a 100MHz\n\r", c2, c1, c2-c1);
    printf("tiempo tot : %d - %d + %d = %d ciclos a 100MHz\n\r", c2, c1, c3, c2 - c1 + c3);
    cleanup_platform();
    return 0;
}
