library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity debouncer is
    Port ( btn : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           enable : out  STD_LOGIC);
end debouncer;

architecture Behavioral of debouncer is
signal q1,q2,q3:std_logic;
signal counter:std_logic_vector(15 downto 0);

begin

enable<=q2 and (not(q3));

process(clk)
begin
if rising_edge(clk) then counter<=counter+1;
end if;

end process;

process(clk)
begin
if rising_edge(clk) then
    if (counter(15 downto 0))=x"ffff" then q1<=btn;
	 end if;
	 end if;
end process;


process(clk)
begin
	if rising_edge(clk) then
	q2<=q1;
	q3<=q2;
	end if;


end process;

end Behavioral;
