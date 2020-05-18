----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 18/05/2020 (dd/mm/yyyy)
-- Design Name:         PACKAGE with FUNCTION and Deferred CONSTANT
-- Module Name:         package - Behavioral
-- Project Name:        ex_8.1
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
--
----------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    use work.all;

entity tb_module is
end tb_module;

architecture behavioral of tb_module is

    -- component declarations
    component module
	port(
		-- input ports
		clk_i		: in	std_logic;
		rst_n		: in	std_logic;
		-- output ports
		valid_o		: out	std_logic
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
	signal s_clk_i		: std_logic;
	signal s_rst_n		: std_logic;

	-- output signals
	signal s_valid_o		: std_logic;

begin
	-- instantiation of the Unit under test
	uut : entity work.module(arch)
	port map(
		-- input ports
		clk_i	=> s_clk_i,
		rst_n	=> s_rst_n,
		-- output ports
		valid_o	=> s_valid_o
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
        s_rst_n <= '0';
        wait for 40 ns;
        s_rst_n <= '1';

        wait for c_CLK_PERIOD;

        -- add code here
        test_vec : for i in 0 to 10 loop
            wait for c_CLK_PERIOD;
        end loop;
        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
