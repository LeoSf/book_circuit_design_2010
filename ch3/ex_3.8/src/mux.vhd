----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 12/05/2020 (dd/mm/yyyy)
-- Design Name:         Example 3.8: Multiplexer with 1Dx1D PORT
-- Module Name:         mux - Behavioral
-- Project Name:        ex_3.8
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      12/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
use work.my_data_types.all;

entity mux is
    port (
        -- input ports
        x   : in oneDimOneDim;
        sel : in integer range 0 to 3;
        -- output ports
        y   : out bit_vector (7 downto 0)
    );
end entity;

architecture arch of mux is
begin

    y <= x(sel);

end architecture;
