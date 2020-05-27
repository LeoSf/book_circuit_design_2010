----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 27/05/2020 (dd/mm/yyyy)
-- Design Name:         Type IV Testbench with a Data File
-- Module Name:         tb_bin_to_gray_files - Behavioral
-- Project Name:        ex_10.7
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      27/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;

entity tb_bin_to_gray_files is
    generic (
        period  : time      := 100ns;
        tp      : time      := 15ns;
        -- component
        N       : natural   := 3
    );
end entity;

architecture testbench of tb_bin_to_gray_files is
    ----dut declaration:--------------------
	component bin_to_gray is
		-- generic (
	    --     N	: natural := 3
	    -- );
	    port (
	        -- input ports
	        bin     : in std_logic_vector(N-1 downto 0);
	        -- output ports
	        gray    : out std_logic_vector(N-1 downto 0)
	    );
	end component;

    ----signal declarations:------
    signal b    : std_logic_vector(2 downto 0);
    signal g    : std_logic_vector(2 downto 0);
    signal gtest: std_logic_vector(2 downto 0);

    file f  : text open read_mode is "test_file.txt";
    -- file f  : text open read_mode is "../../../../src/test_file.txt";

begin

    ---dut instantiation:--------------------
	dut : bin_to_gray
	-- generic map(
	-- 	N => N
	-- )
	port map (
		-- input ports
		bin 	=> b,
		-- output ports
		gray 	=> g
	);

    ---output verification:-----------------
    process
        variable l          : line;
        variable good_value : boolean;
        variable space      : character;
        variable bfile      : bit_vector(2 downto 0);
        variable gfile      : bit_vector(2 downto 0);
        variable str1       : string(1 to 3);   -- "in="
        variable str2       : string(1 to 5);   -- " out="

    begin
        while not endfile (f) loop
            readline(f, l);

            read(l, str1);
            read(l, bfile, good_value);
            assert (good_value)
                report "improper value for 'bin' in file!"
                severity failure;

            b <= to_stdlogicvector(bfile);

            -- read(l, space);
            read(l, str2);
            read(l, gfile, good_value);
            assert (good_value)
                report "improper value for 'gray' in file!"
                severity failure;

            gtest <= to_stdlogicvector(gfile);

            wait for tp;

            assert (gtest=g)
                report "data mismatch!"
                severity failure;

            wait for period-tp;
        end loop;
        assert false
        report "no errors found!"
        severity note;
        wait;
    end process;
end architecture;
