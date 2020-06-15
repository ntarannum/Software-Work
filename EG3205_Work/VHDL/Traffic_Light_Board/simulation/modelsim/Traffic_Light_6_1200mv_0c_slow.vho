-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "03/20/2019 23:18:47"

-- 
-- Device: Altera EP3C16F484C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Traffic_Light IS
    PORT (
	clock : IN std_logic;
	reset : IN std_logic;
	enable : IN std_logic;
	road_1_sensor : IN std_logic;
	road_2_sensor : IN std_logic;
	clk_div_sig : BUFFER std_logic;
	out_count : BUFFER std_logic_vector(4 DOWNTO 0);
	r1_RAG : BUFFER std_logic_vector(2 DOWNTO 0);
	r2_RAG : BUFFER std_logic_vector(2 DOWNTO 0)
	);
END Traffic_Light;

-- Design Ports Information
-- road_2_sensor	=>  Location: PIN_E7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk_div_sig	=>  Location: PIN_T11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_count[0]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_count[1]	=>  Location: PIN_G12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_count[2]	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_count[3]	=>  Location: PIN_H13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_count[4]	=>  Location: PIN_A16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1_RAG[0]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1_RAG[1]	=>  Location: PIN_B16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1_RAG[2]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2_RAG[0]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2_RAG[1]	=>  Location: PIN_B15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2_RAG[2]	=>  Location: PIN_B14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_G22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- road_1_sensor	=>  Location: PIN_E14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- enable	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Traffic_Light IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_enable : std_logic;
SIGNAL ww_road_1_sensor : std_logic;
SIGNAL ww_road_2_sensor : std_logic;
SIGNAL ww_clk_div_sig : std_logic;
SIGNAL ww_out_count : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_r1_RAG : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_r2_RAG : std_logic_vector(2 DOWNTO 0);
SIGNAL \cd|Clk_Div~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \road_2_sensor~input_o\ : std_logic;
SIGNAL \clk_div_sig~output_o\ : std_logic;
SIGNAL \out_count[0]~output_o\ : std_logic;
SIGNAL \out_count[1]~output_o\ : std_logic;
SIGNAL \out_count[2]~output_o\ : std_logic;
SIGNAL \out_count[3]~output_o\ : std_logic;
SIGNAL \out_count[4]~output_o\ : std_logic;
SIGNAL \r1_RAG[0]~output_o\ : std_logic;
SIGNAL \r1_RAG[1]~output_o\ : std_logic;
SIGNAL \r1_RAG[2]~output_o\ : std_logic;
SIGNAL \r2_RAG[0]~output_o\ : std_logic;
SIGNAL \r2_RAG[1]~output_o\ : std_logic;
SIGNAL \r2_RAG[2]~output_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \cd|cnt[0]~32_combout\ : std_logic;
SIGNAL \cd|cnt[29]~36_combout\ : std_logic;
SIGNAL \cd|cnt[0]~33\ : std_logic;
SIGNAL \cd|cnt[1]~34_combout\ : std_logic;
SIGNAL \cd|cnt[1]~35\ : std_logic;
SIGNAL \cd|cnt[2]~37_combout\ : std_logic;
SIGNAL \cd|cnt[2]~38\ : std_logic;
SIGNAL \cd|cnt[3]~39_combout\ : std_logic;
SIGNAL \cd|cnt[3]~40\ : std_logic;
SIGNAL \cd|cnt[4]~41_combout\ : std_logic;
SIGNAL \cd|cnt[4]~42\ : std_logic;
SIGNAL \cd|cnt[5]~43_combout\ : std_logic;
SIGNAL \cd|cnt[5]~44\ : std_logic;
SIGNAL \cd|cnt[6]~45_combout\ : std_logic;
SIGNAL \cd|cnt[6]~46\ : std_logic;
SIGNAL \cd|cnt[7]~47_combout\ : std_logic;
SIGNAL \cd|cnt[7]~48\ : std_logic;
SIGNAL \cd|cnt[8]~49_combout\ : std_logic;
SIGNAL \cd|cnt[8]~50\ : std_logic;
SIGNAL \cd|cnt[9]~51_combout\ : std_logic;
SIGNAL \cd|cnt[9]~52\ : std_logic;
SIGNAL \cd|cnt[10]~53_combout\ : std_logic;
SIGNAL \cd|cnt[10]~54\ : std_logic;
SIGNAL \cd|cnt[11]~55_combout\ : std_logic;
SIGNAL \cd|cnt[11]~56\ : std_logic;
SIGNAL \cd|cnt[12]~57_combout\ : std_logic;
SIGNAL \cd|cnt[12]~58\ : std_logic;
SIGNAL \cd|cnt[13]~59_combout\ : std_logic;
SIGNAL \cd|cnt[13]~60\ : std_logic;
SIGNAL \cd|cnt[14]~61_combout\ : std_logic;
SIGNAL \cd|cnt[14]~62\ : std_logic;
SIGNAL \cd|cnt[15]~63_combout\ : std_logic;
SIGNAL \cd|cnt[15]~64\ : std_logic;
SIGNAL \cd|cnt[16]~65_combout\ : std_logic;
SIGNAL \cd|cnt[16]~66\ : std_logic;
SIGNAL \cd|cnt[17]~67_combout\ : std_logic;
SIGNAL \cd|cnt[17]~68\ : std_logic;
SIGNAL \cd|cnt[18]~69_combout\ : std_logic;
SIGNAL \cd|cnt[18]~70\ : std_logic;
SIGNAL \cd|cnt[19]~71_combout\ : std_logic;
SIGNAL \cd|cnt[19]~72\ : std_logic;
SIGNAL \cd|cnt[20]~73_combout\ : std_logic;
SIGNAL \cd|cnt[20]~74\ : std_logic;
SIGNAL \cd|cnt[21]~75_combout\ : std_logic;
SIGNAL \cd|cnt[21]~76\ : std_logic;
SIGNAL \cd|cnt[22]~77_combout\ : std_logic;
SIGNAL \cd|cnt[22]~78\ : std_logic;
SIGNAL \cd|cnt[23]~79_combout\ : std_logic;
SIGNAL \cd|cnt[23]~80\ : std_logic;
SIGNAL \cd|cnt[24]~81_combout\ : std_logic;
SIGNAL \cd|cnt[24]~82\ : std_logic;
SIGNAL \cd|cnt[25]~83_combout\ : std_logic;
SIGNAL \cd|cnt[25]~84\ : std_logic;
SIGNAL \cd|cnt[26]~85_combout\ : std_logic;
SIGNAL \cd|cnt[26]~86\ : std_logic;
SIGNAL \cd|cnt[27]~87_combout\ : std_logic;
SIGNAL \cd|cnt[27]~88\ : std_logic;
SIGNAL \cd|cnt[28]~89_combout\ : std_logic;
SIGNAL \cd|cnt[28]~90\ : std_logic;
SIGNAL \cd|cnt[29]~91_combout\ : std_logic;
SIGNAL \cd|cnt[29]~92\ : std_logic;
SIGNAL \cd|cnt[30]~93_combout\ : std_logic;
SIGNAL \cd|cnt[30]~94\ : std_logic;
SIGNAL \cd|cnt[31]~95_combout\ : std_logic;
SIGNAL \cd|Equal0~9_combout\ : std_logic;
SIGNAL \cd|Equal0~8_combout\ : std_logic;
SIGNAL \cd|Equal0~1_combout\ : std_logic;
SIGNAL \cd|Equal0~0_combout\ : std_logic;
SIGNAL \cd|Equal0~2_combout\ : std_logic;
SIGNAL \cd|Equal0~3_combout\ : std_logic;
SIGNAL \cd|Equal0~4_combout\ : std_logic;
SIGNAL \cd|Equal0~6_combout\ : std_logic;
SIGNAL \cd|Equal0~5_combout\ : std_logic;
SIGNAL \cd|Equal0~7_combout\ : std_logic;
SIGNAL \cd|Equal0~10_combout\ : std_logic;
SIGNAL \cd|Clk_Div~0_combout\ : std_logic;
SIGNAL \cd|Clk_Div~q\ : std_logic;
SIGNAL \cd|Clk_Div~clkctrl_outclk\ : std_logic;
SIGNAL \count[0]~5_combout\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \count[0]~6\ : std_logic;
SIGNAL \count[1]~7_combout\ : std_logic;
SIGNAL \road_1_sensor~input_o\ : std_logic;
SIGNAL \enable~input_o\ : std_logic;
SIGNAL \r1_RAG~1_combout\ : std_logic;
SIGNAL \count[3]~12\ : std_logic;
SIGNAL \count[4]~13_combout\ : std_logic;
SIGNAL \current_state~21_combout\ : std_logic;
SIGNAL \current_state~22_combout\ : std_logic;
SIGNAL \current_state~23_combout\ : std_logic;
SIGNAL \current_state~24_combout\ : std_logic;
SIGNAL \current_state~25_combout\ : std_logic;
SIGNAL \current_state~19_combout\ : std_logic;
SIGNAL \current_state.s0~0_combout\ : std_logic;
SIGNAL \current_state.s0~q\ : std_logic;
SIGNAL \current_state~16_combout\ : std_logic;
SIGNAL \current_state~17_combout\ : std_logic;
SIGNAL \current_state~18_combout\ : std_logic;
SIGNAL \current_state~20_combout\ : std_logic;
SIGNAL \current_state~26_combout\ : std_logic;
SIGNAL \current_state.s5~q\ : std_logic;
SIGNAL \current_state.s1~1_combout\ : std_logic;
SIGNAL \current_state.s1~2_combout\ : std_logic;
SIGNAL \current_state.s1~q\ : std_logic;
SIGNAL \current_state.s2~q\ : std_logic;
SIGNAL \current_state.s3~q\ : std_logic;
SIGNAL \current_state.s4~q\ : std_logic;
SIGNAL \en~0_combout\ : std_logic;
SIGNAL \en~1_combout\ : std_logic;
SIGNAL \en~q\ : std_logic;
SIGNAL \count[1]~8\ : std_logic;
SIGNAL \count[2]~9_combout\ : std_logic;
SIGNAL \count[2]~10\ : std_logic;
SIGNAL \count[3]~11_combout\ : std_logic;
SIGNAL \LessThan6~0_combout\ : std_logic;
SIGNAL \LessThan6~1_combout\ : std_logic;
SIGNAL \r1_RAG~0_combout\ : std_logic;
SIGNAL \current_state.s1~0_combout\ : std_logic;
SIGNAL \r2_RAG~0_combout\ : std_logic;
SIGNAL \cd|cnt\ : std_logic_vector(31 DOWNTO 0);
SIGNAL count : std_logic_vector(4 DOWNTO 0);
SIGNAL \ALT_INV_current_state~26_combout\ : std_logic;
SIGNAL \ALT_INV_en~q\ : std_logic;
SIGNAL \ALT_INV_LessThan6~1_combout\ : std_logic;
SIGNAL \ALT_INV_current_state.s1~0_combout\ : std_logic;

