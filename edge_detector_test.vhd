library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity edge_detector_test is
    Port ( clk : in STD_LOGIC;
           sw : in STD_LOGIC;
           pulse : out STD_LOGIC);
end edge_detector_test;

architecture Behavioral of edge_detector_test is

component edge_detector is
port ( clk: in  std_logic;
       input: in  std_logic;
       pulse: out std_logic);
end component edge_detector;

component clk_divider is
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end component clk_divider;

signal clkdiv: std_logic;

begin

l1: clk_divider port map(clk_in => clk, clk_out => clkdiv);
l2: edge_detector port map(clk => clkdiv, input => sw, pulse => pulse);

end Behavioral;
