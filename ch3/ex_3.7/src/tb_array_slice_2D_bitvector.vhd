----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 11/05/2020 (dd/mm/yyyy)
-- Design Name:         Testbench: Slicing a 2D Array of Bits
-- Module Name:         tb_array_slice_2D_bitvector - Behavioral
-- Project Name:        ex_3.7
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

entity tb_array_slice_2D_bitvector is
end tb_array_slice_2D_bitvector;


architecture behavioral of tb_array_slice_2D_bitvector is

    -- component declarations
    component array_slice_2D_bitvector
        port(
            -- input ports
            row     : in integer range 0 to 3;
            column  : in integer range 0 to 4;  -- 3 bits
            -- output ports
            slice1  : out bit;
            slice2  : out bit_vector (1 to 2);
            slice3  : out bit_vector (1 to 4);
            slice4  : out bit_vector (1 to 3)
        );
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    --Input signals
    signal s_clk    : std_logic := '0';
    signal s_rst_n  : std_logic := '0';
    signal s_row    : integer range 0 to 3 := 1;
    signal s_column : integer range 0 to 4 := 1;

    --Output signals
    signal s_slice1  : bit;
    signal s_slice2  : bit_vector (1 to 2);
    signal s_slice3  : bit_vector (1 to 4);
    signal s_slice4  : bit_vector (1 to 3);

begin

    -- intantiation of the Unit under test
    uut: array_slice_2D_bitvector
    port map(
        row     => s_row,
        column  => s_column,
        slice1  => s_slice1,
        slice2  => s_slice2,
        slice3  => s_slice3,
        slice4  => s_slice4
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

        loop_cools : for j in 1 to 3 loop
            loop_row : for i in 1 to 3 loop
                s_row <= i;
                s_column <= j;
                wait for c_CLK_PERIOD;
            end loop;

        end loop;

        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


end behavioral;
