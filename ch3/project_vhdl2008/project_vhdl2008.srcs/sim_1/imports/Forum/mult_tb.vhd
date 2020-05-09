library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- does not work for simulation
--use ieee.fixed_pkg.all;

-- according to ug900, this should be used for simulation
library ieee_proposed;
use ieee_proposed.fixed_pkg.all;


entity mult_tb is
--  Port ( );
end mult_tb;

ARCHITECTURE Behavioral OF mult_tb IS 
component main
    Port ( i_Clk : in STD_LOGIC;
           o_n1  : out sfixed (4 downto -3);
           o_n2  : out sfixed (4 downto -3);
           o_n3  : out sfixed (9 downto -6)
           );
end component;

signal r_Clk : STD_LOGIC := '0';
signal r_n1, r_n2 : sfixed (4 downto -3);
signal r_n3 : sfixed (9 downto -6);

begin

m : main port map
    (
        i_Clk => r_Clk,
        o_n1 => r_n1,
        o_n2 => r_n2,
        o_n3 => r_n3        
    );

process
begin
    r_Clk <= not(r_Clk);
    wait for 10 ns;
end process;


end Behavioral;