----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 08/05/2020 (dd/mm/yyyy)
-- Design Name:         Signed Multiplier #2
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
    use ieee.std_logic_signed.all;

entity multiplier_2s is
    port (
        -- input ports
        a   : in std_logic_vector (3 downto 0);
        b   : in std_logic_vector (3 downto 0);
        -- output ports
        y   : out std_logic_vector (7 downto 0)
    );
end entity;

architecture arch of multiplier_2s is

begin
    y <= a * b;
end architecture;
