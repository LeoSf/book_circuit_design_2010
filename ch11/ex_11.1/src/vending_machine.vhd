----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 28/05/2020 (dd/mm/yyyy)
-- Design Name:         Vending-Machine Controller
-- Module Name:         vending_machine - Behavioral
-- Project Name:        ex_11.1
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      28/05/2020  v0.01 File created
--
-- Additional Comments:
--      After running a post-implementation timing simulation, a glitch in
--      s_dime_out can be seen. (from state 3 to 8: st15 to st15)
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity vending_machine is
    port (
        -- input ports
        clk	        : in std_logic;
        rst	        : in std_logic;
        nickel_in	: in boolean;
        dime_in	    : in boolean;
        quarter_in	: in boolean;
        -- output ports
        candy_out	: out std_logic;
        nickel_out	: out std_logic;
        dime_out	: out std_logic
    );
end vending_machine;

architecture fsm of vending_machine is
    -- FSM state's names
    type state is (st0, st5, st10, st15, st20, st25, st30, st35, st40, st45);

    signal pr_state : state;
    signal nx_state : state;
    attribute enum_encoding : string; --optional attribute
    attribute enum_encoding of state: type is "sequential";

begin
    ----lower section of fsm:-----------
    -- sequential logic
    process (rst, clk)
    begin
        if (rst='1') then
            pr_state <= st0;
        elsif (clk'event and clk='1') then
            pr_state <= nx_state;
        end if;
    end process;

    ----upper section of fsm:-----------
    -- combinational logic
    process (pr_state, nickel_in, dime_in, quarter_in)
    begin
        case pr_state is
            when st0 =>
                candy_out <= '0';
                nickel_out <= '0';
                dime_out <= '0';

                if (nickel_in) then
                    nx_state <= st5;
                elsif (dime_in) then
                    nx_state <= st10;
                elsif (quarter_in) then
                    nx_state <= st25;
                else
                    nx_state <= st0;
                end if;

            when st5 =>
                candy_out <= '0';
                nickel_out <= '0';
                dime_out <= '0';

                if (nickel_in) then
                    nx_state <= st10;
                elsif (dime_in) then
                    nx_state <= st15;
                elsif (quarter_in) then
                    nx_state <= st30;
                else
                    nx_state <= st5;
                end if;

            when st10 =>
                candy_out <= '0';
                nickel_out <= '0';
                dime_out <= '0';

                if (nickel_in) then
                    nx_state <= st15;
                elsif (dime_in) then
                    nx_state <= st20;
                elsif (quarter_in) then
                    nx_state <= st35;
                else
                    nx_state <= st10;
                end if;

            when st15 =>
                candy_out <= '0';
                nickel_out <= '0';
                dime_out <= '0';

                if (nickel_in) then
                    nx_state <= st20;
                elsif (dime_in) then
                    nx_state <= st25;
                elsif (quarter_in) then
                    nx_state <= st40;
                else
                    nx_state <= st15;
                end if;

            when st20 =>
                candy_out <= '0';
                nickel_out <= '0';
                dime_out <= '0';

                if (nickel_in) then
                    nx_state <= st25;
                elsif (dime_in) then
                    nx_state <= st30;
                elsif (quarter_in) then
                    nx_state <= st45;
                else
                    nx_state <= st20;
                end if;

            when st25 =>
                candy_out <= '1';
                nickel_out <= '0';
                dime_out <= '0';
                nx_state <= st0;

            when st30 =>
                candy_out <= '1';
                nickel_out <= '1';
                dime_out <= '0';
                nx_state <= st0;

            when st35 =>
                candy_out <= '1';
                nickel_out <= '0';
                dime_out <= '1';
                nx_state <= st0;

            when st40 =>
                candy_out <= '0';
                nickel_out <= '1';
                dime_out <= '0';
                nx_state <= st35;

            when st45 =>
                candy_out <= '0';
                nickel_out <= '0';
                dime_out <= '1';
                nx_state <= st35;
        end case;

    end process;
end fsm;
