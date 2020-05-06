----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 06/05/2020 (dd/mm/yyyy)
-- Design Name:         Registerd Comp-Adder
-- Module Name:         Module - Behavioral
-- Project Name:        ex_2.2
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      06/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity reg_comp_add is
  port (
    -- input ports
    clk         : in std_logic;
    a           : in integer range 0 to 7;
    b           : in integer range 0 to 7;
    -- output ports
    reg_comp    : out std_logic;
    reg_sum     : out integer range 0 to 15
  );
end entity;

architecture behavioral of reg_comp_add is
    signal comp : std_logic;
    signal sum  : integer range 0 to 15;
begin

    comp <= '1' when a > b else '0';

    sum <= a + b;

    p_behav : process(clk)
    begin
        if (clk'event and clk = '1') then
            reg_comp <= comp;
            reg_sum <= sum;
        end if;
    end process;

end architecture;
