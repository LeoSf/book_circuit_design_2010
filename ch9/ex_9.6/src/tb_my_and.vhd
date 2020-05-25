----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 25/05/2020 (dd/mm/yyyy)
-- Design Name:         Non-overloaded "AND" Operator
-- Module Name:         my_and - Behavioral
-- Project Name:        ex_9.6
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      25/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use work.my_package.all;

entity tb_my_and is
end tb_my_and;

architecture behavioral of tb_my_and is

    -- component declarations
    component custom_and
	port(
		-- input ports
		x1		: in	std_logic_vector(7 downto 0);
		x2		: in	std_logic_vector(7 downto 0);
		-- output ports
		y		: out	std_logic_vector(7 downto 0)
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
	signal s_clk	: std_logic := '0';
	signal s_rst_n	: std_logic := '0';
	signal s_x1		: std_logic_vector(7 downto 0) := (others => '0');
	signal s_x2		: std_logic_vector(7 downto 0) := (others => '0');

	-- output signals
	signal s_y		: std_logic_vector(7 downto 0);

begin
	-- instantiation of the Unit under test
	uut : entity work.custom_and(behav)
	port map(
		-- input ports
		x1	=> s_x1,
		x2	=> s_x2,
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
        s_x1 <= "01011100";
        s_x2 <= "11001000";
        wait for c_CLK_PERIOD;

        s_x1 <= "01011100";
        s_x2 <= "110-1000";
        wait for c_CLK_PERIOD;

        s_x1 <= "01011100";
        s_x2 <= "11U01000";
        wait for c_CLK_PERIOD;

        s_x1 <= "010111H0";
        s_x2 <= "110010H0";
        wait for c_CLK_PERIOD;

        s_x1 <= "0101U100";
        s_x2 <= "1100H000";
        wait for c_CLK_PERIOD;

        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
