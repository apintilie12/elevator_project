library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity jk_ff is
    Port ( j : in STD_LOGIC;
           k : in STD_LOGIC;
           q : out STD_LOGIC := '0');
end jk_ff;

architecture Behavioral of jk_ff is

signal nextq: std_logic;

begin

process(j, k)
begin
    if j = '0' and k = '0' then
        nextq <= nextq;
    elsif j = '0' and k = '1' then 
        nextq <= '0';
    elsif j = '1' and k = '0' then
        nextq <= '1';
    else 
        nextq <= not nextq;
    end if;
end process;

q <= nextq;

end Behavioral;
