----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 31/05/2020 (dd/mm/yyyy)
-- Design Name:         Car Alarm with Bypasses Prevented by a Flag
-- Module Name:         simple_car_alarm - Behavioral
-- Project Name:        ex_11.4
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

entity simple_car_alarm is
    port (
        -- input ports
        clk	    : in std_logic;
        rst	    : in std_logic;
        remote	: in std_logic;
        sensors	: in std_logic;
        -- output ports
        siren   : out std_logic
    );
end simple_car_alarm;

architecture fsm of simple_car_alarm is
    type state is (disarmed, armed, intrusion);

    signal pr_state : state;
    signal nx_state : state;

    attribute enum_encoding : string;
    attribute enum_encoding of state: type is "sequential";

    signal flag : std_logic;

begin
    ----flag generator:----------------
    process (clk, rst)
    begin
        if (rst = '1') then
            flag <= '0';

        elsif (clk'event and clk = '1') then
            if (remote = '0') then
                flag <= '1';
            else
                flag <= '0';
            end if;

        end if;
    end process;

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
    process (pr_state, remote, sensors, flag)
    begin

        case pr_state is

            when disarmed =>
                siren <= '0';
                if (remote = '1' and flag = '1') then
                    nx_state <= armed;
                else
                    nx_state <= disarmed;
                end if;

            when armed =>
                siren <= '0';
                if (sensors = '1') then
                    nx_state <= intrusion;
                elsif (remote = '1' and flag = '1') then
                    nx_state <= disarmed;
                else
                    nx_state <= armed;
                end if;

            when intrusion =>
                siren <= '1';
                if (remote='1' and flag='1') then
                    nx_state <= disarmed;
                else
                    nx_state <= intrusion;
                end if;

        end case;

    end process;
end fsm;
