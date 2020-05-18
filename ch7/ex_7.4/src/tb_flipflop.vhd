----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 15/05/2020 (dd/mm/yyyy)
-- Design Name:         DFF with q and qbar
-- Module Name:         flipflop - Behavioral
-- Project Name:        ex_7.4
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
	use ieee.numeric_std.all;

entity tb_flipflop is
end tb_flipflop;

architecture behavioral of tb_flipflop is

    -- component declarations
    component flipflop
	port(
		-- input ports
		d		: in	bit;
		clk		: in	bit;
		-- buffer ports
		q		: buffer	bit;
		-- output ports
		qbar	: out	bit
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
	signal s_rst_n	: std_logic := '0';
	signal s_d		: bit := '0';
	signal s_clk	: bit := '0';

	-- buffer signals
	signal s_q		: bit;

	-- output signals
	signal s_qbar	: bit;

begin
	-- instantiation of the Unit under test
	uut : entity work.flipflop(arch1)
	port map(
		-- input ports
		d		=> s_d,
		clk		=> s_clk,
		-- buffer ports
		q		=> s_q,
		-- output ports
		qbar	=> s_qbar
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
		s_d <= '1';
		wait for 3 * c_CLK_PERIOD;
		s_d <= '0';
		wait for 2 * c_CLK_PERIOD;
		s_d <= '1';
		wait for 1 * c_CLK_PERIOD;
		s_d <= '0';
		wait for 3 * c_CLK_PERIOD;
		s_d <= '1';
		wait for c_CLK_PERIOD;
		s_d <= '0';
		wait for c_CLK_PERIOD;
		s_d <= '1';
		wait for c_CLK_PERIOD;
		s_d <= '0';
		wait for c_CLK_PERIOD;

        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
