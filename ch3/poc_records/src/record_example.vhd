----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 15/05/2020 (dd/mm/yyyy)
-- Design Name:         Records Example
-- Module Name:         record_example - Behavioral
-- Project Name:        poc_records
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      15/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity record_example is
    port (
        -- output ports
        flag    : out bit_vector (1 to 4);
        sum     : out natural range 0 to 15
    );
end entity;

architecture arch of record_example is

    type pair is record
        a   : natural range 0 to 7;
        b   : natural range 0 to 7;
    end record;

    type stack is array (1 to 4) of pair;
    constant matrix : stack := ((1,2), (3,4), (5,6), (7,0));
begin

    gen : for i in 1 to 4 generate
        flag(i) <= '1' when matrix(i).a > matrix(i).b else '0';
    end generate;

    sum <= matrix(1).a + matrix(1).b;

end architecture;
