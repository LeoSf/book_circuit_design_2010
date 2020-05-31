----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 31/06/2020 (dd/mm/yyyy)
-- Design Name:         Car Alarm with Bypasses Prevented by Additional States
-- Module Name:         simple_car_alarm_states - Behavioral
-- Project Name:        ex_11.5
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
-------------------------------------------------------------------
entity simple_car_alarm_states is
    port (
        -- input ports
        clk	    : in std_logic;
        rst	    : in std_logic;
        remote	: in std_logic;
        sensors	: in std_logic;
        -- output ports
        siren   : out std_logic
    );
end simple_car_alarm_states;
-------------------------------------------------------------------
architecture fsm of simple_car_alarm_states is

    type state is (disarmed, wait1, armed, wait2, intrusion, wait3);

    attribute enum_encoding: string; --optional attribure
    attribute enum_encoding of state: type is "sequential";

    signal pr_state : state;
    signal nx_state : state;

begin
    ----lower section of fsm:---------
    process (clk, rst)
    begin
        if (rst = '1') then
            pr_state <= disarmed;
        elsif (clk'event and clk = '1') then
            pr_state <= nx_state;
        end if;
    end process;

    ----upper section of fsm:---------
    process (pr_state, remote, sensors)
    begin
        case pr_state is

            when disarmed =>
                siren <= '0';
                if (remote = '1') then
                    nx_state <= wait1;
                else
                    nx_state <= disarmed;
                end if;

            when wait1 =>
                siren <= '0';
                if (remote = '0') then
                    nx_state <= armed;
                else
                    nx_state <= wait1;
                end if;

            when armed =>
                siren <= '0';
                if (sensors = '1') then
                    nx_state <= intrusion;
                elsif (remote = '1') then
                    nx_state <= wait2;
                else
                    nx_state <= armed;
                end if;

            when wait2 =>
                siren <= '0';
                if (remote = '0') then
                    nx_state <= disarmed;
                else
                    nx_state <= wait2;
                end if;

            when intrusion =>
                siren <= '1';
                if (remote = '1') then
                    nx_state <= wait3;
                else
                    nx_state <= intrusion;
                end if;

            when wait3 =>siren <= '0';
                if (remote = '0') then
                    nx_state <= disarmed;
                else
                    nx_state <= wait3;
                end if;
        end case;
    end process;
end fsm;
