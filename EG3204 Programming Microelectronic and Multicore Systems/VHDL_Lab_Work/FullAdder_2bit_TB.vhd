-------------------------------------------------------------------------------------------
--    Project  : Designing a 2-bit Full Adder
--    File     : FullAdder_2bit_TB.vhd
--    Authors  : Alistair A. McEwan and Irfan Mir
--    Company  : University of Leicester
--    Date     : 18 February 2013
-------------------------------------------------------------------------------------------

library ieee;
USE ieee.std_logic_1164.ALL;

--// This is the TOP VHDL Test Bench file for testing 2-bit full adder
entity FullAdder_2bit_TB IS
end FullAdder_2bit_TB;

-- Architecture block of an entity where the main testing part is designed
architecture TB of FullAdder_2bit_TB is 

	-- Component Declaration of 2-bit full adder --
	component FullAdder_2bit is
		PORT(
				A, B : IN STD_LOGIC_VECTOR(1 downto 0);
				 Cin : IN STD_LOGIC;
				 Sum : OUT STD_LOGIC_VECTOR(1 downto 0);
				Cout : OUT STD_LOGIC
			  );
	end component;

	-- Initialize input signals --
	signal A   :  STD_LOGIC_VECTOR(1 downto 0) := "00";
	signal B   :  STD_LOGIC_VECTOR(1 downto 0) := "00";
	signal Cin :  STD_LOGIC := '0';

	--Outputs
	signal Sum  : STD_LOGIC_VECTOR(1 downto 0);
	signal Cout : STD_LOGIC;
	
begin
	-- Instantiate the component --
	FullAdder_2bit_inst: FullAdder_2bit port map(
																 A => A,
																 B => B,
																 Cin => Cin,
																 Sum => Sum,
																 Cout => Cout
															   );
	
	-- Test driver where the stimulus is generated
	process
	begin
      	   
     	A <= "00";     -- Here load 1st input data
     	B <= "00";     -- Here load 2nd input data
     	Cin <= '0';    -- Here load carry input data
     	wait for 10ns; -- Wait for some time to see the output

     	A <= "01";     -- Here load 1st input data
     	B <= "10";     -- Here load 2nd input data
     	Cin <= '0';    -- Here load carry input data
     	wait for 10ns; -- Wait for some time to see the output

     	A <= "11";     -- Here load 1st input data
     	B <= "01";     -- Here load 2nd input data
     	Cin <= '0';    -- Here load carry input data
     	wait for 10ns; -- Wait for some time to see the output

     	A <= "10";     -- Here load 1st input data
     	B <= "10";     -- Here load 2nd input data
     	Cin <= '0';    -- Here load carry input data
     	wait for 10ns; -- Wait for some time to see the output

     	A <= "01";     -- Here load 1st input data
     	B <= "01";     -- Here load 2nd input data
     	Cin <= '0';    -- Here load carry input data
     	wait for 10ns; -- Wait for some time to see the output

     	A <= "00";     -- Here load 1st input data
     	B <= "00";     -- Here load 2nd input data
     	Cin <= '0';    -- Here load carry input data
     	wait for 10ns; -- Wait for some time to see the output

	wait; -- will wait forever

	end process;
	-- End of process block

end;
-- End of architecture block