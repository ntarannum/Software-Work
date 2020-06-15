library ieee;
use ieee.std_logic_1164.all;

entity fulladder_2bit is
  port (
    A, B : in std_logic_vector (1 downto 0);
	 Cin : in std_logic;
	 Sum : out std_logic_vector (1 downto 0);
	 Cout : out std_logic);
end fulladder_2bit;

architecture structural of fulladder_2bit is
component fulladder_1bit is
	port(
	Din1, Din2, Cin: in std_logic;
   Cout, Dout : out std_logic);
end component;

signal carry: std_logic := '0';
begin

U1: fulladder_1bit port map (
	Din1 => A(0), 
	Din2 => B(0),
	Cout => carry,
	Cin => Cin,
	Dout => Sum(0));

U2: fulladder_1bit port map (
	Din1 => A(1), 
	Din2 => B(1),
	Cin => carry,
	Cout => Cout,
	Dout => Sum(1));

end structural;


