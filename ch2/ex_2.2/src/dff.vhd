----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 05/05/2020 (mm/dd/yyyy)
-- Design Name:         D-type Flip Flop (DFF)
-- Module Name:         top - Behavioral
-- Project Name:        ex_2.2
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      05/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;    -- std_logic declaration

entity flip_flop is
    port(
        -- input ports
        d   : in std_logic;
        clk : in std_logic;
        rst : in std_logic;     -- reset high active
        -- output ports
        q   : out std_logic
    );
end entity;

architecture flip_flop of flip_flop is
    -- signal declarations
begin
    p_behav: process (clk, rst)
    begin
        if (rst = '1') then
            q <= '0';
        elsif (clk'event and clk = '1') then
            q <= d;
        end if;
    end process;


end architecture;
