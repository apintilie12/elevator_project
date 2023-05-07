library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_circuit is
    Port ( btn_reset : in STD_LOGIC;
           brd_clk : in STD_LOGIC;
           cnt_enable : in STD_LOGIC;
           swt_dir : in STD_LOGIC;
           CAT : out STD_LOGIC_VECTOR (6 downto 0);
           AN : out STD_LOGIC_VECTOR (3 downto 0));
end top_circuit;

architecture Behavioral of top_circuit is

component clk_divider is
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end component clk_divider;

component mod_13_rev_counter is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           ce : in STD_LOGIC;
           dir : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (3 downto 0));
end component mod_13_rev_counter;

component SSD is
    Port ( clk : in STD_LOGIC;
           d0 : in STD_LOGIC_VECTOR (3 downto 0);
           d1 : in STD_LOGIC_VECTOR (3 downto 0);
           d2 : in STD_LOGIC_VECTOR (3 downto 0);
           d3 : in STD_LOGIC_VECTOR (3 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0));
end component SSD;

component ssd_decoder is
    Port ( state : in STD_LOGIC_VECTOR (3 downto 0);
           d0 : out STD_LOGIC_VECTOR (3 downto 0);
           d1 : out STD_LOGIC_VECTOR (3 downto 0));
end component ssd_decoder;

signal clk_div: std_logic;
signal int_q, id0, id1: std_logic_vector(3 downto 0);


begin

clock_map: clk_divider port map(clk_in => brd_clk, clk_out => clk_div);

counter_map: mod_13_rev_counter port map (clk => clk_div, reset => btn_reset, ce => cnt_enable, dir => swt_dir, q => int_q);

ssd_dec_map: ssd_decoder port map(state => int_q, d0 => id0, d1 => id1);

ssd_map: SSD port map (clk => brd_clk, d0 => id0, d1 => id1, d2 => "1111", d3 => "1111", an => AN, cat => CAT);

end Behavioral;
