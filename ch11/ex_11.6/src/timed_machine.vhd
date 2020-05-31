----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 31/05/2020 (dd/mm/yyyy)
-- Design Name:         FSM with Embedded Timer
-- Module Name:         timed_machine - Behavioral
-- Project Name:        ex_11.6
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      31/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
----------------------------------------------------------
entity timed_machine is
    generic (
        t1  : integer := 3; --time limit 1
        t2  : integer := 4 --time limit 2 (t2>t1)
    );
    port (
        -- input ports
        clk	: in std_logic;
        rst	: in std_logic;
        x   : in std_logic;
        -- output ports
        y   : out std_logic;
        -- debug signals
        dbg_count : out  integer range 0 to t2
    );
end timed_machine;
----------------------------------------------------------
architecture fsm of timed_machine is
    type state is (a, b, c);

    signal pr_state : state;
    signal nx_state : state;

    attribute enum_encoding : string; --optional attribute
    attribute enum_encoding of state : type is "sequential";

    signal timer: integer range 0 to t2;

begin
    ----lower section of fsm:-----------
    process (clk, rst)
        variable count: integer range 0 to t2;
    begin
        if (rst = '1') then
            pr_state <= a;
            count := 0;
        elsif (clk'event and clk = '1') then
            count := count + 1;
            if (count>=timer) then
                pr_state <= nx_state;
                count := 0;
            end if;
        end if;
        dbg_count <= count;
    end process;

    ----upper section of fsm:-----------
    process (pr_state, x)
    begin
        case pr_state is
            when a =>
                y <= '0';
                timer <= 1;
                if (x = '1') then
                    nx_state <= b;
                else
                    nx_state <= a;
                end if;

            when b =>
                y <= '0';
                if (x = '0') then
                    timer <= t1;
                    nx_state <= c;
                else
                    timer <= t2;
                    nx_state <= a;
                end if;

            when c =>
                y <= '1';
                timer <= t2;
                nx_state <= a;
        end case;
    end process;
end fsm;
