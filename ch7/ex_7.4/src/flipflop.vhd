----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 15/05/2020 (dd/mm/yyyy)
-- Design Name:         DFF with q and qbar
-- Module Name:         flipflop - Behavioral
-- Project Name:        ex_7.4
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      15/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------

entity flipflop is
    port (
        -- input ports
        d       : in bit;
        clk     : in bit;
        -- output ports
        q       : buffer bit;
        qbar    : out bit
    );
end entity;
--------------------------------
architecture arch1 of flipflop is
begin

    proc1: process (clk)
    begin
        if clk'event and clk='1' then
            q <= d;
            qbar <= not d;
        end if;
    end process proc1;

end architecture;


architecture arch2 of flipflop is
begin

    proc2: process (clk)
    begin
        if clk'event and clk='1' then
            q <= d;
            qbar <= not q;
        end if;
    end process proc2;

end architecture;

architecture arch3 of flipflop is
begin

    proc3: process (clk)
    begin
        if clk'event and clk='1' then
            q <= d;
        end if;
    end process proc3;
    qbar <= not q;

end architecture;

---------------------------------
configuration module_conf of flipflop is
    for arch3
    end for;
end configuration;
---------------------------------
