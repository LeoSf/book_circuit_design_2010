----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 15/05/2020 (dd/mm/yyyy)
-- Design Name:         DFF Implemented with Concurrent Code
-- Module Name:         concurrent_dff - Behavioral
-- Project Name:        ex_5.6
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
-- Since sequential logic circuits are digital circuits, and since NAND or
-- NOR gates can be easily constructed with concurrent code, then sequential
-- circuits can obviously also be constructed with pure concurrent code. However,
-- this approach is only viable for simple circuits, because in general the code 
-- would be much longer, more complex to write and debug, and unnatural to
-- follow. In conclusion, the use of concurrent code to design sequential
-- circuits is in general not recommended
----------------------------------------------------------------------------------
entity concurrent_dff is
    port (
        d   : in bit;
        clk : in bit;
        q   : buffer bit
    );
end entity;

architecture concurrent of concurrent_dff is

    signal p : bit;

begin

    p <= d when clk='0' else p; --1st mux
    q <= p when clk='1' else q; --2nd mux
end architecture;