BEGIN

ww_clock <= clock;
ww_reset <= reset;
ww_enable <= enable;
ww_road_1_sensor <= road_1_sensor;
ww_road_2_sensor <= road_2_sensor;
clk_div_sig <= ww_clk_div_sig;
out_count <= ww_out_count;
r1_RAG <= ww_r1_RAG;
r2_RAG <= ww_r2_RAG;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\cd|Clk_Div~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \cd|Clk_Div~q\);

\clock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clock~input_o\);

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);
\ALT_INV_current_state~26_combout\ <= NOT \current_state~26_combout\;
\ALT_INV_en~q\ <= NOT \en~q\;
\ALT_INV_LessThan6~1_combout\ <= NOT \LessThan6~1_combout\;
\ALT_INV_current_state.s1~0_combout\ <= NOT \current_state.s1~0_combout\;

-- Location: IOOBUF_X16_Y0_N16
\clk_div_sig~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \cd|Clk_Div~q\,
	devoe => ww_devoe,
	o => \clk_div_sig~output_o\);

-- Location: IOOBUF_X30_Y29_N2
\out_count[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => count(0),
	devoe => ww_devoe,
	o => \out_count[0]~output_o\);

-- Location: IOOBUF_X26_Y29_N9
\out_count[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => count(1),
	devoe => ww_devoe,
	o => \out_count[1]~output_o\);

-- Location: IOOBUF_X28_Y29_N23
\out_count[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => count(2),
	devoe => ww_devoe,
	o => \out_count[2]~output_o\);

-- Location: IOOBUF_X28_Y29_N30
\out_count[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => count(3),
	devoe => ww_devoe,
	o => \out_count[3]~output_o\);

-- Location: IOOBUF_X30_Y29_N30
\out_count[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => count(4),
	devoe => ww_devoe,
	o => \out_count[4]~output_o\);

-- Location: IOOBUF_X26_Y29_N16
\r1_RAG[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \current_state.s1~q\,
	devoe => ww_devoe,
	o => \r1_RAG[0]~output_o\);

-- Location: IOOBUF_X28_Y29_N2
\r1_RAG[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \r1_RAG~0_combout\,
	devoe => ww_devoe,
	o => \r1_RAG[1]~output_o\);

-- Location: IOOBUF_X26_Y29_N23
\r1_RAG[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \r1_RAG~1_combout\,
	devoe => ww_devoe,
	o => \r1_RAG[2]~output_o\);

-- Location: IOOBUF_X26_Y29_N2
\r2_RAG[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \current_state.s4~q\,
	devoe => ww_devoe,
	o => \r2_RAG[0]~output_o\);

-- Location: IOOBUF_X26_Y29_N30
\r2_RAG[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_current_state.s1~0_combout\,
	devoe => ww_devoe,
	o => \r2_RAG[1]~output_o\);

-- Location: IOOBUF_X23_Y29_N30
\r2_RAG[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \r2_RAG~0_combout\,
	devoe => ww_devoe,
	o => \r2_RAG[2]~output_o\);

