----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 31/05/2020 (dd/mm/yyyy)
-- Design Name:         Zero-to-Nine Counter
-- Module Name:         counter_std - Behavioral
-- Project Name:        ex_11.3
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      31/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity counter_std is
    port (
        -- input ports
        clk_i       : in std_logic;
        rst_n_i	    : in std_logic;
        -- s_data ports
        data_o      : out std_logic_vector(3 downto 0)
    );
end counter_std;
----------------------------------------------------------
architecture fsm of counter_std is
    type state is
        (zero, one, two, three, four, five, six, seven, eight, nine);

    signal pr_state, nx_state: state;
    attribute enum_encoding: string; --optional attribute
    attribute enum_encoding of state: type is "sequential";

    signal s_data : integer;

begin
    ----lower section of fsm:-----------
    process (rst_n_i, clk_i)
    begin
        if (rst_n_i = '0') then
            pr_state <= zero;
        elsif (clk_i'event and clk_i = '1') then
            pr_state <= nx_state;
        end if;
    end process;

    ----upper section of fsm:-----------
    process (pr_state)
    begin
        case pr_state is
            when zero =>
                s_data <= 0;
                nx_state <= one;
            when one =>
                s_data <= 1;
                nx_state <= two;
            when two =>
                s_data <= 2;
                nx_state <= three;
            when three =>
                s_data <= 3;
                nx_state <= four;
            when four =>
                s_data <= 4;
                nx_state <= five;
            when five =>
                s_data <= 5;
                nx_state <= six;
            when six =>
                s_data <= 6;
                nx_state <= seven;
            when seven =>
                s_data <= 7;
                nx_state <= eight;
            when eight =>
                s_data <= 8;
                nx_state <= nine;
            when nine =>
                s_data <= 9;
                nx_state <= zero;
        end case;
    end process;

    data_o <= std_logic_vector(to_unsigned(s_data, data_o'length));

end fsm;
