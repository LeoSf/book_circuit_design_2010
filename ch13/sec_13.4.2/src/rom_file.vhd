----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 08/08/2020 (dd/mm/yyyy)
-- Design Name:         ROM Design
-- Module Name:         rom_file - Behavioral
-- Project Name:        ex_13.4.2
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      05/06/2020  v0.01 File created
--
-- Additional Comments:
--  PENDING...
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
------------------------------------------------------------------
entity rom is
    port (
        clk         : in std_logic;
        address     : in integer range 0 to 15;
        data_out    : out std_logic_vector(7 downto 0)
    );
end rom;

architecture rom of rom is

    signal reg_address: integer range 0 to 15;
    type memory is array (0 to 15) of std_logic_vector(7 downto 0);
    signal myrom : memory;
    attribute ram_init_file: string;
    attribute ram_init_file of rom : signal is "mem_data.coe";

begin
    --register the address:----------
    process (clk)
    begin
        if (clk'event and clk='1') then
            reg_address <= address;
        end if;
    end process;

    --get unregistered output:-------
    data_out <= myrom(reg_address);

end rom;