-- Location: IOIBUF_X41_Y15_N1
\clock~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G9
\clock~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clock~inputclkctrl_outclk\);

-- Location: IOIBUF_X41_Y15_N8
\reset~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: LCCOMB_X16_Y2_N0
\cd|cnt[0]~32\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[0]~32_combout\ = \cd|cnt\(0) $ (VCC)
-- \cd|cnt[0]~33\ = CARRY(\cd|cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \cd|cnt\(0),
	datad => VCC,
	combout => \cd|cnt[0]~32_combout\,
	cout => \cd|cnt[0]~33\);

-- Location: LCCOMB_X17_Y2_N30
\cd|cnt[29]~36\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[29]~36_combout\ = (!\cd|Equal0~10_combout\) # (!\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datad => \cd|Equal0~10_combout\,
	combout => \cd|cnt[29]~36_combout\);

-- Location: FF_X16_Y2_N1
\cd|cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[0]~32_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(0));

-- Location: LCCOMB_X16_Y2_N2
\cd|cnt[1]~34\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[1]~34_combout\ = (\cd|cnt\(1) & (!\cd|cnt[0]~33\)) # (!\cd|cnt\(1) & ((\cd|cnt[0]~33\) # (GND)))
-- \cd|cnt[1]~35\ = CARRY((!\cd|cnt[0]~33\) # (!\cd|cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \cd|cnt\(1),
	datad => VCC,
	cin => \cd|cnt[0]~33\,
	combout => \cd|cnt[1]~34_combout\,
	cout => \cd|cnt[1]~35\);

-- Location: FF_X16_Y2_N3
\cd|cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[1]~34_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(1));

-- Location: LCCOMB_X16_Y2_N4
\cd|cnt[2]~37\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[2]~37_combout\ = (\cd|cnt\(2) & (\cd|cnt[1]~35\ $ (GND))) # (!\cd|cnt\(2) & (!\cd|cnt[1]~35\ & VCC))
-- \cd|cnt[2]~38\ = CARRY((\cd|cnt\(2) & !\cd|cnt[1]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \cd|cnt\(2),
	datad => VCC,
	cin => \cd|cnt[1]~35\,
	combout => \cd|cnt[2]~37_combout\,
	cout => \cd|cnt[2]~38\);

-- Location: FF_X16_Y2_N5
\cd|cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[2]~37_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(2));

-- Location: LCCOMB_X16_Y2_N6
\cd|cnt[3]~39\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[3]~39_combout\ = (\cd|cnt\(3) & (!\cd|cnt[2]~38\)) # (!\cd|cnt\(3) & ((\cd|cnt[2]~38\) # (GND)))
-- \cd|cnt[3]~40\ = CARRY((!\cd|cnt[2]~38\) # (!\cd|cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \cd|cnt\(3),
	datad => VCC,
	cin => \cd|cnt[2]~38\,
	combout => \cd|cnt[3]~39_combout\,
	cout => \cd|cnt[3]~40\);

-- Location: FF_X16_Y2_N7
\cd|cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[3]~39_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(3));

-- Location: LCCOMB_X16_Y2_N8
\cd|cnt[4]~41\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[4]~41_combout\ = (\cd|cnt\(4) & (\cd|cnt[3]~40\ $ (GND))) # (!\cd|cnt\(4) & (!\cd|cnt[3]~40\ & VCC))
-- \cd|cnt[4]~42\ = CARRY((\cd|cnt\(4) & !\cd|cnt[3]~40\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \cd|cnt\(4),
	datad => VCC,
	cin => \cd|cnt[3]~40\,
	combout => \cd|cnt[4]~41_combout\,
	cout => \cd|cnt[4]~42\);

-- Location: FF_X16_Y2_N9
\cd|cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[4]~41_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(4));

-- Location: LCCOMB_X16_Y2_N10
\cd|cnt[5]~43\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[5]~43_combout\ = (\cd|cnt\(5) & (!\cd|cnt[4]~42\)) # (!\cd|cnt\(5) & ((\cd|cnt[4]~42\) # (GND)))
-- \cd|cnt[5]~44\ = CARRY((!\cd|cnt[4]~42\) # (!\cd|cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \cd|cnt\(5),
	datad => VCC,
	cin => \cd|cnt[4]~42\,
	combout => \cd|cnt[5]~43_combout\,
	cout => \cd|cnt[5]~44\);

-- Location: FF_X16_Y2_N11
\cd|cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[5]~43_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(5));

-- Location: LCCOMB_X16_Y2_N12
\cd|cnt[6]~45\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[6]~45_combout\ = (\cd|cnt\(6) & (\cd|cnt[5]~44\ $ (GND))) # (!\cd|cnt\(6) & (!\cd|cnt[5]~44\ & VCC))
-- \cd|cnt[6]~46\ = CARRY((\cd|cnt\(6) & !\cd|cnt[5]~44\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \cd|cnt\(6),
	datad => VCC,
	cin => \cd|cnt[5]~44\,
	combout => \cd|cnt[6]~45_combout\,
	cout => \cd|cnt[6]~46\);

-- Location: FF_X16_Y2_N13
\cd|cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[6]~45_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(6));

-- Location: LCCOMB_X16_Y2_N14
\cd|cnt[7]~47\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[7]~47_combout\ = (\cd|cnt\(7) & (!\cd|cnt[6]~46\)) # (!\cd|cnt\(7) & ((\cd|cnt[6]~46\) # (GND)))
-- \cd|cnt[7]~48\ = CARRY((!\cd|cnt[6]~46\) # (!\cd|cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \cd|cnt\(7),
	datad => VCC,
	cin => \cd|cnt[6]~46\,
	combout => \cd|cnt[7]~47_combout\,
	cout => \cd|cnt[7]~48\);

-- Location: FF_X16_Y2_N15
\cd|cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[7]~47_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(7));

-- Location: LCCOMB_X16_Y2_N16
\cd|cnt[8]~49\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[8]~49_combout\ = (\cd|cnt\(8) & (\cd|cnt[7]~48\ $ (GND))) # (!\cd|cnt\(8) & (!\cd|cnt[7]~48\ & VCC))
-- \cd|cnt[8]~50\ = CARRY((\cd|cnt\(8) & !\cd|cnt[7]~48\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \cd|cnt\(8),
	datad => VCC,
	cin => \cd|cnt[7]~48\,
	combout => \cd|cnt[8]~49_combout\,
	cout => \cd|cnt[8]~50\);

-- Location: FF_X16_Y2_N17
\cd|cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[8]~49_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(8));

-- Location: LCCOMB_X16_Y2_N18
\cd|cnt[9]~51\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[9]~51_combout\ = (\cd|cnt\(9) & (!\cd|cnt[8]~50\)) # (!\cd|cnt\(9) & ((\cd|cnt[8]~50\) # (GND)))
-- \cd|cnt[9]~52\ = CARRY((!\cd|cnt[8]~50\) # (!\cd|cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \cd|cnt\(9),
	datad => VCC,
	cin => \cd|cnt[8]~50\,
	combout => \cd|cnt[9]~51_combout\,
	cout => \cd|cnt[9]~52\);

