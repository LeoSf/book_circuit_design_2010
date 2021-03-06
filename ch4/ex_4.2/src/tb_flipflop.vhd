----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 13/05/2020 (dd/mm/yyyy)
-- Design Name:         DFF with Several Event-Based Attributes
-- Module Name:         flipflop - Behavioral
-- Project Name:        ex_4.2
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

entity tb_flipflop is
end tb_flipflop;


architecture behavioral of tb_flipflop is

    -- component declarations
    component flipflop
        port(
             -- input ports
             d		: in	bit;
             clk	: in	bit;
             rst	: in	bit;
             -- output ports
             q		: out	bit
        );
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
    signal s_d		: bit := '1';
    signal s_clk	: bit := '0';
    signal s_rst	: bit := '1';
    -- output signals
    signal s_q		: bit;
begin

    -- intantiation of the Unit under test
    uut: flipflop
    port map(
        -- input ports
        d	=> s_d,
        clk	=> s_clk,
        rst	=> s_rst,
        -- output ports
        q	=> s_q
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
        s_rst <= '1';
        wait for 40 ns;
        s_rst <= '0';

        wait for c_CLK_PERIOD;

        -- add code here
        s_d <= '0';
        wait for c_CLK_PERIOD;

        s_d <= '1';
        wait for c_CLK_PERIOD;

        s_d <= '0';
        wait for c_CLK_PERIOD;

        s_rst <= '1';
        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


end behavioral;
