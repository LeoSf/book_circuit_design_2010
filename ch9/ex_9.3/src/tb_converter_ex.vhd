----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 20/05/2020 (dd/mm/yyyy)
-- Design Name:         FUNCTION slv_to_integer in an ENTITY
-- Module Name:         converter_ex - Behavioral
-- Project Name:        ex_9.3
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      20/05/2020  v0.01 File created
--
-- Additional Comments:
-- FUNCTION that converts a signal of type STD_LOGIC_VECTOR to type INTEGER.
-- This includes an ASSERT statement in your code to ensure that no symbols
-- other than '0', 'L' (both synthesized as '0'), '1' or 'H' (both synthesized
-- as '1') are present at the input. This time, construct the function directly
-- in the code’s ENTITY.
----------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

library work;
    use work.converter_pkg.all;

entity tb_module is
end tb_module;


architecture behavioral of tb_module is

    -- component declarations
    -- none

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    --Input signals
    signal s_clk    : std_logic := '0';
    signal s_rst_n  : std_logic := '0';

    --Output signals
    signal s_a_gt_b : std_logic;
    signal s_sum    : integer;

begin

    -- intantiation of the Unit under test
    -- none

    -- Clock process definitions
    p_clk_process : process
    begin
        s_clk <= '0';
        wait for c_CLK_PERIOD/2;
        s_clk <= '1';
        wait for c_CLK_PERIOD/2;
   end process;

   -- stimulus process
   p_stim : process
        variable v_number_1    : integer := 0;
        variable v_number_2    : integer := 0;
   begin
        s_rst_n <= '0';
        wait for 40 ns;
        s_rst_n <= '1';

        wait for c_CLK_PERIOD;

        -- thing to do here

        report "[msg] Testbench end." severity failure ;
    end process;


end behavioral;
