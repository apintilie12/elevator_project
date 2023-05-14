library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity encoder_13_4 is
    Port ( data_in : in STD_LOGIC_VECTOR (12 downto 0);
           data_out : out STD_LOGIC_VECTOR (3 downto 0));
end encoder_13_4;

architecture Behavioral of encoder_13_4 is

begin

l1: data_out <= "0000" when data_in(0) = '1' else
                "0001" when data_in(1) = '1' else
                "0010" when data_in(2) = '1' else
                "0011" when data_in(3) = '1' else
                "0100" when data_in(4) = '1' else
                "0101" when data_in(5) = '1' else
                "0110" when data_in(6) = '1' else
                "0111" when data_in(7) = '1' else
                "1000" when data_in(8) = '1' else
                "1001" when data_in(9) = '1' else
                "1010" when data_in(10) = '1' else
                "1011" when data_in(11) = '1' else
                "1100" when data_in(12) = '1' else
                "ZZZZ";

end Behavioral;
