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

entity tb_poc_timming is
end tb_poc_timming;

architecture behavioral of tb_poc_timming is

    -- component declarations
    component poc_timming
	port(
		-- input ports
		clk		         : in	std_logic;
		rst		         : in	std_logic;
		nickel_in		 : in	std_logic;
		dime_in		     : in	std_logic;
		quarter_in		 : in	std_logic;
		-- output ports
		new_candy_out		: out	std_logic;
		new_nickel_out		: out	std_logic;
		new_dime_out		: out	std_logic;
		fsm_state		    : out	std_logic_vector(3 downto 0)
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 40 ns;

    -- input signals
	signal s_clk		     : std_logic;
	signal s_rst		     : std_logic;
	signal s_nickel_in		 : std_logic;
	signal s_dime_in		 : std_logic;
	signal s_quarter_in		 : std_logic;

	-- output signals
	signal s_new_candy_out		: std_logic;
	signal s_new_nickel_out		: std_logic;
	signal s_new_dime_out		: std_logic;
	signal s_fsm_state		    : std_logic_vector(3 downto 0);

begin
	-- instantiation of the Unit under test
	uut : entity work.poc_timming(example)
	port map(
		-- input ports
		clk	            => s_clk,
		rst	            => s_rst,
		nickel_in	    => s_nickel_in,
		dime_in	        => s_dime_in,
		quarter_in	    => s_quarter_in,
		-- output ports
		new_candy_out	=> s_new_candy_out,
		new_nickel_out	=> s_new_nickel_out,
		new_dime_out	=> s_new_dime_out,
		fsm_state	    => s_fsm_state
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
        s_rst <= '1';
        wait for 40 ns;
        s_rst <= '0';

        wait for c_CLK_PERIOD;

        -- add code here

        -- nothing else to do..
        wait for 6 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
