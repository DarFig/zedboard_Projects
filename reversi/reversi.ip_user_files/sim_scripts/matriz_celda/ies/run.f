-makelib ies_lib/xil_defaultlib -sv \
  "E:/programs/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "E:/programs/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "E:/programs/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "E:/programs/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/axi_infrastructure_v1_1_0 \
  "../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/smartconnect_v1_0 -sv \
  "../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/02c8/hdl/sc_util_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/axi_protocol_checker_v2_0_1 -sv \
  "../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/3b24/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/axi_vip_v1_1_1 -sv \
  "../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/a16a/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib ies_lib/processing_system7_vip_v1_0_3 -sv \
  "../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/1313/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/matriz_celda/ip/matriz_celda_processing_system7_0_0/sim/matriz_celda_processing_system7_0_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/matriz_celda/ipshared/4bb2/src/basic_cell1.vhd" \
  "../../../bd/matriz_celda/ipshared/4bb2/src/macro_celda1.vhd" \
  "../../../bd/matriz_celda/ipshared/4bb2/hdl/matriz_celda_v1_0_S00_AXI.vhd" \
  "../../../bd/matriz_celda/ipshared/4bb2/src/matriz_celdas.vhd" \
  "../../../bd/matriz_celda/ipshared/4bb2/hdl/matriz_celda_v1_0.vhd" \
  "../../../bd/matriz_celda/ip/matriz_celda_matriz_celda_0_0/sim/matriz_celda_matriz_celda_0_0.vhd" \
-endlib
-makelib ies_lib/lib_cdc_v1_0_2 \
  "../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/proc_sys_reset_v5_0_12 \
  "../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/matriz_celda/ip/matriz_celda_rst_ps7_0_100M_0/sim/matriz_celda_rst_ps7_0_100M_0.vhd" \
  "../../../bd/matriz_celda/sim/matriz_celda.vhd" \
-endlib
-makelib ies_lib/generic_baseblocks_v2_1_0 \
  "../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_1 \
  "../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/5c35/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_1 \
  "../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/5c35/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_1 \
  "../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/5c35/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib ies_lib/axi_data_fifo_v2_1_14 \
  "../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/9909/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_register_slice_v2_1_15 \
  "../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/3ed1/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_protocol_converter_v2_1_15 \
  "../../../../reversi.srcs/sources_1/bd/matriz_celda/ipshared/ff69/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/matriz_celda/ip/matriz_celda_auto_pc_0/sim/matriz_celda_auto_pc_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

