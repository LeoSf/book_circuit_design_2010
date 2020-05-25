----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 25/05/2020 (dd/mm/yyyy)
-- Design Name:         Non-overloaded "AND" Operator
-- Module Name:         package: my_package - Behavioral
-- Project Name:        ex_9.6
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      25/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
----------------------------------------------------------------------
package my_package is
    function my_and (a, b: std_logic_vector) return std_logic_vector;
end package;
----------------------------------------------------------------------
package body my_package is
    type stdlogic_table is array(std_ulogic, std_ulogic) of std_ulogic;
    constant and_table: stdlogic_table := (
    -----------------------------------------------
    -- u    x    0    1    z    w    l    h    -
    -----------------------------------------------
    ( 'U', 'U', '0', 'U', 'U', 'U', '0', 'U', 'U' ), --| u |
    ( 'U', 'X', '0', 'X', 'X', 'X', '0', 'X', 'X' ), --| x |
    ( '0', '0', '0', '0', '0', '0', '0', '0', '0' ), --| 0 |
    ( 'U', 'X', '0', '1', 'X', 'X', '0', '1', 'X' ), --| 1 |
    ( 'U', 'X', '0', 'X', 'X', 'X', '0', 'X', 'X' ), --| z |
    ( 'U', 'X', '0', 'X', 'X', 'X', '0', 'X', 'X' ), --| w |
    ( '0', '0', '0', '0', '0', '0', '0', '0', '0' ), --| l |
    ( 'U', 'X', '0', '1', 'X', 'X', '0', '1', 'X' ), --| h |
    ( 'U', 'X', '0', 'X', 'X', 'X', '0', 'X', 'X' )); --| - |
    -----------------------------------------------
    function my_and (a, b: std_logic_vector) return std_logic_vector is

        alias aa: std_logic_vector(1 to a'length) is a;
        alias bb: std_logic_vector(1 to b'length) is b;
        variable result: std_logic_vector(1 to a'length);

    begin
        for i in result'range loop
            result(i) := and_table (aa(i), bb(i));
        end loop;

        return result;
    end function;
end package body;
