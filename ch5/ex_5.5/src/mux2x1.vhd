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

entity mux2x1 is
    port (
        a   : in std_logic;
        b   : in std_logic;
        sel : in std_logic;
        x   : out std_logic
    );
end entity;

architecture mux2x1 of mux2x1 is

begin

    x <= a when sel = '0' else b;

end architecture;
---------------------------------
