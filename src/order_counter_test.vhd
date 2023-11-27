library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity order_counter_test is
  Port (cu: in std_logic;
        cd: in std_logic;
        clk: in std_logic;
        an: out std_logic_vector(3 downto 0);
        cat: out std_logic_vector(6 downto 0)--;
        --state, dig1, dig2: out std_logic_vector(3 downto 0);
        --iup, idow: out std_logic
        );
end order_counter_test;

architecture Behavioral of order_counter_test is

component edge_detector is
port ( clk: in  std_logic;
       input: in  std_logic;
       pulse: out std_logic := '0');
end component edge_detector;

component order_counter is
    Port ( count_up : in STD_LOGIC;
           count_down : in STD_LOGIC;
           clk: in std_logic;
           state : out STD_LOGIC_VECTOR (3 downto 0));
end component order_counter;

component ssd_decoder is
    Port ( state : in STD_LOGIC_VECTOR (3 downto 0);
           d0 : out STD_LOGIC_VECTOR (3 downto 0);
           d1 : out STD_LOGIC_VECTOR (3 downto 0));
end component ssd_decoder;

component SSD is
    Port ( clk : in STD_LOGIC;
           d0 : in STD_LOGIC_VECTOR (3 downto 0);
           d1 : in STD_LOGIC_VECTOR (3 downto 0);
           d2 : in STD_LOGIC_VECTOR (3 downto 0);
           d3 : in STD_LOGIC_VECTOR (3 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0));
end component SSD;

component clk_100hz is
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end component clk_100hz;

component debouncer is
    Port ( btn : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           enable : out  STD_LOGIC);
end component debouncer;



signal upulse, dpulse: std_logic;
signal iState, id0, id1: std_logic_vector(3 downto 0);
signal anod: std_logic_vector(3 downto 0);
signal ctd: std_logic_vector(6 downto 0);
signal div_clk: std_logic;

begin

--state <= iState;
--dig1 <= id0;
--dig2 <= id1;
--iup <= upulse;
--idow <= dpulse;

clk_div: clk_100hz port map(clk_in => clk, clk_out => div_clk);
--up_edge: edge_detector port map(clk => clk, input => cu, pulse => upulse);
--down_edge: edge_detector port map (clk => clk, input => cd, pulse => dpulse);
--ctr: order_counter port map (count_up => upulse, count_down => dpulse, clk => clk, state => iState);
--up: debouncer port map(btn => cu, clk => clk, enable => upulse);
--down: debouncer port map(btn => cd, clk => clk, enable => dpulse);
ctr: order_counter port map (count_up => cu, count_down => cd, clk => clk, state => iState);
decdr: ssd_decoder port map (state => iState, d0 => id0, d1 => id1);
second_dcdr: ssd port map (clk => clk, d0 => id0, d1 => id1, d2 => "1111", d3 => "1111", an => anod, cat => ctd);


an <= anod;
cat <= ctd;
end Behavioral;
