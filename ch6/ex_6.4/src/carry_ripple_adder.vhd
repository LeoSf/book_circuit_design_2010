----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 15/05/2020 (dd/mm/yyyy)
-- Design Name:         Carry-Ripple Adder
-- Module Name:         carry_ripple_adder - Behavioral
-- Project Name:        ex_6.4
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
--      Sum: s_k = a_k xor b_k xor c_k
--      Carry: c_(k+1) = a_k · b_k + a_k · c_k + b_k · c_k
----------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;

entity carry_ripple_adder is
    generic (
        N : integer := 8        -- number of bits
    );
    port (
        -- input ports
        a   : in std_logic_vector(N-1 downto 0);
        b   : in std_logic_vector(N-1 downto 0);
        cin : in std_logic;
        -- output ports
        s   : out std_logic_vector(N-1 downto 0);
        cout: out std_logic
    );
end entity;

architecture structure of carry_ripple_adder is
begin
    process(a, b, cin)
        variable c : std_logic_vector(N downto 0);
    begin
        c(0) := cin;

        for i in 0 to N-1 loop
            s(i) <= a(i) xor b(i) xor c(i);

            c(i+1) :=   (a(i) and b(i)) or
                        (a(i) and c(i)) or
                        (b(i) and c(i));
        end loop;

        cout <= c(n);
    end process;
end architecture;
