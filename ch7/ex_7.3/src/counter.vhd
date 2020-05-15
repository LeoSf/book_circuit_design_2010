----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 15/05/2020 (dd/mm/yyyy)
-- Design Name:         Counters with SIGNAL and VARIABLE
-- Module Name:         counter - Behavioral
-- Project Name:        ex_7.3
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
        -- input ports
        clk     : in bit;
        -- output ports
        count1  : out integer range 0 to 9;
        count2  : out integer range 0 to 9
    );
end entity;
--------------------------------------------------
architecture dual_counter of counter is

    signal temp1: integer range 0 to 10;

begin

    -----counter 1: with signal:-----
    with_sig: process(clk)
    begin
        if (clk'event and clk = '1') then
            temp1 <= temp1 + 1;

            if (temp1 = 10) then
                temp1 <= 0;
            end if;
        end if;

        count1 <= temp1;

    end process with_sig;

    -----counter 2: with variable:-----
    with_var: process(clk)
    variable temp2: integer range 0 to 10;
    begin
        if (clk'event and clk = '1') then
            temp2 := temp2 + 1;

            if (temp2 = 10) then
                temp2 := 0;
            end if;
        end if;

        count2 <= temp2;

    end process with_var;

end architecture;
