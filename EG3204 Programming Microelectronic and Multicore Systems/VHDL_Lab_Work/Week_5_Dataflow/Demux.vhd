library ieee;
use ieee.std_logic_1164.all;

entity Demux is
  port (
    s0, s1 : in std_logic;
    Q0, Q1, Q2, Q3 : out std_logic
    );
end Demux;

architecture dataflow of Demux is
begin
  Q0 <= s0 nor s1;
  Q1 <= (not s0) and s1;
  Q2 <= s0 and (not s1);
  Q3 <= s0 and s1;
end dataflow;