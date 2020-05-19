----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 18/05/2020 (dd/mm/yyyy)
-- Design Name:         Circular Shift Register with COMPONENT
-- Module Name:         circular_shift - Behavioral
-- Project Name:        ex_8.2
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
-- main code:
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity tb_circular_shift is
end tb_circular_shift;

architecture behavioral of tb_circular_shift is

    -- component declarations
    component circular_shift
	port(
		-- input ports
		clk		: in	bit;
		load	: in	bit;
		d		: in	bit_vector(0 to 3);
		-- buffer ports
		q		: buffer	bit_vector(0 to 3)
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
	signal s_rst_n	: std_logic := '0';
	signal s_clk	: bit := '0';
	signal s_load	: bit := '0';
	signal s_d		: bit_vector(0 to 3) := (others => '0');

	-- buffer signals
	signal s_q		: bit_vector(0 to 3);

begin
	-- instantiation of the Unit under test
	uut : entity work.circular_shift(structural)
	port map(
		-- input ports
		clk		=> s_clk,
		load	=> s_load,
		d		=> s_d,
		-- buffer ports
		q		=> s_q
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
		s_d <= "0111";
		s_load <= '1';

		wait for 5 * c_CLK_PERIOD;

		s_load <= '0';

        -- nothing else to do..
        wait for 8 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
