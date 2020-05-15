----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 15/05/2020 (dd/mm/yyyy)
-- Design Name:         Counter with SHARED VARIABLE
-- Module Name:         counter_with_sharedvar - Behavioral
-- Project Name:        ex_7.1
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
--  Design of a 00-to-99 counter employing shared variables for both digits
----------------------------------------------------------------------------------
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity tb_counter_with_sharedvar is
end tb_counter_with_sharedvar;

architecture behavioral of tb_counter_with_sharedvar is

    -- component declarations
    component counter_with_sharedvar
	port(
		-- input ports
		clk		: in	bit;
		-- output ports
		digit1		: out	integer range 0 to 9;
		digit2		: out	integer range 0 to 9
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
	signal s_rst_n	: std_logic := '0';
	signal s_clk		: bit;

	-- output signals
	signal s_digit1		: integer range 0 to 9;
	signal s_digit2		: integer range 0 to 9;

begin
	-- instantiation of the Unit under test
	uut : entity work.counter_with_sharedvar(counter)
	port map(
		-- input ports
		clk		=> s_clk,
		-- output ports
		digit1	=> s_digit1,
		digit2	=> s_digit2
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

        -- nothing else to do..
        wait for 25 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
