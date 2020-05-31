----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 31/05/2020 (dd/mm/yyyy)
-- Design Name:         Zero-to-Nine Counter
-- Module Name:         tb_counter_std - Behavioral
-- Project Name:        ex_11.3
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

entity tb_counter_std is
end tb_counter_std;

architecture behavioral of tb_counter_std is

    -- component declarations
    component counter_std
	port(
		-- input ports
		clk_i		: in	std_logic;
		rst_n_i		: in	std_logic;
		-- output ports
		data_o		: out	std_logic_vector(3 downto 0)
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
	signal s_clk_i		: std_logic;
	signal s_rst_n_i	: std_logic;

	-- output signals
	signal s_data_o		: std_logic_vector(3 downto 0);

begin
	-- instantiation of the Unit under test
	uut : entity work.counter_std(fsm)
	port map(
		-- input ports
		clk_i	=> s_clk_i,
		rst_n_i	=> s_rst_n_i,
		-- output ports
		data_o	=> s_data_o
	);

	-- Clock process definitions
    p_clk_process : process
    begin
        s_clk_i <= '0';
        wait for c_CLK_PERIOD/2;
        s_clk_i <= '1';
        wait for c_CLK_PERIOD/2;
    end process;

	-- stimulus process
    p_stim : process
    begin
        s_rst_n_i <= '0';
        wait for 100 ns;
        s_rst_n_i <= '1';

        wait for c_CLK_PERIOD;

        -- add code here

        -- nothing else to do..
        wait for 20 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
