----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 26/05/2020 (dd/mm/yyyy)
-- Design Name:         Reading Values from a File
-- Module Name:         read_adv - Behavioral
-- Project Name:        ex_10.2
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      26/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------

use std.textio.all;

entity read_adv is
end entity;

architecture read_from_file of read_adv is

    file f  : text open read_mode is "../../../../src/test_file.txt";

    signal clk      : bit := '0';
    signal t_out    : time range 0ns to 800ns;
    signal i_out    : natural range 0 to 7;
begin
    process
        variable l      : line;
        variable str1   : string(1 to 2);
        variable str2   : string(1 to 3);
        variable t      : time range 0ns to 800ns;
        variable i      : natural range 0 to 7;
        variable good_value : boolean;
    begin

        wait for 50ns;
        clk <= '1';

        if not endfile(f) then
            readline(f, l);
            read(l, str1);
            read(l, t, good_value);

            assert good_value
                report "bad value at i=" & integer'image(i+1) & "!"
                severity failure;

            read(l, str2); read(l, i);
            t_out <= t;
            i_out <= i;

        else
            report "[msg] Testbench end." severity failure;
        end if;

        wait for 50ns;
        clk <= '0';

    end process;
end architecture;
