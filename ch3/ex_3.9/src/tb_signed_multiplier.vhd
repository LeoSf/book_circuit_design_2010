----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 12/05/2020 (dd/mm/yyyy)
-- Design Name:         Testbench: Recommended Signed Multiplier
--                      Implementation (for Integers)
-- Module Name:         tb_signed_multiplier - Behavioral
-- Project Name:        ex_3.9
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      12/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
-- use ieee.std_logic_arith.all;    -- for arch2, arch3
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
 --use ieee.std_logic_arith.all;

entity tb_signed_multiplier is
end tb_signed_multiplier;


architecture behavioral of tb_signed_multiplier is

    -- component declarations
    component signed_multiplier
        port(
             -- input ports
             a		: in	std_logic_vector(3 downto 0);
             b		: in	std_logic_vector(3 downto 0);
             -- output ports
             prod		: out	std_logic_vector(7 downto 0)
        );
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
    signal s_clk    : std_logic := '0';
    signal s_rst_n  : std_logic := '0';
    signal s_a		: std_logic_vector(3 downto 0) := (others => '0');
    signal s_b		: std_logic_vector(3 downto 0) := (others => '0');
    -- output signals
    signal s_prod		: std_logic_vector(7 downto 0);
begin

    -- intantiation of the Unit under test
    uut: entity work.signed_multiplier (arch1)
    port map(
        -- input ports
        a	=> s_a,
        b	=> s_b,
        -- output ports
        prod	=> s_prod
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
        s_a <= "0010";
        s_b <= "0010";
        wait for c_CLK_PERIOD;

        s_a <= "0011";
        wait for c_CLK_PERIOD;

        s_a <= "1101";
        wait for c_CLK_PERIOD;
        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


end behavioral;


-- configuration config of tb_signed_multiplier is
--     for behavioral
--         for uut: signed_multiplier
--             use configuration work.arch1;
--         end for;
--     end for;
-- end config2;
