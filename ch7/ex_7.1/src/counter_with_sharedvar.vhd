----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 15/05/2020 (dd/mm/yyyy)
-- Design Name:         Counter with SHARED VARIABLE
-- Module Name:         counter_with_sharedvar - Behavioral
-- Project Name:        ex_7.1
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
--  Design of a 00-to-99 counter employing shared variables for both digits
----------------------------------------------------------------------------------

entity counter_with_sharedvar is
    port (
        -- input ports
        clk     : in bit;
        -- output ports
        digit1  : out integer range 0 to 9;
        digit2  : out integer range 0 to 9
    );
end entity;
------------------------------------------------------
architecture counter of counter_with_sharedvar is
    -- less significant digit
    shared variable temp1   : integer range 0 to 9;
    -- most significant digit
    shared variable temp2   : integer range 0 to 9;
begin

    proc1: process (clk)
    begin
        if (clk'event and clk = '1') then
            if (temp1 = 9) then
                temp1 := 0;
            else
                temp1 := temp1 + 1;
            end if;
        digit1 <= temp1;
        end if;
    end process proc1;

    proc2: process (clk)
    begin
        if (clk'event and clk = '1') then
            if (temp1 = 9) then
                if (temp2 = 9) then
                    temp2 := 0;
                else
                    temp2 := temp2 + 1;
                end if;
            end if;
        digit2 <= temp2;
        end if;
    end process proc2;

    -- I don't know but this two assigment have no effect over the ports
    -- digit1 <= temp1;
    -- digit2 <= temp2;
end architecture;
------------------------------------------------------
