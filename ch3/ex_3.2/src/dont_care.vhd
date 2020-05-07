----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 08/05/2020 (dd/mm/yyyy)
-- Design Name:         Don't care Circuit
-- Module Name:         circuit - Behavioral
-- Project Name:        ex_3.2
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      08/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity circuit is
    port (
        -- input ports
        x   : in std_logic_vector(1 downto 0);
        -- output ports
        y   : out std_logic_vector(1 downto 0)
    );
end entity;

architecture arch of circuit is

begin
    y <=    "00" when x = "00" else
            "01" when x = "01" else
            "10" when x = "10" else
            "--";

end architecture;
