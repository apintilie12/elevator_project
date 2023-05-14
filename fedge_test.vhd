library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fedge_test is
    Port ( input : in STD_LOGIC;
           clk : in STD_LOGIC;
           pulse : out STD_LOGIC);
end fedge_test;

architecture Behavioral of fedge_test is

component falling_edge_detector is
    Port ( input : in STD_LOGIC;
           clk : in STD_LOGIC;
           pulse : out STD_LOGIC);
end component falling_edge_detector;

component clk_divider is
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end component;

signal clkdiv: std_logic;

begin

l0: clk_divider port map(clk_in => clk, clk_out => clkdiv);
l1: falling_edge_detector port map(input => input, clk => clkdiv, pulse => pulse);


end Behavioral;
