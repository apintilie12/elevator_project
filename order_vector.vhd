library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity order_vector is
    Port ( set : in STD_LOGIC_VECTOR (12 downto 0);
           rst : in STD_LOGIC_VECTOR (12 downto 0);
           clk: in std_logic;
           fullfilment: out STD_LOGIC);
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

architecture test of order_vector is

component jk_ff is
    Port ( j : in STD_LOGIC;
           k : in STD_LOGIC;
           clk: in STD_LOGIC;
           q : out STD_LOGIC);
end component jk_ff;

component falling_edge_detector is
    Port ( input : in STD_LOGIC;
           clk : in STD_LOGIC;
           pulse : out STD_LOGIC);
end component falling_edge_detector;

signal iState, fPulse: std_logic_vector(12 downto 0) := "0000000000000";

begin
    ff_map: for i in 0 to 12 generate
        l1: jk_ff port map(clk => clk, j => set(i), k => rst(i), q => iState(i));
    end generate ff_map;
    detect_map: for i in 0 to 12 generate
        l2: falling_edge_detector port map(clk => clk, input => iState(i), pulse => fPulse(i));
    end generate detect_map;
--    fullfilment <= or(fPulse);
    fullfilment <= fpulse(0) or fpulse(1) or fpulse(2) or fpulse(3) or fpulse(4) or fpulse(5) or fpulse(6) or fpulse(7) or fpulse(8) or fpulse(9) or fpulse(10) or fpulse(11) or fpulse(12);
end test;
