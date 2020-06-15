library ieee;
USE ieee.std_logic_1164.ALL;

--// This is the TOP VHDL Test Bench file for testing a half adder
entity counter_TB IS
end counter_TB;

-- Architecture block of an entity where the main testing part is designed
architecture TB of counter_TB is 

	-- Component Declaration of 4-bit Universal Shift Register --
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
	signal direction  :  std_logic := '0';
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

      --wait for 50 ns;	

      -- insert stimulus here 
		
		reset <= '1';
      wait for 20 ns;	--if thou reset is not long'th enough'ous then ur clock div will not go to zero
		reset <= '0';
		--wait for 20 ns;
		--wait for 10 ns;
		--direction <= '1';
		--wait for 10 ns;
		wait until rising_edge(clock);
		for i in 0 to 64 loop
			--direction <= '0';
			if(i > 16 and i < 32) then
				enable <= '1';
				direction <= '1';
				wait for 40 ns;
			elsif (i > 33) then
				--enable <= '1';
				direction <= '0';
				wait for 40 ns;
			elsif (i > 43) then
				enable <= '0';
			end if;
			wait until rising_edge(clock);
		end loop;
		
		
		--for i in 0 to 64 loop
         --wait until clock = '1' and clock'event; -- Wait for one CLOCK cycle
			--direction <= '0';
			--if (i >= 32) then
				--direction <= '1';
			--end if;
			--wait until rising_edge(clock);
      --end loop;
		
		--why does the wait break everything?
      --wait;
   end process;


	
end TB;	