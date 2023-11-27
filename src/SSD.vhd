library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SSD is
    Port ( clk : in STD_LOGIC;
           d0 : in STD_LOGIC_VECTOR (3 downto 0);
           d1 : in STD_LOGIC_VECTOR (3 downto 0);
           d2 : in STD_LOGIC_VECTOR (3 downto 0);
           d3 : in STD_LOGIC_VECTOR (3 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0));
end SSD;

architecture Behavioral of SSD is
signal count:std_logic_vector(15 downto 0);
signal input_decoder:std_logic_vector(3 downto 0);
begin

--counter
process(clk,count)
begin
--if rising_edge(clk) then
if (clk='1' and clk'event) then count<=count+1;
end if;
end process;

--ANOZI
process(count)
begin
case count(15 downto 14) is
when "00"=>an<="1110";
when "01"=>an<="1101";
when "10"=>an<="1011";
when others=>an<="0111";
end case;
end process;

-- pentru digits
process(count,d0,d1,d2,d3)
begin
case count(15 downto 14) is
when "00"=>input_decoder<=d0;
when "01"=>input_decoder<=d1;
when "10"=>input_decoder<=d2;
when others=>input_decoder<=d3;
end case;
end process;

process(input_decoder)
begin
	 case input_decoder is
		when "0000" => cat<="0000001";
		when "0001" => cat<="1001111";
		when "0010" => cat<="0010010";
		when "0011" => cat<="0000110";

		when "0100" => cat<="1001100";
		when "0101" => cat<="0100100";
		when "0110" => cat<="0100000";
		when "0111" => cat<="0001111";

		when "1000" => cat<="0000000";
		when "1001" => cat<="0000100";
		when "1010" => cat<="0001000";
		when "1011" => cat<="1100000";

		when "1100" => cat<="0110001";
		when "1101" => cat<="1000010";
		when "1110" => cat<="0110000";
		when others => cat<="0111000";
		
		end case;


end process;

end Behavioral;

--------------------------------------------------------------
--------------------------------------------------------------

architecture test_arch of SSD is

signal count:std_logic_vector(15 downto 0);
signal input_decoder:std_logic_vector(3 downto 0);
begin

--counter
process(clk,count)
begin
--if rising_edge(clk) then
if (clk='1' and clk'event) then count<=count+1;
end if;
end process;

--ANOZI
process(count)
begin
case count(15 downto 14) is
when "00"=>an<="1110";
when "01"=>an<="1101";
when "10"=>an<="1011";
when others=>an<="0111";
end case;
end process;

-- pentru digits
process(count,d0,d1,d2,d3)
begin
case count(15 downto 14) is
when "00"=>input_decoder<=d0;
when "01"=>input_decoder<=d1;
when "10"=>input_decoder<=d2;
when others=>input_decoder<=d3;
end case;
end process;

-- p rev = "0011000"
-- p = "0001100"

process(input_decoder)
begin
	 case input_decoder is
		when "0000" => cat<="0000001";
		when "0001" => cat<="1001111";
		when "0010" => cat<="0010010";
		when "0011" => cat<="0000110";

		when "0100" => cat<="1001100";
		when "0101" => cat<="0100100";
		when "0110" => cat<="0100000";
		when "0111" => cat<="0001111";

		when "1000" => cat<="0000000";
		when "1001" => cat<="0000100";
		
		-- e rev = "0110000"
		-- e = "0000110"
		
		when "1010" => cat<="0011000"; -- letter P
		when "1011" => cat<="0110000"; -- letter E
		--when "1100" => cat<="0110001";
		--when "1101" => cat<="1000010";
		--when "1110" => cat<="0110000";
		when others => cat<="1111111";
		
		end case;


end process;


end test_arch;
