----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 15/05/2020 (dd/mm/yyyy)
-- Design Name:         COMPONENT Instantiation with GENERATE
-- Module Name:         mux2x1 - Behavioral
-- Project Name:        ex_5.5
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
--
----------------------------------------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;

entity mux2x3 is
    port (
        -- input ports
        a   : in std_logic_vector(2 downto 0);
        b   : in std_logic_vector(2 downto 0);
        sel: in std_logic;
        -- output ports
        x: out std_logic_vector(2 downto 0));
end entity;

architecture mux2x3 of mux2x3 is
    ---component declaration:-----
    component mux2x1 is
        port (
            a   : in std_logic;
            b   : in std_logic;
            sel : in std_logic;
            x   : out std_logic
        );
    end component;

begin

    ---component instantiation:---
    generate_mux2x3: for i in 0 to 2 generate
        comp: mux2x1
        port map (a(i), b(i), sel, x(i));
    end generate generate_mux2x3;

end architecture;
-------------------------------------------------------
