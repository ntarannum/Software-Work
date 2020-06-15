transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/a/Documents/EG3205_Work/VHDL/Week_2/halfadder.vhd}

vcom -93 -work work {C:/Users/a/Documents/EG3205_Work/VHDL/Week_2/../HalfAdder_TB.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiii -L rtl_work -L work -voptargs="+acc"  HalfAdder_TB

add wave *
view structure
view signals
run -all
