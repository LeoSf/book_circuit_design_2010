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
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity tb_leading_zeros is
end tb_leading_zeros;

architecture behavioral of tb_leading_zeros is

    -- component declarations
    component leading_zeros
	port(
		-- input ports
		data		: in	std_logic_vector (7 downto 0);
		-- output ports
		zeros		: out	integer range 0 to 8
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
	signal s_clk	: std_logic := '0';
	signal s_rst_n	: std_logic := '0';
	signal s_data	: std_logic_vector (7 downto 0) := (others => '0');

	-- output signals
	signal s_zeros	: integer range 0 to 8;

begin
	-- instantiation of the Unit under test
	uut : entity work.leading_zeros(behavior)
	port map(
		-- input ports
		data	=> s_data,
		-- output ports
		zeros	=> s_zeros
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
        s_data <= b"1000_1010";
        wait for c_CLK_PERIOD;

        s_data <= b"0000_0000";
        wait for c_CLK_PERIOD;

        s_data <= b"0100_0000";
        wait for c_CLK_PERIOD;

        s_data <= b"0010_0000";
        wait for c_CLK_PERIOD;

        s_data <= b"0000_1000";
        wait for c_CLK_PERIOD;

        s_data <= b"0000_0010";
        wait for c_CLK_PERIOD;
        -- nothing else to do..
        wait for 10 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
