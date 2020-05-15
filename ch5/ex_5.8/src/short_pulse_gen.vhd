----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 15/05/2020 (dd/mm/yyyy)
-- Design Name:         Short-Pulse Generator with the keep Attribute
-- Module Name:         short_pulse_gen - Behavioral
-- Project Name:        ex_5.8
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

entity short_pulse_gen is
    port (
        clk         : in std_logic;
        short_clk   : out std_logic
    );
end entity;
----------------------------------------------
architecture short_pulse of short_pulse_gen is
    signal a    : std_logic;
    signal b    : std_logic;
    signal c    : std_logic;

    attribute keep : boolean;
    attribute keep of a, b, c: signal is true;

begin

    a <= not clk;
    b <= not a;
    c <= not b;

    short_clk <= clk and c;

end architecture;
