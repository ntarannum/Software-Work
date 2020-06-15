-------------------------------------------------------------------------------------------
--    Project  : Designing a Half Adder
--    File     : HalfAdder_TB.vhd
--    Authors  : Alistair A. McEwan and Irfan Mir
--    Company  : University of Leicester
--    Date     : 12 February 2013
-------------------------------------------------------------------------------------------

library ieee;
USE ieee.std_logic_1164.ALL;

--// This is the TOP VHDL Test Bench file for testing a half adder
entity HalfAdder_TB IS
end HalfAdder_TB;

-- Architecture block of an entity where the main testing part is designed
architecture TB of HalfAdder_TB is 

	-- Component Declaration of 4-bit Universal Shift Register --
	Component HalfAdder
		port(
				in1  : in std_logic;
				in2  : in std_logic;
				sum  : out std_logic;
				cout : out std_logic
			  );
	end Component;

	-- Initialize input signals --
	signal in1  :  std_logic := '0';
	signal in2  :  std_logic := '0';

	--Outputs
	signal sum, cout : std_logic;
	
begin
	-- Instantiate the component --
	HalfAdder_inst: HalfAdder port map(
													in1 => in1,
													in2 => in2,
													sum => sum,
													cout => cout
                                      );
	
	-- Test driver where the stimulus is generated
	process
	begin
      	   
      	in1 <= '0';   -- Here load 1st input data
      	in2 <= '0';   -- Here load 2nd input data
      	wait for 10ns; -- Wait for some time to see the output

      	in1 <= '1';   -- Here load 1st input data
      	in2 <= '0';   -- Here load 2nd input data
      	wait for 10ns; -- Wait for some time to see the output
           
      	in1 <= '0';   -- Here load 1st input data
      	in2 <= '1';   -- Here load 2nd input data
      	wait for 10ns; -- Wait for some time to see the output

      	in1 <= '1';   -- Here load 1st input data
      	in2 <= '1';   -- Here load 2nd input data
      	wait for 10ns; -- Wait for some time to see the output

      	in1 <= '0';   -- Here load 1st input data
      	in2 <= '0';   -- Here load 2nd input data
      	wait for 10ns; -- Wait for some time to see the output

	wait; -- will wait forever

	end process;
	-- End of process block

END;
-- End of architecture block