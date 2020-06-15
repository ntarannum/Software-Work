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

-- DATE "03/20/2019 21:44:48"

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
	CLOCK : IN std_logic;
	BUTTON : IN std_logic_vector(2 DOWNTO 0);
	SW : IN std_logic_vector(9 DOWNTO 0);
	LEDG : OUT std_logic_vector(9 DOWNTO 0)
	);
END Traffic_Light;

-- Design Ports Information
-- SW[1]	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_H6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_G4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[4]	=>  Location: PIN_G5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_H7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[7]	=>  Location: PIN_E3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[8]	=>  Location: PIN_E4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[9]	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[0]	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[1]	=>  Location: PIN_J2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[2]	=>  Location: PIN_J3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[3]	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[4]	=>  Location: PIN_F2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[5]	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[6]	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[7]	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[8]	=>  Location: PIN_B2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[9]	=>  Location: PIN_B1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BUTTON[0]	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BUTTON[1]	=>  Location: PIN_G3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BUTTON[2]	=>  Location: PIN_F1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL ww_CLOCK : std_logic;
SIGNAL ww_BUTTON : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_SW : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_LEDG : std_logic_vector(9 DOWNTO 0);
SIGNAL \cd|Clk_Div~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLOCK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \SW[8]~input_o\ : std_logic;
SIGNAL \SW[9]~input_o\ : std_logic;
SIGNAL \LEDG[0]~output_o\ : std_logic;
SIGNAL \LEDG[1]~output_o\ : std_logic;
SIGNAL \LEDG[2]~output_o\ : std_logic;
SIGNAL \LEDG[3]~output_o\ : std_logic;
SIGNAL \LEDG[4]~output_o\ : std_logic;
SIGNAL \LEDG[5]~output_o\ : std_logic;
SIGNAL \LEDG[6]~output_o\ : std_logic;
SIGNAL \LEDG[7]~output_o\ : std_logic;
SIGNAL \LEDG[8]~output_o\ : std_logic;
SIGNAL \LEDG[9]~output_o\ : std_logic;
SIGNAL \CLOCK~input_o\ : std_logic;
SIGNAL \CLOCK~inputclkctrl_outclk\ : std_logic;
SIGNAL \cd|cnt[0]~32_combout\ : std_logic;
SIGNAL \cd|Equal0~3_combout\ : std_logic;
SIGNAL \cd|Equal0~2_combout\ : std_logic;
SIGNAL \cd|Equal0~1_combout\ : std_logic;
SIGNAL \cd|Equal0~0_combout\ : std_logic;
SIGNAL \cd|Equal0~4_combout\ : std_logic;
SIGNAL \BUTTON[0]~input_o\ : std_logic;
SIGNAL \cd|cnt[1]~34_combout\ : std_logic;
SIGNAL \cd|cnt[0]~33\ : std_logic;
SIGNAL \cd|cnt[1]~35_combout\ : std_logic;
SIGNAL \cd|cnt[1]~36\ : std_logic;
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
SIGNAL \cd|Equal0~6_combout\ : std_logic;
SIGNAL \cd|Equal0~5_combout\ : std_logic;
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
SIGNAL \cd|Equal0~8_combout\ : std_logic;
SIGNAL \cd|Equal0~7_combout\ : std_logic;
SIGNAL \cd|Equal0~9_combout\ : std_logic;
SIGNAL \cd|Clk_Div~0_combout\ : std_logic;
SIGNAL \cd|Clk_Div~q\ : std_logic;
SIGNAL \cd|Clk_Div~clkctrl_outclk\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \en~0_combout\ : std_logic;
SIGNAL \BUTTON[1]~input_o\ : std_logic;
SIGNAL \BUTTON[2]~input_o\ : std_logic;
SIGNAL \en~1_combout\ : std_logic;
SIGNAL \en~2_combout\ : std_logic;
SIGNAL \en~q\ : std_logic;
SIGNAL \count~34_combout\ : std_logic;
SIGNAL \count[4]~1_combout\ : std_logic;
SIGNAL \count~33_combout\ : std_logic;
SIGNAL \count[3]~5_combout\ : std_logic;
SIGNAL \count~32_combout\ : std_logic;
SIGNAL \count[2]~9_combout\ : std_logic;
SIGNAL \count~30_combout\ : std_logic;
SIGNAL \count[1]~13_combout\ : std_logic;
SIGNAL \count~31_combout\ : std_logic;
SIGNAL \count[0]~17_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \LessThan2~0_combout\ : std_logic;
SIGNAL \count[0]~19_combout\ : std_logic;
SIGNAL \count[0]~_emulated_q\ : std_logic;
SIGNAL \count[0]~18_combout\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \count[1]~15_combout\ : std_logic;
SIGNAL \count[1]~_emulated_q\ : std_logic;
SIGNAL \count[1]~14_combout\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \count[2]~11_combout\ : std_logic;
SIGNAL \count[2]~_emulated_q\ : std_logic;
SIGNAL \count[2]~10_combout\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \count[3]~7_combout\ : std_logic;
SIGNAL \count[3]~_emulated_q\ : std_logic;
SIGNAL \count[3]~6_combout\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \count[4]~3_combout\ : std_logic;
SIGNAL \count[4]~_emulated_q\ : std_logic;
SIGNAL \count[4]~2_combout\ : std_logic;
SIGNAL \current_state~16_combout\ : std_logic;
SIGNAL \current_state.s0~0_combout\ : std_logic;
SIGNAL \current_state.s0~q\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \LessThan1~1_combout\ : std_logic;
SIGNAL \current_state~20_combout\ : std_logic;
SIGNAL \current_state~21_combout\ : std_logic;
SIGNAL \current_state~22_combout\ : std_logic;
SIGNAL \current_state~17_combout\ : std_logic;
SIGNAL \current_state~18_combout\ : std_logic;
SIGNAL \current_state~19_combout\ : std_logic;
SIGNAL \current_state~23_combout\ : std_logic;
SIGNAL \current_state.s5~q\ : std_logic;
SIGNAL \r1_RAG~1_combout\ : std_logic;
SIGNAL \current_state.s1~1_combout\ : std_logic;
SIGNAL \current_state.s1~2_combout\ : std_logic;
SIGNAL \current_state.s1~q\ : std_logic;
SIGNAL \current_state.s2~q\ : std_logic;
SIGNAL \current_state.s3~q\ : std_logic;
SIGNAL \current_state.s4~q\ : std_logic;
SIGNAL \current_state.s1~0_combout\ : std_logic;
SIGNAL \r2_RAG~0_combout\ : std_logic;
SIGNAL \r1_RAG~0_combout\ : std_logic;
SIGNAL \cd|cnt\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_en~q\ : std_logic;
SIGNAL \ALT_INV_current_state~23_combout\ : std_logic;
SIGNAL \ALT_INV_r1_RAG~1_combout\ : std_logic;
SIGNAL \ALT_INV_current_state.s1~0_combout\ : std_logic;

