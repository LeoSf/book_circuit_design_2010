----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 31/05/2020 (dd/mm/yyyy)
-- Design Name:         FSM with Embedded Timer
-- Module Name:         timed_machine - Behavioral
-- Project Name:        ex_11.6
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      31/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity tb_timed_machine is
	generic (
		t1 : integer := 3;
		t2 : integer := 4
	);
end tb_timed_machine;

architecture behavioral of tb_timed_machine is

    -- component declarations
    component timed_machine
	generic (
		t1 : integer := 3;
		t2 : integer := 4
	);
	port(
		-- input ports
		clk		: in	std_logic;
		rst		: in	std_logic;
		x		: in	std_logic;
		-- output ports
		y		: out	std_logic;
		-- debug signals
		dbg_count : out  integer range 0 to t2
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 40 ns;

    -- input signals
	signal s_clk		: std_logic;
	signal s_rst		: std_logic;
	signal s_x			: std_logic;

	-- output signals
	signal s_y			: std_logic;

	-- debug signals
	signal s_dbg_count 	: integer;

begin
	-- instantiation of the Unit under test
	uut : entity work.timed_machine(fsm)
	generic map(
		t1 => t1,
		t2 => t2
	)
	port map(
		-- input ports
		clk	=> s_clk,
		rst	=> s_rst,
		x	=> s_x,
		-- output ports
		y	=> s_y,
		dbg_count => s_dbg_count
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

    s_x <= 	'0' after 0ns,
            '1' after 200ns,
            '0' after 280ns,
            '1' after 360ns,
            '0' after 720ns;


	-- stimulus process
    p_stim : process
    begin

        wait for c_CLK_PERIOD;

        -- add code here

        -- nothing else to do..
        wait for 30 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
