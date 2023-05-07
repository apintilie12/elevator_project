library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_4_13 is
    Port ( data_in : in STD_LOGIC_VECTOR (3 downto 0);
           data_out : out STD_LOGIC_VECTOR (12 downto 0));
end decoder_4_13;

architecture Behavioral of decoder_4_13 is

begin

l1: data_out <= (0 => '1', others => '0') when data_in = "0000" else
                (1 => '1', others => '0') when data_in = "0001" else
                (2 => '1', others => '0') when data_in = "0010" else
                (3 => '1', others => '0') when data_in = "0011" else
                (4 => '1', others => '0') when data_in = "0100" else
                (5 => '1', others => '0') when data_in = "0101" else
                (6 => '1', others => '0') when data_in = "0110" else
                (7 => '1', others => '0') when data_in = "0111" else
                (8 => '1', others => '0') when data_in = "1000" else
                (9 => '1', others => '0') when data_in = "1001" else
                (10 => '1', others => '0') when data_in = "1010" else
                (11 => '1', others => '0') when data_in = "1011" else
                (12 => '1', others => '0') when data_in = "1100" else
                (others => '0');
                

end Behavioral;
