----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 25/06/2020 (dd/mm/yyyy)
-- Design Name:         PROCEDURE min_max in a PACKAGE
-- Module Name:         comparator - Behavioral
-- Project Name:        ex_9.4
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      25/06/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library work;
    use work.my_package.all;


entity comparator is
    port (
        -- input ports
        a	: in integer range -256 to 255;
        b	: in integer range -256 to 255;
        c	: in integer range -256 to 255;
        -- output ports
        min	: out integer range -256 to 255;
        max	: out integer range -256 to 255
    );
end entity;

architecture comparator of comparator is
begin
    min_max(a, b, c, min, max);
end architecture;
