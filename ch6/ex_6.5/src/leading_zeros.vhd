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

entity leading_zeros is
    port (
        -- input ports
        data    : in std_logic_vector (7 downto 0);
        -- output ports
        zeros   : out integer range 0 to 8
    );
end entity;

architecture behavior of leading_zeros is
begin

    process (data)
        variable count: integer range 0 to 8;
    begin
        count := 0;
        for i in data'range loop
            case data(i) is
                when '0'    => count := count + 1;
                when others => exit;
            end case;
        end loop;

        zeros <= count;
    end process;

end architecture;
