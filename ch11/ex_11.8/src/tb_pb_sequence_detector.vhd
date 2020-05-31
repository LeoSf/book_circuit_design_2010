----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 05/04/2020 (mm/dd/yyyy)
-- Design Name:         Abacus
-- Module Name:         top - Behavioral
-- Project Name:        < >
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      05/04/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity tb_pb_sequence_detector is
	generic (
		a : std_logic_vector(2 downto 0) := "011";
		b : std_logic_vector(2 downto 0) := "101";
		c : std_logic_vector(2 downto 0) := "110";
		none : std_logic_vector(2 downto 0) := "111";
		T : integer := 150_000_000
	);
end tb_pb_sequence_detector;

architecture behavioral of tb_pb_sequence_detector is

    -- component declarations
    component pb_sequence_detector
	generic (
		a : std_logic_vector(2 downto 0) := "011";
		b : std_logic_vector(2 downto 0) := "101";
		c : std_logic_vector(2 downto 0) := "110";
		none : std_logic_vector(2 downto 0) := "111";
		T : integer := 150_000_000
	);
	port(
		-- input ports
		clk		: in	std_logic;
		rst		: in	std_logic;
		pb1		: in	std_logic;
		pb2		: in	std_logic;
		pb3		: in	std_logic;
		-- output ports
		led_idle		: out	std_logic;
		led_win		: out	std_logic
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 20 ns;

    -- input signals
	signal s_clk		: std_logic;
	signal s_rst		: std_logic;
	signal s_pb1		: std_logic;
	signal s_pb2		: std_logic;
	signal s_pb3		: std_logic;

	-- output signals
	signal s_led_idle		: std_logic;
	signal s_led_win		: std_logic;

begin
	-- instantiation of the Unit under test
	uut : entity work.pb_sequence_detector(fsm)
	generic map(
		a => a,
		b => b,
		c => c,
		none => none,
		T => T
	)
	port map(
		-- input ports
		clk	=> s_clk,
		rst	=> s_rst,
		pb1	=> s_pb1,
		pb2	=> s_pb2,
		pb3	=> s_pb3,
		-- output ports
		led_idle	=> s_led_idle,
		led_win	=> s_led_win
	);

	-- Clock process definitions
    p_clk_process : process
    begin
        s_clk <= '0';
        wait for c_CLK_PERIOD/2;
        s_clk <= '1';
        wait for c_CLK_PERIOD/2;
    end process;

	-- stimuli generation
	s_rst   <=  '1' after 0ns,
                '0' after 80ns;

	-- stimulus process
    p_stim : process
    begin
        -- init signals

        wait for c_CLK_PERIOD;

        -- add code here

        -- nothing else to do..
        wait for 50 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;

end behavioral;
