----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 31/05/2020 (dd/mm/yyyy)
-- Design Name:         Zero-to-Nine Counter
-- Module Name:         counter - Behavioral
-- Project Name:        <Project name>
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      31/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity tb_counter is
end tb_counter;

architecture behavioral of tb_counter is

    -- component declarations
    component counter
	port(
		-- input ports
		clk		: in	bit;
		rst		: in	bit;
		-- output ports
		output		: out	natural range 0 to 9
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
	signal s_clk		: bit;
	signal s_rst		: bit;

	-- output signals
	signal s_output		: natural range 0 to 9;

begin
	-- instantiation of the Unit under test
	uut : entity work.counter(fsm)
	port map(
		-- input ports
		clk	=> s_clk,
		rst	=> s_rst,
		-- output ports
		output	=> s_output
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

        -- add code heres

        -- nothing else to do..
        wait for 20 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
