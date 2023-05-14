library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mod_13_rev_counter is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           ce : in STD_LOGIC;
           dir : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (3 downto 0));
end mod_13_rev_counter;

architecture Behavioral of mod_13_rev_counter is

    signal next_q: std_logic_vector(3 downto 0) := "0000";

begin

    process(clk, reset)
        begin
            if reset = '1' then
                next_q <= "0000";
            elsif rising_edge(clk) and ce = '1' then
                if dir = '1' then
                    if next_q < 12 then
                        next_q <= next_q + 1;
                    else
                        next_q <= "0000";
                    end if;
                else
                    if next_q > 0 then
                        next_q <= next_q - 1;
                    else
                        next_q <= "1100";
                    end if;
                end if;
            end if;
    end process;
    q <= next_q;

end Behavioral;
