----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 13/05/2020 (dd/mm/yyyy)
-- Design Name:         DFF with Several Event-Based Attributes
-- Module Name:         flipflop - Behavioral
-- Project Name:        ex_4.2
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      13/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------

entity flipflop is
    port (
        -- input ports
        d       : in bit;
        clk     : in bit;
        rst     : in bit;
        -- output ports
        q       : out bit
    );
end entity;

architecture arch of flipflop is

begin
    dehaviour : process(clk, rst)
    begin
        if (rst = '1') then
            q <= '0';
        elsif (clk'event and clk = '1') then
        -- elsif (not clk'stable and clk ='1') then
        -- elsif (clk'event and clk'last_value ='0') then
            q <= d;
        end if;
    end process;


end architecture;
