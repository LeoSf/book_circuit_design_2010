library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- synthesis, implementaion and bitstream generation work with this
--use ieee.fixed_pkg.all;

-- according to ug900, this should be used for simulation
library ieee_proposed;
use ieee_proposed.fixed_pkg.all;

entity main is
    Port ( i_Clk : in STD_LOGIC;
            o_n1 : out sfixed (4 downto -3);
            o_n2 : out sfixed (4 downto -3);
            o_n3 : out sfixed (9 downto -6)
           );
end main;

architecture Behavioral of main is

signal n1, n2 : sfixed(4 downto -3);
signal n3 : sfixed(9 downto -6); 

begin

    o_n1 <= n1;
    o_n2 <= n2;
    o_n3 <= n3;
                
    calc : process(i_Clk) 
    begin
        if rising_edge (i_Clk) then
            n1 <= to_sfixed (5.75, n1);
            n2 <= to_sfixed (-6.5, n2);
            n3 <= n1 * n2;
        end if;        
        
    end process calc;
    
end Behavioral;