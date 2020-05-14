----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 14/05/2020 (dd/mm/yyyy)
-- Design Name:         <Design name>
-- Module Name:         mux - Behavioral
-- Project Name:        ex_5.2
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      14/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;

entity mux is
    generic (
        N: integer := 8
    );
    port (
        -- input ports
        x0: in std_logic_vector(N-1 downto 0);
        x1: in std_logic_vector(N-1 downto 0);
        x2: in std_logic_vector(N-1 downto 0);
        x3: in std_logic_vector(N-1 downto 0);
        sel: in std_logic_vector(1 downto 0);
        -- output ports
        y: out std_logic_vector(n-1 downto 0)
    );
end entity;

architecture with_when of mux is
begin
    y <=    x0 when sel="00" else
            x1 when sel="01" else
            x2 when sel="10" else
            x3;
end architecture;

architecture with_select of mux is
begin
    with sel select
        y <=    x0 when "00",
                x1 when "01",
                x2 when "10",
                x3 when others;
end architecture;
