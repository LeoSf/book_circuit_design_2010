----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 07/05/2020 (dd/mm/yyyy)
-- Design Name:         Registered Comp-Add Testbench
-- Module Name:         reg_comp_add - Behavioral
-- Project Name:        ex_2.3
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      07/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity tb_reg_compadd is
end tb_reg_compadd;


architecture behavioral of tb_reg_compadd is

    -- component declarations
    component reg_comp_add
        port(
            -- input ports
            clk         : in std_logic;
            a           : in integer range 0 to 7;
            b           : in integer range 0 to 7;
            -- output ports
            reg_comp    : out std_logic;
            reg_sum     : out integer range 0 to 15
        );
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;
    --Input signals
    signal s_clk    : std_logic := '0';
    signal s_a      : integer := 4;
    signal s_b      : integer := 5;
    --Output signals
    signal s_a_gt_b : std_logic;
    signal s_sum    : integer;

begin

    -- initialization of the Unit under test
    uut: reg_comp_add
    port map(
        -- input ports
        clk         => s_clk,
        a           => s_a,
        b           => s_b,
        -- output ports
        reg_comp    => s_a_gt_b,
        reg_sum     => s_sum
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
        -- variable v_number_1    : integer := 50;
        -- variable v_number_2    : integer := 0;
    begin

        wait for c_CLK_PERIOD;

        s_a <= 6;
        wait for 3 * c_CLK_PERIOD/2;
        s_b <= 10;

        wait for 2 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


end behavioral;
