----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 08/05/2020 (dd/mm/yyyy)
-- Design Name:         Unsigned Multiplier #1 Testbench
-- Module Name:         tb_multiplier_1u - Behavioral
-- Project Name:        ex_3.2
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

entity tb_multiplier_1u is
end tb_multiplier_1u;


architecture behavioral of tb_multiplier_1u is

    -- component declarations
    component multiplier_1u
        port(
            -- input ports
            a   : in unsigned (3 downto 0);
            b   : in unsigned (3 downto 0);
            -- output ports
            y   : out unsigned (7 downto 0)

        );
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    --Input signals
    signal s_clk : std_logic := '0';
    signal s_a  : unsigned (3 downto 0) := (others => '0');
    signal s_b  : unsigned (3 downto 0) := (others => '0');

    --Output signals
    signal s_y  :  unsigned (7 downto 0);

begin

    -- intantiation of the Unit under test
    uut: multiplier_1u
    port map(
        a => s_a,
        b => s_b,
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
        s_a <= "1101";
        s_b <= "0010";

        wait for c_CLK_PERIOD;
        s_b <= "1110";
        wait for 4 * c_CLK_PERIOD;
        -- thing to do here

        report "[msg] Testbench end." severity failure ;
    end process;


end behavioral;
