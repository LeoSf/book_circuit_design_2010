----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 19/05/2020 (dd/mm/yyyy)
-- Design Name:         FUNCTION order_and_ fill in a PACKAGE
-- Module Name:         organizer - Behavioral
-- Project Name:        ex_9.2
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
--      Top layer component
----------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

use work.my_package.all;

entity tb_organizer is
	generic (
		SIZE : natural := 5
	);
end tb_organizer;

architecture behavioral of tb_organizer is

    -- component declarations
    component organizer
	generic (
		SIZE : natural := 5
	);
	port(
		-- input ports
		x		: in	unsigned(2 to 5);
		-- output ports
		y		: out	unsigned(SIZE-1 downto 0)
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
	signal s_clk	: std_logic := '0';
	signal s_rst_n	: std_logic := '0';
	signal s_x		: unsigned(2 to 5) := (others => '0');
	signal s_x2		: unsigned(5 downto 2) := (others => '0');

	-- output signals
	signal s_y		: unsigned(SIZE-1 downto 0);

begin
	-- instantiation of the Unit under test
	uut : entity work.organizer(organizer)
	generic map(
		SIZE => SIZE
	)
	port map(
		-- input ports
		x	=> s_x,
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
		s_x <= "1110";
		wait for c_CLK_PERIOD;
		s_x2 <= s_x;
        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
