----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 12/05/2020 (dd/mm/yyyy)
-- Design Name:         Package
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
package my_data_types is
    type oneDimOneDim is array (0 to 3) of bit_vector (7 downto 0);
end package;
