/*
 * main.c
 *
 *  Created on: 22 mar. 2018
 *      Author: Dariel
 */

#include "matriz_celda.h"
#include "xil_types.h"
#include <stdio.h>
#include "xparameters.h"
#include "xil_io.h"
#include "platform.h"

#define FILA 8
#define COL 8


void pintarTablero(int t[][COL]){


	for(int i = 0; i < 8; i++){
		printf("%i: %i %i %i %i %i %i %i %i\n\r", i, t[i][0], t[i][1], t[i][2], t[i][3], t[i][4], t[i][5], t[i][6], t[i][7]);
	}

}
void pintarRespuesta(u32 t[]){

	printf("Soluciones posibles:\n\r");
	for(int i = 0; i < 2; i++){
		printf("             %c %c %c %c %c %c %c %c\n\r", t[i] & 0x00000001 ? '1' : '0', t[i] & 0x00000002 ? '1' : '0', t[i] & 0x00000004 ? '1' : '0', t[i] & 0x00000008 ? '1' : '0',
														   t[i] & 0x00000010 ? '1' : '0', t[i] & 0x00000020 ? '1' : '0', t[i] & 0x00000040 ? '1' : '0', t[i] & 0x00000080 ? '1' : '0');
		printf("             %c %c %c %c %c %c %c %c\n\r", t[i] & 0x00000100 ? '1' : '0', t[i] & 0x00000200 ? '1' : '0', t[i] & 0x00000400 ? '1' : '0', t[i] & 0x00000800 ? '1' : '0',
														   t[i] & 0x00001000 ? '1' : '0', t[i] & 0x00002000 ? '1' : '0', t[i] & 0x00004000 ? '1' : '0', t[i] & 0x00008000 ? '1' : '0'
												   );
		printf("             %c %c %c %c %c %c %c %c\n\r", t[i] & 0x00010000 ? '1' : '0', t[i] & 0x00020000 ? '1' : '0', t[i] & 0x00040000 ? '1' : '0', t[i] & 0x00080000 ? '1' : '0',
														   t[i] & 0x00100000 ? '1' : '0', t[i] & 0x00200000 ? '1' : '0', t[i] & 0x00400000 ? '1' : '0', t[i] & 0x00800000 ? '1' : '0');

		printf("             %c %c %c %c %c %c %c %c\n\r", t[i] & 0x01000000 ? '1' : '0', t[i] & 0x02000000 ? '1' : '0', t[i] & 0x04000000 ? '1' : '0', t[i] & 0x08000000 ? '1' : '0',
														   t[i] & 0x10000000 ? '1' : '0', t[i] & 0x20000000 ? '1' : '0', t[i] & 0x40000000 ? '1' : '0', t[i] & 0x80000000 ? '1' : '0');

	}

}

void comprimir(int t[][COL], u32 tablero[]){
	tablero[0] = t[0][0]<<0 | t[0][1] <<2 | t[0][2] <<4 | t[0][3] <<6 | t[0][4] <<8 | t[0][5] <<10 | t[0][6] <<12 | t[0][7] <<14 | t[1][0] <<16 | t[1][1] <<18 | t[1][2] <<20 | t[1][3] <<22 | t[1][4] <<24 | t[1][5] <<26 | t[1][6] <<28 | t[1][7]<<30;
	tablero[1] = t[2][0]<<0 | t[2][1] <<2 | t[2][2] <<4 | t[2][3] <<6 | t[2][4] <<8 | t[2][5] <<10 | t[2][6] <<12 | t[2][7] <<14 | t[3][0] <<16 | t[3][1] <<18 | t[3][2] <<20 | t[3][3] <<22 | t[3][4] <<24 | t[3][5] <<26 | t[3][6] <<28 | t[3][7]<<30;
	tablero[2] = t[4][0]<<0 | t[4][1] <<2 | t[4][2] <<4 | t[4][3] <<6 | t[4][4] <<8 | t[4][5] <<10 | t[4][6] <<12 | t[4][7] <<14 | t[5][0] <<16 | t[5][1] <<18 | t[5][2] <<20 | t[5][3] <<22 | t[5][4] <<24 | t[5][5] <<26 | t[5][6] <<28 | t[5][7]<<30;
	tablero[3] = t[6][0]<<0 | t[6][1] <<2 | t[6][2] <<4 | t[6][3] <<6 | t[6][4] <<8 | t[6][5] <<10 | t[6][6] <<12 | t[6][7] <<14 | t[7][0] <<16 | t[7][1] <<18 | t[7][2] <<20 | t[7][3] <<22 | t[7][4] <<24 | t[7][5] <<26 | t[7][6] <<28 | t[7][7]<<30;

}

