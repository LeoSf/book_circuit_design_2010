----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 31/06/2020 (dd/mm/yyyy)
-- Design Name:         Traffic-Light Controller
-- Module Name:         tlc - Behavioral
-- Project Name:        ex_11.6
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      31/06/2020  v0.01 File created
--
-- Additional Comments:
--  TODO: complete testbench
----------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;

entity tb_tlc is
	generic (
		timeRG : positive := 1800;
		timeRY : positive := 300;
		timegr : positive := 2700;
		timeYR : positive := 300;
		timeTEST : positive := 60;
		timeMAX : positive := 2700
	);
end tb_tlc;

architecture behavioral of tb_tlc is

    -- component declarations
    component tlc
	generic (
		timeRG : positive := 1800;
		timeRY : positive := 300;
		timegr : positive := 2700;
		timeYR : positive := 300;
		timeTEST : positive := 60;
		timeMAX : positive := 2700
	);
	port(
		-- input ports
		clk		: in	std_logic;
		stby	: in	std_logic;
		test	: in	std_logic;
		-- output ports
		r1		: out	std_logic;
		r2		: out	std_logic;
		y1		: out	std_logic;
		y2		: out	std_logic;
		g1		: out	std_logic;
		g2		: out	std_logic
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 16666666 ns; -- 60 hz

    -- input signals
	signal s_rst_n	: std_logic := '0';
	signal s_clk	: std_logic;
	signal s_stby	: std_logic;
	signal s_test	: std_logic;

	-- output signals
	signal s_r1		: std_logic;
	signal s_r2		: std_logic;
	signal s_y1		: std_logic;
	signal s_y2		: std_logic;
	signal s_g1		: std_logic;
	signal s_g2		: std_logic;

begin
	-- instantiation of the Unit under test
	uut : entity work.tlc(fsm)
	generic map(
		timeRG => timeRG,
		timeRY => timeRY,
		timegr => timegr,
		timeYR => timeYR,
		timeTEST => timeTEST,
		timeMAX => timeMAX
	)
	port map(
		-- input ports
		clk	  => s_clk,
		stby  => s_stby,
		test  => s_test,
		-- output ports
		r1	=> s_r1,
		r2	=> s_r2,
		y1	=> s_y1,
		y2	=> s_y2,
		g1	=> s_g1,
		g2	=> s_g2
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
    s_rst_n <=  '1' after 0 ns,
                '0' after 60 ns;

	-- stimulus process
    p_stim : process
    begin

        wait for c_CLK_PERIOD;

        -- add code here

        -- nothing else to do..
        wait for 100 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
