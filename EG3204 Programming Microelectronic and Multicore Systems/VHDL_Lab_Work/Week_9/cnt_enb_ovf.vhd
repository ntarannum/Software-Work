-------------------------------------------------------------------------------------------
--    Project  : Programmable Up/Down Counter Design 
--    File     : cnt_enb_ovf.vhd
--    Authors  : Alistair A. McEwan and Irfan Mir
--    Company  : University of Leicester
--    Date     : 20 March 2013
-------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cnt_enb_ovf is
	GENERIC(WIDTH : integer := 4; 
           LIMIT : integer := 16); 
	PORT (
			Clock	  : IN	STD_LOGIC;
			Reset	  : IN	STD_LOGIC;
			EN      : IN	STD_LOGIC;
			OVF	  : OUT	STD_LOGIC;
			Count   : OUT	STD_LOGIC_VECTOR(WIDTH-1 downto 0)
		  );
end cnt_enb_ovf;

architecture Behavioral of cnt_enb_ovf is

signal cnt : STD_LOGIC_VECTOR(WIDTH-1 downto 0);

begin

PC: process (Clock, Reset)						
	 begin
		if rising_edge(Clock) then
			if Reset = '0' then
				cnt <= (others => '0');
				OVF <= '0';
			elsif EN = '1' then
				if cnt = LIMIT-1 then
					cnt <= (others => '0');
					OVF <= '1';
				else
					cnt <= cnt+1;
					OVF <= '0';
				end if;
			else
				cnt <= cnt;
				OVF <= '0';
			end if;			
		end if;
	 end process;
	 
	 Count <= cnt;

end Behavioral;