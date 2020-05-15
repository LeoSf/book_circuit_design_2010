----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 15/05/2020 (dd/mm/yyyy)
-- Design Name:         Short-Pulse Generator with the keep Attribute
-- Module Name:         short_pulse_gen - Behavioral
-- Project Name:        ex_5.8
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
    use ieee.numeric_std.all;
    
entity tb_short_pulse_gen is
end tb_short_pulse_gen;

architecture behavioral of tb_short_pulse_gen is

    -- component declarations
    component short_pulse_gen
	port(
		-- input ports
		clk           : in	bit;
		-- output ports
		short_clk     : out	bit
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
	signal s_rst_n	    : std_logic := '0';
	signal s_clk		: bit := '0';

	-- output signals
	signal s_short_clk	: bit := '0';

begin
	-- instantiation of the Unit under test
	uut : entity work.short_pulse_gen(short_pulse)
	port map(
		-- input ports
		clk	          => s_clk,
		-- output ports
		short_clk     => s_short_clk
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
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
