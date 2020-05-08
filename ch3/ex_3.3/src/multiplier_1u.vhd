----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 08/05/2020 (dd/mm/yyyy)
-- Design Name:         Unsigned Multiplier #1
-- Module Name:         multiplier_1 - Behavioral
-- Project Name:        ex_3.2
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      08/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity multiplier_1u is
    port (
        -- input ports
        a   : in unsigned (3 downto 0);
        b   : in unsigned (3 downto 0);
        -- output ports
        y   : out unsigned (7 downto 0)
    );
end entity;

architecture arch of multiplier_1u is

begin
    y <= a * b;
end architecture;
