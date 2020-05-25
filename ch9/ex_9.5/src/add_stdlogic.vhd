----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 25/05/2020 (dd/mm/yyyy)
-- Design Name:         Overloaded "+" Operator
-- Module Name:         add_stdlogic - Behavioral
-- Project Name:        ex_9.5
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      25/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;

library work;
    use work.my_package.all;

entity add_stdlogic is
    port (
        -- input ports
        x : in std_logic_vector(7 downto 0);
        -- output ports
        y : out std_logic_vector(7 downto 0)
    );
end entity;

architecture adder of add_stdlogic is

    constant const: std_logic_vector(7 downto 0) := "00001111";

begin
    -- y <= x + const; --overloaded "+" operator
    -- y <= x + const + "01111111"; --overloaded "+" operator
    y <= x + const; --overloaded "+" operator

end architecture;
