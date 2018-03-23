
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


void pintarTablero(u32 *tablero){
	int i = 0;
	for(i = 0; i < 4; i++){
		print("Hola\n\r");
	}
}

int main(){

	printf("Hola\n\r");
   // tablero
   // 0 - nada
   // 1 - blanco
   // 2 - negro
   // movimientos
   // 0 - 2 idem
   // 3 posible movimiento

	u32 tablero[4];
	tablero[0] = 0x00000000;
	tablero[1] = 0x01800000;
	tablero[2] = 0x06000000;
	tablero[3] = 0x00000000;
	pintarTablero(tablero);


	return 0;
}
