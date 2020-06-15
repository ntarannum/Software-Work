library ieee;
use ieee.std_logic_1164.all;

entity halfadder is
  port (
    in1  : in std_logic;
    in2  : in std_logic;
    sum  : out std_logic;
    cout : out std_logic
    );
end halfadder;
 
architecture dataflow of halfadder is
begin
  sum <= in1 xor in2;
  cout <= in1 and in2;
end dataflow;