BEGIN

ww_CLOCK <= CLOCK;
ww_BUTTON <= BUTTON;
ww_SW <= SW;
LEDG <= ww_LEDG;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\cd|Clk_Div~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \cd|Clk_Div~q\);

\CLOCK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK~input_o\);
\ALT_INV_en~q\ <= NOT \en~q\;
\ALT_INV_current_state~23_combout\ <= NOT \current_state~23_combout\;
\ALT_INV_r1_RAG~1_combout\ <= NOT \r1_RAG~1_combout\;
\ALT_INV_current_state.s1~0_combout\ <= NOT \current_state.s1~0_combout\;

-- Location: IOOBUF_X0_Y20_N9
\LEDG[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \current_state.s4~q\,
	devoe => ww_devoe,
	o => \LEDG[0]~output_o\);

-- Location: IOOBUF_X0_Y20_N2
\LEDG[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_current_state.s1~0_combout\,
	devoe => ww_devoe,
	o => \LEDG[1]~output_o\);

-- Location: IOOBUF_X0_Y21_N23
\LEDG[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \r2_RAG~0_combout\,
	devoe => ww_devoe,
	o => \LEDG[2]~output_o\);

-- Location: IOOBUF_X0_Y21_N16
\LEDG[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[3]~output_o\);

-- Location: IOOBUF_X0_Y24_N23
\LEDG[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[4]~output_o\);

-- Location: IOOBUF_X0_Y24_N16
\LEDG[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[5]~output_o\);

-- Location: IOOBUF_X0_Y26_N23
\LEDG[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[6]~output_o\);

-- Location: IOOBUF_X0_Y26_N16
\LEDG[7]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \current_state.s1~q\,
	devoe => ww_devoe,
	o => \LEDG[7]~output_o\);

-- Location: IOOBUF_X0_Y27_N9
\LEDG[8]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \r1_RAG~0_combout\,
	devoe => ww_devoe,
	o => \LEDG[8]~output_o\);

-- Location: IOOBUF_X0_Y27_N16
\LEDG[9]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_r1_RAG~1_combout\,
	devoe => ww_devoe,
	o => \LEDG[9]~output_o\);

-- Location: IOIBUF_X41_Y15_N1
\CLOCK~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK,
	o => \CLOCK~input_o\);

-- Location: CLKCTRL_G9
\CLOCK~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK~inputclkctrl_outclk\);

-- Location: LCCOMB_X23_Y14_N0
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

-- Location: LCCOMB_X22_Y13_N26
\cd|Equal0~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|Equal0~3_combout\ = (((!\cd|cnt\(13)) # (!\cd|cnt\(14))) # (!\cd|cnt\(15))) # (!\cd|cnt\(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cd|cnt\(12),
	datab => \cd|cnt\(15),
	datac => \cd|cnt\(14),
	datad => \cd|cnt\(13),
	combout => \cd|Equal0~3_combout\);

-- Location: LCCOMB_X22_Y13_N28
\cd|Equal0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|Equal0~2_combout\ = (\cd|cnt\(8)) # ((\cd|cnt\(9)) # ((\cd|cnt\(10)) # (\cd|cnt\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cd|cnt\(8),
	datab => \cd|cnt\(9),
	datac => \cd|cnt\(10),
	datad => \cd|cnt\(11),
	combout => \cd|Equal0~2_combout\);

