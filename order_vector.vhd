library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity order_vector is
    Port ( set : in STD_LOGIC_VECTOR (12 downto 0);
           rst : in STD_LOGIC_VECTOR (12 downto 0);
           fullfilment : out STD_LOGIC := '0');
end order_vector;

architecture Behavioral of order_vector is

signal iState: std_logic_vector(12 downto 0) := "0000000000000";
signal sbit, rbit, stbit: std_logic;
begin

process(set, rst)
begin   
    for i in 0 to 11 loop
        if set(i) = '1' then
            iState(i) <= '1';
        end if;
        if rst(i) = '1' then
            iState(i) <= '0';
        end if;       
    end loop;
end process;

process(iState)
begin
    fullfilment <= '0';
    for i in 0 to 11 loop
        stbit <= iState(i);
        if falling_edge(stbit) then
                fullfilment <= '1';
        end if;
    end loop;
end process;

end Behavioral;
