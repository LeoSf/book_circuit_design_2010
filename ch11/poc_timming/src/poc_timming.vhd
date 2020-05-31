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
    use ieee.numeric_std.all;

entity poc_timming is
    port (
        -- input ports
        clk	        : in std_logic;
        rst	        : in std_logic;
        nickel_in	: in std_logic;
        dime_in	    : in std_logic;
        quarter_in	: in std_logic;

        new_candy_out	: out std_logic;
        new_nickel_out	: out std_logic;
        new_dime_out	: out std_logic;
        -- debugging port
        fsm_state : out std_logic_vector(3 downto 0)
    );
end poc_timming;

architecture example of poc_timming is


begin
    process (rst, clk)
    begin
        if (rst='1') then
            new_candy_out <= '0';
            new_candy_out <= '0';
            new_candy_out <= '0';
            fsm_state <= "0100";

        elsif (clk'event and clk='1') then
            new_candy_out <= '1';
            new_candy_out <= '1';
            new_candy_out <= '1';
            fsm_state <= "1010";
        end if;
    end process;
end example;
