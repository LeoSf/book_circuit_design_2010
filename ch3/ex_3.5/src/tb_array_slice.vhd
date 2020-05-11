----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 11/05/2020 (dd/mm/yyyy)
-- Design Name:         Slicing a 1Dx1D Array of Integers
-- Module Name:         array_slice - Behavioral
-- Project Name:        ex_3.5
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

entity tb_array_slice is
end tb_array_slice;


architecture behavioral of tb_array_slice is

    -- component declarations
    component array_slice
        port (
            -- input ports
            row     : in integer range 1 to 3;
            -- output ports
            slice   : out integer range 0 to 15
        );
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- Std signals
    signal s_clk    : std_logic := '0';
    signal s_rst_n    : std_logic := '0';

    -- Input signals
    signal s_row    : integer range 1 to 3 := 1;

    --Output signals
    signal s_slice    : integer range 1 to 15;

begin

    -- intantiation of the Unit under test
    uut: array_slice
    port map(
        row     => s_row,
        slice   => s_slice
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

        multiple_loop : for j in 0 to 2 loop
            for_loop : for i in 1 to 3 loop
                s_row <= i;
                wait for c_CLK_PERIOD;
            end loop;
        end loop;

        -- nothing else to do
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


end behavioral;
