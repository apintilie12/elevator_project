library ieee;
use ieee.std_logic_1164.all;

entity edge_detector is
port ( clk: in  std_logic;
       input: in  std_logic;
       pulse: out std_logic);
end edge_detector;

architecture rtl of edge_detector is
signal r0_input: std_logic := '0';
signal r1_input: std_logic := '0';

begin

process(clk)
begin
  if rising_edge(clk) then
    r0_input           <= input;
    r1_input           <= r0_input;
  end if;
end process p_rising_edge_detector;

pulse            <=  r1_input xor r0_input;

end rtl;