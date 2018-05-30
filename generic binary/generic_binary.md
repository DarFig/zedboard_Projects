# Generic-Binary Network


### Primera Modelo con Generic 640bits

**Objetivo:**
A partir de una entrada de n x m bits y un vector de n bits obtener la salida de m bits correspondiente a la binarización de la entrada.

#### Acumulador

**Descripción:**
Realiza el proceso relativo a la operación de popcount(x), partiendo la entrada en grupos de 8 que pasa a los **counter8**. Luego aplica la operación sing(x) o escalón para dar una salida representada en un solo bit.

| entradas         | salidas         |  utiliza         |
| ---------------- |:---------------:| ---------------: |
| "entrada" N-bits | "salida" 1-bit  |  "counter8"      |


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

#### Interfaz Superior AXI LITE

**Descripción:**
Partiendo de una entrada de hasta 640 bits, provenientes del equivalente a una matriz de 64*10 bits, toma los N*M bits que pasará a la unidad general. Por otro lado a partir de 64 bits equivalentes al vector de entrada toma N bits para el vector de la unidad_general. También cuenta con un contador
de 32bits para devolver el número de ciclos de operación.

| entradas                  | salidas          | utiliza          |
| ------------------------- |:----------------:| ---------------: |
| "matriz"640-bits(64*10)   | "salida"64-bits" | "unidad_general" |
| "vector"64-bits(vector)   | "contador"32bits |                  |

- Total de registros: 25
- matriz: registros 0 a 19
- vector: registros 20 y 21
- salida: registros 22 y 23
- contador: registro 24

**Resultados:**
...

#### Interfaz Superior DMA

**Descripción:**
Recibe 640bits de entrada y 64 bits de vector por transferencia en ráfaga mediante DMA. Almacena los datos recibidos en 22 registros de 32 bits( **gestorRegistros** ) que servirán a la unidad general los N*M bits de matriz y los N de vector. Devuelve 4 registros de 32bits tanto por DMA como por AXI lite para poder comparar ambos casos.

| entradas         | salidas  AXI     |salidas  DMA     | utiliza           |
| ---------------- |:----------------:|:---------------:|------------------:|
| "matriz"640-bits | "salida"64-bits" | "primer dato"   | "unidad_general"  |
| "vector"64-bits  | "# ciclos"32bits | "vector"64bits  | "gestorRegistros" |
|                  | "contador"32bits | "salida0"32bits |                   |


**Resultados:**
...

### Segundo Modelo con Generic 8x8 16x16(bottom-up)

**Objetivo:**
A partir del contador de bits dentro de ristras de 8bits construir un sistema que admita una entrada de n x m bits y un vector de n bits obtener la salida de m bits correspondiente a la binarización de la entrada.

#### u_basica

**Descripción:**
Es la unidad básica de operación, realiza el xnor de una ristra de bits por otra de igual tamaño. Se vale de uno o varios counter8 para obtener el número de bits a 1, luego aplica la operación escalón para dar una salida representada en un solo bit.

| entradas          | salidas          | utiliza       |
| ----------------- |:----------------:|--------------:|
| "in_unidad"N-bits | "salida" 1-bit   |   "counter8"  |
| "vector"N-bits    |                  |               |

#### u_general

**Descripción:**
Gestiona la entrada de N*M bits y la pasa a las diferentes unidades básicas para que operen. Luego recupera las M salidas y las agrupa en un vector de salida de M-bits.

| entradas             | salidas          | utiliza     |
| -------------------- |:----------------:|------------:|
| "in_general"N*M-bits | "salida" Mbits"  | "u_basica"  |
| "vector"N-bits       |                  |             |

#### u_externa

**Descripción:**
Se encarga de recibir la ristra de bits de las entradas y organizarlas en una matriz de N*M bits  y un vector de N bits que le pasa a la unidad_general. Luego recupera la salida de Mbits y la acomoda en señales de 32bits que requiere la interfaz de salida.

| entradas              | salidas             | utiliza          |
| --------------------- |:-------------------:|-----------------:|
| "reg0"32bits entrada1 | "reg3"32bits salida | "u_general"      |
| "reg1"32bits entrada2 |                     |                  |
| "reg2"32bits vector   |                     |                  |


####  Interfaz Superior AXI LITE

**Descripción:**
En este modelo solamente se encarga de la transmisión de los datos, para 8x8 son 4registros de 32bits, 2 para matriz, 1 para vector, y otro de salida. Se añade un quinto registro como contador para los ciclos.


| entradas              | salidas               | utiliza          |
| --------------------- |:---------------------:|-----------------:|
| "reg0"32bits entrada1 | "reg3"32bits salida   | "u_externa"      |
| "reg1"32bits entrada2 | "reg4"32bits contador |                  |
| "reg2"32bits vector   |                       |                  |


####  Interfaz Superior DMA

**Descripción:**
Almacena los datos recibidos registros de 32 bits que servirán a la u_externa los N*M bits de matriz y los N de vector. Devuelve 4 registros de 32bits tanto por DMA como por AXI lite para poder comparar ambos casos.

| entradas         | salidas  AXI     |salidas  DMA    | utiliza      |
| ---------------- |:----------------:|:--------------:|-------------:|
| "matriz"64-bits  | "salida"64-bits" | "primer dato"  | "u_externa"  |
| "vector"32-bits  | "# ciclos"32bits | "segundo dato" |              |
| 32bits extra     | "contador"32bits | "tercer dato"  |              |
|                  |                  | "cuarto dato"  |              |

### Utils

#### Counter8

**Descripción:**
Dada una señal de 8bits, cuenta el número de bits a 1.

| entradas         | salidas          |
| ---------------- |-----------------:|
| "entrada" 8-bits | "salida" 4-bits  |

#### GestorRegistros:

**Descripción:**
Es una interfaz con el objetivo de encapsular la gestión de los datos que llegan por DMA y su posterior organización para pasarlos al acelerador. Recibe un dato de 32bits cada ciclo y cuenta con 3 salidas de 32bits, dos fijas provenientes de la unidad_general y una variable que se utiliza, principalmente, para sacar datos de los registros. En este caso cuenta internamente con 22 registros de 32 bits, pero al estar direccionado con 5bits admite hasta 32 registros.

- Total de registros: 22(32)
- matriz: registros 0 a 19
- vector: registros 20 y 21
