----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 11/05/2020 (dd/mm/yyyy)
-- Design Name:         Floating poit PoC
-- Module Name:         floating - Behavioral
-- Project Name:        poc_floatingpoint
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      11/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

library ieee_proposed;
    use ieee_proposed.float_pkg.all;

entity tb_floating is
end tb_floating;


architecture behavioral of tb_floating is

    -- component declarations
    component floating
        port(
            -- input ports
            a   : in float (3 downto -4);
            b   : in float (3 downto -4);
            -- output ports
            x   : out float (3 downto -4);
            y   : out float (3 downto -4)
        );
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    --Input signals
    signal s_clk    : std_logic := '0';
    signal s_a      : float (3 downto -4) := (others => '0');
    signal s_b      : float (3 downto -4) := (others => '0');

    --Output signals
    signal s_x      : float (3 downto -4);
    signal s_y      : float (3 downto -4);

begin

    -- intantiation of the Unit under test
    uut: floating
    port map(
        a => s_a,
        b => s_b,
        x => s_x,
        y => s_y
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
        wait for 40 ns;
        s_a <= to_float(12.0, 3, 4);
        s_b <= to_float(-0.34375, 3, 4);

        wait for 4 * c_CLK_PERIOD;
        s_b <= to_float(0.11111, 3, 4);

        wait for 6 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;

end architecture;
