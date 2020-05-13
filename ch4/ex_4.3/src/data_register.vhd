----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 13/05/2020 (dd/mm/yyyy)
-- Design Name:         Specifying Device Pins with the chip_ pin Attribute
-- Module Name:         data_register - Behavioral
-- Project Name:        ex_4.3
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      13/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------

entity data_register is
port (
    clk         : in bit;
    data_in     : in bit_vector(3 downto 0);
    data_out    : out bit_vector(3 downto 0)
);
end entity;
--------------------------------------------------------------
architecture data_register of data_register is

    attribute chip_pin  : string;
    attribute chip_pin of clk       : signal is "n2";
    attribute chip_pin of data_in   : signal is "a3, a4, a5, a6";
    attribute chip_pin of data_out  : signal is "b3, b4, b5, b6";

begin

    behav : process (clk)
    begin
        if (clk'event and clk='1') then
            data_out <= data_in;
        end if;
    end process;
    
end architecture;
--------------------------------------------------------------
