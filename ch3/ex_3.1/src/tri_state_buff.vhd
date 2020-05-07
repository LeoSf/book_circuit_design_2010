----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 07/05/2020 (dd/mm/yyyy)
-- Design Name:         Tri-State Buffer
-- Module Name:         tri_state_buff - Behavioral
-- Project Name:        ex_3.1
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      07/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;

entity tri_state_buff is
    port (
        -- input ports
        input   : in std_logic;
        ena     : in std_logic;
        -- output ports
        output  : out std_logic
    );
end entity;

architecture arch of tri_state_buff is
begin
    output <= input when ena = '1' else 'Z';
end architecture;
