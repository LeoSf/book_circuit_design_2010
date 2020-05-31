----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 31/05/2020 (dd/mm/yyyy)
-- Design Name:         Zero-to-Nine Counter
-- Module Name:         counter - Behavioral
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
entity counter is
    port (
        -- input ports
        clk     : in bit;
        rst	    : in bit;
        -- output ports
        output  : out natural range 0 to 9
    );
end counter;
----------------------------------------------------------
architecture fsm of counter is
    type state is
        (zero, one, two, three, four, five, six, seven, eight, nine);

    signal pr_state, nx_state: state;
    attribute enum_encoding: string; --optional attribute
    attribute enum_encoding of state: type is "sequential";

begin
    ----lower section of fsm:-----------
    process (rst, clk)
    begin
        if (rst = '1') then
            pr_state <= zero;
        elsif (clk'event and clk = '1') then
            pr_state <= nx_state;
        end if;
    end process;

    ----upper section of fsm:-----------
    process (pr_state)
    begin
        case pr_state is
            when zero =>
                output <= 0;
                nx_state <= one;
            when one =>
                output <= 1;
                nx_state <= two;
            when two =>
                output <= 2;
                nx_state <= three;
            when three =>
                output <= 3;
                nx_state <= four;
            when four =>
                output <= 4;
                nx_state <= five;
            when five =>
                output <= 5;
                nx_state <= six;
            when six =>
                output <= 6;
                nx_state <= seven;
            when seven =>
                output <= 7;
                nx_state <= eight;
            when eight =>
                output <= 8;
                nx_state <= nine;
            when nine =>
                output <= 9;
                nx_state <= zero;
        end case;
    end process;

end fsm;
