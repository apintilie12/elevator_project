library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity order_vector_test is
    Port ( set : in STD_LOGIC_VECTOR (4 downto 0);
           rst : in STD_LOGIC_VECTOR (4 downto 0);
           clk : in STD_LOGIC;
           flm : out STD_LOGIC);
end order_vector_test;

architecture Behavioral of order_vector_test is

component order_vector is
    Port ( set : in STD_LOGIC_VECTOR (12 downto 0);
           rst : in STD_LOGIC_VECTOR (12 downto 0);
           clk: in std_logic;
           fullfilment : out STD_LOGIC);
end component order_vector;

component clk_100hz is
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end component clk_100hz;

--component clk200hz is
--    Port ( clk_in : in STD_LOGIC;
--           clk_out : out STD_LOGIC);
--end component clk200hz;

component clk_divider is
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end component;

component clk2hz is
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end component;

component t_flip_flop is
    Port ( t : in STD_LOGIC;
           clk : in STD_LOGIC;
           q : out STD_LOGIC);
end component t_flip_flop;

component jk_ff is
    Port ( j : in STD_LOGIC;
           k : in STD_LOGIC;
           clk: in STD_LOGIC;
           q : out STD_LOGIC);
end component jk_ff;

signal clkdiv, clk2, tin, ist: std_logic;

begin

--l1: order_vector port map(set(4 downto 0) => set, set(12 downto 5) => x"00", rst(4 downto 0) => rst, rst(12 downto 5) => x"00", clk => clk, fullfilment => flm);

--l4: clk2hz port map(clk_in => clk, clk_out => clk2);
l2: clk_divider port map(clk_in => clk, clk_out => clkdiv);
l1: order_vector port map(set(4 downto 0) => set, set(12 downto 5) => x"00", rst(4 downto 0) => rst, rst(12 downto 5) => x"00", clk => clkdiv, fullfilment => flm);
--l3: t_flip_flop port map(t => tin, clk => clk2, q => flm);
--l3: jk_ff port map(j => tin, k => '0', clk => clk2, q => flm);
--st <= ist;
end Behavioral;
