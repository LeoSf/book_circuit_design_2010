----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 11/05/2020 (dd/mm/yyyy)
-- Design Name:         Slicing a 1Dx1D Array of Integers
-- Module Name:         array_slice - Behavioral
-- Project Name:        ex_3.5
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      11/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity array_slice is
    port (
        -- input ports
        row     : in integer range 1 to 3;
        -- output ports
        slice   : out integer range 0 to 15
    );
end entity;

architecture arch of array_slice is

    type oneDimOneDim is array  (1 to 3) of integer range 0 to 15;
    constant table : oneDimOneDim := (3, 9, 13);
begin

    slice <= table(row);

end architecture;
