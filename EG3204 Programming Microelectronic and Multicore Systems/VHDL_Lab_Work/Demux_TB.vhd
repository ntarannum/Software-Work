library ieee;
USE ieee.std_logic_1164.ALL;

--// This is the TOP VHDL Test Bench file for testing a half adder
entity Demux_TB IS
end Demux_TB;

-- Architecture block of an entity where the main testing part is designed
architecture TB of Demux_TB is 

	-- Component Declaration of 4-bit Universal Shift Register --
	Component Demux
		port(
				s0 : in std_logic;
				s1 : in std_logic;
				Q0 : out std_logic;
				Q1 : out std_logic;
				Q2 : out std_logic;
				Q3 : out std_logic
			  );
	end Component;

	-- Initialize input signals --
	signal s0  :  std_logic := '0';
	signal s1  :  std_logic := '0';

	--Outputs
	signal Q0, Q1, Q2, Q3 : std_logic;
	
begin
	-- Instantiate the component --
	Demux_inst: Demux port map(
													s0 => s0,
													s1 => s1,
													Q0 => Q0,
													Q1 => Q1,
													Q2 => Q2,
													Q3 => Q3
                                      );
	
	-- Test driver where the stimulus is generated
	process
	begin
      	   
      	s0 <= '0';   -- Here load 1st input data
      	s1 <= '0';   -- Here load 2nd input data
      	wait for 10ns; -- Wait for some time to see the output

      	s0 <= '1';   -- Here load 1st input data
      	s1 <= '0';   -- Here load 2nd input data
      	wait for 10ns; -- Wait for some time to see the output
           
      	s0 <= '0';   -- Here load 1st input data
      	s1 <= '1';   -- Here load 2nd input data
      	wait for 10ns; -- Wait for some time to see the output

      	s0 <= '1';   -- Here load 1st input data
      	s1 <= '1';   -- Here load 2nd input data
      	wait for 10ns; -- Wait for some time to see the output

      	s0 <= '0';   -- Here load 1st input data
      	s1 <= '0';   -- Here load 2nd input data
      	wait for 10ns; -- Wait for some time to see the output

	wait; -- will wait forever

	end process;
	-- End of process block

END;
-- End of architecture block