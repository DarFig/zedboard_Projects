# Generic-Binary Network


### Primera Modelo con Generic

**Objetivo:**
A partir de una entrada de n x m bits y un vector de n bits obtener la salida de m bits correspondiente a la binarización de la entrada.

#### Acumulador

**Descripción:**
Realiza el proceso relativo a la operación de popcount(x) y luego aplica la operación sing(x) o escalón para dar una salida representada en un solo bit.

| entradas         | salidas         |
| ---------------- |----------------:|
| "entrada" N-bits | "salida" 1-bit  |


#### Unidad Básica

**Descripción:**
Es la unidad básica de operación, realiza el xnor de una ristra de bits por otra de igual tamaño. Luego se lo pasa al "acumulador". Su salida es a su vez la salida de su acumulador correspondiente.

| entradas          | salidas          | utiliza           |
| ----------------- |:----------------:| ----------------: |
| "in_unidad"N-bits | "salida" 1-bit   |   "Acumulador"    |
| "vector"N-bits    |                  |                   |

in_unidad **xnor** vector -> acumulador -> salida

#### Unidad General

**Descripción:**
Es la unidad superior del sistema gestiona la entrada de N*M bits y la pasa a las diferentes unidades básicas para que operen. Luego recupera las M salidas y las agrupa en un vector de salida de M-bits.

| entradas               | salidas         | utiliza         |
| ---------------------- |:---------------:| --------------: |
| "reg2"N*M-bits(matriz) | "reg1" M-bits"  | "unidad_basica" |
| "reg0"N-bits(vector)   |                 |                 |

- reg2
-   ||==== -> M unidad_basica -> agrupar M salidas -> reg1
- reg0

#### Interfaz Superior #1

**Descripción:**
Partiendo de una entrada de hasta 4096 bits, provenientes del equivalente a una matriz de 64*64 bits, toma los N*M bits que pasará a la unidad general. Por otro lado a partir de 64 bits equivalentes al vector de entrada toma N bits para el vector de la unidad_general. También cuenta con un contador
de 32bits para devolver el número de ciclos de operación.

| entradas                  | salidas          | utiliza          |
| ------------------------- |:----------------:| ---------------: |
| "matriz"4096-bits(64*64)  | "salida"64-bits" | "unidad_general" |
| "vector"64-bits(vector)   | "contador"32bits |                  |

- Total de registros: 133
- matriz: registros 0 a 127
- vector: registros 128 y 129
- salida: registro 130 y 131
- contador: registro 132

**Resultados:**
....
