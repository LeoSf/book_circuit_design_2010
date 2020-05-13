----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 15/05/2020 (dd/mm/yyyy)
-- Design Name:         Records Example
-- Module Name:         record_example - Behavioral
-- Project Name:        poc_records
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

entity tb_record_example is
end tb_record_example;


architecture behavioral of tb_record_example is

    -- component declarations
    component record_example
        port(
             -- input ports
             -- output ports
             flag		: out	bit_vector (1 to 4);
             sum		: out	natural range 0 to 15

            );
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;
    -- input signals
    signal s_clk    : std_logic := '0';
    signal s_rst_n  : std_logic := '0';
    -- output signals
    signal s_flag	: bit_vector (1 to 4);
    signal s_sum	: natural range 0 to 15;

begin

    -- intantiation of the Unit under test
    uut: record_example
    port map(
        -- input ports
        -- output ports
        flag    => s_flag,
        sum     => s_sum
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

        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


end behavioral;
