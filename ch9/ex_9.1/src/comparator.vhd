----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 19/05/2020 (dd/mm/yyyy)
-- Design Name:         FUNCTION max in an ARCHITECTURE
-- Module Name:         comparator - Behavioral
-- Project Name:        ex_9.1
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
--  ERROR: checking with integers is not working ....
----------------------------------------------------------------------------------
entity comparator is
    port (
        -- input ports
        a	: in integer range 0 to 255;
        b	: in integer range 0 to 255;
        c	: in integer range 0 to 255;
        -- output ports
        y   : out integer range 0 to 255
    );
end entity;
---------------------------------------------------------------------
architecture comparator of comparator is
    -- function max
    function max (in1, in2, in3: integer) return integer is
    begin
        -- checking with integers is not working ....
        -- check in-out signals:
        --- assert (in1'left)
        -- assert (y'left = a'left and
        --         y'left = b'left and
        --         y'left = c'left and
        --         y'right = a'right and
        --         y'right = b'right and
        --         y'right = c'right
        -- )
        -- report "signal sizes are not all equal!"
        -- severity failure;

        -- find maximum:
        if (in1 >= in2 and in1 >= in3) then
            return in1;
        elsif (in2 >= in1 and in2 >= in3) then
            return in2;
        else
            return in3;
        end if;

    end function;
    -- \function max

begin

    y <= max(a, b, c);                      --positional mapping
    --y <= max(in1=>a, in2=>b, in3=>c);     --nominal mapping
end architecture;
