----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 15/05/2020 (dd/mm/yyyy)
-- Design Name:         DFF Implemented with Concurrent Code
-- Module Name:         signed_add_sub - Behavioral
-- Project Name:        ex_5.7
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
------------------------------------------------------------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_signed_add_sub is
	generic (
		N : integer := 4
	);
end tb_signed_add_sub;

architecture behavioral of tb_signed_add_sub is

    -- component declarations
    component signed_add_sub
	generic (
		N : integer := 4
	);
	port(
		-- input ports
		a		: in	std_logic_vector(N-1 downto 0);
		b		: in	std_logic_vector(N-1 downto 0);
		cin		: in	std_logic;
		-- output ports
		sum		: out	std_logic_vector(N downto 0);
		sub		: out	std_logic_vector(N downto 0)
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
	signal s_clk	: std_logic := '0';
	signal s_rst_n	: std_logic := '0';
	signal s_a		: std_logic_vector(N-1 downto 0) := (others => '0');
	signal s_b		: std_logic_vector(N-1 downto 0) := (others => '0');
	signal s_cin	: std_logic := '0';

	-- output signals
	signal s_sum	: std_logic_vector(N downto 0);
	signal s_sub	: std_logic_vector(N downto 0);

begin
	-- instantiation of the Unit under test
	uut : entity work.signed_add_sub(signed_add_sub)
	generic map(
		N => N
	)
	port map(
		-- input ports
		a	=> s_a,
		b	=> s_b,
		cin	=> s_cin,
		-- output ports
		sum	=> s_sum,
		sub	=> s_sub
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
		s_cin <= '0';
		s_a <= std_logic_vector(to_signed(3, s_a'length));
		s_b <= std_logic_vector(to_signed(7, s_b'length));
		wait for c_CLK_PERIOD;

		s_cin <= '1';
		wait for c_CLK_PERIOD;

        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
