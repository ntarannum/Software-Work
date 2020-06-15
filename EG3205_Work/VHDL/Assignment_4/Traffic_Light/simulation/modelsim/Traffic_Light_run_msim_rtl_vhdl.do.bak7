transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/a/Documents/EG3205_Work/VHDL/Assignment_4/Traffic_Light/Clock_Divider_neg_reset.vhd}
vcom -93 -work work {C:/Users/a/Documents/EG3205_Work/VHDL/Assignment_4/Traffic_Light/Traffic_Light.vhd}

vcom -93 -work work {C:/Users/a/Documents/EG3205_Work/VHDL/Assignment_4/Traffic_Light/Traffic_Light_TB.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiii -L rtl_work -L work -voptargs="+acc"  Traffic_Light_TB

add wave *
view structure
view signals
run -all
