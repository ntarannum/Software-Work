library ieee;
use ieee.std_logic_1164.all;

ENTITY D_flip_flop IS
  PORT (
    Clock : IN  std_logic;
    Reset : IN  std_logic;
    EN : IN  std_logic;
    D : IN  std_logic;
    Q : OUT  std_logic);
END D_flip_flop;
 
ARCHITECTURE Behavioral OF D_flip_flop IS
BEGIN

PROCESS(Clock, Reset)
	BEGIN
	IF(Reset='1') THEN
		Q <='0';
	ELSIF(rising_edge(Clock) and EN='1') THEN
		Q <= D;
	END IF;
END PROCESS;
END Behavioral;

