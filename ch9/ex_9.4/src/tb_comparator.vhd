----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 25/06/2020 (dd/mm/yyyy)
-- Design Name:         PROCEDURE min_max in a PACKAGE
-- Module Name:         comparator - Behavioral
-- Project Name:        ex_9.4
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      25/06/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

-- use work.my_package.all;

entity tb_comparator is
end tb_comparator;

architecture behavioral of tb_comparator is

    -- component declarations
    component comparator
	port(
		-- input ports
		a		: in	integer range -256 to 255;
		b		: in	integer range -256 to 255;
		c		: in	integer range -256 to 255;
		-- output ports
		min		: out	integer range -256 to 255;
		max		: out	integer range -256 to 255
	);

    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
	signal s_clk	: std_logic := '0';
	signal s_rst_n	: std_logic := '0';
	signal s_a		: integer range -256 to 255 := 0;
	signal s_b		: integer range -256 to 255 := 0;
	signal s_c		: integer range -256 to 255 := 0;

	-- output signals
	signal s_min		: integer range -256 to 255;
	signal s_max		: integer range -256 to 255;

begin
	-- instantiation of the Unit under test
	uut : entity work.comparator(comparator)
	port map(
		-- input ports
		a	=> s_a,
		b	=> s_b,
		c	=> s_c,
		-- output ports
		min	=> s_min,
		max	=> s_max
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
        s_a <= 3;
        s_b <= 5;
        s_c <= 12;
        wait for c_CLK_PERIOD;

        s_a <= 7;
        s_b <= 2;
        s_c <= -4;
        wait for c_CLK_PERIOD;

        s_a <= 115;
        s_b <= 6;
        s_c <= -89;
        wait for c_CLK_PERIOD;

        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
