----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 12/05/2020 (dd/mm/yyyy)
-- Design Name:         Recommended Signed Multiplier Implementation (for Integers)
-- Module Name:         signed_multiplier - Behavioral
-- Project Name:        ex_3.9
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      12/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    -- use ieee.std_logic_arith.all;    -- for arch2, arch3

entity signed_multiplier is
    port (
        -- input ports
        a       : in std_logic_vector(3 downto 0);
        b       : in std_logic_vector(3 downto 0);
        -- output ports
        prod    : out std_logic_vector(7 downto 0)
    );
end entity;

architecture arch1 of signed_multiplier is
    signal a_sig    : signed (3 downto 0);
    signal b_sig    : signed (3 downto 0);
begin
    a_sig <= signed(a);
    b_sig <= signed(b);

    prod <= std_logic_vector(a_sig * b_sig);
end arch1;

architecture arch2 of signed_multiplier is
    signal a_sig    : signed (3 downto 0);
    signal b_sig    : signed (3 downto 0);
    signal prod_sig : signed (7 downto 0);
begin
    a_sig <= signed(a);
    b_sig <= signed(b);

    prod_sig <= a_sig * b_sig;

    prod <= std_logic_vector(prod_sig);
end arch2;

architecture arch3 of signed_multiplier is
    signal a_sig    : signed (3 downto 0);
    signal b_sig    : signed (3 downto 0);
begin
    a_sig <= signed(a);
    b_sig <= signed(b);

    prod <= std_logic_vector(signed'(a_sig * b_sig));
end arch3;
