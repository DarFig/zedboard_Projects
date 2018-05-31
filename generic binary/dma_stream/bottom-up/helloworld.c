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

void PRUEBA_STREAM_LITE_Reg_SelfTest2(int baseaddr_p)
{
	u32 baseaddr;
	u32 data_read;
	int write_loop_index;
	int read_loop_index;
	int Index;

	printf("******************************\n\r");
	printf("* User Peripheral Self Test\n\r");
	printf("******************************\n\n\r");

	/*
	 * Write to user logic slave module register(s) and read back
	 */
	printf("User logic slave module test...\n\r");

	for (read_loop_index = 0 ; read_loop_index < 4; read_loop_index++){
		data_read=PRUEBA_STREAM_LITE_mReadReg ((u32) baseaddr_p, read_loop_index*4);
	    printf ("Dato leído %x\n", data_read);

	  }

	printf("   - slave register write/read passed\n\n\r");
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
    u32 row[4]={0x5a0bc964,0xd6512c96,0x69,8};
    u32 c1, c2 = 0x0;

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



    print("Datos enviados\n\r");
    printf("%d,%d,%d,%d\n", row[0], row[1], row[2], row[3]);
    print("Datos recibidos\n\r");
    printf("%d,%d,%d,%d\n", map_from_HW[0], map_from_HW[1], map_from_HW[2], map_from_HW[3]);
    PRUEBA_STREAM_LITE_Reg_SelfTest2(XPAR_PRUEBA_STREAM_LITE_0_S00_AXI_BASEADDR);

    printf("tiempo : %d - %d = %d ciclos a 100MHz\n\r", c2, c1, c2-c1);
    cleanup_platform();
    return 0;
}
