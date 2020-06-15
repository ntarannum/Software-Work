library ieee;
use ieee.std_logic_1164.all;


ENTITY D_flip_flop_4_bit IS
  PORT (
    Clock, Reset, EN : IN  std_logic;
    Din : IN  std_logic_vector (3 DOWNTO 0);
    Dout : OUT  std_logic_vector (3 DOWNTO 0));
END D_flip_flop_4_bit;

ARCHITECTURE Behavioural OF D_flip_flop_4_bit IS
COMPONENT D_flip_flop IS
	port(
	Clock : IN  std_logic;
   Reset : IN  std_logic;
   EN : IN  std_logic;
   D : IN  std_logic;
   Q : OUT  std_logic);
END COMPONENT;

BEGIN
U1: D_flip_flop PORT MAP (
	Clock => Clock,
	Reset => Reset,
	EN => EN,
	D => Din(0),
	Q => Dout(0)
	);

U2: D_flip_flop PORT MAP (
	Clock => Clock,
	Reset => Reset,
	EN => EN,
	D => Din(1),
	Q => Dout(1)
	);
	
U3: D_flip_flop PORT MAP (
	Clock => Clock,
	Reset => Reset,
	EN => EN,
	D => Din(2),
	Q => Dout(2)
	);
	
U4: D_flip_flop PORT MAP (
	Clock => Clock,
	Reset => Reset,
	EN => EN,
	D => Din(3),
	Q => Dout(3)
	);
END Behavioural;

