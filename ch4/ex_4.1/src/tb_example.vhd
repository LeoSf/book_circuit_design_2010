----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 13/05/2020 (dd/mm/yyyy)
-- Design Name:         Using Predefined Scalar Attributes
-- Module Name:         example - Behavioral
-- Project Name:        ex_4.1
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      13/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity tb_example is
end tb_example;


architecture behavioral of tb_example is

    -- component declarations
    component example
        port(
             -- input ports
             x		: in	integer range 0 to 3;
             -- output ports
             y1		: out	bit;
             y2		: out	bit;
             y3		: out	bit;
             y4		: out	bit;
             y5		: out	bit
        );
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
    signal s_clk    : std_logic := '0';
    signal s_rst_n  : std_logic := '0';
    signal s_x		: integer range 0 to 3 := 0;
    -- output signals
    signal s_y1		: bit;
    signal s_y2		: bit;
    signal s_y3		: bit;
    signal s_y4		: bit;
    signal s_y5		: bit;
begin

    -- intantiation of the Unit under test
    uut: example
    port map(
        -- input ports
        x	=> s_x,
        -- output ports
        y1	=> s_y1,
        y2	=> s_y2,
        y3	=> s_y3,
        y4	=> s_y4,
        y5	=> s_y5
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
        wait for 40 ns;
        s_rst_n <= '1';

        wait for c_CLK_PERIOD;

        -- add code here
        identifier : for i in 0 to 5 loop
            s_x <= i;
            wait for c_CLK_PERIOD;
        end loop;

        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


end behavioral;
