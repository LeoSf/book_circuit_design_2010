----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 18/05/2020 (dd/mm/yyyy)
-- Design Name:         Dual-Edge Flip-Flop
-- Module Name:         dual_edge_dff - Behavioral
-- Project Name:        ex_7.6
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      18/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity tb_dual_edge_dff is
end tb_dual_edge_dff;

architecture behavioral of tb_dual_edge_dff is

    -- component declarations
    component dual_edge_dff
	port(
		-- input ports
		clk		: in	bit;
		d		: in	bit;
		-- output ports
		q		: out	bit
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
	signal s_rst_n	: std_logic := '0';
	signal s_clk	: bit := '0';
	signal s_d		: bit := '0';

	-- output signals
	signal s_q		: bit;

begin
	-- instantiation of the Unit under test
	uut : entity work.dual_edge_dff(structure)
	port map(
		-- input ports
		clk	=> s_clk,
		d	=> s_d,
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
		test_vec : for i in 0 to 10 loop
			s_d <= '0';
			wait for c_CLK_PERIOD;
			s_d <= '1';
			wait for c_CLK_PERIOD;
		end loop;

        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
