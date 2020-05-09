----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 08/05/2020 (dd/mm/yyyy)
-- Design Name:         Fixed point operations Testbench
-- Module Name:         tb_fixedpoint_1 - Behavioral
-- Project Name:        poc_fixedpoint
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      08/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    -- use ieee.fixed_pkg.all;
library ieee_proposed;
    use ieee_proposed.fixed_pkg.all;

entity tb_fixedpoint_1 is
end tb_fixedpoint_1;


architecture behavioral of tb_fixedpoint_1 is

    -- component declarations
    component fixedpoint_1
        port(
            -- input ports
            a   : in sfixed (3 downto -3);
            b   : in sfixed (3 downto -3);
            -- output ports
            x   : out sfixed (4 downto -3);
            y   : out sfixed (7 downto -6)
        );
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    --Input signals
    signal s_clk    : std_logic := '0';
    signal s_a      : sfixed (3 downto -3) := (others => '0');
    signal s_b      : sfixed (3 downto -3) := (others => '0');

    --Output signals
    signal s_x      : sfixed (4 downto -3);
    signal s_y      : sfixed (7 downto -6);

begin

    -- intantiation of the Unit under test
    uut: fixedpoint_1
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
        variable v_number_1    : sfixed (4 downto -3) := (others => '0');
   begin
        wait for 40 ns;
        s_a <= to_sfixed(17.5, 3, -3);
        s_b <= to_sfixed(4.0, 3, -3);

        wait for 4 * c_CLK_PERIOD;
        s_b <= to_sfixed(8.0, 3, -3);

        wait for 6 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


end behavioral;
