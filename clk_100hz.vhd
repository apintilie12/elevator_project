library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_100hz is
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end clk_100hz;

architecture Behavioral of clk_100hz is

signal count: integer := 0;
signal clk_div: std_logic := '0';

begin

    process(clk_in)
    begin
        if rising_edge(clk_in) then
            if count = 500000 then
                count <= 1;
                clk_div <= not clk_div;
            else
                count <= count + 1;
            end if;
        end if;
    end process;
    clk_out <= clk_div;


end Behavioral;
