library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter is
  port (
  CLOCK : in  std_logic;
  BUTTON	: in	std_logic_vector(2 downto 0);   				-- 3-bit Push Button input port
  SW		: in	std_logic_vector(9 downto 0);   				-- 10-bit Switch input port
  LEDG	: out	std_logic_vector(9 downto 0)     			-- 10-bits LED output port
  );
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
signal mod_in : std_logic_vector (3 downto 0);
signal reset, enable, direction : std_logic;
signal Dout : std_logic_vector (3 downto 0);

--signal led_clock : std_logic := '0'; -- again was used to see if the clock divider was functioning

begin

	reset <= BUTTON(0);
	mod_in <= SW(3 downto 0);
	enable <= SW(4);
	direction <= SW(5);
	LEDG(3 downto 0) <= Dout;

-- LEDG(8) <= led_clock; -- again was used to see the LED if the clock divider was functioning correctly

cd: clock_divider 
port map (
	clock => clock,
	reset => reset,
	clk_div => slow_clk);
	
process (slow_clk, reset)
	begin
		if (reset='1') then
			temp_mod <= mod_in;
		end if;
end process;

--process (slow_clk, led_clock) -- was used for debugging, to check if clock divider worked
--begin
	--if(rising_edge(slow_clk)) then
		--led_clock <= not led_clock;
	--end if;
--end process;

process (slow_clk, reset)						
begin
	if(reset = '0') then
		count <= "0000";
		elsif(rising_edge(slow_clk)) then
			if(direction='0') then
				if(enable='1') then
					if (count >= temp_mod) then
						count <= "0000";
					else
						count <= count + 1;
					end if;
				end if;
		elsif (direction='1') then
				if (enable='1') then
					if (count = "0000") then
						count <= temp_mod;
					else
						count <= count - 1;
					end if;
				end if;
		elsif (enable='0') then
			count <= count;
		end if;
	end if;
end process;

Dout <= count;

end behavioural;
				
				
			
			
		

