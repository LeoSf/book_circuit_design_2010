----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 18/05/2020 (dd/mm/yyyy)
-- Design Name:         Example 8.3: Parity Detector with COMPONENT and GENERIC MAP
-- Module Name:         parity_detector - Behavioral
-- Project Name:        ex_8.3
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
--  Same file as project ex_8.3
----------------------------------------------------------------------------------

----------the component:--------------------------
entity par_detector is
    generic (
        BITS : positive
    );
    port (
        input  : in bit_vector(BITS-1 downto 0);
        output : out bit
    );
end par_detector;

architecture behavior of par_detector is
begin
    process(input)
        variable temp: bit;
    begin
        temp := '0';
        for i in input'range loop
            temp := temp xor input(i);
        end loop;

        output <= temp;
    end process;
end behavior;
