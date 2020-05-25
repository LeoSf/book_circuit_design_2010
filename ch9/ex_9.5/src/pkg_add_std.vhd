----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 25/05/2020 (dd/mm/yyyy)
-- Design Name:         Overloaded "+" Operator
-- Module Name:         my_package - Behavioral
-- Project Name:        ex_9.5
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

package my_package is

    function "+" (
        a   : std_logic_vector;
        b   : std_logic_vector
    )
    return std_logic_vector;

    -- it has to be written in the same way in the declaration and in the body
    -- function "+" (a, b: std_logic_vector) return std_logic_vector;

end package;


package body my_package is

    function "+" (
        a   : std_logic_vector;
        b   : std_logic_vector
    )
    return std_logic_vector is

        -- aliases
        alias aa    : std_logic_vector(1 to a'length) is a;
        alias bb    : std_logic_vector(1 to b'length) is b;
        -- variables
        variable result: std_logic_vector(1 to a'length);
        variable carry: std_logic := '0';

    begin
        for i in result'reverse_range loop
            result(i) := aa(i) xor bb(i) xor carry;

            carry :=    (aa(i) and bb(i)) or
                        (aa(i) and carry) or
                        (bb(i) and carry) or
                        (bb(i) and carry);
        end loop;

        return result;
    end function "+";

end package body;
