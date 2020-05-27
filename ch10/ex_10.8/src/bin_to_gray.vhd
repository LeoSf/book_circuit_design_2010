----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 27/05/2020 (dd/mm/yyyy)
-- Design Name:         Type IV Testbench with a Data File
-- Module Name:         bin_to_gray - Behavioral
-- Project Name:        ex_10.7
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      27/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity bin_to_gray is
    generic (
        N   : natural := 3
    );
    port (
        -- input ports
        bin     : in std_logic_vector(N-1 downto 0);
        -- output ports
        gray    : out std_logic_vector(N-1 downto 0)
    );
end entity;

architecture bin_to_gray of bin_to_gray is
begin
    gray(N-1) <= bin(N-1);

    gen: for i in 1 to N-1 generate
        gray(N-1-i) <= bin(N-i) xor bin(N-1-i);
    end generate;

end architecture;
