----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 18/05/2020 (dd/mm/yyyy)
-- Design Name:         PACKAGE with FUNCTION and Deferred CONSTANT
-- Module Name:         package - Behavioral
-- Project Name:        ex_8.1
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

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
library work;
    use work.my_package.all;

entity module is
    port (
        -- input ports
        clk_i   : in std_logic;
        rst_n   : in std_logic;
        -- output ports
        valid_o : out std_logic
    );
end entity;

architecture arch of module is

begin
    proc : process(clk_i)
    begin
        if down_edge(clk_i) then
            valid_o <= '1';
        else
            valid_o <= '0';
        end if;

    end process;



end architecture;
