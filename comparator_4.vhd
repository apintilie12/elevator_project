library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity comparator_4 is
    Port ( alpha : in STD_LOGIC_VECTOR (3 downto 0);
           beta : in STD_LOGIC_VECTOR (3 downto 0);
           greater : out STD_LOGIC;
           equal : out STD_LOGIC;
           less : out STD_LOGIC);
end comparator_4;

architecture Behavioral of comparator_4 is

begin

l1: greater <= '1' when alpha > beta else '0';
l2: equal <= '1' when alpha = beta else '0';
l3: less <= '1' when alpha < beta else '0';

end Behavioral;
