----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 11/05/2020 (dd/mm/yyyy)
-- Design Name:         Floating poit PoC
-- Module Name:         floating - Behavioral
-- Project Name:        poc_floatingpoint
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
-- library ieee;
--     use ieee.std_logic_1164.all;
--     use ieee.numeric_std.all;

-- uncomment the following package for synthesis
library ieee;
    use ieee.float_pkg.all;

-- uncomment the following library and package for simulation
-- library ieee_proposed;
--     use ieee_proposed.float_pkg.all;

entity floating is
    port (
        -- input ports
        a : in float (3 downto -4);
        b : in float (3 downto -4);
        -- output ports
        x : out float (3 downto -4);
        y : out float (3 downto -4)
    );
end entity;

architecture arch of floating is

begin
    x <= to_float(0.34375, 3, 4) + a + b;
    y <= a * b;
end architecture;
