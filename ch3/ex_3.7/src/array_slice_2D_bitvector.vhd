----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 11/05/2020 (dd/mm/yyyy)
-- Design Name:         Slicing a 2D Array of Bits
-- Module Name:         array_slice_2D_bitvector - Behavioral
-- Project Name:        ex_3.7
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

entity array_slice_2D_bitvector is
    port (
        -- input ports
        row     : in integer range 0 to 3;
        column  : in integer range 0 to 4;  -- 3 bits
        -- output ports
        slice1  : out bit;
        slice2  : out bit_vector (1 to 2);
        slice3  : out bit_vector (1 to 4);
        slice4  : out bit_vector (1 to 3)
    );
end entity;

architecture arch of array_slice_2D_bitvector is
    type twoDim is array (1 to 3, 1 to 4) of bit;

    constant table : twoDim := (    ('0', '0', '0', '1'),   -- 1
                                    ('1', '0', '0', '1'),   -- 9
                                    ('1', '1', '0', '1')    -- 13
    );
begin

    -- slice1 <= table(row)(column);
    slice1 <= table(row, column);

    -- illegal assignments
    -- slice2 <= table(row)(1 to 2);
    -- slice3 <= table(row)(1 to 4);
    -- slice4 <= table(1 to 3)(column);
    --slice4 <= table(1)(column) & table(2)(column) & table(3)(column);
    --slice4 <= table(1, column) & table(2, column) & table(3, column);

    gen : for i in 1 to 3 generate
        -- slice4(i) <= table(i)(column);
        slice4(i) <= table(i, column);
    end generate;
end architecture;
