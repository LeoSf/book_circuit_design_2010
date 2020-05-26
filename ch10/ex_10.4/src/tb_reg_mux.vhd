----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 26/05/2020 (dd/mm/yyyy)
-- Design Name:         Type I Testbench for a Registered Mux
-- Module Name:         tb_reg_mux - Behavioral
-- Project Name:        ex_10.4
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      26/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity tb_reg_mux is
end entity;

architecture testbench of tb_reg_mux is
    ----dut declaration:--------
    component reg_mux is
        port (
            -- input ports
            a	: in std_logic_vector(3 downto 0);
            b	: in std_logic_vector(3 downto 0);
            c	: in std_logic_vector(3 downto 0);
            d	: in std_logic_vector(3 downto 0);
            sel : in std_logic_vector(1 downto 0);
            clk : in std_logic;
            -- -- output ports
            x	: out std_logic_vector(3 downto 0);
            y	: out std_logic_vector(3 downto 0)
        );
    end component;

    ----signal declarations:----
    signal a_tb: std_logic_vector(3 downto 0) := "0010";
    signal b_tb: std_logic_vector(3 downto 0) := "0100";
    signal c_tb: std_logic_vector(3 downto 0) := "0110";
    signal d_tb: std_logic_vector(3 downto 0) := "1000";
    signal sel_tb: std_logic_vector(1 downto 0) := "00";
    signal clk_tb: std_logic := '0';
    signal x_tb: std_logic_vector(3 downto 0);
    signal y_tb: std_logic_vector(3 downto 0);

begin
    ---dut instantiation:-------
    dut : reg_mux
    port map (
        -- input ports
        a   => a_tb,
        b   => b_tb,
        c   => c_tb,
        d   => d_tb,
        clk => clk_tb,
        sel => sel_tb,
        -- output ports
        x   => x_tb,
        y   => y_tb
    );

    ---stimuli generation:------
    clk_tb <= not clk_tb after 40ns;
    a_tb <= "0011" after 80ns, "0000" after 640ns;
    b_tb <= "0101" after 240ns;
    c_tb <= "0111" after 400ns;
    d_tb <= "1001" after 560ns;
    sel_tb <=   "01" after 160ns,
                "10" after 320ns,
                "11" after 480ns,
                "00" after 640ns;

end architecture;
