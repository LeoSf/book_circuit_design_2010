----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 15/05/2020 (dd/mm/yyyy)
-- Design Name:         Basic counter
-- Module Name:         counter - Behavioral
-- Project Name:        ex_6.2
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      15/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------

entity counter is
    port (
        clk     : in bit;
        count   : out integer range 0 to 9
        );
end entity;

architecture counter of counter is
begin

    process(clk)
        variable temp: integer range 0 to 10;
    begin
        if (clk'event and clk = '1') then
            temp := temp + 1;

            if (temp = 10) then
                temp := 0;
            end if;

        end if;

        count <= temp;
    end process;

end architecture;
