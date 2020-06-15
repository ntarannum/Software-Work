transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/a/Documents/EG3205_Work/VHDL/Assignment 3 Files/Assignment_3_Board/Counter.vhd}
vcom -93 -work work {C:/Users/a/Documents/EG3205_Work/VHDL/Assignment 3 Files/Assignment_3_Board/Clock_Divider.vhd}

vcom -93 -work work {C:/Users/a/Documents/EG3205_Work/VHDL/Assignment 3 Files/Assignment_3_Board/Counter_TB.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiii -L rtl_work -L work -voptargs="+acc"  Counter_TB

add wave *
view structure
view signals
run -all
