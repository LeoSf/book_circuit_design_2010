----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 05/04/2020 (mm/dd/yyyy)
-- Design Name:         Abacus
-- Module Name:         top - Behavioral
-- Project Name:        < >
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      05/04/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------

entity parity_det is
    generic (
        N: positive := 8
    );
    port (
        -- input ports
        x: in bit_vector(N-1 downto 0);
        -- output ports
        y: out bit
    );
end entity;

architecture ok of parity_det is

    signal temp: bit_vector(n-1 downto 0);

begin

    temp(0) <= x(0);

    gen: for i in 1 to n-1 generate
        temp(i) <= temp(i-1) xor x(i);
    end generate;

    y <= temp(n-1);
end architecture;
