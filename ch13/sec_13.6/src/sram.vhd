----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 08/06/2020 (dd/mm/yyyy)
-- Design Name:         External Memory Interfaces
-- Module Name:         sram - Behavioral
-- Project Name:        ex_13.6
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      08/06/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;

entity sram is
    generic (
        -- fclk: natural := 50_000_000
        fclk: natural := 100
    );
	port (
        -- input ports
		clk	: in std_logic;
		rst	: in std_logic;
        -- bidirectional ports
        d: inout std_logic_vector(15 downto 0);
        -- output ports
		nce	: out std_logic;
        nwe	: out std_logic;
        noe	: out std_logic;
        nub	: out std_logic;
        nlb	: out std_logic;
        a   : out std_logic_vector(17 downto 0);
        -- test signals
        test    : out std_logic_vector(7 downto 0);
        we_test : out std_logic
    );

end entity;

architecture sram of sram is

    type memory is array (0 to 7) of std_logic_vector(7 downto 0);
    constant rom: memory := (
        0 => "00000000",
        1 => "00000001",
        2 => "00000011",
        3 => "00000111",
        4 => "00001111",
        5 => "00011111",
        6 => "00111111",
        7 => "01111111"
    );

begin

    --feed sram static pins:--------------
    nce <= '0';
    noe <= '0';
    nub <= '0';
    nlb <= '0';

    --------------------------------------
    process (clk, rst)
        variable wr_enable  : std_logic;
        variable wr_done    : std_logic;
        variable count      : natural range 0 to fclk;
        variable i          : natural range 0 to 15;
    begin
        --create address and wr_done:-----
        if (rst = '1') then
            count := 0;
            i := 0;
            wr_done := '0';
        elsif (clk'event and clk = '1') then
            count := count + 1;
            if (count = fclk/2) then
                count := 0;
                i := i + 1;

                if (i = 8) then
                    i := 0;
                    wr_done := '1';
                end if;
            end if;
        end if;

        a <= conv_std_logic_vector(i, 18);

        --create nwe:---------------------
        if (wr_done = '0') then
            wr_enable := clk;
        else
            wr_enable := '1';
        end if;

        nwe <= wr_enable;
        we_test <= wr_enable;

        --bidirectional bus:--------------
        test <= d(7 downto 0);

        if (wr_enable = '0') then
            d <= "00000000" & rom(i);
        else
            d <= (others => 'Z');
        end if;

    end process;
end architecture;
