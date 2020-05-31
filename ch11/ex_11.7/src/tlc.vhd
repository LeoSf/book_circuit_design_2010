----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 31/06/2020 (dd/mm/yyyy)
-- Design Name:         Traffic-Light Controller
-- Module Name:         tlc - Behavioral
-- Project Name:        ex_11.6
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      31/06/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;

entity tlc is
    generic (
        timeRG      : positive := 1800;     --30s with 60hz clock
        timeRY      : positive := 300;      --5s with 60hz clock
        timegr      : positive := 2700;     --45s with 60hz clock
        timeYR      : positive := 300;      --5s with 60hz clock
        timeTEST    : positive := 60;       --1s with 60hz clock
        timeMAX     : positive := 2700      --max of all above
    );
    port (
        -- input ports
        clk	    : in std_logic;
        stby	: in std_logic;
        test	: in std_logic;
        -- output ports
        r1      : out std_logic;
        r2      : out std_logic;
        y1      : out std_logic;
        y2      : out std_logic;
        g1      : out std_logic;
        g2      : out std_logic
    );
end tlc;

architecture fsm of tlc is
    type state is (rg, ry, gr, yr, yy);

    signal pr_state : state;
    signal nx_state : state;

    signal timer: integer range 0 to timeMAX;

begin

    ----lower section of fsm:-----------
    process (clk, stby)
        variable count : integer range 0 to timeMAX;
    begin
        if (stby = '1') then
            pr_state <= yy;
            count := 0;
        elsif (clk'event and clk = '1') then
            count := count + 1;
            if (count >= timer) then
                pr_state <= nx_state;
                count := 0;
            end if;
        end if;
    end process;

    ----upper section of fsm:-----------
    process (pr_state, test)
    begin

        case pr_state is

            when rg =>
                r1 <= '1'; y1 <= '0'; g1 <= '0';
                r2 <= '0'; y2 <= '0'; g2 <= '1';
                nx_state <= ry;

                if (test = '0') then
                    timer <= timeRG;
                else
                    timer <= timeTEST;
                end if;

            when ry =>
                r1 <= '1'; y1 <= '0'; g1 <= '0';
                r2 <= '0'; y2 <= '1'; g2 <= '0';
                nx_state <= gr;

                if (test = '0') then
                    timer <= timeRY;
                else
                    timer <= timeTEST;
                end if;

            when gr =>
                r1 <= '0'; y1 <= '0'; g1 <= '1';
                r2 <= '1'; y2 <= '0'; g2 <= '0';
                nx_state <= yr;

                if (test = '0') then
                    timer <= timegr;
                else
                    timer <= timeTEST;
                end if;

            when yr =>
                r1 <= '0'; y1 <= '1'; g1 <= '0';
                r2 <= '1'; y2 <= '0'; g2 <= '0';
                nx_state <= rg;

                if (test = '0') then
                    timer <= timeYR;
                else
                    timer <= timeTEST;
                end if;

            when yy =>
                r1 <= '0'; y1 <= '1'; g1 <= '0';
                r2 <= '0'; y2 <= '1'; g2 <= '0';

                timer <= timeTEST; --to avoid latches
                nx_state <= ry;
        end case;
    end process;
end fsm;
