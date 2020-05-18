----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 18/05/2020 (dd/mm/yyyy)
-- Design Name:         PACKAGE with FUNCTION and Deferred CONSTANT
-- Module Name:         package - Behavioral
-- Project Name:        ex_8.1
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      18/05/2020  v0.01 File created
--
-- Additional Comments:
--  ERROR with 'event statement
----------------------------------------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

package my_package is
    constant flag : std_logic;
    function down_edge(signal s : std_logic) return boolean;

end my_package;

package body my_package is

    constant flag : std_logic := '0';

    function down_edge (signal s : std_logic) return boolean is
    begin
        return (s'event and s = '0');
    end down_edge;

    -- function down_edge (signal s : std_logic) return std_logic is
    --     variable result : std_logic;
    -- begin
    --     result :=   '1' when (s'event and s = '0')
    --                 else '0';
    --     return result;
    -- end down_edge;

end my_package;
