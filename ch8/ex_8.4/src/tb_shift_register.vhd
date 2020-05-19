----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 18/05/2020 (dd/mm/yyyy)
-- Design Name:         Shift Register with COMPONENT and GENERATE
-- Module Name:         shift_register - Behavioral
-- Project Name:        ex_8.4
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
--  Top component layer
----------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

library work;
    use work.my_declarations.all;

entity tb_shift_register is
	generic (
		M : positive := 4;
		N : positive := 8
	);
end tb_shift_register;

architecture behavioral of tb_shift_register is

    -- component declarations
    component shift_register
	generic (
		M : positive := 4;
		N : positive := 8
	);
	port(
		-- input ports
		clk		: in	bit;
		load	: in	bit;
		x		: in	bit_vector(N-1 downto 0);
		d		: in	twoDim(0 to M-1, N-1 downto 0);
		-- output ports
		y		: out	bit_vector(N-1 downto 0)
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
	signal s_rst_n	: std_logic := '0';
	signal s_clk	: bit := '0';
	signal s_load	: bit := '0';
	signal s_x		: bit_vector(N-1 downto 0) := (others => '0');
	signal s_d		: twoDim(0 to M-1, N-1 downto 0) := (others => (others =>'0'));

	-- output signals
	signal s_y		: bit_vector(N-1 downto 0);

begin
	-- instantiation of the Unit under test
	uut : entity work.shift_register(structural)
	generic map(
		M => M,
		N => N
	)
	port map(
		-- input ports
		clk   => s_clk,
		load  => s_load,
		x     => s_x,
		d     => s_d,
		-- output ports
		y     => s_y
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

        -- ERROR: [VRFC 10-1379] sliced name is allowed only on single-dimensional arrays
        -- s_d(0, 7 downto 0) <= b"0000_0001";
        -- s_d(1, 7 downto 0) <= b"0000_0010";
        -- s_d(2, 7 downto 0) <= b"0011_0000";
        -- s_d(3, 7 downto 0) <= b"1100_0010";

        s_d <= ((b"0000_0001"),
                (b"0000_0010"),
                (b"0011_0000"),
                (b"1100_0010"));

		s_load <= '1';

		wait for 6 * c_CLK_PERIOD;

        s_x <= b"0110_0110";
		s_load <= '0';

		wait for 6 * c_CLK_PERIOD;

		-- s_load <= '0';


        -- nothing else to do..
        wait for 10 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
