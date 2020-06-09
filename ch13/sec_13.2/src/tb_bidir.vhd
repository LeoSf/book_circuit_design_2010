----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 05/04/2020 (mm/dd/yyyy)
-- Design Name:         Abacus
-- Module Name:         top - Behavioral
-- Project Name:        < >
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      05/04/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity tb_bidir is
end tb_bidir;

architecture behavioral of tb_bidir is

    -- component declarations
    component bidir
	port(
		-- input ports
		a		: in	std_logic;
		b		: in	std_logic;
		-- inout ports
		c		: inout	std_logic;
		-- output ports
		d		: out	std_logic
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
	signal s_clk	: std_logic := '0';
	signal s_rst_n	: std_logic := '0';
	signal s_a		: std_logic := '0';
	signal s_b		: std_logic := '0';

	-- inout signals
	signal s_c		: std_logic;

	-- output signals
	signal s_d		: std_logic;

begin
	-- instantiation of the Unit under test
	uut : entity work.bidir(arch1)
	port map(
		-- input ports
		a	=> s_a,
		b	=> s_b,
		-- inout ports
		c	=> s_c,
		-- output ports
		d	=> s_d
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
        s_a <= '1';
        wait for c_CLK_PERIOD;


        s_b <= '1';
        wait for 2 * c_CLK_PERIOD;

        s_a <= '0';
        wait for c_CLK_PERIOD;

        s_a <= '1';
        wait for c_CLK_PERIOD;

        s_b <= '0';
        
        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