-- Location: LCCOMB_X22_Y13_N8
\cd|Equal0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|Equal0~1_combout\ = (((\cd|cnt\(7)) # (!\cd|cnt\(5))) # (!\cd|cnt\(4))) # (!\cd|cnt\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cd|cnt\(6),
	datab => \cd|cnt\(4),
	datac => \cd|cnt\(7),
	datad => \cd|cnt\(5),
	combout => \cd|Equal0~1_combout\);

-- Location: LCCOMB_X22_Y13_N24
\cd|Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|Equal0~0_combout\ = (((!\cd|cnt\(0)) # (!\cd|cnt\(2))) # (!\cd|cnt\(3))) # (!\cd|cnt\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cd|cnt\(1),
	datab => \cd|cnt\(3),
	datac => \cd|cnt\(2),
	datad => \cd|cnt\(0),
	combout => \cd|Equal0~0_combout\);

-- Location: LCCOMB_X22_Y13_N4
\cd|Equal0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|Equal0~4_combout\ = (\cd|Equal0~3_combout\) # ((\cd|Equal0~2_combout\) # ((\cd|Equal0~1_combout\) # (\cd|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cd|Equal0~3_combout\,
	datab => \cd|Equal0~2_combout\,
	datac => \cd|Equal0~1_combout\,
	datad => \cd|Equal0~0_combout\,
	combout => \cd|Equal0~4_combout\);

-- Location: IOIBUF_X0_Y21_N8
\BUTTON[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BUTTON(0),
	o => \BUTTON[0]~input_o\);

-- Location: LCCOMB_X22_Y13_N0
\cd|cnt[1]~34\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[1]~34_combout\ = ((!\cd|Equal0~9_combout\ & !\cd|Equal0~4_combout\)) # (!\BUTTON[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \cd|Equal0~9_combout\,
	datac => \cd|Equal0~4_combout\,
	datad => \BUTTON[0]~input_o\,
	combout => \cd|cnt[1]~34_combout\);

-- Location: FF_X23_Y14_N1
\cd|cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[0]~32_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(0));

-- Location: LCCOMB_X23_Y14_N2
\cd|cnt[1]~35\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[1]~35_combout\ = (\cd|cnt\(1) & (!\cd|cnt[0]~33\)) # (!\cd|cnt\(1) & ((\cd|cnt[0]~33\) # (GND)))
-- \cd|cnt[1]~36\ = CARRY((!\cd|cnt[0]~33\) # (!\cd|cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \cd|cnt\(1),
	datad => VCC,
	cin => \cd|cnt[0]~33\,
	combout => \cd|cnt[1]~35_combout\,
	cout => \cd|cnt[1]~36\);

-- Location: FF_X23_Y14_N3
\cd|cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[1]~35_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(1));

-- Location: LCCOMB_X23_Y14_N4
\cd|cnt[2]~37\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|cnt[2]~37_combout\ = (\cd|cnt\(2) & (\cd|cnt[1]~36\ $ (GND))) # (!\cd|cnt\(2) & (!\cd|cnt[1]~36\ & VCC))
-- \cd|cnt[2]~38\ = CARRY((\cd|cnt\(2) & !\cd|cnt[1]~36\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \cd|cnt\(2),
	datad => VCC,
	cin => \cd|cnt[1]~36\,
	combout => \cd|cnt[2]~37_combout\,
	cout => \cd|cnt[2]~38\);

-- Location: FF_X23_Y14_N5
\cd|cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[2]~37_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(2));

-- Location: LCCOMB_X23_Y14_N6
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

-- Location: FF_X23_Y14_N7
\cd|cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[3]~39_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(3));

-- Location: LCCOMB_X23_Y14_N8
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

-- Location: FF_X23_Y14_N9
\cd|cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[4]~41_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(4));

-- Location: LCCOMB_X23_Y14_N10
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

-- Location: FF_X23_Y14_N11
\cd|cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[5]~43_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(5));

-- Location: LCCOMB_X23_Y14_N12
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

-- Location: FF_X23_Y14_N13
\cd|cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[6]~45_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(6));

-- Location: LCCOMB_X23_Y14_N14
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

-- Location: FF_X23_Y14_N15
\cd|cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[7]~47_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(7));

-- Location: LCCOMB_X23_Y14_N16
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

-- Location: FF_X23_Y14_N17
\cd|cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[8]~49_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(8));

-- Location: LCCOMB_X23_Y14_N18
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

-- Location: FF_X23_Y14_N19
\cd|cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[9]~51_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(9));

-- Location: LCCOMB_X23_Y14_N20
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

-- Location: FF_X23_Y14_N21
\cd|cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[10]~53_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(10));

-- Location: LCCOMB_X23_Y14_N22
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

-- Location: FF_X23_Y14_N23
\cd|cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[11]~55_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(11));

-- Location: LCCOMB_X23_Y14_N24
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

-- Location: FF_X23_Y14_N25
\cd|cnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[12]~57_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(12));

-- Location: LCCOMB_X23_Y14_N26
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

-- Location: FF_X23_Y14_N27
\cd|cnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[13]~59_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(13));

-- Location: LCCOMB_X23_Y14_N28
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

-- Location: FF_X23_Y14_N29
\cd|cnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[14]~61_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(14));

-- Location: LCCOMB_X23_Y14_N30
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

-- Location: FF_X23_Y14_N31
\cd|cnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[15]~63_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(15));

-- Location: LCCOMB_X23_Y13_N0
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

-- Location: FF_X23_Y13_N1
\cd|cnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[16]~65_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(16));

-- Location: LCCOMB_X23_Y13_N2
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

-- Location: FF_X23_Y13_N3
\cd|cnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[17]~67_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(17));

-- Location: LCCOMB_X23_Y13_N4
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

-- Location: FF_X23_Y13_N5
\cd|cnt[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[18]~69_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(18));

-- Location: LCCOMB_X23_Y13_N6
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

-- Location: FF_X23_Y13_N7
\cd|cnt[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[19]~71_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(19));

-- Location: LCCOMB_X23_Y13_N8
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