int main(){
	u32 baseaddr = 0x43c00000;
	u32 t1, t2, dato1, dato2;
	u32 tablero_comp[4], respuesta[2];
   // tablero
   // 0 - nada
   // 1 - blanco
   // 2 - negro
   // movimientos
   // 0 - 2 idem
   // 3 posible movimiento

	int tablero[FILA][COL] = {
	                    //0 1 2 3 4 5 6 7
	                     {0,0,0,0,0,0,0,0},//0
	                     {0,0,0,0,0,0,0,0},//1
	                     {0,0,0,0,0,0,0,0},//2
	                     {0,0,0,1,2,0,0,0},//3
	                     {0,0,1,2,0,0,0,0},//4
	                     {0,0,0,0,0,0,0,0},//5
	                     {0,0,0,0,0,0,0,0},//6
						 {0,0,0,0,0,0,0,0}};//7

	pintarTablero(tablero);
	comprimir(tablero, tablero_comp);

	t1 = MATRIZ_CELDA_mReadReg(XPAR_MATRIZ_CELDA_0_S00_AXI_BASEADDR, MATRIZ_CELDA_S00_AXI_SLV_REG4_OFFSET);

	MATRIZ_CELDA_mWriteReg(XPAR_MATRIZ_CELDA_0_S00_AXI_BASEADDR, MATRIZ_CELDA_S00_AXI_SLV_REG0_OFFSET, tablero_comp[0]);
	MATRIZ_CELDA_mWriteReg(XPAR_MATRIZ_CELDA_0_S00_AXI_BASEADDR, MATRIZ_CELDA_S00_AXI_SLV_REG1_OFFSET, tablero_comp[1]);
	MATRIZ_CELDA_mWriteReg(XPAR_MATRIZ_CELDA_0_S00_AXI_BASEADDR, MATRIZ_CELDA_S00_AXI_SLV_REG2_OFFSET, tablero_comp[2]);
	MATRIZ_CELDA_mWriteReg(XPAR_MATRIZ_CELDA_0_S00_AXI_BASEADDR, MATRIZ_CELDA_S00_AXI_SLV_REG3_OFFSET, tablero_comp[3]);

	t2 = MATRIZ_CELDA_mReadReg(XPAR_MATRIZ_CELDA_0_S00_AXI_BASEADDR, MATRIZ_CELDA_S00_AXI_SLV_REG4_OFFSET);
	dato1 = MATRIZ_CELDA_mReadReg(XPAR_MATRIZ_CELDA_0_S00_AXI_BASEADDR, MATRIZ_CELDA_S00_AXI_SLV_REG6_OFFSET);
	dato2 = MATRIZ_CELDA_mReadReg(XPAR_MATRIZ_CELDA_0_S00_AXI_BASEADDR, MATRIZ_CELDA_S00_AXI_SLV_REG7_OFFSET);
	printf("resultados reg6: %08x	reg7: %08x\n\r", dato1, dato2);
	respuesta[0] = dato1;
	respuesta[1] = dato2;
	pintarRespuesta(respuesta);
	printf("tiempo : %d - %d = %d ciclos a 100MHz\n\r", t2, t1, t2-t1);
	cleanup_platform();
	return 0;
}
