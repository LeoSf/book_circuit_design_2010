----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 13/05/2020 (dd/mm/yyyy)
-- Design Name:         Construction of a Delay Line with the keep Attribute
-- Module Name:         delay_line - Behavioral
-- Project Name:        ex_4.4
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

entity delay_line is
    port (
        x   : in bit;
        y   : out bit
    );
end entity;

architecture example of delay_line is

    signal a, b, c: bit;
    attribute keep: boolean;
    attribute keep of a, b, c: signal is true;

begin
    a <= not x;
    b <= not a;
    c <= not b;
    y <= not c;
end architecture;
