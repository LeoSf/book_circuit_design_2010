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
--  Top layer component
----------------------------------------------------------------------------------

entity parity_detector is
    generic (
        N   : positive := 8
    );
    port (
        -- input ports
        x   : in bit_vector(N-1 downto 0);
        -- output ports
        y   : out bit
    );
end parity_detector;

architecture structural of parity_detector is
    component par_detector is
        generic (
            BITS : positive
        );
        port (
            input  : in bit_vector(BITS-1 downto 0);
            output : out bit
        );
    end component;
-----------------------------
begin
    det: par_detector
        generic map (
            bits=>n
        )
        port map (
            input   => x,
            output  => y
        );

end structural;
