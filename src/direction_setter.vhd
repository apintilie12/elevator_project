library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity direction_setter is
    Port ( qu : in STD_LOGIC_VECTOR (3 downto 0);
           qd : in STD_LOGIC_VECTOR (3 downto 0);
           j : out STD_LOGIC;
           k : out STD_LOGIC);
end direction_setter;

architecture Behavioral of direction_setter is

begin

j <= '1' when (qd = "0000" and qu /= "0000") else '0';
k <= '1' when (qu = "0000" and qd /= "0000") else '0';

end Behavioral;
