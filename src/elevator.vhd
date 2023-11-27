library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity elevator is
  Port( sw: in std_logic_vector (12 downto 0);
        lift_speed: in std_logic;
        door_sensor: in std_logic;
        weight_sensor: in std_logic;
        door_open_led: out std_logic;
        debug_led: out std_logic;
        clk: in std_logic;
        an, cu, cd: out std_logic_vector(3 downto 0);
        cat: out std_logic_vector(6 downto 0)
   );
end elevator;

architecture Behavioral of elevator is

component edge_detector is
port ( clk: in  std_logic;
       input: in  std_logic;
       pulse: out std_logic);
end component edge_detector;

component clk_divider is
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end component clk_divider;

component decoder_4_13 is
    Port ( data_in : in STD_LOGIC_VECTOR (3 downto 0);
           data_out : out STD_LOGIC_VECTOR (12 downto 0));
end component decoder_4_13;

component encoder_13_4 is
    Port ( data_in : in STD_LOGIC_VECTOR (12 downto 0);
           data_out : out STD_LOGIC_VECTOR (3 downto 0));
end component encoder_13_4;

component order_counter is
    Port ( count_up : in STD_LOGIC;
           count_down : in STD_LOGIC;
           clk: in std_logic;
           state : out STD_LOGIC_VECTOR (3 downto 0));
end component order_counter;

component order_vector is
    Port ( set : in STD_LOGIC_VECTOR (12 downto 0);
           rst : in STD_LOGIC_VECTOR (12 downto 0);
           clk: in std_logic;
           fullfilment: out STD_LOGIC);
end component order_vector;

component comparator_4 is
    Port ( alpha : in STD_LOGIC_VECTOR (3 downto 0);
           beta : in STD_LOGIC_VECTOR (3 downto 0);
           greater : out STD_LOGIC;
           equal : out STD_LOGIC;
           less : out STD_LOGIC);
end component comparator_4;

component direction_setter is
    Port ( qu : in STD_LOGIC_VECTOR (3 downto 0);
           qd : in STD_LOGIC_VECTOR (3 downto 0);
           j : out STD_LOGIC;
           k : out STD_LOGIC);
end component direction_setter;

component jk_ff is
    Port ( j : in STD_LOGIC;
           k : in STD_LOGIC;
           clk: in STD_LOGIC;
           q : out STD_LOGIC);
end component jk_ff;

component door_open_timer is
    Port ( start : in STD_LOGIC;
           clk : in STD_LOGIC;
           active : out STD_LOGIC);
end component door_open_timer;

component dmux_2_1 is
    Port ( inp : in STD_LOGIC;
           sel: in STD_LOGIC;
           out1 : out STD_LOGIC;
           out2 : out STD_LOGIC);
end component dmux_2_1;

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

component mux_2_1 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           y : out STD_LOGIC;
           s : in STD_LOGIC);
end component mux_2_1;

component clk033hz is
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end component clk033hz;

signal btn_eq, rst_sig: std_logic_vector(12 downto 0);
signal clk1hz, clk033, var_clk: std_logic;
signal enc_state, main_counter_state, up_order_state, down_order_state, order_or, id0, id1: std_logic_vector(3 downto 0);
signal eq, order_enable, count_enable, door_timer_pulse, ij, ik, dir, count_up_up, count_up_down, count_down_up, count_down_down, onorare_semnal: std_logic;


begin

---Variable clock mapping

    l00: clk_divider port map(clk_in => clk, clk_out => clk1hz);
    l01: clk033hz port map(clk_in => clk, clk_out => clk033);
    l02: mux_2_1 port map(a => clk1hz, b => clk033, s => lift_speed, y => var_clk);
    
--Edge detector mapping to convert switches into buttons
    edge_map: for i in 0 to 12 generate
        l0: edge_detector port map(clk => clk, input => sw(i), pulse => btn_eq(i));
    end generate edge_map;
    
    enc_map: encoder_13_4 port map(data_in => btn_eq, data_out => enc_state);
    comp_map: comparator_4 port map(alpha => enc_state, beta => main_counter_state, greater => count_up_up, equal => eq, less => count_down_up);
    
    dmux_map: dmux_2_1 port map(inp => onorare_semnal, sel => dir, out2 => count_up_down, out1 => count_down_down);
    dec_map: decoder_4_13 port map(data_in => main_counter_state, data_out => rst_sig);
    order_vector_map: order_vector port map( set => btn_eq, rst => rst_sig, clk => clk, fullfilment => onorare_semnal);
    up_order: order_counter port map(count_up => count_up_up, count_down => count_up_down, clk => clk, state => up_order_state);
    down_order: order_counter port map(count_up => count_down_up, count_down => count_down_down, clk => clk, state => down_order_state);
    dir_set_map: direction_setter port map(qu => up_order_state, qd => down_order_state, j => ij, k => ik);
    jk_map: jk_ff port map(j => ij, k => ik, clk => clk, q => dir);
    door_timer_map: door_open_timer port map(start => onorare_semnal, clk => clk1hz, active => door_timer_pulse);
    
    order_or <= up_order_state or down_order_state;
    order_enable <= order_or(3) or order_or(2) or order_or(1) or order_or(0);
    count_enable <= order_enable and  (not door_timer_pulse) and (not weight_sensor) and (not door_sensor);
    main_ctr_map: mod_13_rev_counter port map(clk => var_clk, reset => '0', ce => count_enable, dir => dir, q => main_counter_state);
    ssd_dec_map: ssd_decoder port map(state => main_counter_state, d0 => id0, d1 => id1);
    ssd_map: ssd port map(clk => clk, d0 => id0, d1 => id1, d2 => "1111", d3 => "1111", an => an, cat => cat);
    door_open_led <= not count_enable;
    debug_led <= order_enable;
    cu <= up_order_state;
    cd <= down_order_state;
end Behavioral;
