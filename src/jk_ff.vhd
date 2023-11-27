library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity jk_ff is
    Port ( j : in STD_LOGIC;
           k : in STD_LOGIC;
           clk: in STD_LOGIC;
           q : out STD_LOGIC);
end jk_ff;

architecture Behavioral of jk_ff is

signal nextq: std_logic := '0';

begin

process(clk)
begin
if rising_edge(clk) then
    if j = '0' and k = '0' then
        nextq <= nextq;
    elsif j = '0' and k = '1' then 
        nextq <= '0';
    elsif j = '1' and k = '0' then
        nextq <= '1';
    else 
        nextq <= not nextq;
    end if;
end if;
end process;

q <= nextq;

end Behavioral;

--architecture test of jk_ff is

--signal iq: std_logic := '0';

--begin

--q <= ((not iq) and j) or (iq and (not k));

--end test;