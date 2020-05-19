----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 19/05/2020 (dd/mm/yyyy)
-- Design Name:         Latch Implemented with a Guarded BLOCK
-- Module Name:         latch - Behavioral
-- Project Name:        ex_8.5
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      19/05/2020  v0.01 File created
--
-- Additional Comments:
--
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity tb_latch is
end tb_latch;

architecture behavioral of tb_latch is

    -- component declarations
    component latch
	port(
		-- input ports
		d		: in	std_logic;
		clk		: in	std_logic;
		-- output ports
		q		: out	std_logic
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
	signal s_rst_n	: std_logic := '0';
	signal s_d		: std_logic;
	signal s_clk		: std_logic;

	-- output signals
	signal s_q		: std_logic;

begin
	-- instantiation of the Unit under test
	uut : entity work.latch(block_latch)
	port map(
		-- input ports
		d	=> s_d,
		clk	=> s_clk,
		-- output ports
		q	=> s_q
	);

	-- Clock process definitions
    p_clk_process : process
    begin
        s_clk <= '0';
        wait for c_CLK_PERIOD/2;
        s_clk <= '1';
        wait for c_CLK_PERIOD/2;
    end process;

	-- stimulus process
    p_stim : process
    begin
        s_rst_n <= '0';
        wait for 40 ns;
        s_rst_n <= '1';

        wait for c_CLK_PERIOD;

        -- add code here

        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
    