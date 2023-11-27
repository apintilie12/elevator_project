library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity falling_edge_detector is
    Port ( input : in STD_LOGIC;
           clk : in STD_LOGIC;
           pulse : out STD_LOGIC);
end falling_edge_detector;

architecture Behavioral of falling_edge_detector is

signal q1, q2: std_logic := '0';

begin

process(clk)
begin
    if rising_edge(clk) then
        q1 <= input;
        q2 <= q1;
    end if;
end process;

pulse <= '1' when (q2 = '1' and q1 = '0') else '0';

end Behavioral;
