-------------------------------------------------------------------------------------------
--    Project  : Designing a 1-bit Full Adder using two Half Adders
--    File     : FullAdder_1bit_TB.vhd
--    Authors  : Alistair A. McEwan and Irfan Mir
--    Company  : University of Leicester
--    Date     : 18 February 2013
-------------------------------------------------------------------------------------------

library ieee;
USE ieee.std_logic_1164.ALL;

--// This is the TOP VHDL Test Bench file for testing a full adder
entity FullAdder_1bit_TB IS
end FullAdder_1bit_TB;

-- Architecture block of an entity where the main testing part is designed
architecture TB of FullAdder_1bit_TB is 

	-- Component Declaration of 1-bit full adder --
	Component FullAdder_1bit is
		PORT(
				Din1, Din2, Cin  : IN STD_LOGIC;
				Dout, Cout : OUT STD_LOGIC
			 );
	end Component;

	-- Initialize input signals --
	signal Din1  :  STD_LOGIC := '0';
	signal Din2  :  STD_LOGIC := '0';
	signal Cin   :  STD_LOGIC := '0';

	--Outputs
	signal Dout, Cout : STD_LOGIC;
	
begin
	-- Instantiate the component --
	FullAdder_1bit_inst: FullAdder_1bit port map(
													Din1 => Din1,
													Din2 => Din2,
													 Cin => Cin,
													Dout => Dout,
													Cout => Cout
                                      );
	
	-- Test driver where the stimulus is generated
	process
	begin
      	   
     	Din1 <= '0';   -- Here load 1st input data
     	Din2 <= '0';   -- Here load 2nd input data
     	Cin <= '0';   -- Here load carry input data
     	wait for 10ns; -- Wait for some time to see the output

     	Din1 <= '1';   -- Here load 1st input data
     	Din2 <= '0';   -- Here load 2nd input data
     	Cin <= '0';   -- Here load carry input data
     	wait for 10ns; -- Wait for some time to see the output

     	Din1 <= '0';   -- Here load 1st input data
     	Din2 <= '1';   -- Here load 2nd input data
     	Cin <= '0';   -- Here load carry input data
     	wait for 10ns; -- Wait for some time to see the output

     	Din1 <= '0';   -- Here load 1st input data
     	Din2 <= '0';   -- Here load 2nd input data
     	Cin <= '1';   -- Here load carry input data
     	wait for 10ns; -- Wait for some time to see the output

     	Din1 <= '1';   -- Here load 1st input data
     	Din2 <= '1';   -- Here load 2nd input data
     	Cin <= '1';   -- Here load carry input data
     	wait for 10ns; -- Wait for some time to see the output

     	Din1 <= '0';   -- Here load 1st input data
     	Din2 <= '1';   -- Here load 2nd input data
     	Cin <= '1';   -- Here load carry input data
     	wait for 10ns; -- Wait for some time to see the output

     	Din1 <= '0';   -- Here load 1st input data
     	Din2 <= '0';   -- Here load 2nd input data
     	Cin <= '0';   -- Here load carry input data
     	wait for 10ns; -- Wait for some time to see the output

	wait; -- will wait forever

	end process;
	-- End of process block

END;
-- End of architecture block