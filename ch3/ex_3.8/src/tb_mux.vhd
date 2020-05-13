----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 12/05/2020 (dd/mm/yyyy)
-- Design Name:         Example 3.8: Multiplexer with 1Dx1D PORT
-- Module Name:         mux - Behavioral
-- Project Name:        ex_3.8
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

use work.my_data_types.all;

entity tb_mux is
end tb_mux;


architecture behavioral of tb_mux is

    -- component declarations
    component mux
        port(
             -- input ports
             x		: in	oneDimOneDim;
             sel	: in	integer range 0 to 3;
             -- output ports
             y		: out	bit_vector (7 downto 0)
        );
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
    signal s_clk    : std_logic := '0';
    signal s_rst_n  : std_logic := '0';
    signal s_x		: oneDimOneDim;
    signal s_sel	: integer range 0 to 3 := 0;
    -- output signals
    signal s_y		: bit_vector (7 downto 0);
begin

    -- intantiation of the Unit under test
    uut: mux
    port map(
        -- input ports
        x	=> s_x,
        sel	=> s_sel,
        -- output ports
        y	=> s_y
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
    p_stim : process
    begin
        s_rst_n <= '0';
        s_sel   <= 0;
        wait for 40 ns;
        s_rst_n <= '1';

        wait for c_CLK_PERIOD;

        -- add code here
        s_x(0) <= "00000001";
        s_x(1) <= "00000010";
        s_x(2) <= "00000100";
        s_x(3) <= "00001000";

        sel2 : for j in 0 to 1 loop
            sel : for i in 0 to 3 loop
                s_sel <= i;
                wait for c_CLK_PERIOD;
            end loop;
        end loop;

        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


end behavioral;
