----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 19/05/2020 (dd/mm/yyyy)
-- Design Name:         FUNCTION order_and_ fill in a PACKAGE
-- Module Name:         organizer - Behavioral
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
-- Write a function that reorganizes a binary word, such that the indexing is always
-- descending and ending in zero, regardless of the original specification (for
-- example: a(5:2)->b(3:0), a(1:4)->b(3:0), a(3:0)->b(3:0), etc.). Moreover, the
-- vector must be filled with zeros (on the left) until a predefined size is attained.
-- Include the ASSERT statement in your solution to assure that the size of the input
-- word is not bigger than the size wanted for the final vector (after filling).
-- Construct your function in a PACKAGE (most common option)
----------------------------------------------------------------------------------
library ieee;
    use ieee.numeric_std.all;

library work;
    use work.my_package.all;

entity organizer is
    generic (
        SIZE : natural := 5
    );
    port (
        -- input ports
        x   : in unsigned(2 to 5);
        -- output ports
        y   : out unsigned(SIZE-1 downto 0)
    );
end entity;

architecture organizer of organizer is
begin

    y <= order_and_fill(x, SIZE);

end architecture;
