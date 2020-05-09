----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 05/04/2020 (mm/dd/yyyy)
-- Design Name:         Abacus
-- Module Name:         top - Behavioral
-- Project Name:        < >
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      05/04/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity tb_circuit is
end tb_circuit;


architecture behavioral of tb_circuit is

    -- component declarations
    component circuit
        port(
            -- input ports
            x   : in std_logic_vector(1 downto 0);
            -- output ports
            y   : out std_logic_vector(1 downto 0)
        );
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    --Input signals
    signal s_clk    : std_logic := '0';
    signal s_x      : std_logic_vector(1 downto 0) := "00";

    --Output signals
    signal s_y      : std_logic_vector(1 downto 0);

begin

    -- intantiation of the Unit under test
    uut: circuit
    port map(
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
   p_stim: process
   begin

        wait for 40 ns;

        wait for c_CLK_PERIOD;
        s_x <= "00";

        wait for c_CLK_PERIOD;
        s_x <= "01";

        wait for c_CLK_PERIOD;
        s_x <= "10";

        wait for c_CLK_PERIOD;
        s_x <= "11";

        wait for 2 * c_CLK_PERIOD;

        s_x <= "00";
        wait for c_CLK_PERIOD;
        -- thing to do here

        report "[msg] Testbench end." severity failure ;
    end process;


end behavioral;
