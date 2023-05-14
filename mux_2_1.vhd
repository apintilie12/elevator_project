library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux_2_1 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           y : out STD_LOGIC;
           s : in STD_LOGIC);
end mux_2_1;

architecture Behavioral of mux_2_1 is
signal aux : std_logic;
begin
    
    process(a, b, s)
    begin
        if s = '1' then
            aux <= b;
        else
            aux <= a;
        end if;
    end process;
    y <= aux;
    
end Behavioral;
