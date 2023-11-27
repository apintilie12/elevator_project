library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_comparison is
    Port ( clk_in : in STD_LOGIC;
           clk1 : out STD_LOGIC;
           clk033 : out STD_LOGIC);
end clk_comparison;

architecture Behavioral of clk_comparison is

component clk_divider is
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end component clk_divider;

component clk033hz is
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end component clk033hz;

begin

l1: clk_divider port map(clk_in => clk_in, clk_out => clk1);
l2: clk033hz port map(clk_in => clk_in, clk_out => clk033);

end Behavioral;
