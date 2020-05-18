----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 18/05/2020 (dd/mm/yyyy)
-- Design Name:         Generic Hamming Weight with Concurrent Code
-- Module Name:         hamm_weight - Behavioral
-- Project Name:        ex_7.7
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      18/05/2020  v0.01 File created
--
-- Additional Comments:
--      The Hamming weight of a string is the number of symbols that are
--      different from the zero-symbol of the alphabet used
--      https://en.wikipedia.org/wiki/Hamming_weight
----------------------------------------------------------------------------------

entity hamm_weight is
    generic (
        N : positive := 8
    );
    port (
        -- input ports
        x: in bit_vector(N-1 downto 0);
        -- output ports
        y: out integer range 0 to N
    );
end entity;

-- architecture not_ok of hamm_weight is
--     signal temp: integer range 0 to n;
-- begin
--     temp <= 0;
--
--     gen: for i in 1 to n-1 generate
--         temp <= temp + 1 when x(i)='1' else temp;
--     end generate;
--
--     y <= temp;
-- end architecture;

architecture ok of hamm_weight is
    type oneDimOneDim is array (0 to N-1) of integer range 0 to N;
    signal temp: oneDimOneDim;

begin
    temp(0) <=  0 when x(0) = '0'
                else 1;

    gen: for i in 1 to n-1 generate
        temp(i) <=  temp(i-1) + 1    when x(i) = '1'
                    else temp(i-1);
    end generate;

    y <= temp(n-1);
end architecture;