-- Location: FF_X16_Y2_N19
\cd|cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[9]~51_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(9));

-- Location: LCCOMB_X16_Y2_N20
\cd|cnt[10]~53\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[10]~53_combout\ = (\cd|cnt\(10) & (\cd|cnt[9]~52\ $ (GND))) # (!\cd|cnt\(10) & (!\cd|cnt[9]~52\ & VCC))
-- \cd|cnt[10]~54\ = CARRY((\cd|cnt\(10) & !\cd|cnt[9]~52\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \cd|cnt\(10),
	datad => VCC,
	cin => \cd|cnt[9]~52\,
	combout => \cd|cnt[10]~53_combout\,
	cout => \cd|cnt[10]~54\);

-- Location: FF_X16_Y2_N21
\cd|cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[10]~53_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(10));

-- Location: LCCOMB_X16_Y2_N22
\cd|cnt[11]~55\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[11]~55_combout\ = (\cd|cnt\(11) & (!\cd|cnt[10]~54\)) # (!\cd|cnt\(11) & ((\cd|cnt[10]~54\) # (GND)))
-- \cd|cnt[11]~56\ = CARRY((!\cd|cnt[10]~54\) # (!\cd|cnt\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \cd|cnt\(11),
	datad => VCC,
	cin => \cd|cnt[10]~54\,
	combout => \cd|cnt[11]~55_combout\,
	cout => \cd|cnt[11]~56\);

-- Location: FF_X16_Y2_N23
\cd|cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[11]~55_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(11));

-- Location: LCCOMB_X16_Y2_N24
\cd|cnt[12]~57\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[12]~57_combout\ = (\cd|cnt\(12) & (\cd|cnt[11]~56\ $ (GND))) # (!\cd|cnt\(12) & (!\cd|cnt[11]~56\ & VCC))
-- \cd|cnt[12]~58\ = CARRY((\cd|cnt\(12) & !\cd|cnt[11]~56\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \cd|cnt\(12),
	datad => VCC,
	cin => \cd|cnt[11]~56\,
	combout => \cd|cnt[12]~57_combout\,
	cout => \cd|cnt[12]~58\);

-- Location: FF_X16_Y2_N25
\cd|cnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[12]~57_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(12));

-- Location: LCCOMB_X16_Y2_N26
\cd|cnt[13]~59\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[13]~59_combout\ = (\cd|cnt\(13) & (!\cd|cnt[12]~58\)) # (!\cd|cnt\(13) & ((\cd|cnt[12]~58\) # (GND)))
-- \cd|cnt[13]~60\ = CARRY((!\cd|cnt[12]~58\) # (!\cd|cnt\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \cd|cnt\(13),
	datad => VCC,
	cin => \cd|cnt[12]~58\,
	combout => \cd|cnt[13]~59_combout\,
	cout => \cd|cnt[13]~60\);

-- Location: FF_X16_Y2_N27
\cd|cnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[13]~59_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(13));

-- Location: LCCOMB_X16_Y2_N28
\cd|cnt[14]~61\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[14]~61_combout\ = (\cd|cnt\(14) & (\cd|cnt[13]~60\ $ (GND))) # (!\cd|cnt\(14) & (!\cd|cnt[13]~60\ & VCC))
-- \cd|cnt[14]~62\ = CARRY((\cd|cnt\(14) & !\cd|cnt[13]~60\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \cd|cnt\(14),
	datad => VCC,
	cin => \cd|cnt[13]~60\,
	combout => \cd|cnt[14]~61_combout\,
	cout => \cd|cnt[14]~62\);

-- Location: FF_X17_Y2_N25
\cd|cnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \cd|cnt[14]~61_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(14));

-- Location: LCCOMB_X16_Y2_N30
\cd|cnt[15]~63\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[15]~63_combout\ = (\cd|cnt\(15) & (!\cd|cnt[14]~62\)) # (!\cd|cnt\(15) & ((\cd|cnt[14]~62\) # (GND)))
-- \cd|cnt[15]~64\ = CARRY((!\cd|cnt[14]~62\) # (!\cd|cnt\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \cd|cnt\(15),
	datad => VCC,
	cin => \cd|cnt[14]~62\,
	combout => \cd|cnt[15]~63_combout\,
	cout => \cd|cnt[15]~64\);

-- Location: FF_X16_Y2_N31
\cd|cnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[15]~63_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(15));

-- Location: LCCOMB_X16_Y1_N0
\cd|cnt[16]~65\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[16]~65_combout\ = (\cd|cnt\(16) & (\cd|cnt[15]~64\ $ (GND))) # (!\cd|cnt\(16) & (!\cd|cnt[15]~64\ & VCC))
-- \cd|cnt[16]~66\ = CARRY((\cd|cnt\(16) & !\cd|cnt[15]~64\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \cd|cnt\(16),
	datad => VCC,
	cin => \cd|cnt[15]~64\,
	combout => \cd|cnt[16]~65_combout\,
	cout => \cd|cnt[16]~66\);

-- Location: FF_X17_Y2_N9
\cd|cnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \cd|cnt[16]~65_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(16));

-- Location: LCCOMB_X16_Y1_N2
\cd|cnt[17]~67\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[17]~67_combout\ = (\cd|cnt\(17) & (!\cd|cnt[16]~66\)) # (!\cd|cnt\(17) & ((\cd|cnt[16]~66\) # (GND)))
-- \cd|cnt[17]~68\ = CARRY((!\cd|cnt[16]~66\) # (!\cd|cnt\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \cd|cnt\(17),
	datad => VCC,
	cin => \cd|cnt[16]~66\,
	combout => \cd|cnt[17]~67_combout\,
	cout => \cd|cnt[17]~68\);

-- Location: FF_X16_Y1_N3
\cd|cnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[17]~67_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(17));

