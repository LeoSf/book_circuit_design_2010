----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 18/05/2020 (dd/mm/yyyy)
-- Design Name:         Circular Shift Register with COMPONENT
-- Module Name:         flipflop - Behavioral
-- Project Name:        ex_8.2
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      18/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------

-- flip-flop:
entity flipflop is
    port (
        -- input ports
        d   : in bit;
        clk : in bit;
        -- output ports
        q   : out bit
    );
end entity;

architecture flipflop of flipflop is
begin
    process (clk)
    begin
        if (clk'event and clk='1') then
            q <= d;
        end if;
    end process;
end architecture;
