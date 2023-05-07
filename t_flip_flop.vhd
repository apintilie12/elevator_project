library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity t_flip_flop is
    Port ( t : in STD_LOGIC;
           clk : in STD_LOGIC;
           q : out STD_LOGIC := '0');
end t_flip_flop;

architecture Behavioral of t_flip_flop is

signal iQ: std_logic := '0';

begin

process(clk)
begin
    if rising_edge(clk) and t = '1' then
        iQ <= not iQ;
    end if;
end process;

q <= iQ;

end Behavioral;
