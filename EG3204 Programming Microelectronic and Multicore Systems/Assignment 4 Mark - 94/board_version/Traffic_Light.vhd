library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Traffic_Light is
  port (
  CLOCK : in std_logic;
  BUTTON : in std_logic_vector(2 downto 0);
  SW : in std_logic_vector(9 downto 0);
  LEDG : out std_logic_vector (9 downto 0)); 
  --clock, reset, enable, road_1_sensor, road_2_sensor : in std_logic;
  --clk_div_sig : out std_logic;
  --out_count : out std_logic_vector (4 downto 0);
  --r1_RAG : out  std_logic_vector (2 downto 0);
  --r2_RAG : out  std_logic_vector (2 downto 0));
end Traffic_Light;

architecture behavioural of Traffic_Light is
type state_type is (s0, s1, s2, s3, s4, s5);
signal current_state : state_type;

component clock_divider is
	port(
	clock : in std_logic;
	reset : in std_logic;
	clk_div : out std_logic);
end component;

signal slow_clk: std_logic;
signal en : std_logic := '0';
signal reset, enable, road_1_sensor, road_2_sensor : std_logic;
signal count, out_count : std_logic_vector (4 downto 0);
signal mod_value : std_logic_vector (4 downto 0);
signal r1_RAG, r2_RAG : std_logic_vector (2 downto 0);
signal r1_latch: std_logic; 
signal r2_latch: std_logic;

signal led_clock : std_logic := '0';


begin

reset <= BUTTON(0);
road_1_sensor <= BUTTON(1);
road_2_sensor <= BUTTON(2);
enable <= SW(0);
LEDG(2 downto 0) <= r1_RAG;
LEDG(9 downto 7) <= r2_RAG;
LEDG(4) <= r1_latch;
LEDG(5) <= r2_latch;
LEDG(6) <= led_clock;


cd: clock_divider port map (
	clock => clock,
	reset => reset,
	clk_div => slow_clk);
	
process (reset, mod_value)
begin
	if(reset = '0') then
		mod_value <= "11011";
	end if;
end process;

process (slow_clk, reset, en, mod_value)						
begin
	if(reset = '0') then
		if(en = '0') then
			count <= "00000";
		end if;
	elsif(rising_edge(slow_clk)) then
		if(en = '0') then
			if (count >= mod_value) then
				count <= "00000";
			else
				count <= count + 1;
			end if;
		elsif (en = '1') then
			count <= count;
		end if;
	end if;
end process;

--process(road_1_sensor, current_state, reset)
--begin
--	if(road_1_sensor = '0') then
--		r2_latch_count <= r2_latch_count + 1;
--		if(r2_latch_count <= "1001") then
--			r2_latch <= '1';
--		end if;
--	else
--		if(current_state = s2 or reset = '0') then
--			r2_latch_count <= "0000";
--			r2_latch <= '0';
--		end if;
--	end if;
--end process;
--
--
--process(road_2_sensor, current_state, reset)
--begin
--	if(road_2_sensor = '0') then
--		r1_latch_count <= r1_latch_count + 1;
--		if(r1_latch_count <= "1001") then
--			r1_latch <= '1';
--		end if;
--	else
--		if(current_state = s5 or reset = '0') then
--			r1_latch_count <= "0000";
--			r1_latch <= '0';
--		end if;
--	end if;
--end process;

--out_count <= count;
--clk_div_sig <= slow_clk;


--process (slow_clk, led_clock) -- was used for debugging, to check if clock divider worked
--begin
--	if(rising_edge(slow_clk)) then
--		led_clock <= not led_clock;
--	end if;
--end process;

process(road_1_sensor, reset, current_state)
begin
	if(road_1_sensor = '0') then
		r2_latch <= '1';
	else 
		if(current_state = s2) then
			r2_latch <= '0';
		elsif (reset = '0') then
			r2_latch <= '0';
		end if;
	end if;
end process;
	
process(road_2_sensor, reset, current_state)
begin
	if(road_2_sensor = '0') then
		r1_latch <= '1';
	else 
		if(current_state = s5) then
			r1_latch <= '0';
		elsif (reset = '0') then
			r1_latch <= '0';
		end if;
	end if;
end process;


process (slow_clk, reset, enable, count, current_state)						
begin
	if(reset = '0') then
		current_state <= s0;
	elsif(rising_edge(slow_clk)) then
		if (enable = '0') then
			case current_state is
				when s0 => 
					if (count >= "00001") then 
						current_state <= s1; 
					end if;
				when s1 => 
					if(r2_latch = '1') then 
						en <= '0'; 
						if (count >= "01011") then 
							current_state <= s2; 
						end if;
					else
						en <= '1';
					end if;
				when s2 => 
					if (count >= "01101") then 
						current_state <= s3; 
					end if;
				when s3 => 
					if (count >= "01111") then 
						current_state <= s4; 
					end if;
				when s4 => 
					if(r1_latch = '1') then --was 1
							en <= '0'; 						--was 0
						if (count >= "11001") then 
							current_state <= s5; 
						end if;
					else
						en <= '1';				-- was 1
					end if;
				when s5 => 
					if (count >= "11011") then 
						current_state <= s0; 
					end if;
				when others => 
					current_state <= s0;
			end case;
		elsif (enable = '1') then
			current_state <= current_state;
		end if;
	end if;
end process;


process(current_state)
begin
	case current_state is
		when s0 => 
			r1_RAG <= "110";
			r2_RAG <= "100";
		when s1 => 
			r1_RAG <= "001";
			r2_RAG <= "100";
		when s2 => 
			r1_RAG <= "010"; 
			r2_RAG <= "100";
		when s3 => 
			r1_RAG <= "100"; 
			r2_RAG <= "110";
		when s4 => 
			r1_RAG <= "100"; 
			r2_RAG <= "001";
		when s5 => 
			r1_RAG <= "100";
			r2_RAG <= "010";
		when others => 
			r1_RAG <= "110"; 
			r2_RAG <= "100"; 
	end case;
end process;
end behavioural;
