transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/a/Documents/EG3205_Work/VHDL/Week_4_D_flip_flop/D_flip_flop.vhd}
vcom -93 -work work {C:/Users/a/Documents/EG3205_Work/VHDL/Week_4_D_flip_flop_4_bit/D_flip_flop_4_bit.vhd}

vcom -93 -work work {C:/Users/a/Documents/EG3205_Work/VHDL/Week_4_D_flip_flop_4_bit/../D_flip_flop_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiii -L rtl_work -L work -voptargs="+acc"  D_flip_flop_tb

add wave *
view structure
view signals
run -all
