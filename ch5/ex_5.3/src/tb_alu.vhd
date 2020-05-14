----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 14/05/2020 (dd/mm/yyyy)
-- Design Name:         ALU
-- Module Name:         alu - Behavioral
-- Project Name:        ex_5.3
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

entity tb_alu is
	generic (
		N : integer := 8
	);
end tb_alu;

architecture behavioral of tb_alu is

    -- component declarations
    component alu
	generic (
		N : integer := 8
	);
	port(
		-- input ports
		a		: in	std_logic_vector(N-1 downto 0);
		b		: in	std_logic_vector(N-1 downto 0);
		cin		: in	std_logic;
		opcode	: in	std_logic_vector(3 downto 0);
		-- output ports
		y		: out	std_logic_vector(N-1 downto 0)
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
	signal s_clk       : std_logic := '0';
	signal s_rst_n	   : std_logic := '0';
	signal s_a		   : std_logic_vector(N-1 downto 0) := (others => '0');
	signal s_b         : std_logic_vector(N-1 downto 0) := (others => '0');
	signal s_cin       : std_logic := '0';
	signal s_opcode    : std_logic_vector(3 downto 0) := (others => '0');

	-- output signals
	signal s_y		   : std_logic_vector(N-1 downto 0);

begin
	-- instantiation of the Unit under test
	uut : entity work.alu(alu)
	generic map(
		N => N
	)
	port map(
		-- input ports
		a	    => s_a,
		b	    => s_b,
		cin	    => s_cin,
		opcode	=> s_opcode,
		-- output ports
		y	    => s_y
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
        s_b <= std_logic_vector(to_signed(87, s_b'length));
        wait for c_CLK_PERIOD;

        test_vec : for i in 0 to 15 loop
            s_opcode <= std_logic_vector(to_unsigned(i, s_opcode'length));
            wait for c_CLK_PERIOD;
        end loop;

        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure;
    end process;


    end behavioral;
