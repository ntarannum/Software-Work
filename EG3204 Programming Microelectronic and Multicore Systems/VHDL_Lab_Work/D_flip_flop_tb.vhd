-------------------------------------------------------------------------------------------
--    Project  : Design an enabled D_flip_flop with reset logic 
--    File     : D_flip_flop_tb.vhd
--    Authors  : Alistair A. McEwan and Irfan Mir
--    Company  : University of Leicester
--    Date     : 26 February 2013
-------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY D_flip_flop_tb IS
END D_flip_flop_tb;
 
ARCHITECTURE behavior OF D_flip_flop_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT D_flip_flop
    PORT(
         Clock : IN  std_logic;
         Reset : IN  std_logic;
         EN : IN  std_logic;
         D : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clock : std_logic := '0';
   signal Reset : std_logic := '0';
   signal EN : std_logic := '0';
   signal D : std_logic := '0';

 	--Outputs
   signal Q : std_logic;

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: D_flip_flop PORT MAP (
          Clock => Clock,
          Reset => Reset,
          EN => EN,
          D => D,
          Q => Q
        );

 	-- It generates clock signal with Clock_period duty cycle
	Clock <= not Clock after Clock_period/2;

   -- Stimulus process
   stim_proc: process
   begin		

      wait for 50 ns;	

      -- insert stimulus here 
		
		Reset <= '1';
      wait for 20 ns;	
		Reset <= '0';
		
		wait until rising_edge(Clock);
		EN <= '1';
		wait for 5 ns;
		D <= '1';

		wait until rising_edge(Clock);
		EN <= '1';
		wait for 5 ns;
		D <= '0';

		wait until rising_edge(Clock);
		wait until rising_edge(Clock);
		EN <= '1';
		wait for 5 ns;
		D <= '1';

		wait until rising_edge(Clock);
		EN <= '0';
		D <= '0';

		wait until rising_edge(Clock);
		EN <= '0';
		D <= '1';

		wait until rising_edge(Clock);
		EN <= '0';
		D <= '0';

      wait;
   end process;

END;
