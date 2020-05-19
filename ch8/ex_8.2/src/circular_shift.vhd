----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 18/05/2020 (dd/mm/yyyy)
-- Design Name:         Circular Shift Register with COMPONENT
-- Module Name:         circular_shift - Behavioral
-- Project Name:        ex_8.2
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
--  VHDL-2008
----------------------------------------------------------------------------------

-- main code:
entity circular_shift is
    port (
        -- input ports
        clk     : in bit;
        load    : in bit;
        d       : in bit_vector(0 to 3);
        -- output ports
        q       : buffer bit_vector(0 to 3)
    );
end entity;

architecture structural of circular_shift is
    signal i: bit_vector(0 to 3);
    -----------------
    component mux is
        port (a, b, sel: in bit; x: out bit);
    end component;
    ---------------------
    component flipflop is
        port (d, clk: in bit; q: out bit);
    end component;

begin
    mux1: mux port map (q(3), d(0), load, i(0));
    mux2: mux port map (q(0), d(1), load, i(1));
    mux3: mux port map (q(1), d(2), load, i(2));
    mux4: mux port map (q(2), d(3), load, i(3));
    dff1: flipflop port map (i(0), clk, q(0));
    dff2: flipflop port map (i(1), clk, q(1));
    dff3: flipflop port map (i(2), clk, q(2));
    dff4: flipflop port map (i(3), clk, q(3));
end architecture;
