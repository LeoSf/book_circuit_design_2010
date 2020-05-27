----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 26/05/2020 (dd/mm/yyyy)
-- Design Name:         Type I Testbench for a Registered Mux
-- Module Name:         reg_mux - Behavioral
-- Project Name:        ex_10.4
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
library ieee;
use ieee.std_logic_1164.all;

entity reg_mux is
    port (
        -- input ports
        a	: in std_logic_vector(3 downto 0);
        b	: in std_logic_vector(3 downto 0);
        c	: in std_logic_vector(3 downto 0);
        d	: in std_logic_vector(3 downto 0);
        sel : in std_logic_vector(1 downto 0);
        clk : in std_logic;
        -- output ports
        x	: out std_logic_vector(3 downto 0);
        y	: out std_logic_vector(3 downto 0)
    );
end entity;
-----------------------------------------------------
architecture reg_mux of reg_mux is
    signal mux: std_logic_vector(3 downto 0);

begin
    mux <=  a when sel="00" else
            b when sel="01" else
            c when sel="10" else
            d;

    x <= mux;

    process (clk)
    begin
        if (clk'event and clk = '1') then
            y <= mux;
        end if;
    end process;
end architecture;
