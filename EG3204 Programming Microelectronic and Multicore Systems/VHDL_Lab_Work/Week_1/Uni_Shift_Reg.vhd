-------------------------------------------------------------------------------------------
--    Project  : Universal Shift Register Design in VHDL 
--    File     : Uni_Shift_Reg.vhd
--    Authors  : Alistair A. McEwan and Irfan Mir
--    Company  : University of Leicester
--    Date     : 30 January 2014
-------------------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

-- TOP VHDL design which implements a 8-bit Universal Shift Register
entity Uni_Shift_Reg is
  port (
    CLOCK	: in	std_logic;                      -- CLOCK input signal
    BUTTON	: in	std_logic_vector(2 downto 0);   -- 3-bit Push Button input port
    SW		: in	std_logic_vector(9 downto 0);   -- 10-bit Switch input port
    LEDG	: out	std_logic_vector(9 downto 0));     -- 10-bits LED output port
end entity Uni_Shift_Reg;
--// End of entity

--// This is an architecture of 4-bits universal shift register 
architecture RTL of Uni_Shift_Reg is
  signal Din, Dout, unishftreg8 : std_logic_vector(7 downto 0); -- Internal signal declaration
  signal Clk1sec_cnt : std_logic_vector(31 downto 0);
  signal Reset, Load, SIL, SIR, Clk1sec : std_logic;
  
  constant PERIOD : integer := 6250000;
  
begin

	Reset <= BUTTON(0);
	Load <= BUTTON(2);
	SIL <= SW(9);
	SIR <= SW(8);
	Din <= SW(7 downto 0);
	LEDG(7 downto 0) <= Dout;

	process(CLOCK, Reset)
	begin
		if Reset = '0' then
			Clk1sec_cnt <= (others => '0');
			Clk1sec <= '0';
		elsif rising_edge(CLOCK) then
			if Clk1sec_cnt = PERIOD - 1 then
				Clk1sec_cnt <= (others => '0');
				Clk1sec <= NOT (Clk1sec);
			else
				Clk1sec_cnt <= Clk1sec_cnt+1;
				Clk1sec <= Clk1sec;
			end if;
		end if;
	end process;

  process(Clk1sec, Reset)
  begin
    if Reset = '0' then
      unishftreg8 <= (others => '0');
    elsif rising_edge(Clk1sec) then
      if Load = '0' then
        unishftreg8 <= Din;
      elsif SIL = '1' then
        unishftreg8 <= unishftreg8(6 downto 0) & unishftreg8(7);
      elsif SIR = '1' then
        unishftreg8 <= unishftreg8(0) & unishftreg8(7 downto 1);
      else
        unishftreg8 <= unishftreg8;
      end if;
    end if;
  end process;
 
  Dout <= unishftreg8; 

end RTL;
-- End of architectural block