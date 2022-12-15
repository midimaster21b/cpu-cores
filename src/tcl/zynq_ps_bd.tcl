create_bd_design "zynq_ps"
update_compile_order -fileset sources_1
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" }  [get_bd_cells processing_system7_0]
make_bd_pins_external  [get_bd_cells processing_system7_0]
make_bd_intf_pins_external  [get_bd_cells processing_system7_0]
make_wrapper -files [get_files ../default-vivado/midimaster21b_cpus_zynq7_0.1.0.srcs/sources_1/bd/zynq_ps/zynq_ps.bd] -top
add_files -norecurse ../default-vivado/midimaster21b_cpus_zynq7_0.1.0.gen/sources_1/bd/zynq_ps/hdl/zynq_ps_wrapper.v
