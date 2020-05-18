----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 15/05/2020 (dd/mm/yyyy)
-- Design Name:         Shift Register
-- Module Name:         shift_register - Behavioral
-- Project Name:        ex_6.3
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

entity shift_register is
    generic (
        N : integer := 4
    ); --number of stages
    port (
        -- input ports
        din     : in std_logic;
        clk     : in std_logic;
        rst     : in std_logic;
        -- output ports
        dout    : out std_logic
    );
end entity;

architecture shift_register of shift_register is
begin
    process (clk, rst)
        variable q: std_logic_vector(0 to N-1);
    begin
        if (rst = '1') then
            q := (others => '0');

        elsif (clk'event and clk = '1') then
            -- registro de desplazamiento hacia la derecha
            q := din & q(0 to N-2);
        end if;

        dout <= q(N-1);
    end process;
end architecture;
