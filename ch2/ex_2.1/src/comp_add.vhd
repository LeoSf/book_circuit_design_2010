----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 05/04/2020 (mm/dd/yyyy)
-- Design Name:         Compare-Add Circuit
-- Module Name:         top - Behavioral
-- Project Name:        < >
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      05/04/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity comp_add is
    port(
        -- input ports
        a       : in integer range 0 to 7;
        b       : in integer range 0 to 7;
        -- output ports
        comp    : out std_logic;
        sum     : out integer range 0 to 15
    );
end entity;


architecture circuit of comp_add is
begin

    comp <= '1' when a > b else '0';

    sum <= a + b;
end architecture;
