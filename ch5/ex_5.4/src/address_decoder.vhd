----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 14/05/2020 (dd/mm/yyyy)
-- Design Name:         Generic Address Decoder with GENERATE
-- Module Name:         address_decoder  - Behavioral
-- Project Name:        ex_5.4
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
use ieee.std_logic_unsigned.all;

entity address_decoder is
    generic (
        N: natural := 3     --number of address bits
    );
    port (
        -- input ports
        ena         : in std_logic;
        address     : in std_logic_vector (N-1 downto 0);
        -- output ports
        word_line   : out std_logic_vector (2**N-1 downto 0));
end entity;

architecture decoder of address_decoder is

    signal addr: natural range 0 to 2**n-1;

begin

    addr <= conv_integer(address);

    gen: for i in word_line'range generate
        word_line(i) <= '0' when i = addr and ena = '1'
                            else '1';
    end generate;

end architecture;
    -----------------------------------------------------------
