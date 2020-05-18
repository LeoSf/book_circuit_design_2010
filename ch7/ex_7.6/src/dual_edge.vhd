----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 18/05/2020 (dd/mm/yyyy)
-- Design Name:         Dual-Edge Flip-Flop
-- Module Name:         dual_edge_dff - Behavioral
-- Project Name:        ex_7.6
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
-- this a realy low level design for a dual-edge DFF
-- logic Analysis:
--      when clk = 0: q2 = d; and q = q1 (latched)
--      when clk = 1: q1 = d; and q = q2 (latched)
--
--  a fully concurrent code could have been employed because the individual
--  units (muxes) are combinational circuits
----------------------------------------------------------------------------------

entity dual_edge_dff is
    port (
        clk : in bit;
        d   : in bit;
        q   : out bit
    );
end entity;

architecture structure of dual_edge_dff is
    signal q1, q2: bit;

begin
    process(clk, d)
    begin
        ---mux for q1:------
        if (clk = '0') then
            q1 <= q1;   -- clk = 0 memory
        else
            q1 <= d;
        end if;

        ---mux for q2:------
        if (clk = '0') then
            q2 <= d;
        else
            q2 <= q2;   -- clk = 1 memory
        end if;

        ---mux for q:-------
        if (clk = '0') then
            q <= q1;    -- asignation clk=0 for q1 from latched value
        else
            q <= q2;    -- asignation clk=1 for q2 from latched value
        end if;
    end process;

end architecture;