-- Location: LCCOMB_X16_Y1_N4
\cd|cnt[18]~69\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[18]~69_combout\ = (\cd|cnt\(18) & (\cd|cnt[17]~68\ $ (GND))) # (!\cd|cnt\(18) & (!\cd|cnt[17]~68\ & VCC))
-- \cd|cnt[18]~70\ = CARRY((\cd|cnt\(18) & !\cd|cnt[17]~68\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \cd|cnt\(18),
	datad => VCC,
	cin => \cd|cnt[17]~68\,
	combout => \cd|cnt[18]~69_combout\,
	cout => \cd|cnt[18]~70\);

-- Location: FF_X16_Y1_N5
\cd|cnt[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[18]~69_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(18));

-- Location: LCCOMB_X16_Y1_N6
\cd|cnt[19]~71\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[19]~71_combout\ = (\cd|cnt\(19) & (!\cd|cnt[18]~70\)) # (!\cd|cnt\(19) & ((\cd|cnt[18]~70\) # (GND)))
-- \cd|cnt[19]~72\ = CARRY((!\cd|cnt[18]~70\) # (!\cd|cnt\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \cd|cnt\(19),
	datad => VCC,
	cin => \cd|cnt[18]~70\,
	combout => \cd|cnt[19]~71_combout\,
	cout => \cd|cnt[19]~72\);

-- Location: FF_X16_Y1_N7
\cd|cnt[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[19]~71_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(19));

-- Location: LCCOMB_X16_Y1_N8
\cd|cnt[20]~73\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[20]~73_combout\ = (\cd|cnt\(20) & (\cd|cnt[19]~72\ $ (GND))) # (!\cd|cnt\(20) & (!\cd|cnt[19]~72\ & VCC))
-- \cd|cnt[20]~74\ = CARRY((\cd|cnt\(20) & !\cd|cnt[19]~72\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \cd|cnt\(20),
	datad => VCC,
	cin => \cd|cnt[19]~72\,
	combout => \cd|cnt[20]~73_combout\,
	cout => \cd|cnt[20]~74\);

-- Location: FF_X16_Y1_N9
\cd|cnt[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[20]~73_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(20));

-- Location: LCCOMB_X16_Y1_N10
\cd|cnt[21]~75\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[21]~75_combout\ = (\cd|cnt\(21) & (!\cd|cnt[20]~74\)) # (!\cd|cnt\(21) & ((\cd|cnt[20]~74\) # (GND)))
-- \cd|cnt[21]~76\ = CARRY((!\cd|cnt[20]~74\) # (!\cd|cnt\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \cd|cnt\(21),
	datad => VCC,
	cin => \cd|cnt[20]~74\,
	combout => \cd|cnt[21]~75_combout\,
	cout => \cd|cnt[21]~76\);

-- Location: FF_X16_Y1_N11
\cd|cnt[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[21]~75_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(21));

-- Location: LCCOMB_X16_Y1_N12
\cd|cnt[22]~77\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[22]~77_combout\ = (\cd|cnt\(22) & (\cd|cnt[21]~76\ $ (GND))) # (!\cd|cnt\(22) & (!\cd|cnt[21]~76\ & VCC))
-- \cd|cnt[22]~78\ = CARRY((\cd|cnt\(22) & !\cd|cnt[21]~76\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \cd|cnt\(22),
	datad => VCC,
	cin => \cd|cnt[21]~76\,
	combout => \cd|cnt[22]~77_combout\,
	cout => \cd|cnt[22]~78\);

-- Location: FF_X16_Y1_N13
\cd|cnt[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[22]~77_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(22));

-- Location: LCCOMB_X16_Y1_N14
\cd|cnt[23]~79\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[23]~79_combout\ = (\cd|cnt\(23) & (!\cd|cnt[22]~78\)) # (!\cd|cnt\(23) & ((\cd|cnt[22]~78\) # (GND)))
-- \cd|cnt[23]~80\ = CARRY((!\cd|cnt[22]~78\) # (!\cd|cnt\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \cd|cnt\(23),
	datad => VCC,
	cin => \cd|cnt[22]~78\,
	combout => \cd|cnt[23]~79_combout\,
	cout => \cd|cnt[23]~80\);

-- Location: FF_X16_Y1_N15
\cd|cnt[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[23]~79_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(23));

-- Location: LCCOMB_X16_Y1_N16
\cd|cnt[24]~81\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[24]~81_combout\ = (\cd|cnt\(24) & (\cd|cnt[23]~80\ $ (GND))) # (!\cd|cnt\(24) & (!\cd|cnt[23]~80\ & VCC))
-- \cd|cnt[24]~82\ = CARRY((\cd|cnt\(24) & !\cd|cnt[23]~80\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \cd|cnt\(24),
	datad => VCC,
	cin => \cd|cnt[23]~80\,
	combout => \cd|cnt[24]~81_combout\,
	cout => \cd|cnt[24]~82\);

-- Location: FF_X16_Y1_N17
\cd|cnt[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[24]~81_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(24));

-- Location: LCCOMB_X16_Y1_N18
\cd|cnt[25]~83\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[25]~83_combout\ = (\cd|cnt\(25) & (!\cd|cnt[24]~82\)) # (!\cd|cnt\(25) & ((\cd|cnt[24]~82\) # (GND)))
-- \cd|cnt[25]~84\ = CARRY((!\cd|cnt[24]~82\) # (!\cd|cnt\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \cd|cnt\(25),
	datad => VCC,
	cin => \cd|cnt[24]~82\,
	combout => \cd|cnt[25]~83_combout\,
	cout => \cd|cnt[25]~84\);

-- Location: FF_X16_Y1_N19
\cd|cnt[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[25]~83_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(25));

-- Location: LCCOMB_X16_Y1_N20
\cd|cnt[26]~85\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[26]~85_combout\ = (\cd|cnt\(26) & (\cd|cnt[25]~84\ $ (GND))) # (!\cd|cnt\(26) & (!\cd|cnt[25]~84\ & VCC))
-- \cd|cnt[26]~86\ = CARRY((\cd|cnt\(26) & !\cd|cnt[25]~84\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \cd|cnt\(26),
	datad => VCC,
	cin => \cd|cnt[25]~84\,
	combout => \cd|cnt[26]~85_combout\,
	cout => \cd|cnt[26]~86\);

-- Location: FF_X16_Y1_N21
\cd|cnt[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[26]~85_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(26));

-- Location: LCCOMB_X16_Y1_N22
\cd|cnt[27]~87\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[27]~87_combout\ = (\cd|cnt\(27) & (!\cd|cnt[26]~86\)) # (!\cd|cnt\(27) & ((\cd|cnt[26]~86\) # (GND)))
-- \cd|cnt[27]~88\ = CARRY((!\cd|cnt[26]~86\) # (!\cd|cnt\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \cd|cnt\(27),
	datad => VCC,
	cin => \cd|cnt[26]~86\,
	combout => \cd|cnt[27]~87_combout\,
	cout => \cd|cnt[27]~88\);

-- Location: FF_X16_Y1_N23
\cd|cnt[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[27]~87_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(27));

-- Location: LCCOMB_X16_Y1_N24
\cd|cnt[28]~89\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[28]~89_combout\ = (\cd|cnt\(28) & (\cd|cnt[27]~88\ $ (GND))) # (!\cd|cnt\(28) & (!\cd|cnt[27]~88\ & VCC))
-- \cd|cnt[28]~90\ = CARRY((\cd|cnt\(28) & !\cd|cnt[27]~88\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \cd|cnt\(28),
	datad => VCC,
	cin => \cd|cnt[27]~88\,
	combout => \cd|cnt[28]~89_combout\,
	cout => \cd|cnt[28]~90\);

-- Location: FF_X16_Y1_N25
\cd|cnt[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[28]~89_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(28));

-- Location: LCCOMB_X16_Y1_N26
\cd|cnt[29]~91\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[29]~91_combout\ = (\cd|cnt\(29) & (!\cd|cnt[28]~90\)) # (!\cd|cnt\(29) & ((\cd|cnt[28]~90\) # (GND)))
-- \cd|cnt[29]~92\ = CARRY((!\cd|cnt[28]~90\) # (!\cd|cnt\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \cd|cnt\(29),
	datad => VCC,
	cin => \cd|cnt[28]~90\,
	combout => \cd|cnt[29]~91_combout\,
	cout => \cd|cnt[29]~92\);

-- Location: FF_X16_Y1_N27
\cd|cnt[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[29]~91_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(29));

-- Location: LCCOMB_X16_Y1_N28
\cd|cnt[30]~93\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[30]~93_combout\ = (\cd|cnt\(30) & (\cd|cnt[29]~92\ $ (GND))) # (!\cd|cnt\(30) & (!\cd|cnt[29]~92\ & VCC))
-- \cd|cnt[30]~94\ = CARRY((\cd|cnt\(30) & !\cd|cnt[29]~92\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \cd|cnt\(30),
	datad => VCC,
	cin => \cd|cnt[29]~92\,
	combout => \cd|cnt[30]~93_combout\,
	cout => \cd|cnt[30]~94\);

-- Location: FF_X16_Y1_N29
\cd|cnt[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[30]~93_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(30));

-- Location: LCCOMB_X16_Y1_N30
\cd|cnt[31]~95\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[31]~95_combout\ = \cd|cnt\(31) $ (\cd|cnt[30]~94\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \cd|cnt\(31),
	cin => \cd|cnt[30]~94\,
	combout => \cd|cnt[31]~95_combout\);

-- Location: FF_X16_Y1_N31
\cd|cnt[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|cnt[31]~95_combout\,
	sclr => \cd|cnt[29]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(31));

-- Location: LCCOMB_X17_Y2_N6
\cd|Equal0~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|Equal0~9_combout\ = (\cd|cnt\(28)) # ((\cd|cnt\(29)) # ((\cd|cnt\(30)) # (\cd|cnt\(31))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cd|cnt\(28),
	datab => \cd|cnt\(29),
	datac => \cd|cnt\(30),
	datad => \cd|cnt\(31),
	combout => \cd|Equal0~9_combout\);

-- Location: LCCOMB_X17_Y1_N0
\cd|Equal0~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|Equal0~8_combout\ = (\cd|cnt\(24)) # ((\cd|cnt\(27)) # ((\cd|cnt\(25)) # (\cd|cnt\(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cd|cnt\(24),
	datab => \cd|cnt\(27),
	datac => \cd|cnt\(25),
	datad => \cd|cnt\(26),
	combout => \cd|Equal0~8_combout\);

-- Location: LCCOMB_X17_Y2_N12
\cd|Equal0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|Equal0~1_combout\ = (\cd|cnt\(5)) # ((\cd|cnt\(4)) # ((\cd|cnt\(6)) # (\cd|cnt\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cd|cnt\(5),
	datab => \cd|cnt\(4),
	datac => \cd|cnt\(6),
	datad => \cd|cnt\(7),
	combout => \cd|Equal0~1_combout\);

-- Location: LCCOMB_X17_Y2_N2
\cd|Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|Equal0~0_combout\ = ((\cd|cnt\(2)) # ((\cd|cnt\(3)) # (\cd|cnt\(1)))) # (!\cd|cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cd|cnt\(0),
	datab => \cd|cnt\(2),
	datac => \cd|cnt\(3),
	datad => \cd|cnt\(1),
	combout => \cd|Equal0~0_combout\);

-- Location: LCCOMB_X17_Y2_N4
\cd|Equal0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|Equal0~2_combout\ = (\cd|cnt\(8)) # ((\cd|cnt\(10)) # ((\cd|cnt\(9)) # (\cd|cnt\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cd|cnt\(8),
	datab => \cd|cnt\(10),
	datac => \cd|cnt\(9),
	datad => \cd|cnt\(11),
	combout => \cd|Equal0~2_combout\);

-- Location: LCCOMB_X17_Y2_N28
\cd|Equal0~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|Equal0~3_combout\ = (\cd|cnt\(12)) # ((\cd|cnt\(14)) # ((\cd|cnt\(13)) # (\cd|cnt\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cd|cnt\(12),
	datab => \cd|cnt\(14),
	datac => \cd|cnt\(13),
	datad => \cd|cnt\(15),
	combout => \cd|Equal0~3_combout\);

-- Location: LCCOMB_X17_Y2_N22
\cd|Equal0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|Equal0~4_combout\ = (\cd|Equal0~1_combout\) # ((\cd|Equal0~0_combout\) # ((\cd|Equal0~2_combout\) # (\cd|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cd|Equal0~1_combout\,
	datab => \cd|Equal0~0_combout\,
	datac => \cd|Equal0~2_combout\,
	datad => \cd|Equal0~3_combout\,
	combout => \cd|Equal0~4_combout\);

-- Location: LCCOMB_X17_Y2_N26
\cd|Equal0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|Equal0~6_combout\ = (\cd|cnt\(20)) # (\cd|cnt\(21))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \cd|cnt\(20),
	datad => \cd|cnt\(21),
	combout => \cd|Equal0~6_combout\);

