----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 27/05/2020 (dd/mm/yyyy)
-- Design Name:         Type IV Testbench for a Registered Mux
-- Module Name:         tb_T4_reg_mux - Behavioral
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
--      Assume that the expected maximum propagation delay between the clock
--      and y (t_{pCQ}) is 10ns.
-- the first expected value is ommited because of the reset state of the fpga
-- at time 0
----------------------------------------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
    -- use ieee.numeric_std.all;
----------------------------------------------------------------
entity tb_T4_reg_mux is
    generic (
        tp  : time := 10ns
    );
end entity;
----------------------------------------------------------------
architecture testbench of tb_T4_reg_mux is
    ----dut declaration:----------
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

    ----signal declarations:------
    signal a_tb: std_logic_vector(3 downto 0) := "0010";
    signal b_tb: std_logic_vector(3 downto 0) := "0100";
    signal c_tb: std_logic_vector(3 downto 0) := "0110";
    signal d_tb: std_logic_vector(3 downto 0) := "1000";
    signal sel_tb: std_logic_vector(1 downto 0) := "00";
    signal clk_tb: std_logic := '0';
    signal x_tb: std_logic_vector(3 downto 0);
    signal y_tb: std_logic_vector(3 downto 0);
    signal expected: std_logic_vector(3 downto 0) := "0000";

begin
    ---dut instantiation:------------
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

    ---stimuli generation:-----------
    clk_tb <= not clk_tb after 40ns;

    a_tb <= "0011" after 80ns,
            "0000" after 640ns;
    b_tb <= "0101" after 240ns;
    c_tb <= "0111" after 400ns;
    d_tb <= "1001" after 560ns;

    sel_tb <=   "01" after 160ns,
                "10" after 320ns,
                "11" after 480ns,
                "00" after 640ns;

    ---output verification:----------
    ---(i) generate template:
    expected <= -- "0010" after  40ns + tp,
                "0011" after 120ns + tp,
                "0100" after 200ns + tp,
                "0101" after 280ns + tp,
                "0110" after 360ns + tp,
                "0111" after 440ns + tp,
                "1000" after 520ns + tp,
                "1001" after 600ns + tp,
                "0000" after 680ns + tp;

    ---(ii) make comparison:
    process
    begin
        wait for tp;
        if (now < 800ns) then
            assert (y_tb = expected)
                report  "mismatch at t=" & time'image(now) &
                        " y_tb=" & integer'image(conv_integer(y_tb)) &
                        " y_exp=" & integer'image(conv_integer(expected))
                severity note;
                -- severity failure;
        else
            assert false
            report "no error found (t=" & time'image(now) & ")"
            severity note;
        end if;
    end process;
end architecture;
