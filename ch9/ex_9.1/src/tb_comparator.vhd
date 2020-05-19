----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 19/05/2020 (dd/mm/yyyy)
-- Design Name:         FUNCTION max in an ARCHITECTURE
-- Module Name:         comparator - Behavioral
-- Project Name:        ex_9.1
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
----------------------------------------------------------------------------------
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity tb_comparator is
end tb_comparator;

architecture behavioral of tb_comparator is

    -- component declarations
    component comparator
	port(
		-- input ports
		a		: in	integer range 0 to 255;
		b		: in	integer range 0 to 255;
		c		: in	integer range 0 to 255;
		-- output ports
		y		: out	integer range 0 to 255
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
	signal s_clk	: std_logic := '0';
	signal s_rst_n	: std_logic := '0';
	signal s_a		: integer range 0 to 255;
	signal s_b		: integer range 0 to 255;
	signal s_c		: integer range 0 to 255;

	-- output signals
	signal s_y		: integer range 0 to 255;

begin
	-- instantiation of the Unit under test
	uut : entity work.comparator(comparator)
	port map(
		-- input ports
		a	=> s_a,
		b	=> s_b,
		c	=> s_c,
		-- output ports
		y	=> s_y
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
		s_a <= 4;
		s_b <= 9;
		s_c <= 1;
		wait for c_CLK_PERIOD;

		s_a <= 3;
		s_b <= 3;
		s_c <= 8;
		wait for c_CLK_PERIOD;

		s_a <= 40;
		s_b <= 190;
		s_c <= 10;
		wait for c_CLK_PERIOD;
        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
