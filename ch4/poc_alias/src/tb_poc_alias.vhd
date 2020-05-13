----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 13/05/2020 (dd/mm/yyyy)
-- Design Name:         Proff of Concept: alias
-- Module Name:         poc_alias - Behavioral
-- Project Name:        poc_alias
-- Target Devices:      Basys 3
-- tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      13/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity tb_poc_alias is
end tb_poc_alias;


architecture behavioral of tb_poc_alias is

    -- component declarations
    component poc_alias
        port(
             -- input ports
             clk_i		: in	std_logic;
             rst_n		: in	std_logic;
             data_i		: in	std_logic_vector(31 downto 0);
             -- output ports
             valid_o            : out	std_logic;
             upper_bus1_o		: out	std_logic_vector(15 downto 0);
             upper_bus2_o		: out	std_logic_vector(15 downto 0);
             lower_bus1_o		: out	std_logic_vector(15 downto 0);
             lower_bus2_o		: out	std_logic_vector(15 downto 0)
        );
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
    signal s_clk_i		: std_logic := '0';
    signal s_rst_n		: std_logic := '0';
    signal s_data_i		: std_logic_vector(31 downto 0) := (others => '0');
    -- output signals
    signal s_valid_o		    : std_logic;
    signal s_upper_bus1_o		: std_logic_vector(15 downto 0);
    signal s_upper_bus2_o		: std_logic_vector(15 downto 0);
    signal s_lower_bus1_o		: std_logic_vector(15 downto 0);
    signal s_lower_bus2_o		: std_logic_vector(15 downto 0);
begin

    -- instantiation of the Unit under test
    uut: poc_alias
    port map(
        -- input ports
        clk_i	=> s_clk_i,
        rst_n	=> s_rst_n,
        data_i	=> s_data_i,
        -- output ports
        valid_o	=> s_valid_o,
        upper_bus1_o	=> s_upper_bus1_o,
        upper_bus2_o	=> s_upper_bus2_o,
        lower_bus1_o	=> s_lower_bus1_o,
        lower_bus2_o	=> s_lower_bus2_o
    );

    -- Clock process definitions
    p_clk_process : process
    begin
        s_clk_i <= '0';
        wait for c_CLK_PERIOD/2;
        s_clk_i <= '1';
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
        s_data_i <= x"A41D_F327";

        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


end behavioral;
