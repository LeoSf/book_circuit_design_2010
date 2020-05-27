----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 26/05/2020 (dd/mm/yyyy)
-- Design Name:         Stimuli Generation
-- Module Name:         tb_testbench - Behavioral
-- Project Name:        ex_10.3
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      26/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
--------------------------------------------
entity testbench is
end entity;
--------------------------------------------
architecture testbench of testbench is
    signal clk: std_logic := '0';
    signal rst: std_logic := '0';
    signal rst2: std_logic := '0';
begin
    --generation of clk with after:
    clk <= not clk after 10ns;

    --generation of rst with wait for:
    process
    begin
        wait for 10ns;
        rst <= '1';

        wait for 10ns;
        rst <= '0';
        wait;
    end process;

    rst2 <= '1' after 10ns, '0' after 20ns;
end architecture;
