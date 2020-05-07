----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 07/05/2020 (dd/mm/yyyy)
-- Design Name:         Address Decoder
-- Module Name:         address_decoder - Behavioral
-- Project Name:        ex_2.4
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--      all output bits are '1' when ena is '0', or produces just one bit equal
--      to '0' (whose position coincides with the value represented by address)
--      when ena is '1'.
--
-- Dependencies:
--
--
-- Revision History:
--      07/05/2020  v0.01 File created
--
-- Additional Comments:
--      Currently not working:
--      [Synth 8-2385] near range ; prefix should denote an array type
--      [Synth 8-2559] prefix of attribute range is not a type mark
--      problem: gen : for i in address'range generate
--
----------------------------------------------------------------------------------
-- library ieee;
-- use ieee.std_logic_1164.all;
-- Library declarations are not needed because only data types from the package
-- standard (visible by default) are employed in this example

entity address_decoder is
    generic(
        N   : natural := 3
    );
    port (
        -- input ports
        address : in natural range 0 to 2**N - 1;
        ena     : in bit;
        -- output ports
        word_line : out bit_vector (2**N-1 downto 0)
    );
end entity;

architecture behavioral of address_decoder is

    -- signal address2 :  natural range 0 to 2**N - 1;
begin

    -- gen : for i in address'range generate    -- problem
    gen : for i in 0 to 2**N - 1 generate
        word_line(i) <= '1' when ena = '0' else
                        '0' when i = address else
                        '1';
    end generate;

    -- identifier : for i in x to y generate
    -- end generate;

end architecture;