-- Location: FF_X23_Y13_N9
\cd|cnt[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[20]~73_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(20));

-- Location: LCCOMB_X23_Y13_N10
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

-- Location: FF_X23_Y13_N11
\cd|cnt[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[21]~75_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(21));

-- Location: LCCOMB_X23_Y13_N12
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

-- Location: FF_X23_Y13_N13
\cd|cnt[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[22]~77_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(22));

-- Location: LCCOMB_X23_Y13_N14
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

-- Location: FF_X23_Y13_N15
\cd|cnt[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[23]~79_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(23));

-- Location: LCCOMB_X22_Y13_N6
\cd|Equal0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|Equal0~6_combout\ = (((!\cd|cnt\(22)) # (!\cd|cnt\(23))) # (!\cd|cnt\(20))) # (!\cd|cnt\(21))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cd|cnt\(21),
	datab => \cd|cnt\(20),
	datac => \cd|cnt\(23),
	datad => \cd|cnt\(22),
	combout => \cd|Equal0~6_combout\);

-- Location: LCCOMB_X22_Y13_N20
\cd|Equal0~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|Equal0~5_combout\ = (\cd|cnt\(18)) # ((\cd|cnt\(16)) # ((!\cd|cnt\(19)) # (!\cd|cnt\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cd|cnt\(18),
	datab => \cd|cnt\(16),
	datac => \cd|cnt\(17),
	datad => \cd|cnt\(19),
	combout => \cd|Equal0~5_combout\);

-- Location: LCCOMB_X23_Y13_N16
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

-- Location: FF_X23_Y13_N17
\cd|cnt[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[24]~81_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(24));

-- Location: LCCOMB_X23_Y13_N18
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

-- Location: FF_X23_Y13_N19
\cd|cnt[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[25]~83_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(25));

-- Location: LCCOMB_X23_Y13_N20
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

-- Location: FF_X23_Y13_N21
\cd|cnt[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[26]~85_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(26));

-- Location: LCCOMB_X23_Y13_N22
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

-- Location: FF_X23_Y13_N23
\cd|cnt[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[27]~87_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(27));

-- Location: LCCOMB_X23_Y13_N24
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

-- Location: FF_X23_Y13_N25
\cd|cnt[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[28]~89_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(28));

-- Location: LCCOMB_X23_Y13_N26
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

-- Location: FF_X23_Y13_N27
\cd|cnt[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[29]~91_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(29));

-- Location: LCCOMB_X23_Y13_N28
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

-- Location: FF_X23_Y13_N29
\cd|cnt[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[30]~93_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(30));

-- Location: LCCOMB_X23_Y13_N30
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

-- Location: FF_X23_Y13_N31
\cd|cnt[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|cnt[31]~95_combout\,
	sclr => \cd|cnt[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|cnt\(31));

-- Location: LCCOMB_X22_Y13_N30
\cd|Equal0~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|Equal0~8_combout\ = (\cd|cnt\(29)) # ((\cd|cnt\(28)) # ((\cd|cnt\(30)) # (\cd|cnt\(31))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cd|cnt\(29),
	datab => \cd|cnt\(28),
	datac => \cd|cnt\(30),
	datad => \cd|cnt\(31),
	combout => \cd|Equal0~8_combout\);

-- Location: LCCOMB_X24_Y13_N16
\cd|Equal0~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|Equal0~7_combout\ = (\cd|cnt\(24)) # (((\cd|cnt\(26)) # (\cd|cnt\(27))) # (!\cd|cnt\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cd|cnt\(24),
	datab => \cd|cnt\(25),
	datac => \cd|cnt\(26),
	datad => \cd|cnt\(27),
	combout => \cd|Equal0~7_combout\);

-- Location: LCCOMB_X22_Y13_N18
\cd|Equal0~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|Equal0~9_combout\ = (\cd|Equal0~6_combout\) # ((\cd|Equal0~5_combout\) # ((\cd|Equal0~8_combout\) # (\cd|Equal0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cd|Equal0~6_combout\,
	datab => \cd|Equal0~5_combout\,
	datac => \cd|Equal0~8_combout\,
	datad => \cd|Equal0~7_combout\,
	combout => \cd|Equal0~9_combout\);

