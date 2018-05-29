## ToDo List


- [x] Plantear el diseño del sistema

### Acumulador

- [x] Sumadores Básicos 
- [x] bitcount

### Unidad Básica

- [x] esquema genérico 
- [x] control según tamaños

### Unidad General

- [x] Esquema global 
- [x] Sistema de registros/memoria de entradas y salidas
- [x] pasar a modelo genérico 
- [x] depurar (señales)

### Sistema

- [x] Block Design
- [x] new ip package
- [x] estructurar el c
- [x] primera prueba

****

## Fase2

- [x] reducir espacio reservado actual a 64x10(espacio util de la primera prueba)
- [x] primera prueba del espacio reducido
- [x] replantear partiendo de diseño bottom-up
- [x] simplificar diseño antiguo, reprobar --> ok 640 bits 64x10

### Diseño bottom-up

- [x] counter 8
- [x] u_basica 8, 16
- [x] u_general 8x8, 16x16
- [x] u_externa 8x8, 16x16
- [x] axi 8x8
- [x] prueba externa 8x8 --> ok :)

### Transferencia por Ráfaga

- [x] adaptar interfaz
- [x] probar interfaz
- [x] integrar con acelerador 
- [x] probar integrado

## General

- [ ] Doc

### Transferencia

- [x] Transferencia por registros
- [x] Transferencia por DMA(ráfaga)
- [ ] Comparar tiempos


### Pruebas

- [x] Montar todo junto
- [ ] banco de pruebas
- [ ] Para 8x8
- [ ] Para 16x16
- [ ] Para 32x32
- [ ] Para 64x64