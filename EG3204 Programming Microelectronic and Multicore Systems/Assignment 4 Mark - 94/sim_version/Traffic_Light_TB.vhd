library ieee;
USE ieee.std_logic_1164.ALL;

--// This is the TOP VHDL Test Bench file for testing a Traffic Light Controller
entity Traffic_Light_TB IS
end Traffic_Light_TB;

-- Architecture block of an entity where the main testing part is designed
architecture TB of Traffic_Light_TB is 

	-- Component Declaration of Traffic Light Controller --
	Component Traffic_Light is
		port(
				clock : in std_logic;
				reset : in std_logic;
				enable : in std_logic;
				road_1_sensor : in std_logic;
				road_2_sensor : in std_logic;
				clk_div_sig : out std_logic;
				out_count : out std_logic_vector (4 downto 0);
				--latch1 : out std_logic;
				--latch2 : out std_logic;
				r1_RAG: out std_logic_vector (2 downto 0);
				r2_RAG: out std_logic_vector (2 downto 0)
			  );
	end Component;
	
	-- Initialize input signals --
	signal reset : std_logic := '0';
	signal enable :  std_logic := '0';
	signal clock : std_logic := '0';
	signal mod_value : std_logic_vector (4 downto 0) := "11011";
	signal road_1_sensor : std_logic := '1';
	signal road_2_sensor : std_logic := '1';

	--Outputs
	signal out_count: std_logic_vector (4 downto 0) := "00000";
	signal clk_div_sig : std_logic := '0';
	--signal latch1 : std_logic := '0';
	--signal latch2 : std_logic := '0';
	signal r1_RAG : std_logic_vector (2 downto 0) := "110";
	signal r2_RAG : std_logic_vector (2 downto 0) := "100";
	
	-- Clock period definitions
   constant Clock_period : time := 20 ns;
	
	
begin
	-- Instantiate the component --
	uut: Traffic_Light port map(
									clock => clock,
									reset => reset,
									enable => enable,
									road_1_sensor => road_1_sensor,
									road_2_sensor => road_2_sensor,
									clk_div_sig => clk_div_sig,
									out_count => out_count,
									--latch1 => latch1,
									--latch2 => latch2,
									r1_RAG => r1_RAG,
									r2_RAG => r2_RAG
                           );
	 -- It generates clock signal with Clock_period duty cycle
	clock <= not clock after Clock_period/2;
	
	 -- Stimulus process
   stim_proc: process
   begin
	
	-- insert stimulus here 
		reset <= '0';
		enable <= '0';
		wait for 10 ns;
		reset <= '1';
      wait for 10 ns;
		road_1_sensor <= '0'; -- both of the latches are pressed
		road_2_sensor <= '0';
			
		
		assert(r1_RAG /= "110" and r2_RAG /= "100") report "state change s0 to s1 successful" severity note;
		wait until out_count = "00010";
		assert(r1_RAG /= "001" and r2_RAG /= "100") report "state change s1 to s2 successful" severity note;
		wait until out_count = "01100";
		assert(r1_RAG /= "010" and r2_RAG /= "100") report "state change s2 to s3 successful" severity note;
		wait until out_count = "01110";
		
		enable <= '1';
		report "count disabled";
		wait for 60 ns;
		enable <= '0';
		report "count enabled";
		
		assert(r1_RAG /= "100" and r2_RAG /= "110") report "state change s3 to s4 transition successful" severity note;
		wait until out_count = "10000";
		assert(r1_RAG /= "100" and r2_RAG /= "001") report "state change s4 to s5 successful" severity note;
		wait until out_count = "11010";
		assert(r1_RAG /= "100" and r2_RAG /= "010") report "state change s5 to s0 successful" severity note;
		wait until out_count = "00000";
		
		road_1_sensor <= '1'; -- both of the latches are not pressed
		road_2_sensor <= '1';
		wait until out_count = "00010";
		if(out_count > "00010") then
			report "latch 1 did not de latch" severity failure;
		else
			report "latch 1 passed de latch test";
		end if;
		
		wait for 40 ns;
		reset <= '0';
		wait for 10 ns;
		reset <= '1';
		
		road_1_sensor <= '1'; -- 1 latch is pressed
		road_2_sensor <= '0';
		wait until out_count = "00010";
		if(out_count > "00010") then
			report "latch 2 does affect road 1" severity failure;
		else
			report "latch 2 doesn't affect road 1";
		end if;
		
		wait for 40 ns;
		reset <= '0';
		wait for 10 ns;
		reset <= '1';
		
		road_1_sensor <= '0'; -- 2 latch is pressed
		road_2_sensor <= '1';
		wait until out_count = "10000";
		if(out_count > "10000") then
			report "latch 1 does affect road 2" severity failure;
		else
			report "latch 1 doesn't affect road 2";
		end if;
		
		wait;
   end process;

end TB;	