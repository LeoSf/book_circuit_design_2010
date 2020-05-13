----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 13/05/2020 (dd/mm/yyyy)
-- Design Name:         Using Predefined Scalar Attributes
-- Module Name:         example - Behavioral
-- Project Name:        ex_4.1
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

entity example is
    port (
        -- input ports
        x   : in integer range 0 to 3;
        -- output ports
        y1  : out bit;
        y2  : out bit;
        y3  : out bit;
        y4  : out bit;
        y5  : out bit
    );
end entity;

architecture arch of example is

    type color is (red, green, blue);   -- assume seq. encoding
    signal z : color;

begin

    z <= red when x=0 else green when x=1 else blue;
    y1 <='1' when color'val(x)=blue else '0';       --y1='1' for x=2
    y2 <='1' when color'pos(blue)=x else '0';       --y2='1' for x=2
    y3 <='1' when color'rightof(z)=blue else '0';   --y3='1' for x=1
    y4 <='1' when color'pred(z)=green else '0';     --y4='1' for x=2,3
    y5 <='1' when color'pred(green)=z else '0';     --y5='1' for x=0


end architecture;
