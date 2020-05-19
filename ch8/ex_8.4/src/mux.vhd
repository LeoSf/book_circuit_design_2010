----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 18/05/2020 (dd/mm/yyyy)
-- Design Name:         Circular Shift Register with COMPONENT
-- Module Name:         mux - Behavioral
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

-- multiplexer:
entity mux is
    port (
        -- input ports
        a   : in bit;
        b   : in bit;
        sel : in bit;
        -- output ports
        x   : out bit
    );
end entity;

architecture mux of mux is
begin
    x <= a when sel='0' else b;
end architecture;
