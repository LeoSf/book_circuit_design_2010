----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 19/05/2020 (dd/mm/yyyy)
-- Design Name:         Latch Implemented with a Guarded BLOCK
-- Module Name:         latch - Behavioral
-- Project Name:        ex_8.5
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      19/05/2020  v0.01 File created
--
-- Additional Comments:
--  [Synth 8-27] guarded block statements not supported [latch.vhd":36]
------------------------------------------------------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
------------------------------------
entity latch is
    port (
        d   : in std_logic;
        clk : in std_logic;
        q: out std_logic
    );
end entity;
------------------------------------
architecture block_latch of latch is
begin
    blk: block (clk = '1')
    begin
        q <= guarded d;
    end block blk;
end architecture;
