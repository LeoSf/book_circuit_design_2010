----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 19/05/2020 (dd/mm/yyyy)
-- Design Name:         FUNCTION order_and_ fill in a PACKAGE
-- Module Name:         package - Behavioral
-- Project Name:        ex_9.2
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      19/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
    use ieee.numeric_std.all;

package my_package is

    -- function declaration
    function order_and_fill (input: unsigned; bits: natural)
    return unsigned;

end package;


package body my_package is

    -- function order_and_fill --
    function order_and_fill (input: unsigned; bits: natural)
    return unsigned is
        variable a      : unsigned(input'length-1 downto 0);
        variable result : unsigned(bits-1 downto 0);
    begin
        -----check input size:--------
        assert (input'length <= bits)
        report "improper input size!"
        severity failure;

        -----organize input:----------
        if (input'left > input'right) then
            a := input;
        else
            for i in a'range loop
                a(i) := input(input'left + i);
            end loop;
        end if;

        -----fill with zeros:---------
        if (a'length < bits) then
            result(bits-1 downto a'length) := (others => '0');
            result(a'length-1 downto 0) := a;
        else
            result:=a;
        end if;

        return result;
    end function;
    -- \function order_and_fill --
end package body;
