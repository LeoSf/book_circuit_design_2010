----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 25/05/2020 (dd/mm/yyyy)
-- Design Name:         Writing Values to a File
-- Module Name:         write_to_file  - Behavioral
-- Project Name:        ex_10.1
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      25/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------

use std.textio.all;

entity write_to_file is
end entity;

architecture write_to_file of write_to_file is

    constant period: time := 100ns;
    signal clk: bit := '0';

    file f: text open write_mode is "../../../../src/test_file.txt";
begin
    process
        constant str1   : string(1 to 2) := "t=";
        constant str2   : string(1 to 3) := " i=";

        variable l  : line;
        variable t  : time range 0ns to 800ns;
        variable i  : natural range 0 to 7 := 0;
    begin

        cycles : for iloop in 0 to 100 loop
            wait for period/2;
            clk <= '1';
            t := period/2 + i*period;

            -- making the line with format: "t=550 ns i=5"
            write(l, str1);     -- "t=";
            write(l, t);        -- "550 ns"
            write(l, str2);     -- " i="
            write(l, i);        -- "5"

            writeline(f, l);    -- witting line to file

            i := i + 1;
            wait for period/2;
            clk <='0';

        end loop;

        report "[msg] Testbench end." severity failure ;
    end process;
end architecture;