-- Location: LCCOMB_X17_Y2_N0
\cd|Equal0~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|Equal0~5_combout\ = (\cd|cnt\(17)) # ((\cd|cnt\(16)) # ((\cd|cnt\(19)) # (\cd|cnt\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cd|cnt\(17),
	datab => \cd|cnt\(16),
	datac => \cd|cnt\(19),
	datad => \cd|cnt\(18),
	combout => \cd|Equal0~5_combout\);

-- Location: LCCOMB_X17_Y2_N16
\cd|Equal0~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|Equal0~7_combout\ = (\cd|cnt\(23)) # ((\cd|cnt\(22)) # ((\cd|Equal0~6_combout\) # (\cd|Equal0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cd|cnt\(23),
	datab => \cd|cnt\(22),
	datac => \cd|Equal0~6_combout\,
	datad => \cd|Equal0~5_combout\,
	combout => \cd|Equal0~7_combout\);

-- Location: LCCOMB_X17_Y2_N10
\cd|Equal0~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|Equal0~10_combout\ = (\cd|Equal0~9_combout\) # ((\cd|Equal0~8_combout\) # ((\cd|Equal0~4_combout\) # (\cd|Equal0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cd|Equal0~9_combout\,
	datab => \cd|Equal0~8_combout\,
	datac => \cd|Equal0~4_combout\,
	datad => \cd|Equal0~7_combout\,
	combout => \cd|Equal0~10_combout\);

-- Location: LCCOMB_X17_Y2_N14
\cd|Clk_Div~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|Clk_Div~0_combout\ = (\reset~input_o\ & !\cd|Equal0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datad => \cd|Equal0~10_combout\,
	combout => \cd|Clk_Div~0_combout\);

-- Location: FF_X17_Y2_N15
\cd|Clk_Div\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cd|Clk_Div~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|Clk_Div~q\);

-- Location: CLKCTRL_G16
\cd|Clk_Div~clkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \cd|Clk_Div~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \cd|Clk_Div~clkctrl_outclk\);

