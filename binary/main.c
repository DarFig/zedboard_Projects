/*
 * main.c
 *
 *  Created on: 18 abr. 2018
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

#include "neurona.h"


int main()
{
    init_platform();

    u32 baseaddr = 0x43c00000;
    u32 matriz[2];
    matriz[1] = 0xd6512c96;
    matriz[0] = 0x5a0bc964;
    u32 vector = 0x69;
    u32 salida = 0x0;

    print("....\n\r");
    NEURONA_mWriteReg(baseaddr, NEURONA_S00_AXI_SLV_REG0_OFFSET, matriz[0]);
    NEURONA_mWriteReg(baseaddr, NEURONA_S00_AXI_SLV_REG1_OFFSET, matriz[1]);
    NEURONA_mWriteReg(baseaddr, NEURONA_S00_AXI_SLV_REG2_OFFSET, vector);


    salida = NEURONA_mReadReg(baseaddr, NEURONA_S00_AXI_SLV_REG3_OFFSET);
    printf("resultado: %08x\n\r", salida);

    cleanup_platform();
    return 0;
}


