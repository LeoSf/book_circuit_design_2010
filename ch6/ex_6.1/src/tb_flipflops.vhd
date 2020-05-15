----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 15/05/2020 (dd/mm/yyyy)
-- Design Name:         DFFs with Reset and Clear
-- Module Name:         flipflops - Behavioral
-- Project Name:        ex_6.1
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      15/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity tb_flipflops is
end tb_flipflops;

architecture behavioral of tb_flipflops is

    -- component declarations
    component flipflops
	port(
		-- input ports
		d1		: in	std_logic;
		d2		: in	std_logic;
		clk		: in	std_logic;
		rst		: in	std_logic;
		clr		: in	std_logic;
		-- output ports
		q1		: out	std_logic;
		q2		: out	std_logic
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
	signal s_d1		: std_logic := '0';
	signal s_d2		: std_logic := '0';
	signal s_clk	: std_logic := '0';
	signal s_rst	: std_logic := '1';
	signal s_clr	: std_logic := '1';

	-- output signals
	signal s_q1		: std_logic;
	signal s_q2		: std_logic;

begin
	-- instantiation of the Unit under test
	uut : entity work.flipflops(flipflops)
	port map(
		-- input ports
		d1	=> s_d1,
		d2	=> s_d2,
		clk	=> s_clk,
		rst	=> s_rst,
		clr	=> s_clr,
		-- output ports
		q1	=> s_q1,
		q2	=> s_q2
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
        s_rst <= '1';
        wait for 40 ns;
        s_rst <= '0';

        wait for c_CLK_PERIOD;

        -- add code here
        s_clr <= '1';

        s_d1 <= '1';
        s_d2 <= '1';
        wait for c_CLK_PERIOD;
        s_clr <= '0';
        wait for c_CLK_PERIOD;
        s_d1 <= '0';
        s_d2 <= '0';
        wait for c_CLK_PERIOD;
        s_rst <= '1';
        s_clr <= '1';

        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