-- Location: LCCOMB_X28_Y26_N14
\count[0]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count[0]~5_combout\ = count(0) $ (VCC)
-- \count[0]~6\ = CARRY(count(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count(0),
	datad => VCC,
	combout => \count[0]~5_combout\,
	cout => \count[0]~6\);

-- Location: CLKCTRL_G7
\reset~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset~inputclkctrl_outclk\);

-- Location: LCCOMB_X28_Y26_N16
\count[1]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count[1]~7_combout\ = (count(1) & (!\count[0]~6\)) # (!count(1) & ((\count[0]~6\) # (GND)))
-- \count[1]~8\ = CARRY((!\count[0]~6\) # (!count(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(1),
	datad => VCC,
	cin => \count[0]~6\,
	combout => \count[1]~7_combout\,
	cout => \count[1]~8\);

-- Location: IOIBUF_X28_Y29_N15
\road_1_sensor~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_road_1_sensor,
	o => \road_1_sensor~input_o\);

-- Location: IOIBUF_X28_Y29_N8
\enable~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_enable,
	o => \enable~input_o\);

-- Location: LCCOMB_X27_Y26_N10
\r1_RAG~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \r1_RAG~1_combout\ = (!\current_state.s2~q\ & !\current_state.s1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.s2~q\,
	datad => \current_state.s1~q\,
	combout => \r1_RAG~1_combout\);

-- Location: LCCOMB_X28_Y26_N20
\count[3]~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count[3]~11_combout\ = (count(3) & (!\count[2]~10\)) # (!count(3) & ((\count[2]~10\) # (GND)))
-- \count[3]~12\ = CARRY((!\count[2]~10\) # (!count(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(3),
	datad => VCC,
	cin => \count[2]~10\,
	combout => \count[3]~11_combout\,
	cout => \count[3]~12\);

-- Location: LCCOMB_X28_Y26_N22
\count[4]~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count[4]~13_combout\ = count(4) $ (!\count[3]~12\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(4),
	cin => \count[3]~12\,
	combout => \count[4]~13_combout\);

-- Location: FF_X28_Y26_N23
\count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \cd|Clk_Div~clkctrl_outclk\,
	d => \count[4]~13_combout\,
	clrn => \reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_LessThan6~1_combout\,
	ena => \ALT_INV_en~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(4));

-- Location: LCCOMB_X28_Y26_N4
\current_state~21\ : cycloneiii_lcell_comb
-- Equation(s):
-- \current_state~21_combout\ = ((!count(1) & (!count(0) & !count(2)))) # (!\road_1_sensor~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \road_1_sensor~input_o\,
	datab => count(1),
	datac => count(0),
	datad => count(2),
	combout => \current_state~21_combout\);

