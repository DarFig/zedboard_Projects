vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/smartconnect_v1_0
vlib activehdl/axi_protocol_checker_v2_0_1
vlib activehdl/axi_vip_v1_1_1
vlib activehdl/processing_system7_vip_v1_0_3
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/proc_sys_reset_v5_0_12
vlib activehdl/generic_baseblocks_v2_1_0
vlib activehdl/fifo_generator_v13_2_1
vlib activehdl/axi_data_fifo_v2_1_14
vlib activehdl/axi_register_slice_v2_1_15
vlib activehdl/axi_protocol_converter_v2_1_15

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap smartconnect_v1_0 activehdl/smartconnect_v1_0
vmap axi_protocol_checker_v2_0_1 activehdl/axi_protocol_checker_v2_0_1
vmap axi_vip_v1_1_1 activehdl/axi_vip_v1_1_1
vmap processing_system7_vip_v1_0_3 activehdl/processing_system7_vip_v1_0_3
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_12 activehdl/proc_sys_reset_v5_0_12
vmap generic_baseblocks_v2_1_0 activehdl/generic_baseblocks_v2_1_0
vmap fifo_generator_v13_2_1 activehdl/fifo_generator_v13_2_1
vmap axi_data_fifo_v2_1_14 activehdl/axi_data_fifo_v2_1_14
vmap axi_register_slice_v2_1_15 activehdl/axi_register_slice_v2_1_15
vmap axi_protocol_converter_v2_1_15 activehdl/axi_protocol_converter_v2_1_15

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/verilog" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl" "+incdir+E:/programs/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/verilog" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl" "+incdir+E:/programs/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"E:/programs/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"E:/programs/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"E:/programs/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"E:/programs/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/verilog" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl" "+incdir+E:/programs/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/verilog" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl" "+incdir+E:/programs/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/verilog" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl" "+incdir+E:/programs/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/verilog" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl" "+incdir+E:/programs/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/sc_util_v1_0_vl_rfs.sv" \

vlog -work axi_protocol_checker_v2_0_1  -sv2k12 "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/verilog" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl" "+incdir+E:/programs/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/verilog" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl" "+incdir+E:/programs/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/3b24/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \

vlog -work axi_vip_v1_1_1  -sv2k12 "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/verilog" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl" "+incdir+E:/programs/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/verilog" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl" "+incdir+E:/programs/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/a16a/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_3  -sv2k12 "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/verilog" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl" "+incdir+E:/programs/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/verilog" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl" "+incdir+E:/programs/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/verilog" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl" "+incdir+E:/programs/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/verilog" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl" "+incdir+E:/programs/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/matriz_celda/ip/matriz_celda_processing_system7_0_0/sim/matriz_celda_processing_system7_0_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/matriz_celda/ipshared/4bb2/src/basic_cell1.vhd" \
"../../../bd/matriz_celda/ipshared/4bb2/src/macro_celda1.vhd" \
"../../../bd/matriz_celda/ipshared/4bb2/hdl/matriz_celda_v1_0_S00_AXI.vhd" \
"../../../bd/matriz_celda/ipshared/4bb2/src/matriz_celdas.vhd" \
"../../../bd/matriz_celda/ipshared/4bb2/hdl/matriz_celda_v1_0.vhd" \
"../../../bd/matriz_celda/ip/matriz_celda_matriz_celda_0_0/sim/matriz_celda_matriz_celda_0_0.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_12 -93 \
"../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/matriz_celda/ip/matriz_celda_rst_ps7_0_100M_0/sim/matriz_celda_rst_ps7_0_100M_0.vhd" \
"../../../bd/matriz_celda/sim/matriz_celda.vhd" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/verilog" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl" "+incdir+E:/programs/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/verilog" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl" "+incdir+E:/programs/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_1  -v2k5 "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/verilog" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl" "+incdir+E:/programs/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/verilog" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl" "+incdir+E:/programs/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/5c35/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_1 -93 \
"../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/5c35/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_1  -v2k5 "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/verilog" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl" "+incdir+E:/programs/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/verilog" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl" "+incdir+E:/programs/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/5c35/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_14  -v2k5 "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/verilog" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl" "+incdir+E:/programs/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/verilog" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl" "+incdir+E:/programs/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/9909/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_15  -v2k5 "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/verilog" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl" "+incdir+E:/programs/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/verilog" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl" "+incdir+E:/programs/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/3ed1/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_15  -v2k5 "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/verilog" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl" "+incdir+E:/programs/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/verilog" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl" "+incdir+E:/programs/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ff69/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/verilog" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl" "+incdir+E:/programs/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/verilog" "+incdir+../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl" "+incdir+E:/programs/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/matriz_celda/ip/matriz_celda_auto_pc_0/sim/matriz_celda_auto_pc_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

