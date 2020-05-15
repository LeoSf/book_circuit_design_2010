----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 15/05/2020 (dd/mm/yyyy)
-- Design Name:         COMPONENT Instantiation with GENERATE
-- Module Name:         mux2x1 - Behavioral
-- Project Name:        ex_5.5
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

entity tb_mux2x3 is
end tb_mux2x3;

architecture behavioral of tb_mux2x3 is

    -- component declarations
    component mux2x3
	port(
		-- input ports
		a		: in	std_logic_vector(2 downto 0);
		b		: in	std_logic_vector(2 downto 0);
		sel		: in	std_logic;
		-- output ports
		x		: out	std_logic_vector(2 downto 0)
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
	signal s_clk	: std_logic := '0';
	signal s_rst_n	: std_logic := '0';
	signal s_a		: std_logic_vector(2 downto 0) := (others => '0');
	signal s_b		: std_logic_vector(2 downto 0) := (others => '0');
	signal s_sel		: std_logic := '0';

	-- output signals
	signal s_x		: std_logic_vector(2 downto 0);

begin
	-- instantiation of the Unit under test
	uut : entity work.mux2x3(mux2x3)
	port map(
		-- input ports
		a	=> s_a,
		b	=> s_b,
		sel	=> s_sel,
		-- output ports
		x	=> s_x
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
        s_a <= "100";
        s_b <= "010";
        s_sel <= '0';
        wait for c_CLK_PERIOD;

        s_sel <= '1';
        wait for c_CLK_PERIOD;

        s_sel <= '0';
        wait for c_CLK_PERIOD;

        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
