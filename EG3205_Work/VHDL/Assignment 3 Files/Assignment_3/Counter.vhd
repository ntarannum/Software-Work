library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter is
  port (
  clock, reset, enable, direction : in  std_logic;
  mod_value : in std_logic_vector (3 downto 0);
  clk_div_sig: out std_logic;
  out_count : out  std_logic_vector (3 downto 0));
end counter;

architecture behavioural of counter is
component clock_divider is
	port(
	clock : in std_logic;
	reset : in std_logic;
	clk_div : out std_logic);
end component;

signal slow_clk : std_logic;
signal count, temp_mod : std_logic_vector (3 downto 0);

begin
cd: clock_divider port map (
	clock => clock,
	reset => reset,
	clk_div => slow_clk);
	
process (slow_clk, reset)
	begin
		if (rising_edge(slow_clk) and reset='1') then
			temp_mod <= mod_value;
		end if;
end process;
	

process (slow_clk, direction, enable, reset, temp_mod, count)						
begin
	if (rising_edge(slow_clk)) then
		if(reset = '1') then
			count <= "0000";
		elsif(direction='0' and enable='1') then
			if (count >= temp_mod) then
				count <= "0000";
			else
				count <= count + 1;
			end if;
		elsif (direction='1' and enable='1') then
			if (count = "0000") then
				count <= temp_mod;
			else
				count <= count - 1;
			end if;
		elsif (enable='0') then
			count <= count;
		end if;
	end if;
end process;

out_count <= count;
clk_div_sig <= slow_clk;

end behavioural;

				
				
			
			
		

