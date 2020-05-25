----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 25/05/2020 (dd/mm/yyyy)
-- Design Name:         Non-overloaded "AND" Operator
-- Module Name:         custom_and - Behavioral
-- Project Name:        ex_9.6
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
use work.my_package.all;

entity custom_and is
    port (
        -- input ports
        x1	: in std_logic_vector(7 downto 0);
        x2	: in std_logic_vector(7 downto 0);
        -- output ports
        y   : out std_logic_vector(7 downto 0)
    );
end entity;

architecture behav of custom_and is
begin

    y <= my_and(x1, x2);

end architecture;
