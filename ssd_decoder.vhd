library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ssd_decoder is
    Port ( state : in STD_LOGIC_VECTOR (3 downto 0);
           d0 : out STD_LOGIC_VECTOR (3 downto 0);
           d1 : out STD_LOGIC_VECTOR (3 downto 0));
end ssd_decoder;

architecture Behavioral of ssd_decoder is

begin
    process(state)
    begin
        case state is
            when "0000" =>
                d1 <= "1111";
                d0 <= "1010";
            when "0001" =>
                d1 <= "1111";
                d0 <= "0001";
            when "0010" =>
                d1 <= "1111";
                d0 <= "0010";
            when "0011" =>
                d1 <= "1111";
                d0 <= "0011";
            when "0100" =>
                d1 <= "1111";
                d0 <= "0100";
            when "0101" =>
                d1 <= "1111";
                d0 <= "0101";
            when "0110" =>
                d1 <= "1111";
                d0 <= "0110";
            when "0111" =>
                d1 <= "1111";
                d0 <= "0111";
            when "1000" =>
                d1 <= "1111";
                d0 <= "1000";
            when "1001" =>
                d1 <= "1111";
                d0 <= "1001";
            when "1010" =>
                d1 <= "0001";
                d0 <= "0000";
            when "1011" =>
                d1 <= "0001";
                d0 <= "0001";
            when "1100" =>
                d1 <= "0001";
                d0 <= "0010";
            when others =>
                d1 <= "1011";
                d0 <= "1011";
        end case;
    end process;

end Behavioral;
