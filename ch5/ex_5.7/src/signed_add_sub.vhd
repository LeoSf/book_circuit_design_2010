----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 15/05/2020 (dd/mm/yyyy)
-- Design Name:         DFF Implemented with Concurrent Code
-- Module Name:         signed_add_sub - Behavioral
-- Project Name:        ex_5.7
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
--  For this specific example, in both cases the carry is adding...
------------------------------------------------------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity signed_add_sub is
    generic (
        N: integer := 4     --number of input bits
    );
    port (
        a   : in std_logic_vector(N-1 downto 0);
        b   : in std_logic_vector(N-1 downto 0);
        cin : in std_logic;

        -- carry included in the output
        sum : out std_logic_vector(N downto 0);
        sub : out std_logic_vector(N downto 0)

        -- carry apart
        -- sum : out std_logic_vector(N-1 downto 0);
        -- sub : out std_logic_vector(N-1 downto 0);
        -- cout_sum : out std_logic);
        -- cout_sub : out std_logic)
    );

end entity;
------------------------------------------------------------------------
architecture signed_add_sub of signed_add_sub is

    signal a_sig, b_sig: signed(n-1 downto 0);
    signal sum_sig, sub_sig: signed(n downto 0);

begin
    -----convert to signed:--------------
    a_sig <= signed(a);
    b_sig <= signed(b);

    -----add and subtract:---------------
    sum_sig <= (a_sig(N-1) & a_sig) + (b_sig(N-1) & b_sig) + ('0' & cin);
    sub_sig <= (a_sig(N-1) & a_sig) - (b_sig(N-1) & b_sig) + ('0' & cin);

    -----output option #1:---------------
    sum <= std_logic_vector(sum_sig);
    sub <= std_logic_vector(sub_sig);

    -----output option #2:---------------
    -- sum <= std_logic_vector(sum_sig(N-1 downto 0));
    -- cout_sum <= std_logic(sum_sig(N));
    --
    -- sub <= std_logic_vector(sub_sig(N-1 downto 0));
    -- cout_sub <= std_logic(sub_sig(N));
    end architecture;
