----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 08/05/2020 (dd/mm/yyyy)
-- Design Name:         Fixed point operations Testbench
-- Module Name:         fixedpoint_1 - Behavioral
-- Project Name:        poc_fixedpoint
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
-- The main fixed-point types are the following:
-- TYPE UFIXED IS ARRAY (INTEGER RANGE <>) OF STD_LOGIC; --unsigned
-- TYPE SFIXED IS ARRAY (INTEGER RANGE <>) OF STD_LOGIC; --signed
----------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

-- uncomment the following package for synthesis
--    use ieee.fixed_pkg.all;

-- uncomment the following library and package for simulation
library ieee_proposed;
    use ieee_proposed.fixed_pkg.all;

entity fixedpoint_1 is
    port (
        -- input ports
        a   : in sfixed (3 downto -3);
        b   : in sfixed (3 downto -3);
        -- output ports
        x   : out sfixed (4 downto -3);
        y   : out sfixed (7 downto -6)
    );
end entity;

architecture arch of fixedpoint_1 is
begin
    x <= a + b;
    y <= a * b;
end architecture;
