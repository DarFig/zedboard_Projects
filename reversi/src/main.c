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
		printf("%i: %i %i %i %i %i %i %i %i\n", i, t[i][0], t[i][1], t[i][2], t[i][3], t[i][4], t[i][5], t[i][6], t[i][7]);
	}

}

void comprimir(int t[][COL], u32 tablero[]){
	tablero[0] = t[0][0]<<30 | t[0][1] <<28 | t[0][2] <<26 | t[0][3] <<24 | t[0][4] <<22 | t[0][5] <<20 | t[0][6] <<18 | t[0][7] <<16 | t[1][0] <<14 | t[1][1] <<12 | t[1][2] <<10 | t[1][3] <<8 | t[1][4] <<6 | t[1][5] <<4 | t[1][6] <<2 | t[1][7];
	tablero[1] = t[2][0]<<30 | t[2][1] <<28 | t[2][2] <<26 | t[2][3] <<24 | t[2][4] <<22 | t[2][5] <<20 | t[2][6] <<18 | t[2][7] <<16 | t[3][0] <<14 | t[3][1] <<12 | t[3][2] <<10 | t[3][3] <<8 | t[3][4] <<6 | t[3][5] <<4 | t[3][6] <<2 | t[3][7];
	tablero[2] = t[4][0]<<30 | t[4][1] <<28 | t[4][2] <<26 | t[4][3] <<24 | t[4][4] <<22 | t[4][5] <<20 | t[4][6] <<18 | t[4][7] <<16 | t[5][0] <<14 | t[5][1] <<12 | t[5][2] <<10 | t[5][3] <<8 | t[5][4] <<6 | t[5][5] <<4 | t[5][6] <<2 | t[5][7];
	tablero[3] = t[6][0]<<30 | t[6][1] <<28 | t[6][2] <<26 | t[6][3] <<24 | t[6][4] <<22 | t[6][5] <<20 | t[6][6] <<18 | t[6][7] <<16 | t[7][0] <<14 | t[7][1] <<12 | t[7][2] <<10 | t[7][3] <<8 | t[7][4] <<6 | t[7][5] <<4 | t[7][6] <<2 | t[7][7];

}

int main(){
	u32 baseaddr = 0x43c00000;
	u32 t1, t2, dato1, dato2;
	u32 tablero_comp[4];
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

	t1 = MATRIZ_CELDA_mReadReg(baseaddr, MATRIZ_CELDA_S00_AXI_SLV_REG4_OFFSET);

	MATRIZ_CELDA_mWriteReg(baseaddr, MATRIZ_CELDA_S00_AXI_SLV_REG0_OFFSET, tablero_comp[0]);
	MATRIZ_CELDA_mWriteReg(baseaddr, MATRIZ_CELDA_S00_AXI_SLV_REG1_OFFSET, tablero_comp[1]);
	MATRIZ_CELDA_mWriteReg(baseaddr, MATRIZ_CELDA_S00_AXI_SLV_REG2_OFFSET, tablero_comp[2]);
	MATRIZ_CELDA_mWriteReg(baseaddr, MATRIZ_CELDA_S00_AXI_SLV_REG3_OFFSET, tablero_comp[3]);

	t2 = MATRIZ_CELDA_mReadReg(baseaddr, MATRIZ_CELDA_S00_AXI_SLV_REG4_OFFSET);
	dato1 = MATRIZ_CELDA_mReadReg(baseaddr, MATRIZ_CELDA_S00_AXI_SLV_REG6_OFFSET);
	dato2 = MATRIZ_CELDA_mReadReg(baseaddr, MATRIZ_CELDA_S00_AXI_SLV_REG7_OFFSET);
	printf("resultados dato 1: %08x	dato2: %08x\n\r", dato1, dato2);
	printf("tiempo : %d - %d = %d ciclos a 100MHz\n\r", t2, t1, t2-t1);
	cleanup_platform();
	return 0;
}
