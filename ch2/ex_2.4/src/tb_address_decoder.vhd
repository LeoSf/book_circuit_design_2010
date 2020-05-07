----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 07/05/2020 (dd/mm/yyyy)
-- Design Name:         Registered Comp-Add Testbench
-- Module Name:         reg_comp_add - Behavioral
-- Project Name:        ex_2.3
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      07/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity tb_address_decoder is
    generic(
        g_N   : natural := 3
    );

end tb_address_decoder;


architecture behavioral of tb_address_decoder is

    -- component declarations
    component address_decoder
    generic(
        N   : natural := 3
    );
    port (
        -- input ports
        address : in natural range 0 to 2**N - 1;
        ena     : in bit;
        -- output ports
        word_line : out bit_vector ((2**N - 1) downto 0)
    );
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    signal s_clk        : std_logic := '0';
    signal s_rst_n      : std_logic := '0';     -- not used

    --Input signals
    signal s_address    : natural range 0 to (2**g_N - 1);
    signal s_ena        : bit := '0';
    --Output signals
    signal s_word_line  : bit_vector ((2**g_N - 1) downto 0);


begin

    -- instantiation of the Unit under test
    uut: address_decoder
    generic map(
        N =>  g_N
    )
    port map(
        -- input ports
        address     => s_address,
        ena         => s_ena,
        -- output ports
        word_line   => s_word_line
    );

    -- Clock process definitions
    -- not necessary here... but still
    p_clk_process : process
    begin
		s_clk <= '0';
		wait for c_CLK_PERIOD/2;
		s_clk <= '1';
		wait for c_CLK_PERIOD/2;
   end process;

   -- stimulus process
   p_stim_proc: process
   begin
        s_ena <= '0';
        wait for c_CLK_PERIOD;
        s_ena <= '1';

        wait for c_CLK_PERIOD;
        s_address <= 3;

        wait for 2* c_CLK_PERIOD;
        s_address <= 1;

        wait for c_CLK_PERIOD;
        s_address <= 4;

        wait for 2* c_CLK_PERIOD;
        s_ena <= '0';


        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


end behavioral;
