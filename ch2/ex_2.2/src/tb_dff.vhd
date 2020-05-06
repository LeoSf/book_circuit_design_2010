----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 05/05/2020 (mm/dd/yyyy)
-- Design Name:         Testbench: D-type Flip Flop (DFF)
-- Module Name:         top - Behavioral
-- Project Name:        ex_2.2
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      05/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity tb_dflipflop is
end tb_dflipflop;

architecture behavioral of tb_dflipflop is

    -- component declarations
    component flip_flop is
        port(
            -- input ports
            d   : in std_logic;
            clk : in std_logic;
            rst : in std_logic;
            -- output ports
            q   : out std_logic
        );
    end component;

    -- clock period definition
    constant c_CLK_PERIOD   : time := 10 ns;

    -- input signals
    signal s_clk    : std_logic := '0';
    signal s_rst  : std_logic := '0';
    signal s_din    : std_logic := '0';

    -- output signals
    signal s_qout   : std_logic := '0';

begin

    -- unit under test instantiation
    uut: flip_flop
    port map(
        d   => s_din,
        clk => s_clk,
        rst => s_rst,
        q   => s_qout
    );

    -- clock process definition
    p_clk_process : process
    begin
        s_clk <= '0';
        wait for c_CLK_PERIOD/2;
        s_clk <= '1';
        wait for c_CLK_PERIOD/2;
    end process;

    -- stimulus process
    p_stim : process
    begin

        s_rst <= '1';
        s_din <= '1';

        wait for 3 * c_CLK_PERIOD;
        s_rst <= '0';

        wait for c_CLK_PERIOD;
        s_din <= '0';
        wait for c_CLK_PERIOD;
        s_din <= '1';
        wait for c_CLK_PERIOD;
        s_din <= '0';
        wait for c_CLK_PERIOD;
        s_din <= '1';
        wait for c_CLK_PERIOD;
        s_rst <= '1';

        assert false report "Simulation completed" severity failure;
    end process;


end architecture;
