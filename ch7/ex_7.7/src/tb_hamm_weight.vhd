----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 18/05/2020 (dd/mm/yyyy)
-- Design Name:         Generic Hamming Weight with Concurrent Code
-- Module Name:         hamm_weight - Behavioral
-- Project Name:        ex_7.7
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
--      The Hamming weight of a string is the number of symbols that are
--      different from the zero-symbol of the alphabet used
--      https://en.wikipedia.org/wiki/Hamming_weight
----------------------------------------------------------------------------------
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity tb_hamm_weight is
	generic (
		N : positive := 8
	);
end tb_hamm_weight;

architecture behavioral of tb_hamm_weight is

    -- component declarations
    component hamm_weight
	generic (
		N : positive := 8
	);
	port(
		-- input ports
		x		: in	bit_vector(N-1 downto 0);
		-- output ports
		y		: out	integer range 0 to N
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
	signal s_clk	: std_logic := '0';
	signal s_rst_n	: std_logic := '0';
	signal s_x		: bit_vector(N-1 downto 0) := (others => '0');

	-- output signals
	signal s_y		: integer range 0 to N;

begin
	-- instantiation of the Unit under test
	uut : entity work.hamm_weight(ok)
	generic map(
		N => N
	)
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
		s_x <= (others => '0');
		wait for c_CLK_PERIOD;
		s_x <= (others => '1');
		wait for c_CLK_PERIOD;

		s_x <= b"1010_0001";
		wait for c_CLK_PERIOD;
		s_x <= b"1011_0001";
		wait for c_CLK_PERIOD;

        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
