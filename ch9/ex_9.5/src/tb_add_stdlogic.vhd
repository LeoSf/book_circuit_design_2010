----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 25/05/2020 (dd/mm/yyyy)
-- Design Name:         Overloaded "+" Operator
-- Module Name:         add_stdlogic - Behavioral
-- Project Name:        ex_9.5
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
    use ieee.numeric_std.all;

entity tb_add_stdlogic is
end tb_add_stdlogic;

architecture behavioral of tb_add_stdlogic is

    -- component declarations
    component add_stdlogic
	port(
		-- input ports
		x		: in	std_logic_vector(7 downto 0);
		-- output ports
		y		: out	std_logic_vector(7 downto 0)
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
	signal s_clk	: std_logic := '0';
	signal s_rst_n	: std_logic := '0';
	signal s_x		: std_logic_vector(7 downto 0) := (others => '0');

	-- output signals
	signal s_y		: std_logic_vector(7 downto 0);

begin
	-- instantiation of the Unit under test
	-- uut : add_stdlogic
    uut : entity work.add_stdlogic(adder)
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
        s_x <= std_logic_vector(to_signed(15, s_x'length));
        wait for c_CLK_PERIOD;

        s_x <= std_logic_vector(to_signed(-15, s_x'length));
        wait for c_CLK_PERIOD;

        s_x <= std_logic_vector(to_signed(112, s_x'length));
        wait for c_CLK_PERIOD;


        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
