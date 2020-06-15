library ieee;
USE ieee.std_logic_1164.ALL;

--// This is the TOP VHDL Test Bench file for testing a 4 Bit Modulo Counter
entity counter_TB IS
end counter_TB;

-- Architecture block of an entity where the main testing part is designed
architecture TB of counter_TB is 

	-- Component Declaration of 4-bit Modulo Counter --
	Component counter is
		port(
				clock : in std_logic;
				reset : in std_logic;
				enable : in std_logic;
				direction : in std_logic;
				mod_value : in std_logic_vector (3 downto 0);
				clk_div_sig : out std_logic;
				out_count : out std_logic_vector (3 downto 0)
			  );
	end Component;
	
	-- Initialize input signals --
	signal reset  :  std_logic := '0';
	signal enable :  std_logic := '1';
	signal clock  :  std_logic := '0';
	signal direction  :  std_logic := '1';
	signal mod_value  :  std_logic_vector (3 downto 0) := "1111";

	--Outputs
	signal out_count: std_logic_vector (3 downto 0) := "0000";
	signal clk_div_sig : std_logic := '0';
	
	-- Clock period definitions
   constant Clock_period : time := 20 ns;
	
	
begin
	-- Instantiate the component --
	uut: counter port map(
									clock => clock,
									reset => reset,
									enable => enable,
									direction => direction,
									mod_value => mod_value,
									clk_div_sig => clk_div_sig,
									out_count => out_count
                           );
	 -- It generates clock signal with Clock_period duty cycle
	clock <= not clock after Clock_period/2;
	
	 -- Stimulus process
   stim_proc: process
   begin	

	
      -- insert stimulus here 
		reset <= '1';
      wait for 20 ns;
		reset <= '0';
		wait until rising_edge(clock);
		
		for i in 0 to 64 loop
			if(i > 5 and i < 10) then
				enable <= '0';	-- testing enable
				wait for 20 ns;
			elsif(i > 10 and i < 32) then
				if(i > 20 and i < 22) then
					mod_value <= "1000";	--testing change in mod value
					reset <= '1';
					wait for 20 ns;
					reset <= '0';
				end if;
				enable <= '1';		-- enabling the counter
				direction <= '1';	-- setting to count down
				wait for 40 ns;
			elsif (i > 33 and i < 50) then
				if(i > 40 and i < 42) then
					mod_value <= "1111";	--testing change in mod value
					reset <= '1';
					wait for 20 ns;
					reset <= '0';
				end if;
				direction <= '0'; --changing the direction to counting up
				wait for 40 ns;
			elsif (i > 55) then
				mod_value <= "0101"; -- changing the mod value without it immediately being changed as there is no reset
				direction <= '1';	-- changing the direction to counting down
			end if;
			wait until rising_edge(clock);
		end loop;
   end process;

end TB;	