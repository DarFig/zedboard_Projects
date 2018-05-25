/******************************************************************************

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
int main()
{
    init_platform();

    u32 baseaddr = 0x43c00000;
	u32 matriz[2];
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

	c2  = U_GENERAL_mReadReg(baseaddr, U_GENERAL_S00_AXI_SLV_REG4_OFFSET);
	U_GENERAL_mWriteReg(baseaddr,U_GENERAL_S00_AXI_SLV_REG0_OFFSET, matriz[0]);
	U_GENERAL_mWriteReg(baseaddr,U_GENERAL_S00_AXI_SLV_REG1_OFFSET,matriz[1]);
	U_GENERAL_mWriteReg(baseaddr,U_GENERAL_S00_AXI_SLV_REG2_OFFSET,vector);

	salida = U_GENERAL_mReadReg(baseaddr,U_GENERAL_S00_AXI_SLV_REG3_OFFSET);

	c1  = U_GENERAL_mReadReg(baseaddr,U_GENERAL_S00_AXI_SLV_REG4_OFFSET);

	printf("resultado: %08x\n\r", salida);
	printf("tiempo : %d - %d = %d ciclos a 100MHz\n\r", c2, c1, c2-c1);

    cleanup_platform();
    return 0;
}