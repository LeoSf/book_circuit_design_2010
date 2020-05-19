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
--  This is a modification over ex_8.3
--  It is important to mention that in regular codes (with just one architecture
-- for each entity, and with component instantiations fully specified using the
-- syntax of section 8.3) there is no need to use CONFIGURATION
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
    component detector is
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
    det : detector
        generic map (
            bits => n
        )
        port map (
            input   => x,
            output  => y
        );

end structural;

configuration my_config of parity_detector is
    for structural
        for det : detector
            use entity work.par_detector(behavior);
        end for;
    end for;
end my_config;
