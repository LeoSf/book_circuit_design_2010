----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 13/05/2020 (dd/mm/yyyy)
-- Design Name:         Construction of a Delay Line with the keep Attribute
-- Module Name:         delay_line - Behavioral
-- Project Name:        ex_4.4
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

entity tb_delay_line is
end tb_delay_line;


architecture behavioral of tb_delay_line is

    -- component declarations
    component delay_line
        port(
             -- input ports
             x		: in	bit;
             -- output ports
             y		: out	bit
        );
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
    signal s_clk    : std_logic := '0';
    signal s_rst_n  : std_logic := '0';
    signal s_x		: bit;
    -- output signals
    signal s_y		: bit;
begin

    -- instantiation of the Unit under test
    uut: delay_line
    port map(
        -- input ports
        x	=> s_x,
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
        wait for 40 ns;
        s_rst_n <= '1';

        wait for c_CLK_PERIOD;

        -- add code here

        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


end behavioral;
    