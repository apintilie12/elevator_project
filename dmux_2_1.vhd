library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dmux_2_1 is
    Port ( inp : in STD_LOGIC;
           sel: in STD_LOGIC;
           out1 : out STD_LOGIC;
           out2 : out STD_LOGIC);
end dmux_2_1;

architecture Behavioral of dmux_2_1 is

begin

out1 <= inp when sel = '0' else '0';
out2 <= inp when sel ='1' else '0';

end Behavioral;
