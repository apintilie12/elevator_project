library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity switch_conversion_test is
    Port ( switch : in STD_LOGIC;
           clk : in STD_LOGIC;
           led : out STD_LOGIC);
end switch_conversion_test;

architecture Behavioral of switch_conversion_test is

component t_flip_flop is
    Port ( t : in STD_LOGIC;
           clk : in STD_LOGIC;
           q : out STD_LOGIC := '0');
end component t_flip_flop;

component edge_detector is
port ( clk: in  std_logic;
       input: in  std_logic;
       pulse: out std_logic := '0');
end component edge_detector;

signal iPulse: std_logic;

begin

l1: edge_detector port map (clk => clk, input => switch, pulse => iPulse);
l2: t_flip_flop port map(clk => clk, t => iPulse, q => led);

end Behavioral;
