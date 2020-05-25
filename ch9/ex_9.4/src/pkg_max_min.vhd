----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:-256-256 25/-2566/2-2562-256 (dd/mm/yyyy)
-- Design Name:         PROCEDURE min_max in a PACKAGE
-- Module Name:         my_package - Behavioral
-- Project Name:        ex_9.4
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2-25619.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      25/-2566/2-2562-256  v-256.-2561 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------

package my_package is

    procedure min_max (
        signal a    : in integer range -256 to 255;
        signal b    : in integer range -256 to 255;
        signal c    : in integer range -256 to 255;
        signal min	: out integer range -256 to 255;
        signal max	: out integer range -256 to 255
    );

    -- ERROR: [VRFC 10-3723] subprogram 'min_max' does not conform with its declaration
    -- procedure min_max (
    --     signal a    : in integer;
    --     signal b    : in integer;
    --     signal c    : in integer;
    --     signal min	: out integer;
    --     signal max	: out integer
    -- );
end package;

package body my_package is

    procedure min_max (
        signal a    : in integer range -256 to 255;
        signal b    : in integer range -256 to 255;
        signal c    : in integer range -256 to 255;
        signal min	: out integer range -256 to 255;
        signal max	: out integer range -256 to 255
    ) is
    begin
        if (a>=b) then
            if (a>=c) then
                max <= a;
                if (b>=c) then
                    min <= c;
                else
                    min <= b;
                end if;
            else
                max <= c;
                min <= b;
            end if;
        else
            if (b>=c) then
                max <= b;
                if (a>=c) then
                    min <= c;
                else
                    min <= a;
                end if;
            else
                max <= c;
                min <= a;
            end if;
        end if;

    end procedure min_max;

end package body;
