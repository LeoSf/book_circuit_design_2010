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

entity pb_sequence_detector is
    generic (
        a   : std_logic_vector(2 downto 0) := "011"; --"011","101",or"110"
        b   : std_logic_vector(2 downto 0) := "101"; --"011","101",or"110"
        c   : std_logic_vector(2 downto 0) := "110"; --"011","101",or"110"
        none: std_logic_vector(2 downto 0) := "111"; --always "111"
        T   : integer := 150_000_000                 --delay=3s with 50 MHz clock
    );
    port (
        -- input ports
        clk	: in std_logic;
        rst	: in std_logic;
        pb1	: in std_logic;
        pb2	: in std_logic;
        pb3	: in std_logic;
        -- output ports
        led_idle    : out std_logic;
        led_win	    : out std_logic
    );
end pb_sequence_detector;


architecture fsm of pb_sequence_detector is
    type state is (idle, wait1, key1, wait2, key2, wait3, key3);

    signal pr_state : state;
    signal nx_state : state;

    attribute enum_encoding: string;
    attribute enum_encoding of state: type is "sequential";

    signal x        : std_logic_vector(2 downto 0);
    signal timer    : integer range 0 to  T;
begin
    ----construction of x:----------------
    x <= (pb1 & pb2 & pb3);

    ----lower section of fsm:-------------
    process (clk, rst)
    variable count: integer range 0 to  T;
    begin
        if (rst = '1') then
            pr_state <= idle;
            count := 0;

        elsif (clk'event and clk = '1') then
            count := count + 1;

            if (count >= timer) then
                pr_state <= nx_state;
                count := 0;
            end if;
        end if;
    end process;

    ----upper section of fsm:------------
    process (pr_state, x)
    begin
        case pr_state is
            when idle =>
                led_idle <= '1';
                led_win <= '0';
                timer <= 1;
                if (x = a) then
                    nx_state <= wait1;
                else
                    nx_state <= idle;
                end if;

            when wait1 =>
                led_idle <= '0';
                led_win <= '0';

                if (x = none) then
                    timer <= 1;
                    nx_state <= key1;
                else
                    timer <=  T;
                    nx_state <= idle;
                end if;

            when key1 =>
                led_idle <= '0';
                led_win <= '0';

                if (x = b) then --x=b test must be before x=a test
                    timer <= 1;
                    nx_state <= wait2;
                elsif (x = a) then
                    timer <= 1;
                    nx_state <= wait1;
                elsif (x /= none) then
                    timer <= 1;
                    nx_state <= idle;
                else
                    timer <=  T;
                    nx_state <= idle;
                end if;

            when wait2 =>
                led_idle <= '0';
                led_win <= '0';

                if (x = none) then
                    timer <= 1;
                    nx_state <= key2;
                else
                    timer <=  T;
                    nx_state <= idle;
                end if;

            when key2 =>
                led_idle <= '0';
                led_win <= '0';

                if (x = c) then --x=c test must be before x=a test
                    timer <= 1;
                    nx_state <= wait3;
                elsif (x = a) then
                    timer <= 1;
                    nx_state <= wait1;
                elsif (x /= none) then
                    timer <= 1;
                    nx_state <= idle;
                else
                    timer <=  T;
                    nx_state <= idle;
                end if;

            when wait3 =>
                led_idle <= '0';
                led_win <= '1';

                if (x = none) then
                    timer <= 1;
                    nx_state <= key3;
                else
                    timer <=  T;
                    nx_state <= idle;
                end if;

            when key3 =>
                led_idle <= '0';
                led_win <= '1';
                timer <=  T;
                nx_state <= idle;
        end case;
    end process;
end fsm;
