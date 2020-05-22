----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 20/05/2020 (dd/mm/yyyy)
-- Design Name:         FUNCTION slv_to_integer in an ENTITY
-- Module Name:         converter_ex - Behavioral
-- Project Name:        ex_9.3
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      20/05/2020  v0.01 File created
--
-- Additional Comments:
-- FUNCTION that converts a signal of type STD_LOGIC_VECTOR to type INTEGER.
-- This includes an ASSERT statement in your code to ensure that no symbols
-- other than '0', 'L' (both synthesized as '0'), '1' or 'H' (both synthesized
-- as '1') are present at the input. This time, construct the function directly
-- in the code’s ENTITY.
----------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

package converter_pkg is

    -- function declaration
    function slv_to_integer (signal s: std_logic_vector)
    return integer;

end package;

package body converter_pkg is

    ----- function: slv_to_integer -----
    function slv_to_integer (signal s: std_logic_vector)
    return integer is
        -- variables declarations
        alias ss        : std_logic_vector(1 to s'length) is s;
        variable result : integer range 0 to 2**s'length-1;
    begin
        result := 0;
        for i in 1 to s'length loop
            result := result * 2;

            if (ss(i) = '1' or ss(i) = 'H') then
                result := result + 1;

            elsif (ss(i) /= '0' and ss(i) /= 'L') then
                assert false
                report "there is an invalid input!"
                severity failure;
            end if;

        end loop;

        return result;
    end function slv_to_integer;
    ----- \function: slv_to_integer -----
end package body;
