-------------------------------------------------------------------------------------------
--    Project  : Digital Watch Design 
--    File     : Digital_Watch.vhd
--    Authors  : Alistair A. McEwan and Irfan Mir
--    Company  : University of Leicester
--    Date     : 17 March 2014
-------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity Digital_Watch is
    port(
		Clock    :   IN    STD_LOGIC;
		Reset    :   IN    STD_LOGIC;
		Enable	 :   IN    STD_LOGIC;
		
		HEX0	 :   OUT   STD_LOGIC_VECTOR(7 downto 0);
		HEX1	 :   OUT   STD_LOGIC_VECTOR(7 downto 0);
		HEX2	 :   OUT   STD_LOGIC_VECTOR(7 downto 0);
		HEX3	 :   OUT   STD_LOGIC_VECTOR(7 downto 0)
		);
end Digital_Watch;

architecture Behavioral of Digital_Watch is

component Clock_Divider is
	GENERIC(LIMIT : integer := 2); 
	PORT (
			Clock	  : IN	STD_LOGIC;
			Reset	  : IN	STD_LOGIC;
			Clk_Div : OUT	STD_LOGIC
		  );
end component;

component cnt_enb_ovf is
	GENERIC(WIDTH : integer := 4; 
           LIMIT : integer := 16); 
	PORT (
			Clock	  : IN	STD_LOGIC;
			Reset	  : IN	STD_LOGIC;
			EN      : IN	STD_LOGIC;
			OVF	  : OUT	STD_LOGIC;
			Count   : OUT	STD_LOGIC_VECTOR(WIDTH-1 downto 0)
		  );
end component;

component SevenSeg_Driver
			PORT(
				Enable     :   IN   STD_LOGIC;
                Binary_Din :   IN   STD_LOGIC_VECTOR (3 downto 0);
                Dec_Out    :   OUT  STD_LOGIC_VECTOR (7 downto 0)
				);
end component;


begin


end Behavioral;