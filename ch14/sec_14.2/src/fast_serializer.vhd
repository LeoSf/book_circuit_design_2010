----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 16/06/2020 (dd/mm/yyyy)
-- Design Name:         Design of a fast Serializer
-- Module Name:         fast_serializer - Behavioral
-- Project Name:        sec_14.2
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      16/06/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;

entity fast_serializer is
    generic (
        N : integer := 4
    ); --number of bits
    port (
        -- input ports
        clk         : in std_logic;                         --10MHz system clock
        din         : in std_logic_vector(N-1 downto 0);
        -- output ports
        dout        : out std_logic;
        sclk_test	: out std_logic
    );
end entity;

architecture fast_serializer of fast_serializer is
    signal sclk: std_logic;
    signal internal: std_logic_vector(n-1 downto 0);

    -- component altera_pll is
    --     port(
    --         areset  : in std_logic := '0';
    --         inclk0  : in std_logic := '0';
    --         c0      : out std_logic;
    --         locked  : out std_logic
    --     );
    -- end component;

    component xilinx_pll is
        port(
            reset       : in std_logic := '0';
            clk_in1     : in std_logic := '0';
            clk_out1    : out std_logic;
            locked      : out std_logic
        );
    end component;
begin
    -----get sclk (with pll):------------
    pll_circuit: xilinx_pll
    port map(
        reset       => '0',
        clk_in1     => clk,
        clk_out1    => sclk,
        locked      => open
    );

    sclk_test <= sclk;

    -----build serializer:---------------
    process (sclk)
    variable count: integer range 0 to N;
    begin
        if (sclk'event and sclk = '1') then
            count := count + 1;

            if (count = N-1) then --enabled to update "internal"
                internal <= din;
            elsif (count = N) then --counter is 0-to-(n-1)
                count := 0;
            end if;

        dout <= internal(count); --continuous serial output
        end if;
    end process;

end architecture;
