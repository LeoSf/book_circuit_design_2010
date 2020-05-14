----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 14/05/2020 (dd/mm/yyyy)
-- Design Name:         Multiplexer Implemented with Operators
-- Module Name:         mux - Behavioral
-- Project Name:        ex_5.1
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      14/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity mux is
    port (
        -- input ports
        x0  : in std_logic;
        x1  : in std_logic;
        x2  : in std_logic;
        x3  : in std_logic;
        sel : in std_logic_vector(1 downto 0);
        -- output ports
        y: out std_logic
    );
end mux;
----------------------------------------------
architecture operators_only of mux is

begin
    y <=    (not sel(1) and not sel(0) and x0) or
            (not sel(1) and sel(0) and x1) or
            (sel(1) and not sel(0) and x2) or
            (sel(1) and sel(0) and x3);

end operators_only;
----------------------------------------------
