onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib matriz_celda_opt

do {wave.do}

view wave
view structure
view signals

do {matriz_celda.udo}

run -all

quit -force
