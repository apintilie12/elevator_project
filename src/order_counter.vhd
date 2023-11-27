library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity order_counter is
    Port ( count_up : in STD_LOGIC;
           count_down : in STD_LOGIC;
           clk: in std_logic;
           state : out STD_LOGIC_VECTOR (3 downto 0));
end order_counter;

architecture Behavioral of order_counter is

signal iState: unsigned (3 downto 0) := "0000";
signal cu, cd: std_logic;
begin

process(count_up)
begin
    cu <= '0';
    if rising_edge(count_up) then
        cu <= '1';
    end if;
end process;

process(count_down)
begin
    cd <= '0';
    if rising_edge(count_down) then
        cd <= '1';
    end if;
end process;

process(cu, cd)
begin
    if cu = '1' and cd = '0' then
        iState <= iState + 1;
    elsif cu = '0' and cd = '1' then
        iState <= iState - 1;
    else 
        iState <= iState;
    end if;
end process;

state <= std_logic_vector(iState);

end Behavioral;

-------------------------------------------------------
-------------------------------------------------------

architecture test of order_counter is

component mod_13_rev_counter is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           ce : in STD_LOGIC;
           dir : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (3 downto 0));
end component mod_13_rev_counter;

signal ice, ireset, idir: std_logic;
signal istate: std_logic_vector(3 downto 0);
signal cu0, cu1, cd0, cd1: std_logic := '0';

begin

l1: mod_13_rev_counter port map(clk => clk, reset => ireset, ce => ice, dir => idir, q => istate);

--process(count_up, count_down)
process(clk)
begin
    if rising_edge(clk) then
        cu1 <= cu0;
        cu0 <= count_up;
        cd1 <= cd0;
        cd0 <= count_down;
    end if;
end process;


idir <= '1' when (cu1 = '0' and cu0 = '1') else '0';
ice <= '1' when ((cu1 = '0' and cu0 = '1') or (cd1 = '0' and cd0 = '1')) else '0';
state <= istate;
end test;
