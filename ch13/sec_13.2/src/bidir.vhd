----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 05/04/2020 (mm/dd/yyyy)
-- Design Name:         Abacus
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
------------------------------
entity bidir is
    port (
        -- input ports
        a	: in std_logic;
        b	: in std_logic;
        -- bidirectional ports
        c   : inout std_logic;
        -- output ports
        d   : out std_logic
    );
end entity;


architecture arch1 of bidir is
begin
    c <= a when b='1' else 'Z';
    d <= c;
end architecture;


architecture arch2 of bidir is
begin
    process (a, b)
    begin
        d <= c;
        if (b='1') then
            c <= a;
        else
            c <= 'Z';
        end if;
    end process;
end architecture;


configuration which_bidir of bidir is
    for arch1
    end for;
end configuration;
