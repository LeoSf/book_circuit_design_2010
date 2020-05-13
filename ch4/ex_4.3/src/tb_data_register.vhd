----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 13/05/2020 (dd/mm/yyyy)
-- Design Name:         Specifying Device Pins with the chip_ pin Attribute
-- Module Name:         data_register - Behavioral
-- Project Name:        ex_4.3
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
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

entity tb_data_register is
end tb_data_register;


architecture behavioral of tb_data_register is

    -- component declarations
    component data_register
        port(
             -- input ports
             clk        : in	bit;
             data_in    : in	bit_vector(3 downto 0);
             -- output ports
             data_out	: out	bit_vector(3 downto 0)
        );
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
    signal s_rst_n      : std_logic := '0';
    signal s_clk		: bit;
    signal s_data_in	: bit_vector(3 downto 0);
    -- output signals
    signal s_data_out	: bit_vector(3 downto 0);
begin

    -- instantiation of the Unit under test
    uut: data_register
    port map(
        -- input ports
        clk	        => s_clk,
        data_in	    => s_data_in,
        -- output ports
        data_out	=> s_data_out
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
