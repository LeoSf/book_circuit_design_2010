----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 14/05/2020 (dd/mm/yyyy)
-- Design Name:         Multiplexer Implemented with Operators
-- Module Name:         mux - Behavioral
-- Project Name:        ex_5.1
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      14/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity tb_mux is
    end tb_mux;


    architecture behavioral of tb_mux is

    -- component declarations
    component mux
        port(
			-- input ports
			x0		: in	std_logic;
			x1		: in	std_logic;
			x2		: in	std_logic;
			x3		: in	std_logic;
			sel		: in	std_logic_vector(1 downto 0);
			-- output ports
			y		: out	std_logic
		);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
	signal s_clk	: std_logic := '0';
	signal s_rst_n	: std_logic := '0';
	signal s_x0		: std_logic := '0';
	signal s_x1		: std_logic := '0';
	signal s_x2		: std_logic := '0';
	signal s_x3		: std_logic := '0';
	signal s_sel	: std_logic_vector(1 downto 0) := (others => '0');
	-- output signals
	signal s_y		: std_logic;
begin

    -- instantiation of the Unit under test
    uut: mux
    port map(
		-- input ports
		x0	=> s_x0,
		x1	=> s_x1,
		x2	=> s_x2,
		x3	=> s_x3,
		sel	=> s_sel,
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
        s_x0 <= '1';
        s_x1 <= '0';
        s_x2 <= '1';
        s_x3 <= '1';

        s_sel <= "01";

        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
