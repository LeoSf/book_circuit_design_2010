----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 05/04/2020 (mm/dd/yyyy)
-- Design Name:         Compare-Add Testbench
-- Module Name:         top - Behavioral
-- Project Name:        < >
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      05/04/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity tb_comp_add is
end tb_comp_add;


architecture behavioral of tb_comp_add is

    -- component declarations
    component comp_add
        port(
            -- input signals
            a       : in integer range 0 to 7;
            b       : in integer range 0 to 7;
            -- output signals
            comp    : out std_logic;
            sum     : out integer range 0 to 15
        );
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;
    --Inputs
    signal s_clk    : std_logic := '0';
    signal s_rst_n  : std_logic := '0';
    signal s_a      : integer := 4;
    signal s_b      : integer := 5;
    --Outputs
    signal s_a_gt_b : std_logic;
    signal s_sum    : integer;

begin

    -- initialization of the Unit under test
    uut: comp_add
    port map(
        a       => s_a,
        b       => s_b,
        comp    => s_a_gt_b,
        sum     => s_sum
    );

    -- Clock process definitions
    p_clk_process : process
    begin
		s_clk <= '0';
		wait for c_CLK_PERIOD/2;
		s_clk <= '1';
		wait for c_CLK_PERIOD/2;
   end process;

   -- stimulus process
   p_stim_proc: process
        variable v_number_1    : integer := 50;
        variable v_number_2    : integer := 0;

    begin
        s_rst_n <= '0';
        wait for 40 ns;
        s_rst_n <= '1';

        wait for c_CLK_PERIOD;



        report "[msg] Testbench end." severity failure ;
    end process;


end behavioral;