-- Location: LCCOMB_X22_Y13_N2
\cd|Clk_Div~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cd|Clk_Div~0_combout\ = (!\cd|Equal0~9_combout\ & (!\cd|Equal0~4_combout\ & \BUTTON[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \cd|Equal0~9_combout\,
	datac => \cd|Equal0~4_combout\,
	datad => \BUTTON[0]~input_o\,
	combout => \cd|Clk_Div~0_combout\);

-- Location: FF_X22_Y13_N3
\cd|Clk_Div\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \cd|Clk_Div~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cd|Clk_Div~q\);

-- Location: CLKCTRL_G18
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

-- Location: IOIBUF_X0_Y24_N1
\SW[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: LCCOMB_X22_Y19_N16
\en~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \en~0_combout\ = (\BUTTON[0]~input_o\ & (!\SW[0]~input_o\ & ((\current_state.s1~q\) # (\current_state.s4~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.s1~q\,
	datab => \BUTTON[0]~input_o\,
	datac => \current_state.s4~q\,
	datad => \SW[0]~input_o\,
	combout => \en~0_combout\);

-- Location: IOIBUF_X0_Y23_N15
\BUTTON[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BUTTON(1),
	o => \BUTTON[1]~input_o\);

-- Location: IOIBUF_X0_Y23_N1
\BUTTON[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BUTTON(2),
	o => \BUTTON[2]~input_o\);

-- Location: LCCOMB_X22_Y19_N14
\en~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \en~1_combout\ = (\current_state.s4~q\ & ((\BUTTON[2]~input_o\))) # (!\current_state.s4~q\ & (\BUTTON[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \BUTTON[1]~input_o\,
	datac => \current_state.s4~q\,
	datad => \BUTTON[2]~input_o\,
	combout => \en~1_combout\);

-- Location: LCCOMB_X23_Y19_N18
\en~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \en~2_combout\ = (\en~0_combout\ & ((\en~1_combout\))) # (!\en~0_combout\ & (\en~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \en~0_combout\,
	datac => \en~q\,
	datad => \en~1_combout\,
	combout => \en~2_combout\);

-- Location: FF_X23_Y19_N19
en : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \cd|Clk_Div~clkctrl_outclk\,
	d => \en~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \en~q\);

-- Location: LCCOMB_X23_Y19_N20
\count~34\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count~34_combout\ = (\count[4]~2_combout\ & \en~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \count[4]~2_combout\,
	datad => \en~q\,
	combout => \count~34_combout\);

-- Location: LCCOMB_X23_Y19_N14
\count[4]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count[4]~1_combout\ = (\BUTTON[0]~input_o\ & (\count[4]~1_combout\)) # (!\BUTTON[0]~input_o\ & ((\count~34_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \count[4]~1_combout\,
	datac => \BUTTON[0]~input_o\,
	datad => \count~34_combout\,
	combout => \count[4]~1_combout\);

-- Location: LCCOMB_X23_Y19_N6
\count~33\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count~33_combout\ = (\count[3]~6_combout\ & \en~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count[3]~6_combout\,
	datad => \en~q\,
	combout => \count~33_combout\);

-- Location: LCCOMB_X23_Y19_N0
\count[3]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count[3]~5_combout\ = (\BUTTON[0]~input_o\ & (\count[3]~5_combout\)) # (!\BUTTON[0]~input_o\ & ((\count~33_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \count[3]~5_combout\,
	datac => \BUTTON[0]~input_o\,
	datad => \count~33_combout\,
	combout => \count[3]~5_combout\);

-- Location: LCCOMB_X24_Y19_N10
\count~32\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count~32_combout\ = (\count[2]~10_combout\ & \en~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \count[2]~10_combout\,
	datad => \en~q\,
	combout => \count~32_combout\);

-- Location: LCCOMB_X24_Y19_N4
\count[2]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count[2]~9_combout\ = (\BUTTON[0]~input_o\ & (\count[2]~9_combout\)) # (!\BUTTON[0]~input_o\ & ((\count~32_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \count[2]~9_combout\,
	datac => \BUTTON[0]~input_o\,
	datad => \count~32_combout\,
	combout => \count[2]~9_combout\);

-- Location: LCCOMB_X24_Y19_N28
\count~30\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count~30_combout\ = (\count[1]~14_combout\ & \en~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \count[1]~14_combout\,
	datad => \en~q\,
	combout => \count~30_combout\);

-- Location: LCCOMB_X24_Y19_N12
\count[1]~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count[1]~13_combout\ = (\BUTTON[0]~input_o\ & (\count[1]~13_combout\)) # (!\BUTTON[0]~input_o\ & ((\count~30_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count[1]~13_combout\,
	datac => \BUTTON[0]~input_o\,
	datad => \count~30_combout\,
	combout => \count[1]~13_combout\);

-- Location: LCCOMB_X23_Y19_N28
\count~31\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count~31_combout\ = (\count[0]~18_combout\ & \en~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \count[0]~18_combout\,
	datad => \en~q\,
	combout => \count~31_combout\);

-- Location: LCCOMB_X23_Y19_N10
\count[0]~17\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count[0]~17_combout\ = (\BUTTON[0]~input_o\ & (\count[0]~17_combout\)) # (!\BUTTON[0]~input_o\ & ((\count~31_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count[0]~17_combout\,
	datac => \BUTTON[0]~input_o\,
	datad => \count~31_combout\,
	combout => \count[0]~17_combout\);

