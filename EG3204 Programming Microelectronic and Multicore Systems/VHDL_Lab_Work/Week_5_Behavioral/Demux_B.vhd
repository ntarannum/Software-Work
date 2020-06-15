library ieee;
use ieee.std_logic_1164.all;

entity Demux_B is
  port (
    s0, s1 : in std_logic;
    Q0, Q1, Q2, Q3 : out std_logic
    );
end Demux_B;

architecture behavioral of Demux_B is
begin
process(s0,s1)
	begin
	Q0 <= s0 nor s1;
	Q1 <= (not s0) and s1;
	Q2 <= s0 and (not s1);
	Q3 <= s0 and s1;
		--if (s0 = '0' and s1 = '0') then
		
			--Q0 <= '1'; Q1 <= '0'; Q2 <= '0'; Q3 <= '0';
			
		--elsif (s0 = '0' and s1 = '1') then
		
			--Q0 <= '0'; Q1 <= '1'; Q2 <= '0'; Q3 <= '0';
			
		--elsif (s0 = '1' and s1 = '0') then
		
			--Q0 <= '0'; Q1 <= '0'; Q2 <= '1'; Q3 <= '0';
			
--		elsif (s0 = '1' and s1 = '1') then
--		
--			Q0 <= '0'; Q1 <= '0'; Q2 <= '0'; Q3 <= '1';
			
--		end if;
end process;
--begin
--process(s0, s1)
--	begin
--		Q0 <= s0 nor s1;
--end process;
--
--process(s0, s1)
--	begin
--	Q1 <= (not s0) and s1;
--		--if(s0 = '0' and s1 = '1') then
--		--Q1 <= '1';
--		--end if;
--end process;
--
--process(s0, s1)
--	begin
--	Q2 <= s0 and (not s1);
--		--if(s0 = '1' and s1 = '0') then
--		--Q2 <= '1';
--		--end if;
--end process;
--
--process(s0, s1)
--	begin
--		Q3 <= s0 and s1;
--end process;

end behavioral;