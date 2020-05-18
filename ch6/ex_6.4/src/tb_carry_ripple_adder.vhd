----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 15/05/2020 (dd/mm/yyyy)
-- Design Name:         Carry-Ripple Adder
-- Module Name:         carry_ripple_adder - Behavioral
-- Project Name:        ex_6.4
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

entity tb_carry_ripple_adder is
	generic (
		N : integer := 8
	);
end tb_carry_ripple_adder;

architecture behavioral of tb_carry_ripple_adder is

    -- component declarations
    component carry_ripple_adder
	generic (
		N : integer := 8
	);
	port(
		-- input ports
		a		: in	std_logic_vector(N-1 downto 0);
		b		: in	std_logic_vector(N-1 downto 0);
		cin		: in	std_logic;
		-- output ports
		s		: out	std_logic_vector(N-1 downto 0);
		cout	: out	std_logic
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
	signal s_s		: std_logic_vector(N-1 downto 0);
	signal s_cout	: std_logic;

begin
	-- instantiation of the Unit under test
	uut : entity work.carry_ripple_adder(structure)
	generic map(
		N => N
	)
	port map(
		-- input ports
		a	=> s_a,
		b	=> s_b,
		cin	=> s_cin,
		-- output ports
		s	=> s_s,
		cout	=> s_cout
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
		s_a <= std_logic_vector(to_signed(16, s_a'length));
		s_b <= std_logic_vector(to_signed(-18, s_b'length));
		s_cin <= '1';
        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

		s_a <= std_logic_vector(to_signed(110, s_a'length));

		vect_test : for i in 0 to 20 loop
			s_b <= std_logic_vector(to_signed(i, s_b'length));
			wait for c_CLK_PERIOD;
		end loop;

		wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
