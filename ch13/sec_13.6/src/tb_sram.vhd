----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 08/06/2020 (dd/mm/yyyy)
-- Design Name:         External Memory Interfaces
-- Module Name:         sram - Behavioral
-- Project Name:        ex_13.6
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      08/06/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;

entity tb_sram is
	generic (
		-- fclk : natural := 50_000_000
        fclk : natural := 100
	);
end tb_sram;

architecture behavioral of tb_sram is

    -- component declarations
    component sram
	generic (
		fclk : natural := 50_000_000
	);
	port(
		-- input ports
		clk		: in	std_logic;
		rst		: in	std_logic;
		-- inout ports
		d		: inout	std_logic_vector(15 downto 0);
		-- output ports
		nce		: out	std_logic;
		nwe		: out	std_logic;
		noe		: out	std_logic;
		nub		: out	std_logic;
		nlb		: out	std_logic;
		a		: out	std_logic_vector(17 downto 0);
		test	: out	std_logic_vector(7 downto 0);
		we_test	: out	std_logic
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 20 ns;

    -- input signals
	signal s_clk		: std_logic;
	signal s_rst		: std_logic;

	-- inout signals
	signal s_d		: std_logic_vector(15 downto 0);

	-- output signals
	signal s_nce		: std_logic;
	signal s_nwe		: std_logic;
	signal s_noe		: std_logic;
	signal s_nub		: std_logic;
	signal s_nlb		: std_logic;
	signal s_a		    : std_logic_vector(17 downto 0);
	signal s_test		: std_logic_vector(7 downto 0);
	signal s_we_test	: std_logic;

begin
	-- instantiation of the Unit under test
	uut : entity work.sram(sram)
	generic map(
		fclk => fclk
	)
	port map(
		-- input ports
		clk	=> s_clk,
		rst	=> s_rst,
		-- inout ports
		d	=> s_d,
		-- output ports
		nce	=> s_nce,
		nwe	=> s_nwe,
		noe	=> s_noe,
		nub	=> s_nub,
		nlb	=> s_nlb,
		a	=> s_a,
		test	=> s_test,
		we_test	=> s_we_test
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
                '0' after 80 ns;

	-- stimulus process
    p_stim : process
    begin

        wait for c_CLK_PERIOD;

        -- add code here

        -- nothing else to do..
        wait for 10 us;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
