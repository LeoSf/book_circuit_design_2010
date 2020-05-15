----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 15/05/2020 (dd/mm/yyyy)
-- Design Name:         DFFs with Reset and Clear
-- Module Name:         flipflops - Behavioral
-- Project Name:        ex_6.1
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
--  (c) Positive-edge DFF with reset;
--  (e) Positive-edge DFF with clear;
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity flipflops is
    port (
        -- input ports
        d1  : in std_logic;
        d2  : in std_logic;
        clk : in std_logic;
        rst : in std_logic;
        clr : in std_logic;
        -- output ports
        q1  : out std_logic;
        q2  : out std_logic
    );
end entity;

architecture flipflops of flipflops is
begin


    -- (c) Positive-edge DFF with reset;
    with_reset: process (clk, rst)
    begin
        if (rst = '1') then
            q1 <= '0';
        elsif (clk'event and clk = '1') then
            q1 <= d1;
        end if;
    end process with_reset;

    -- (e) Positive-edge DFF with clear;
    with_clear: process (clk)
    begin
        if (clk'event and clk = '1') then
            if (clr = '1') then
                q2 <= '0';
            else
                q2 <= d2;
            end if;
        end if;
    end process with_clear;

    end architecture;
