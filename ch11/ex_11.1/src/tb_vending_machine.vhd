----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 28/05/2020 (dd/mm/yyyy)
-- Design Name:         Vending-Machine Controller
-- Module Name:         vending_machine - Behavioral
-- Project Name:        ex_11.1
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

entity tb_vending_machine is
end tb_vending_machine;

architecture behavioral of tb_vending_machine is

    -- component declarations
    component vending_machine
    	port(
    		-- input ports
    		clk           : in	std_logic;
    		rst           : in	std_logic;
    		nickel_in     : in	boolean;
    		dime_in       : in	boolean;
    		quarter_in    : in	boolean;
    		-- output ports
    		candy_out     : out	std_logic;
    		nickel_out    : out	std_logic;
    		dime_out      : out	std_logic
    	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 40 ns;

    -- input signals
	signal s_clk		    : std_logic;
	signal s_rst		    : std_logic;
	signal s_nickel_in		: boolean;
	signal s_dime_in		: boolean;
	signal s_quarter_in		: boolean;

	-- output signals
	signal s_candy_out		: std_logic;
	signal s_nickel_out		: std_logic;
	signal s_dime_out		: std_logic;

begin
	-- instantiation of the Unit under test
	uut : entity work.vending_machine(fsm)
	port map(
		-- input ports
		clk       => s_clk,
		rst	      => s_rst,
		nickel_in => s_nickel_in,
		dime_in   => s_dime_in,
		quarter_in	=> s_quarter_in,
		-- output ports
		candy_out	=> s_candy_out,
		nickel_out	=> s_nickel_out,
		dime_out	=> s_dime_out
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

    s_nickel_in <=  false after 0ns,
                    true after 120ns,
                    false after 160ns;

    s_dime_in   <=  false after 0ns,
                    true after 200ns,
                    false after 240ns;

    s_quarter_in <= false after 0ns,
                    true after 280ns,
                    false after 320ns;

	-- stimulus process
    p_stim : process
    begin

        -- add code here

        -- nothing else to do..
        wait for 560ns;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
