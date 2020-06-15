library ieee;
use ieee.std_logic_1164.all;

entity fulladder_1bit is
  port (
    Din1, Din2, Cin: in std_logic;
    Cout, Dout : out std_logic);
end fulladder_1bit;
 
architecture structural of fulladder_1bit is
component halfadder is
	port(
	in1, in2: in std_logic;
	sum, cout: out std_logic);
end component;
	
signal s1, c2, c1: std_logic;
begin
ha1: halfadder port map (
	in1 => Din1,
	in2 => Din2,
	sum => s1,
	cout => c2);
ha2: halfadder port map (
	in1 => s1,
	in2 => Cin,
	sum => Dout,
	cout => c1);
 
Cout <= c1 or c2;

end structural;







