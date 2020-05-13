----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 13/05/2020 (dd/mm/yyyy)
-- Design Name:         Keeping Redundant Registers with preserve and noprune Attributes
-- Module Name:         redundant_registers - Behavioral
-- Project Name:        ex_4.5
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      13/05/2020  v0.01 File created
--
-- Additional Comments:
-- If preserve is used, flip-flops a and b will be preserved, but flip-flop
-- c will not because it does not feed the design entity. On the other hand,
-- if noprune is used, then even DFF c is preserved.
--
-- IMPORTANT:
-- I couldn't find any difference using no-prune or preserve, because the
-- synthesizer optimizes the design anyway.
----------------------------------------------------------------------------------

entity redundant_registers is
port (
    clk : in bit;
    x   : in bit;
    y   : out bit
);
end entity;

architecture arch of redundant_registers is
    signal a, b, c: bit;
    attribute preserve: boolean;
    attribute preserve of a, b, c: signal is true;
    -- attribute noprune: boolean;
    -- attribute noprune of a, b, c: signal is true;
begin

    behav : process (clk)
    begin
        if (clk'event and clk='1') then
            a <= x;
            b <= x;
            c <= x;
        end if;
    end process;

    y <= a and b;

end architecture;
