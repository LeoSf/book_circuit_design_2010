----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 18/05/2020 (dd/mm/yyyy)
-- Design Name:         Shift Register with COMPONENT and GENERATE
-- Module Name:         shift_register - Behavioral
-- Project Name:        ex_8.4
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
--  Top component layer
----------------------------------------------------------------------------------

-- library work;
use work.my_declarations.all;

entity shift_register is
    generic (
        M   : positive := 4;    -- M stages
        N   : positive := 8     -- N bits
    );
    port (
        -- input ports
        clk     : in bit;
        load    : in bit;
        x       : in bit_vector(N-1 downto 0);
        d       : in twoDim(0 to M-1, N-1 downto 0);
        -- output ports
        y       : out bit_vector(N-1 downto 0)
    );
end entity;
------------------------------------------------------------------
architecture structural of shift_register is
    signal u : twoDim(0 to M, N-1 downto 0);
    signal v : twoDim(0 to M-1, N-1 downto 0);
begin
    ----transfer x -> u and u -> y:---------
    gen1: for i in N-1 downto 0 generate
        u(0,i) <= x(i);
        y(i) <= u(M,i);
    end generate gen1;

    ----update internal array:----------
    gen2: for i in 0 to M-1 generate
        gen3: for j in N-1 downto 0 generate
            mux1: mux
                port map (u(i,j), d(i,j), load, v(i,j));

            dff1: flipflop
                port map (v(i,j), clk, u(i+1,j));
        end generate gen3;
    end generate gen2;

end architecture;



-------------------------------------------------------------------
