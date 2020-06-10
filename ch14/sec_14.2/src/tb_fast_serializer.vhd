----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 16/06/2020 (dd/mm/yyyy)
-- Design Name:         Design of a fast Serializer
-- Module Name:         fast_serializer - Behavioral
-- Project Name:        sec_14.2
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      16/06/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;

entity tb_fast_serializer is
	generic (
		N : integer := 4
	);
end tb_fast_serializer;

architecture behavioral of tb_fast_serializer is

    -- component declarations
    component fast_serializer
	generic (
		N : integer := 4
	);
	port(
		-- input ports
		clk       : in	std_logic;
        rst       : in	std_logic;
		din       : in	std_logic_vector(N-1 downto 0);
		-- output ports
		dout      : out	std_logic;
		sclk_test : out	std_logic
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 100 ns; --10MHz system clock
    -- constant c_CLK_PERIOD : time := 20 ns; --50MHz system clock

    -- input signals
	signal s_rst	    : std_logic := '0';
	signal s_clk		: std_logic := '0';
	signal s_din		: std_logic_vector(N-1 downto 0) := (others => '0');

	-- output signals
	signal s_dout		: std_logic;
	signal s_sclk_test	: std_logic;

begin
	-- instantiation of the Unit under test
	uut : entity work.fast_serializer(fast_serializer)
	generic map(
		N => N
	)
	port map(
		-- input ports
		clk       => s_clk,
        rst       => s_rst,
		din       => s_din,
		-- output ports
		dout      => s_dout,
		sclk_test => s_sclk_test
	);

	-- Clock process definitions
    p_clk_process : process
    begin
        s_clk <= '0';
        wait for c_CLK_PERIOD/2;
        s_clk <= '1';
        wait for c_CLK_PERIOD/2;
    end process;

    s_rst   <=  '1' after 0 ns,
                '0' after 100 ns;

	-- stimulus process
    p_stim : process
    begin
        -- reset until now
        wait for 60 us;

        -- add code here
        s_din <= "0110";
        wait for c_CLK_PERIOD;

        s_din <= "1010";
        wait for c_CLK_PERIOD;

        s_din <= "1001";
        wait for c_CLK_PERIOD;

        -- nothing else to do..
        wait for 4000 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
