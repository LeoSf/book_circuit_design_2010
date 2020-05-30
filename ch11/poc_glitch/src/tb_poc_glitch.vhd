----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 29/05/2020 (dd/mm/yyyy)
-- Design Name:         Glitch-Free Vending-Machine Controller
-- Module Name:         vending_machine_glitch_free - Behavioral
-- Project Name:        ex_11.2
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      28/05/2020  v0.01 File created
--
-- Additional Comments:
--      After running a post-implementation timing simulation, a glitch in
--      s_dime_out can be seen.
----------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity tb_vending_machine_glitch_free is
end tb_vending_machine_glitch_free;

architecture behavioral of tb_vending_machine_glitch_free is

    -- component declarations
    component vending_machine_glitch_free
	port(
		-- input ports
		clk           : in	std_logic;
		rst		      : in	std_logic;
		nickel_in	  : in	std_logic;
		dime_in       : in	std_logic;
		quarter_in    : in	std_logic;
		-- buffer ports
		candy_out     : buffer	std_logic;
		nickel_out    : buffer	std_logic;
		dime_out      : buffer	std_logic;
		-- output ports
		new_candy_out : out	std_logic;
		new_nickel_out: out	std_logic;
		new_dime_out  : out	std_logic;
        -- debugging port
        -- fsm_state     : out integer
        fsm_state : out std_logic_vector(3 downto 0)
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 40 ns;

    -- input signals
	signal s_clk		    : std_logic;
	signal s_rst		    : std_logic;
	signal s_nickel_in		: std_logic;
	signal s_dime_in		: std_logic;
	signal s_quarter_in		: std_logic;

	-- buffer signals
	signal s_candy_out		: std_logic;
	signal s_nickel_out		: std_logic;
	signal s_dime_out		: std_logic;

	-- output signals
	signal s_new_candy_out		: std_logic;
	signal s_new_nickel_out		: std_logic;
	signal s_new_dime_out		: std_logic;

    -- test signals
    type state is (st0, st5, st10, st15, st20, st25, st30, st35, st40, st45);

    -- debugging signals
    signal test_state       : state;
    attribute enum_encoding : string; --optional attribute
    attribute enum_encoding of state: type is "sequential";

    -- debugging port
    -- signal s_fsm_state   :  integer;
    signal s_fsm_state :  std_logic_vector(3 downto 0);

begin
	-- instantiation of the Unit under test
    -- uut : entity work.vending_machine_glitch_free
	uut : entity work.vending_machine_glitch_free(fsm)
    -- uut : vending_machine_glitch_free
    port map(
		-- input ports
		clk           => s_clk,
		rst	          => s_rst,
		nickel_in     => s_nickel_in,
		dime_in	      => s_dime_in,
		quarter_in	  => s_quarter_in,
		-- buffer ports
		candy_out     => s_candy_out,
		nickel_out    => s_nickel_out,
		dime_out      => s_dime_out,
		-- output ports
		new_candy_out	=> s_new_candy_out,
		new_nickel_out	=> s_new_nickel_out,
		new_dime_out	=> s_new_dime_out,
        -- debugging port
        fsm_state       => s_fsm_state
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
                '0' after 40ns;

    s_nickel_in <=  '0' after 0ns,
                    '1' after 120ns,
                    '0' after 160ns;

    s_dime_in   <=  '0' after 0ns,
                    '1' after 200ns,
                    '0' after 240ns;

    s_quarter_in <= '0' after 0ns,
                    '1' after 280ns,
                    '0' after 320ns;


    -- test process

    p_test : process
    begin
        -- test_for : for i in test_state'range loop
        --     test_state <= i;
        --     wait for c_CLK_PERIOD;
        -- end loop;

        test_state <= st0;
        wait for c_CLK_PERIOD;
        test_state <= st5;
        wait for c_CLK_PERIOD;
        test_state <= st10;
        wait for c_CLK_PERIOD;
        test_state <= st15;
        wait for c_CLK_PERIOD;
        test_state <= st20;
        wait for c_CLK_PERIOD;
        test_state <= st25;
        wait for c_CLK_PERIOD;
        test_state <= st30;
        wait for c_CLK_PERIOD;
        test_state <= st35;
        wait for c_CLK_PERIOD;
        test_state <= st40;
        wait for c_CLK_PERIOD;
        test_state <= st45;
        wait for c_CLK_PERIOD;
    end process;

	-- stimulus process
    p_stim : process
    begin

        -- add code here

        -- nothing else to do..
        wait for 560ns;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
