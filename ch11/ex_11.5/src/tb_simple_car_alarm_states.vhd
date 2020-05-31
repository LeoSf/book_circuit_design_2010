----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 31/06/2020 (dd/mm/yyyy)
-- Design Name:         Car Alarm with Bypasses Prevented by Additional States
-- Module Name:         tb_simple_car_alarm_states - Behavioral
-- Project Name:        ex_11.5
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
--
----------------------------------------------------------------------------------
-------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity tb_simple_car_alarm_states is
end tb_simple_car_alarm_states;

architecture behavioral of tb_simple_car_alarm_states is

    -- component declarations
    component simple_car_alarm_states
	port(
		-- input ports
		clk		  : in	std_logic;
		rst       : in	std_logic;
		remote    : in	std_logic;
		sensors   : in	std_logic;
		-- output ports
		siren     : out	std_logic
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 40 ns;

    -- input signals
	signal s_clk		: std_logic;
	signal s_rst		: std_logic;
	signal s_remote		: std_logic;
	signal s_sensors	: std_logic;

	-- output signals
	signal s_siren		: std_logic;

begin
	-- instantiation of the Unit under test
	uut : entity work.simple_car_alarm_states(fsm)
	port map(
		-- input ports
		clk	      => s_clk,
		rst	      => s_rst,
		remote	  => s_remote,
		sensors   => s_sensors,
		-- output ports
		siren	  => s_siren
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
                '0' after 60ns;

    s_remote <= '0' after 0ns,
                '1' after 160ns,
                '0' after 200ns,
                '1' after 240ns,
                '0' after 320ns,
                '1' after 400ns,
                '0' after 480ns,
                '1' after 680ns,
                '0' after 800ns;

    s_sensors   <=  '0' after 0ns,
                    '1' after 560ns,
                    '0' after 640ns;

	-- stimulus process
    p_stim : process
    begin
        -- init signals

        wait for c_CLK_PERIOD;

        -- add code here

        -- nothing else to do..
        wait for 30 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
