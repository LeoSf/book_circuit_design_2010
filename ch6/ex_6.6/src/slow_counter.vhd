----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 15/05/2020 (dd/mm/yyyy)
-- Design Name:         Slow 0-to-9 Counter with SSD
-- Module Name:         slow_counter - Behavioral
-- Project Name:        ex_6.6
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

entity slow_counter is
    generic (
        fclk : integer := 50_000_000        -- 50 MHz system clock
    );
    port (
        clk : in bit;
        rst : in bit;
        ssd : out bit_vector(6 downto 0)
    );
end entity;
------------------------------------------------------
architecture counter of slow_counter is
begin
    process (clk, rst)
        variable counter1 : natural range 0 to fclk := 0;
        variable counter2 : natural range 0 to 10 := 0;
    begin
        ------counter:---------
        if (rst='1') then
            counter1 := 0;
            counter2 := 0;
        elsif (clk'event and clk = '1') then
            counter1 := counter1 + 1;

            if (counter1 = fclk) then
                counter1 := 0;
                counter2 := counter2 + 1;

                if (counter2 = 10) then
                    counter2 := 0;
                end if;
            end if;
        end if;

        ------ssd driver:------
        case counter2 is
            when 0 => ssd <= "0000001"; --"0" on ssd
            when 1 => ssd <= "1001111"; --"1" on ssd
            when 2 => ssd <= "0010010"; --"2" on ssd
            when 3 => ssd <= "0000110"; --"3" on ssd
            when 4 => ssd <= "1001100"; --"4" on ssd
            when 5 => ssd <= "0100100"; --"5" on ssd
            when 6 => ssd <= "0100000"; --"6" on ssd
            when 7 => ssd <= "0001111"; --"7" on ssd
            when 8 => ssd <= "0000000"; --"8" on ssd
            when 9 => ssd <= "0000100"; --"9" on ssd
            when others => ssd <= "0110000"; --"e"rror
        end case;

    end process;
end architecture;
