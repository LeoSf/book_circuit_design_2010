----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 15/05/2020 (dd/mm/yyyy)
-- Design Name:         Slow 0-to-9 Counter with SSD
-- Module Name:         slow_counter - Behavioral
-- Project Name:        ex_6.6
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

entity tb_slow_counter is
	generic (
		fclk : integer := 10        -- clock for simulation
		-- fclk : integer := 50_000_000
	);
end tb_slow_counter;

architecture behavioral of tb_slow_counter is

    -- component declarations
    component slow_counter
	generic (
		fclk : integer := 50_000_000
	);
	port(
		-- input ports
		clk		: in	bit;
		rst		: in	bit;
		-- output ports
		ssd		: out	bit_vector(6 downto 0)
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
	signal s_clk		: bit	:= '0';
	signal s_rst		: bit	:= '0';

	-- output signals
	signal s_ssd		: bit_vector(6 downto 0);

begin
	-- instantiation of the Unit under test
	uut : entity work.slow_counter(counter)
	generic map(
		fclk => fclk
	)
	port map(
		-- input ports
		clk	=> s_clk,
		rst	=> s_rst,
		-- output ports
		ssd	=> s_ssd
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

        -- nothing else to do..
        wait for 100 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
