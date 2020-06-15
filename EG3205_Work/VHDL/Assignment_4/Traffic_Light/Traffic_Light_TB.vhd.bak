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
				r1_RAG: out std_logic_vector (2 downto 0);
				r2_RAG: out std_logic_vector (2 downto 0)
			  );
	end Component;
	
	-- Initialize input signals --
	signal reset : std_logic := '0';
	signal enable :  std_logic := '0';
	signal clock : std_logic := '0';
	signal mod_value : std_logic_vector (4 downto 0) := "11011";
	signal road_1_sensor : std_logic := '0';
	signal road_2_sensor : std_logic := '0';

	--Outputs
	signal out_count: std_logic_vector (4 downto 0) := "00000";
	signal clk_div_sig : std_logic := '0';
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
		road_1_sensor <= '1';
		road_2_sensor <= '1';
      wait for 10 ns;
		reset <= '1';
		--wait until rising_edge(clock);
		--wait for 10 ns;
		--enable <= '1';
		--wait until rising_edge(clock);
		--wait for 10 ns;
		--enable <= '0';
		--wait for 10 ns;
		wait;
   end process;

end TB;	