----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 07/05/2020 (dd/mm/yyyy)
-- Design Name:         Tri-State Buffer Testbench
-- Module Name:         tb_tri_state_buff - Behavioral
-- Project Name:        ex_3.1
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

entity tb_tri_state_buff is
end tb_tri_state_buff;


architecture behavioral of tb_tri_state_buff is

    -- component declarations
    component tri_state_buff
    port (
        -- input ports
        input   : in std_logic;
        ena     : in std_logic;
        -- output ports
        output  : out std_logic
    );
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    --Input signals
    signal s_clk    : std_logic := '0';
    signal s_input  : std_logic := '0';
    signal s_ena  : std_logic := '0';
    --Output signals
    signal s_out : std_logic;

begin

    -- intantiation of the Unit under test
    uut: tri_state_buff
    port map(
        input   => s_input,
        ena     => s_ena,
        output  => s_out
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
   p_stim: process

    begin
        s_ena <= '0';
        wait for 40 ns;
        s_ena <= '1';

        wait for c_CLK_PERIOD;
        s_input <= '1';
        wait for c_CLK_PERIOD;
        s_input <= '0';
        wait for c_CLK_PERIOD;
        s_input <= '1';
        wait for c_CLK_PERIOD;
        s_ena <= '0';

        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


end behavioral;
