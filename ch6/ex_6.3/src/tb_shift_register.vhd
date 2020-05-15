----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 15/05/2020 (dd/mm/yyyy)
-- Design Name:         Shift Register
-- Module Name:         shift_register - Behavioral
-- Project Name:        ex_6.3
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

entity tb_shift_register is
	generic (
		N : integer := 4
	);
end tb_shift_register;

architecture behavioral of tb_shift_register is

    -- component declarations
    component shift_register
	generic (
		N : integer := 4
	);
	port(
		-- input ports
		din		: in	std_logic;
		clk		: in	std_logic;
		rst		: in	std_logic;
		-- output ports
		dout		: out	std_logic
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
	signal s_din		: std_logic := '0';
	signal s_clk		: std_logic := '0';
	signal s_rst		: std_logic := '0';

	-- output signals
	signal s_dout		: std_logic;

begin
	-- instantiation of the Unit under test
	uut : entity work.shift_register(shift_register)
	generic map(
		N => N
	)
	port map(
		-- input ports
		din	=> s_din,
		clk	=> s_clk,
		rst	=> s_rst,
		-- output ports
		dout => s_dout
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
		s_din <= '1';
		wait for c_CLK_PERIOD;

		s_din <= '0';
		wait for c_CLK_PERIOD;

		s_din <= '1';
		wait for c_CLK_PERIOD;

		s_din <= '1';
		wait for c_CLK_PERIOD;

		s_din <= '0';
		wait for c_CLK_PERIOD;

		s_din <= '1';
		wait for c_CLK_PERIOD;

		s_din <= '1';
		wait for c_CLK_PERIOD;

		s_din <= '0';
		wait for c_CLK_PERIOD;

        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