-- Location: LCCOMB_X27_Y26_N26
\current_state~22\ : cycloneiii_lcell_comb
-- Equation(s):
-- \current_state~22_combout\ = (\current_state.s4~q\ & (((\current_state~21_combout\) # (!count(4))) # (!count(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(3),
	datab => count(4),
	datac => \current_state.s4~q\,
	datad => \current_state~21_combout\,
	combout => \current_state~22_combout\);

-- Location: LCCOMB_X27_Y26_N14
\current_state~23\ : cycloneiii_lcell_comb
-- Equation(s):
-- \current_state~23_combout\ = (\current_state.s3~q\ & (!count(4) & ((!count(0)) # (!count(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.s3~q\,
	datab => count(1),
	datac => count(0),
	datad => count(4),
	combout => \current_state~23_combout\);

-- Location: LCCOMB_X27_Y26_N20
\current_state~24\ : cycloneiii_lcell_comb
-- Equation(s):
-- \current_state~24_combout\ = (!count(4) & (!count(3) & ((\current_state.s3~q\) # (!\r1_RAG~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.s3~q\,
	datab => count(4),
	datac => count(3),
	datad => \r1_RAG~1_combout\,
	combout => \current_state~24_combout\);

-- Location: LCCOMB_X27_Y26_N8
\current_state~25\ : cycloneiii_lcell_comb
-- Equation(s):
-- \current_state~25_combout\ = (\enable~input_o\) # ((\current_state~24_combout\) # ((!\road_1_sensor~input_o\ & \current_state.s1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \road_1_sensor~input_o\,
	datab => \current_state.s1~q\,
	datac => \enable~input_o\,
	datad => \current_state~24_combout\,
	combout => \current_state~25_combout\);

-- Location: LCCOMB_X27_Y26_N6
\current_state~19\ : cycloneiii_lcell_comb
-- Equation(s):
-- \current_state~19_combout\ = (\current_state.s2~q\ & (!count(1) & (!count(0) & !count(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.s2~q\,
	datab => count(1),
	datac => count(0),
	datad => count(4),
	combout => \current_state~19_combout\);

-- Location: LCCOMB_X27_Y26_N18
\current_state.s0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \current_state.s0~0_combout\ = !\current_state.s5~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \current_state.s5~q\,
	combout => \current_state.s0~0_combout\);

-- Location: FF_X27_Y26_N19
\current_state.s0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \cd|Clk_Div~clkctrl_outclk\,
	d => \current_state.s0~0_combout\,
	clrn => \reset~inputclkctrl_outclk\,
	ena => \ALT_INV_current_state~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s0~q\);

-- Location: LCCOMB_X27_Y26_N0
\current_state~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \current_state~16_combout\ = (count(1)) # ((!count(0) & ((\current_state.s0~q\) # (count(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.s0~q\,
	datab => count(0),
	datac => count(3),
	datad => count(1),
	combout => \current_state~16_combout\);

-- Location: LCCOMB_X27_Y26_N12
\current_state~17\ : cycloneiii_lcell_comb
-- Equation(s):
-- \current_state~17_combout\ = (!\current_state.s2~q\ & ((\current_state.s1~q\ & (count(0) & \current_state~16_combout\)) # (!\current_state.s1~q\ & ((count(0)) # (\current_state~16_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.s2~q\,
	datab => \current_state.s1~q\,
	datac => count(0),
	datad => \current_state~16_combout\,
	combout => \current_state~17_combout\);

-- Location: LCCOMB_X27_Y26_N16
\current_state~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \current_state~18_combout\ = (!count(4) & (!count(2) & ((\current_state.s3~q\) # (!\current_state~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.s3~q\,
	datab => count(4),
	datac => count(2),
	datad => \current_state~17_combout\,
	combout => \current_state~18_combout\);

-- Location: LCCOMB_X27_Y26_N2
\current_state~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \current_state~20_combout\ = (\current_state~19_combout\) # ((\current_state~18_combout\) # ((\current_state.s5~q\ & \LessThan6~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state~19_combout\,
	datab => \current_state.s5~q\,
	datac => \LessThan6~1_combout\,
	datad => \current_state~18_combout\,
	combout => \current_state~20_combout\);

-- Location: LCCOMB_X27_Y26_N24
\current_state~26\ : cycloneiii_lcell_comb
-- Equation(s):
-- \current_state~26_combout\ = (\current_state~22_combout\) # ((\current_state~23_combout\) # ((\current_state~25_combout\) # (\current_state~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state~22_combout\,
	datab => \current_state~23_combout\,
	datac => \current_state~25_combout\,
	datad => \current_state~20_combout\,
	combout => \current_state~26_combout\);

-- Location: FF_X27_Y26_N29
\current_state.s5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \cd|Clk_Div~clkctrl_outclk\,
	asdata => \current_state.s4~q\,
	clrn => \reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \ALT_INV_current_state~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s5~q\);

-- Location: LCCOMB_X27_Y26_N22
\current_state.s1~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \current_state.s1~1_combout\ = (\r1_RAG~1_combout\ & (!\current_state.s4~q\ & (!\current_state.s3~q\ & !\current_state.s5~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r1_RAG~1_combout\,
	datab => \current_state.s4~q\,
	datac => \current_state.s3~q\,
	datad => \current_state.s5~q\,
	combout => \current_state.s1~1_combout\);

-- Location: LCCOMB_X27_Y26_N4
\current_state.s1~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \current_state.s1~2_combout\ = (\current_state~26_combout\ & ((\current_state.s1~q\))) # (!\current_state~26_combout\ & (\current_state.s1~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.s1~1_combout\,
	datac => \current_state.s1~q\,
	datad => \current_state~26_combout\,
	combout => \current_state.s1~2_combout\);

-- Location: FF_X27_Y26_N5
\current_state.s1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \cd|Clk_Div~clkctrl_outclk\,
	d => \current_state.s1~2_combout\,
	clrn => \reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s1~q\);

-- Location: FF_X27_Y26_N31
\current_state.s2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \cd|Clk_Div~clkctrl_outclk\,
	asdata => \current_state.s1~q\,
	clrn => \reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \ALT_INV_current_state~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s2~q\);

-- Location: FF_X27_Y26_N23
\current_state.s3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \cd|Clk_Div~clkctrl_outclk\,
	asdata => \current_state.s2~q\,
	clrn => \reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \ALT_INV_current_state~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s3~q\);

-- Location: FF_X27_Y26_N27
\current_state.s4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \cd|Clk_Div~clkctrl_outclk\,
	asdata => \current_state.s3~q\,
	clrn => \reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \ALT_INV_current_state~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s4~q\);

-- Location: LCCOMB_X27_Y26_N28
\en~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \en~0_combout\ = (\reset~input_o\ & (!\enable~input_o\ & ((\current_state.s4~q\) # (\current_state.s1~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \enable~input_o\,
	datac => \current_state.s4~q\,
	datad => \current_state.s1~q\,
	combout => \en~0_combout\);

-- Location: LCCOMB_X28_Y26_N2
\en~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \en~1_combout\ = (\en~0_combout\ & (!\road_1_sensor~input_o\)) # (!\en~0_combout\ & ((\en~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \road_1_sensor~input_o\,
	datac => \en~q\,
	datad => \en~0_combout\,
	combout => \en~1_combout\);

-- Location: FF_X28_Y26_N3
en : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \cd|Clk_Div~clkctrl_outclk\,
	d => \en~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \en~q\);

-- Location: FF_X28_Y26_N17
\count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \cd|Clk_Div~clkctrl_outclk\,
	d => \count[1]~7_combout\,
	clrn => \reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_LessThan6~1_combout\,
	ena => \ALT_INV_en~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(1));

-- Location: LCCOMB_X28_Y26_N18
\count[2]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count[2]~9_combout\ = (count(2) & (\count[1]~8\ $ (GND))) # (!count(2) & (!\count[1]~8\ & VCC))
-- \count[2]~10\ = CARRY((count(2) & !\count[1]~8\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(2),
	datad => VCC,
	cin => \count[1]~8\,
	combout => \count[2]~9_combout\,
	cout => \count[2]~10\);

-- Location: FF_X28_Y26_N19
\count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \cd|Clk_Div~clkctrl_outclk\,
	d => \count[2]~9_combout\,
	clrn => \reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_LessThan6~1_combout\,
	ena => \ALT_INV_en~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(2));

-- Location: FF_X28_Y26_N21
\count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \cd|Clk_Div~clkctrl_outclk\,
	d => \count[3]~11_combout\,
	clrn => \reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_LessThan6~1_combout\,
	ena => \ALT_INV_en~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(3));

-- Location: LCCOMB_X28_Y26_N6
\LessThan6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan6~0_combout\ = (!count(2) & ((!count(0)) # (!count(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count(1),
	datac => count(0),
	datad => count(2),
	combout => \LessThan6~0_combout\);

-- Location: LCCOMB_X28_Y26_N0
\LessThan6~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan6~1_combout\ = ((\LessThan6~0_combout\) # (!count(4))) # (!count(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count(3),
	datac => count(4),
	datad => \LessThan6~0_combout\,
	combout => \LessThan6~1_combout\);

-- Location: FF_X28_Y26_N15
\count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \cd|Clk_Div~clkctrl_outclk\,
	d => \count[0]~5_combout\,
	clrn => \reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_LessThan6~1_combout\,
	ena => \ALT_INV_en~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(0));

-- Location: LCCOMB_X28_Y26_N24
\r1_RAG~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \r1_RAG~0_combout\ = (\current_state.s2~q\) # (!\current_state.s0~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.s0~q\,
	datad => \current_state.s2~q\,
	combout => \r1_RAG~0_combout\);

-- Location: LCCOMB_X26_Y26_N0
\current_state.s1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \current_state.s1~0_combout\ = (!\current_state.s3~q\ & !\current_state.s5~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.s3~q\,
	datad => \current_state.s5~q\,
	combout => \current_state.s1~0_combout\);

-- Location: LCCOMB_X27_Y26_N30
\r2_RAG~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \r2_RAG~0_combout\ = (!\current_state.s4~q\ & !\current_state.s5~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.s4~q\,
	datad => \current_state.s5~q\,
	combout => \r2_RAG~0_combout\);

-- Location: IOIBUF_X3_Y29_N22
\road_2_sensor~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_road_2_sensor,
	o => \road_2_sensor~input_o\);

ww_clk_div_sig <= \clk_div_sig~output_o\;

ww_out_count(0) <= \out_count[0]~output_o\;

ww_out_count(1) <= \out_count[1]~output_o\;

ww_out_count(2) <= \out_count[2]~output_o\;

ww_out_count(3) <= \out_count[3]~output_o\;

ww_out_count(4) <= \out_count[4]~output_o\;

ww_r1_RAG(0) <= \r1_RAG[0]~output_o\;

ww_r1_RAG(1) <= \r1_RAG[1]~output_o\;

ww_r1_RAG(2) <= \r1_RAG[2]~output_o\;

ww_r2_RAG(0) <= \r2_RAG[0]~output_o\;

ww_r2_RAG(1) <= \r2_RAG[1]~output_o\;

ww_r2_RAG(2) <= \r2_RAG[2]~output_o\;
END structure;


