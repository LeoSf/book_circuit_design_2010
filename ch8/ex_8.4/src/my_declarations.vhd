----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 18/05/2020 (dd/mm/yyyy)
-- Design Name:         Shift Register with COMPONENT and GENERATE
-- Module Name:         shift_register - Behavioral
-- Project Name:        ex_8.4
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

-----package:-----------------------------------------------------
package my_declarations is
    type twoDim is array (natural range <>, natural range <>) of bit;
    ----------------
    component mux is
        port (
            -- input ports
            a   : in bit;
            b   : in bit;
            sel : in bit;
            -- output ports
            x: out bit
        );
    end component;
    ----------------
    component flipflop is
        port (
            -- input ports
            d   : in bit;
            clk : in bit;
            -- output ports
            q   : out bit
        );
    end component;
    ----------------------
end package;
