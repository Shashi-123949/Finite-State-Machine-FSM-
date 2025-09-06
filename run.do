vlib work
vlog Mealy_overlap_tb.v
vsim tb
add wave -r sim:/tb/dut/*
run -all
