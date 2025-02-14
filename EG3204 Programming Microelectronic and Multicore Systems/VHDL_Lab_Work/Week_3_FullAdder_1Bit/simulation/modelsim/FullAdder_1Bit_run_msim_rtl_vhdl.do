transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/a/Documents/EG3205_Work/VHDL/Week_2/halfadder.vhd}
vcom -93 -work work {C:/Users/a/Documents/EG3205_Work/VHDL/Week_3_FullAdder_1Bit/FullAdder_1Bit.vhd}

vcom -93 -work work {C:/Users/a/Documents/EG3205_Work/VHDL/Week_3_FullAdder_1Bit/../FullAdder_1bit_TB.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiii -L rtl_work -L work -voptargs="+acc"  FullAdder_1bit_TB

add wave *
view structure
view signals
run -all
