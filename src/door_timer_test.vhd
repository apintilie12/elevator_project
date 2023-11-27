library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity door_timer_test is
    Port ( start : in STD_LOGIC;
           clk : in STD_LOGIC;
           active : out STD_LOGIC);
end door_timer_test;

architecture Behavioral of door_timer_test is

component door_open_timer is
    Port ( start : in STD_LOGIC;
           clk : in STD_LOGIC;
           active : out STD_LOGIC);
end component door_open_timer;

component clk_divider is
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end component;
signal clkdiv: std_logic;


begin

l0: clk_divider port map(clk_in => clk, clk_out => clkdiv);
l1: door_open_timer port map(start => start, clk => clkdiv, active => active);

end Behavioral;