-- Location: LCCOMB_X24_Y19_N18
\Add0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = \count[0]~18_combout\ $ (VCC)
-- \Add0~1\ = CARRY(\count[0]~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \count[0]~18_combout\,
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: LCCOMB_X24_Y19_N8
\LessThan2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan2~0_combout\ = ((!\count[2]~10_combout\ & ((!\count[0]~18_combout\) # (!\count[1]~14_combout\)))) # (!\count[3]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count[3]~6_combout\,
	datab => \count[1]~14_combout\,
	datac => \count[2]~10_combout\,
	datad => \count[0]~18_combout\,
	combout => \LessThan2~0_combout\);

-- Location: LCCOMB_X23_Y19_N12
\count[0]~19\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count[0]~19_combout\ = \count[0]~17_combout\ $ (((\Add0~0_combout\ & ((\LessThan2~0_combout\) # (!\count[4]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count[0]~17_combout\,
	datab => \Add0~0_combout\,
	datac => \count[4]~2_combout\,
	datad => \LessThan2~0_combout\,
	combout => \count[0]~19_combout\);

-- Location: FF_X23_Y19_N13
\count[0]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \cd|Clk_Div~clkctrl_outclk\,
	d => \count[0]~19_combout\,
	clrn => \BUTTON[0]~input_o\,
	ena => \ALT_INV_en~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count[0]~_emulated_q\);

-- Location: LCCOMB_X23_Y19_N30
\count[0]~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count[0]~18_combout\ = (\BUTTON[0]~input_o\ & (\count[0]~_emulated_q\ $ (((\count[0]~17_combout\))))) # (!\BUTTON[0]~input_o\ & (((\count~31_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count[0]~_emulated_q\,
	datab => \count~31_combout\,
	datac => \BUTTON[0]~input_o\,
	datad => \count[0]~17_combout\,
	combout => \count[0]~18_combout\);

-- Location: LCCOMB_X24_Y19_N20
\Add0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (\count[1]~14_combout\ & (!\Add0~1\)) # (!\count[1]~14_combout\ & ((\Add0~1\) # (GND)))
-- \Add0~3\ = CARRY((!\Add0~1\) # (!\count[1]~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \count[1]~14_combout\,
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: LCCOMB_X24_Y19_N6
\count[1]~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count[1]~15_combout\ = \count[1]~13_combout\ $ (((\Add0~2_combout\ & ((\LessThan2~0_combout\) # (!\count[4]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count[1]~13_combout\,
	datab => \count[4]~2_combout\,
	datac => \Add0~2_combout\,
	datad => \LessThan2~0_combout\,
	combout => \count[1]~15_combout\);

-- Location: FF_X24_Y19_N7
\count[1]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \cd|Clk_Div~clkctrl_outclk\,
	d => \count[1]~15_combout\,
	clrn => \BUTTON[0]~input_o\,
	ena => \ALT_INV_en~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count[1]~_emulated_q\);

-- Location: LCCOMB_X24_Y19_N0
\count[1]~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count[1]~14_combout\ = (\BUTTON[0]~input_o\ & (\count[1]~_emulated_q\ $ (((\count[1]~13_combout\))))) # (!\BUTTON[0]~input_o\ & (((\count~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count[1]~_emulated_q\,
	datab => \count~30_combout\,
	datac => \BUTTON[0]~input_o\,
	datad => \count[1]~13_combout\,
	combout => \count[1]~14_combout\);

-- Location: LCCOMB_X24_Y19_N22
\Add0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = (\count[2]~10_combout\ & (\Add0~3\ $ (GND))) # (!\count[2]~10_combout\ & (!\Add0~3\ & VCC))
-- \Add0~5\ = CARRY((\count[2]~10_combout\ & !\Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \count[2]~10_combout\,
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: LCCOMB_X24_Y19_N14
\count[2]~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count[2]~11_combout\ = \count[2]~9_combout\ $ (((\Add0~4_combout\ & ((\LessThan2~0_combout\) # (!\count[4]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count[2]~9_combout\,
	datab => \count[4]~2_combout\,
	datac => \Add0~4_combout\,
	datad => \LessThan2~0_combout\,
	combout => \count[2]~11_combout\);

-- Location: FF_X24_Y19_N15
\count[2]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \cd|Clk_Div~clkctrl_outclk\,
	d => \count[2]~11_combout\,
	clrn => \BUTTON[0]~input_o\,
	ena => \ALT_INV_en~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count[2]~_emulated_q\);

-- Location: LCCOMB_X24_Y19_N16
\count[2]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count[2]~10_combout\ = (\BUTTON[0]~input_o\ & ((\count[2]~_emulated_q\ $ (\count[2]~9_combout\)))) # (!\BUTTON[0]~input_o\ & (\count~32_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count~32_combout\,
	datab => \count[2]~_emulated_q\,
	datac => \count[2]~9_combout\,
	datad => \BUTTON[0]~input_o\,
	combout => \count[2]~10_combout\);

-- Location: LCCOMB_X24_Y19_N24
\Add0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (\count[3]~6_combout\ & (!\Add0~5\)) # (!\count[3]~6_combout\ & ((\Add0~5\) # (GND)))
-- \Add0~7\ = CARRY((!\Add0~5\) # (!\count[3]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \count[3]~6_combout\,
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: LCCOMB_X23_Y19_N24
\count[3]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count[3]~7_combout\ = \count[3]~5_combout\ $ (((\Add0~6_combout\ & ((\LessThan2~0_combout\) # (!\count[4]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count[3]~5_combout\,
	datab => \Add0~6_combout\,
	datac => \count[4]~2_combout\,
	datad => \LessThan2~0_combout\,
	combout => \count[3]~7_combout\);

-- Location: FF_X23_Y19_N25
\count[3]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \cd|Clk_Div~clkctrl_outclk\,
	d => \count[3]~7_combout\,
	clrn => \BUTTON[0]~input_o\,
	ena => \ALT_INV_en~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count[3]~_emulated_q\);

-- Location: LCCOMB_X23_Y19_N22
\count[3]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count[3]~6_combout\ = (\BUTTON[0]~input_o\ & ((\count[3]~_emulated_q\ $ (\count[3]~5_combout\)))) # (!\BUTTON[0]~input_o\ & (\count~33_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count~33_combout\,
	datab => \count[3]~_emulated_q\,
	datac => \BUTTON[0]~input_o\,
	datad => \count[3]~5_combout\,
	combout => \count[3]~6_combout\);

-- Location: LCCOMB_X24_Y19_N26
\Add0~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = \count[4]~2_combout\ $ (!\Add0~7\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \count[4]~2_combout\,
	cin => \Add0~7\,
	combout => \Add0~8_combout\);

-- Location: LCCOMB_X24_Y19_N30
\count[4]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count[4]~3_combout\ = \count[4]~1_combout\ $ (((\Add0~8_combout\ & ((\LessThan2~0_combout\) # (!\count[4]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count[4]~1_combout\,
	datab => \Add0~8_combout\,
	datac => \count[4]~2_combout\,
	datad => \LessThan2~0_combout\,
	combout => \count[4]~3_combout\);

-- Location: FF_X24_Y19_N31
\count[4]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \cd|Clk_Div~clkctrl_outclk\,
	d => \count[4]~3_combout\,
	clrn => \BUTTON[0]~input_o\,
	ena => \ALT_INV_en~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count[4]~_emulated_q\);

-- Location: LCCOMB_X23_Y19_N8
\count[4]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count[4]~2_combout\ = (\BUTTON[0]~input_o\ & ((\count[4]~1_combout\ $ (\count[4]~_emulated_q\)))) # (!\BUTTON[0]~input_o\ & (\count~34_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count~34_combout\,
	datab => \count[4]~1_combout\,
	datac => \count[4]~_emulated_q\,
	datad => \BUTTON[0]~input_o\,
	combout => \count[4]~2_combout\);

-- Location: LCCOMB_X22_Y19_N30
\current_state~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \current_state~16_combout\ = (\LessThan2~0_combout\ & ((\current_state.s5~q\) # ((!\count[4]~2_combout\ & \current_state.s1~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.s5~q\,
	datab => \count[4]~2_combout\,
	datac => \current_state.s1~q\,
	datad => \LessThan2~0_combout\,
	combout => \current_state~16_combout\);

-- Location: LCCOMB_X22_Y19_N26
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

-- Location: FF_X22_Y19_N27
\current_state.s0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \cd|Clk_Div~clkctrl_outclk\,
	d => \current_state.s0~0_combout\,
	clrn => \BUTTON[0]~input_o\,
	ena => \ALT_INV_current_state~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s0~q\);

-- Location: LCCOMB_X23_Y19_N16
\LessThan1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (!\count[0]~18_combout\ & (!\count[1]~14_combout\ & !\count[2]~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count[0]~18_combout\,
	datac => \count[1]~14_combout\,
	datad => \count[2]~10_combout\,
	combout => \LessThan1~0_combout\);

-- Location: LCCOMB_X23_Y19_N26
\LessThan1~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~1_combout\ = (!\count[3]~6_combout\ & (!\count[4]~2_combout\ & (!\current_state.s0~q\ & \LessThan1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count[3]~6_combout\,
	datab => \count[4]~2_combout\,
	datac => \current_state.s0~q\,
	datad => \LessThan1~0_combout\,
	combout => \LessThan1~1_combout\);

-- Location: LCCOMB_X22_Y19_N6
\current_state~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \current_state~20_combout\ = (\BUTTON[1]~input_o\ & ((\current_state.s1~q\) # ((!\count[4]~2_combout\ & \current_state.s5~q\)))) # (!\BUTTON[1]~input_o\ & (((!\count[4]~2_combout\ & \current_state.s5~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BUTTON[1]~input_o\,
	datab => \current_state.s1~q\,
	datac => \count[4]~2_combout\,
	datad => \current_state.s5~q\,
	combout => \current_state~20_combout\);

-- Location: LCCOMB_X23_Y19_N2
\current_state~21\ : cycloneiii_lcell_comb
-- Equation(s):
-- \current_state~21_combout\ = ((\BUTTON[2]~input_o\) # ((\LessThan1~0_combout\) # (!\count[4]~2_combout\))) # (!\count[3]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count[3]~6_combout\,
	datab => \BUTTON[2]~input_o\,
	datac => \count[4]~2_combout\,
	datad => \LessThan1~0_combout\,
	combout => \current_state~21_combout\);

-- Location: LCCOMB_X22_Y19_N22
\current_state~22\ : cycloneiii_lcell_comb
-- Equation(s):
-- \current_state~22_combout\ = (\current_state~20_combout\) # ((\SW[0]~input_o\) # ((\current_state.s4~q\ & \current_state~21_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state~20_combout\,
	datab => \SW[0]~input_o\,
	datac => \current_state.s4~q\,
	datad => \current_state~21_combout\,
	combout => \current_state~22_combout\);

-- Location: LCCOMB_X23_Y19_N4
\current_state~17\ : cycloneiii_lcell_comb
-- Equation(s):
-- \current_state~17_combout\ = (\count[3]~6_combout\ & \count[2]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \count[3]~6_combout\,
	datad => \count[2]~10_combout\,
	combout => \current_state~17_combout\);

-- Location: LCCOMB_X22_Y19_N0
\current_state~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \current_state~18_combout\ = (\current_state~17_combout\ & ((\count[0]~18_combout\ & ((\count[1]~14_combout\) # (!\current_state.s3~q\))) # (!\count[0]~18_combout\ & (!\current_state.s3~q\ & \count[1]~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count[0]~18_combout\,
	datab => \current_state.s3~q\,
	datac => \count[1]~14_combout\,
	datad => \current_state~17_combout\,
	combout => \current_state~18_combout\);

-- Location: LCCOMB_X22_Y19_N24
\current_state~19\ : cycloneiii_lcell_comb
-- Equation(s):
-- \current_state~19_combout\ = (!\count[4]~2_combout\ & (!\current_state~18_combout\ & ((\current_state.s3~q\) # (\current_state.s2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.s3~q\,
	datab => \count[4]~2_combout\,
	datac => \current_state.s2~q\,
	datad => \current_state~18_combout\,
	combout => \current_state~19_combout\);

-- Location: LCCOMB_X22_Y19_N12
\current_state~23\ : cycloneiii_lcell_comb
-- Equation(s):
-- \current_state~23_combout\ = (\current_state~16_combout\) # ((\LessThan1~1_combout\) # ((\current_state~22_combout\) # (\current_state~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state~16_combout\,
	datab => \LessThan1~1_combout\,
	datac => \current_state~22_combout\,
	datad => \current_state~19_combout\,
	combout => \current_state~23_combout\);

-- Location: FF_X22_Y19_N3
\current_state.s5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \cd|Clk_Div~clkctrl_outclk\,
	asdata => \current_state.s4~q\,
	clrn => \BUTTON[0]~input_o\,
	sload => VCC,
	ena => \ALT_INV_current_state~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s5~q\);

-- Location: LCCOMB_X22_Y19_N10
\r1_RAG~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \r1_RAG~1_combout\ = (\current_state.s1~q\) # (\current_state.s2~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.s1~q\,
	datac => \current_state.s2~q\,
	combout => \r1_RAG~1_combout\);

-- Location: LCCOMB_X22_Y19_N18
\current_state.s1~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \current_state.s1~1_combout\ = (!\current_state.s5~q\ & (!\current_state.s3~q\ & (!\current_state.s4~q\ & !\r1_RAG~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.s5~q\,
	datab => \current_state.s3~q\,
	datac => \current_state.s4~q\,
	datad => \r1_RAG~1_combout\,
	combout => \current_state.s1~1_combout\);

-- Location: LCCOMB_X22_Y19_N8
\current_state.s1~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \current_state.s1~2_combout\ = (\current_state~23_combout\ & ((\current_state.s1~q\))) # (!\current_state~23_combout\ & (\current_state.s1~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.s1~1_combout\,
	datac => \current_state.s1~q\,
	datad => \current_state~23_combout\,
	combout => \current_state.s1~2_combout\);

-- Location: FF_X22_Y19_N9
\current_state.s1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \cd|Clk_Div~clkctrl_outclk\,
	d => \current_state.s1~2_combout\,
	clrn => \BUTTON[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s1~q\);

-- Location: FF_X22_Y19_N25
\current_state.s2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \cd|Clk_Div~clkctrl_outclk\,
	asdata => \current_state.s1~q\,
	clrn => \BUTTON[0]~input_o\,
	sload => VCC,
	ena => \ALT_INV_current_state~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s2~q\);

-- Location: FF_X22_Y19_N21
\current_state.s3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \cd|Clk_Div~clkctrl_outclk\,
	asdata => \current_state.s2~q\,
	clrn => \BUTTON[0]~input_o\,
	sload => VCC,
	ena => \ALT_INV_current_state~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s3~q\);

-- Location: FF_X22_Y19_N23
\current_state.s4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \cd|Clk_Div~clkctrl_outclk\,
	asdata => \current_state.s3~q\,
	clrn => \BUTTON[0]~input_o\,
	sload => VCC,
	ena => \ALT_INV_current_state~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s4~q\);

-- Location: LCCOMB_X22_Y19_N2
\current_state.s1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \current_state.s1~0_combout\ = (!\current_state.s5~q\ & !\current_state.s3~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.s5~q\,
	datad => \current_state.s3~q\,
	combout => \current_state.s1~0_combout\);

-- Location: LCCOMB_X22_Y19_N20
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

-- Location: LCCOMB_X22_Y19_N28
\r1_RAG~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \r1_RAG~0_combout\ = (\current_state.s2~q\) # (!\current_state.s0~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.s2~q\,
	datad => \current_state.s0~q\,
	combout => \r1_RAG~0_combout\);

-- Location: IOIBUF_X0_Y27_N1
\SW[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: IOIBUF_X0_Y25_N22
\SW[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: IOIBUF_X0_Y23_N8
\SW[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

-- Location: IOIBUF_X0_Y27_N22
\SW[4]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(4),
	o => \SW[4]~input_o\);

-- Location: IOIBUF_X0_Y22_N15
\SW[5]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(5),
	o => \SW[5]~input_o\);

-- Location: IOIBUF_X0_Y25_N15
\SW[6]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(6),
	o => \SW[6]~input_o\);

-- Location: IOIBUF_X0_Y26_N8
\SW[7]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(7),
	o => \SW[7]~input_o\);

-- Location: IOIBUF_X0_Y26_N1
\SW[8]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(8),
	o => \SW[8]~input_o\);

-- Location: IOIBUF_X0_Y25_N1
\SW[9]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(9),
	o => \SW[9]~input_o\);

ww_LEDG(0) <= \LEDG[0]~output_o\;

ww_LEDG(1) <= \LEDG[1]~output_o\;

ww_LEDG(2) <= \LEDG[2]~output_o\;

ww_LEDG(3) <= \LEDG[3]~output_o\;

ww_LEDG(4) <= \LEDG[4]~output_o\;

ww_LEDG(5) <= \LEDG[5]~output_o\;

ww_LEDG(6) <= \LEDG[6]~output_o\;

ww_LEDG(7) <= \LEDG[7]~output_o\;

ww_LEDG(8) <= \LEDG[8]~output_o\;

ww_LEDG(9) <= \LEDG[9]~output_o\;
END structure;


