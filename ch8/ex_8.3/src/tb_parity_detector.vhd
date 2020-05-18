----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 18/05/2020 (dd/mm/yyyy)
-- Design Name:         Example 8.3: Parity Detector with COMPONENT and GENERIC MAP
-- Module Name:         parity_detector - Behavioral
-- Project Name:        ex_8.3
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
--  Top layer component
----------------------------------------------------------------------------------
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity tb_parity_detector is
	generic (
		N : positive := 8
	);
end tb_parity_detector;

architecture behavioral of tb_parity_detector is

    -- component declarations
    component parity_detector
	generic (
		N : positive := 8
	);
	port(
		-- input ports
		x		: in	bit_vector(N-1 downto 0);
		-- output ports
		y		: out	bit
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
	signal s_clk	: std_logic := '0';
	signal s_rst_n	: std_logic := '0';
	signal s_x		: bit_vector(N-1 downto 0) := (others => '0');

	-- output signals
	signal s_y		: bit;

begin
	-- instantiation of the Unit under test
	uut : entity work.parity_detector(structural)
	generic map(
		N => N
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
		s_x <= b"1100_1000";
		wait for c_CLK_PERIOD;

		s_x <= b"1100_1010";
		wait for c_CLK_PERIOD;

		s_x <= b"1100_1110";
		wait for c_CLK_PERIOD;

		s_x <= b"1000_1000";
		wait for c_CLK_PERIOD;

        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
