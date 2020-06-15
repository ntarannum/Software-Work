-------------------------------------------------------------------------------------------
--    Project  : Universal Shift Register Design in VHDL 
--    File     : Uni_Shift_Reg_TB.vhd
--    Authors  : Alistair A. McEwan and Irfan Mir
--    Company  : University of Leicester
--    Date     : 30 January 2014
-------------------------------------------------------------------------------------------

library ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;

-- TOP VHDL Test Bench file for testing a 8-bit Universal Shift Register
entity Uni_Shift_Reg_TB IS
end Uni_Shift_Reg_TB;

-- Architecture block of a test bench
architecture TB of Uni_Shift_Reg_TB is 

	-- Component Declaration of 8-bit Universal Shift Register --
	Component Uni_Shift_Reg
	port(
		CLOCK	: in	std_logic;
		BUTTON	: in	std_logic_vector(2 downto 0);
		SW    	: in	std_logic_vector(9 downto 0);          
		LEDG   	: out	std_logic_vector(9 downto 0)
	    );
	end Component;

	-- Initialize input signals --
	signal CLOCK  :  std_logic := '0';
	signal BUTTON   :  std_logic_vector(2 downto 0) := "111";
	signal SW    	:  std_logic_vector(9 downto 0) := (others=>'0');

	--Outputs
	signal LEDG    :  std_logic_vector(9 downto 0);
	
	-- Local variable declarations
	signal index :  std_logic_vector(7 downto 0) := (others=>'0');
	
begin
	-- Instantiate the component --
	Uni_Shift_Reg_inst: Uni_Shift_Reg port map
											(
											CLOCK => CLOCK,
											BUTTON => BUTTON,
											SW => SW,
											LEDG => LEDG
											);
	
	-- It generates CLOCK signal having 50MHz frequency with 50% duty cycle
	CLOCK <= not CLOCK after 50 ns;
	
	-- Test driver block
	process
	begin
	
   	BUTTON(0) <= '0';
	   wait for 170 ns;  -- Wait for 170 nsec for reset signal
   	BUTTON(0) <= '1';
                 
      wait until CLOCK = '1' and CLOCK'event; -- Wait for one CLOCK cycle
      	   
      BUTTON(2) <= '0';   -- Here we load input data
      SW(7 downto 0) <= "00000001";    -- Initial value of SW

      wait for 200 ns;  -- Wait for 200 nsec
      wait until CLOCK = '1' and CLOCK'event; -- Wait for one CLOCK cycle

      -- This is for SIL
      BUTTON(2) <= '1';
      SW(9) <= '1';   -- Perform circular left shift
      for index in 0 to 14 loop
         wait until CLOCK = '1' and CLOCK'event; -- Wait for one CLOCK cycle
      end loop;
                 
      wait until CLOCK = '1' and CLOCK'event; -- Wait for one CLOCK cycle

      -- This is for SIR
      BUTTON(2) <= '1';
      SW(9) <= '0';
      SW(8) <= '1';   -- Perform circular right shift
      for index in 0 to 14 loop
         wait until CLOCK = '1' and CLOCK'event; -- Wait for one CLOCK cycle
      end loop;

      wait for 50 ns;

      BUTTON(2) <= '1';
	  
	  SW <= "0000000000";
           
	  wait for 100 ns;
	   
	  report "All the test cases has been completed." severity FAILURE;
	   
	  wait;
	end process;
	-- End of process block

END;
-- End of architecture block