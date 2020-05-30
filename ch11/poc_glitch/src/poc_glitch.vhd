----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 29/05/2020 (dd/mm/yyyy)
-- Design Name:         Glitch-Free Vending-Machine Controller
-- Module Name:         vending_machine_glitch_free - Behavioral
-- Project Name:        ex_11.2
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      28/05/2020  v0.01 File created
--
-- Additional Comments:
--      After running a post-implementation timing simulation, a glitch in
--      s_dime_out can be seen.
----------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity vending_machine_glitch_free is
    port (
        -- input ports
        clk	        : in std_logic;
        rst	        : in std_logic;
        nickel_in	: in std_logic;
        dime_in	    : in std_logic;
        quarter_in	: in std_logic;
        -- output ports
        -- candy_out	: buffer std_logic;
        -- nickel_out	: buffer std_logic;
        -- dime_out	: buffer std_logic;
        -- new un-glitched outputs
        new_candy_out	: out std_logic;
        new_nickel_out	: out std_logic;
        new_dime_out	: out std_logic;
        -- debugging port
        -- fsm_state   : out integer
        fsm_state : out std_logic_vector(3 downto 0)
    );
end vending_machine_glitch_free;

architecture fsm of vending_machine_glitch_free is
    -- FSM state's names
    type state is (st0, st5, st10, st15, st20, st25, st30, st35, st40, st45);

    signal pr_state : state;
    signal nx_state : state;
    attribute enum_encoding : string; --optional attribute
    attribute enum_encoding of state : type is "sequential";
    -- [Synth 8-2816] unknown character 's' in enumeration encoding is  considered 'X' ["D:/Repos/FPGA/book_circuit_design_2010/ch11/ex_11.2/src/vending_machine_glitch_free.vhd":51]
    -- [Synth 8-1950] enum_encoding attribute specifies incorrect number of valid encoding values for type state ; encoding ignored ["D:/Repos/FPGA/book_circuit_design_2010/ch11/ex_11.2/src/vending_machine_glitch_free.vhd":51]



    signal candy_out	: std_logic;
    signal nickel_out	: std_logic;
    signal dime_out 	: std_logic;

begin
    ----lower section of fsm:-----------
    -- sequential logic
    process (rst, clk)
    begin
        if (rst='1') then
            pr_state <= st0;
            -- fsm_state <= state'pos(st0);
            fsm_state <=  std_logic_vector(to_unsigned(state'pos(st0), fsm_state'length)) ;
        elsif (clk'event and clk='1') then
            pr_state <= nx_state;
            -- fsm_state <= state'pos(nx_state);
            fsm_state <=  std_logic_vector(to_unsigned(state'pos(nx_state), fsm_state'length)) ;
        end if;
    end process;

    ----upper section of fsm:-----------
    -- combinational logic
    process (pr_state, nickel_in, dime_in, quarter_in)
    begin
        case pr_state is
            when st0 =>
                candy_out <= '0';
                nickel_out <= '0';
                dime_out <= '0';

                if (nickel_in = '1') then
                    nx_state <= st5;
                elsif (dime_in = '1') then
                    nx_state <= st10;
                elsif (quarter_in = '1') then
                    nx_state <= st25;
                else
                    nx_state <= st0;
                end if;

            when st5 =>
                candy_out <= '0';
                nickel_out <= '0';
                dime_out <= '0';

                if  (nickel_in = '1') then
                    nx_state <= st10;
                elsif (dime_in = '1') then
                    nx_state <= st15;
                elsif (quarter_in = '1') then
                    nx_state <= st30;
                else
                    nx_state <= st5;
                end if;

            when st10 =>
                candy_out <= '0';
                nickel_out <= '0';
                dime_out <= '0';

                if  (nickel_in = '1') then
                    nx_state <= st15;
                elsif (dime_in = '1') then
                    nx_state <= st20;
                elsif (quarter_in = '1') then
                    nx_state <= st35;
                else
                    nx_state <= st10;
                end if;

            when st15 =>
                candy_out <= '0';
                nickel_out <= '0';
                dime_out <= '0';

                if  (nickel_in = '1') then
                    nx_state <= st20;
                elsif (dime_in = '1') then
                    nx_state <= st25;
                elsif (quarter_in = '1') then
                    nx_state <= st40;
                else
                    nx_state <= st15;
                end if;

            when st20 =>
                candy_out <= '0';
                nickel_out <= '0';
                dime_out <= '0';

                if (nickel_in = '1') then
                    nx_state <= st25;
                elsif (dime_in = '1') then
                    nx_state <= st30;
                elsif (quarter_in = '1') then
                    nx_state <= st45;
                else
                    nx_state <= st20;
                end if;

            when st25 =>
                candy_out <= '1';
                nickel_out <= '0';
                dime_out <= '0';
                nx_state <= st0;

            when st30 =>
                candy_out <= '1';
                nickel_out <= '1';
                dime_out <= '0';
                nx_state <= st0;

            when st35 =>
                candy_out <= '1';
                nickel_out <= '0';
                dime_out <= '1';
                nx_state <= st0;

            when st40 =>
                candy_out <= '0';
                nickel_out <= '1';
                dime_out <= '0';
                nx_state <= st35;

            when st45 =>
                candy_out <= '0';
                nickel_out <= '0';
                dime_out <= '1';
                nx_state <= st35;
        end case;

    end process;

    -----output section of fsm:-------------
    process (rst, clk)
    begin
        if (rst='1') then
            new_candy_out <= '0';
            new_nickel_out <= '0';
            new_dime_out <= '0';

        elsif (clk'event and clk = '1') then
            new_candy_out   <= candy_out;
            new_nickel_out  <= nickel_out;
            new_dime_out    <= dime_out;
        end if;
    end process;

end fsm;
