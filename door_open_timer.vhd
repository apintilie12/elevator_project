library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity door_open_timer is
    Port ( start : in STD_LOGIC;
           clk : in STD_LOGIC;
           active : out STD_LOGIC);
end door_open_timer;

architecture Behavioral of door_open_timer is

type state_t is (IDLE, ST1, ST2, ST3, ST4, ST5);
signal state, next_state: state_t;
begin

update_state: process(clk, start)
begin 
    if start = '1' then state <= ST1;
    elsif rising_edge(clk) then
        state <= next_state;
    end if;
end process update_state;

transitions: process(state)
begin
    active <= '0';
    case state is
        when IDLE => 
            if start = '1' then next_state <= ST1;
            else next_state <= IDLE;
            end if;
        when ST1 => active <= '1'; next_state <= ST2;
        when ST2 => active <= '1'; next_state <= ST3;
        when ST3 => active <= '1'; next_state <= ST4;
        when ST4 => active <= '1'; next_state <= ST5;
        when ST5 => active <= '1'; next_state <= IDLE;
    end case; 
end process transitions;

end Behavioral;
