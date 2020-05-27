----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 27/05/2020 (dd/mm/yyyy)
-- Design Name:         Type IV Testbench with a Record Type
-- Module Name:         tb_bin_to_gray - Behavioral
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

entity tb_bin_to_gray is
	generic (
		period	: time := 100ns;
		tp		: time := 15ns;
		-- component
		N		: natural := 3
	);
end entity;


architecture testbench of tb_bin_to_gray is

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

	----signal declarations:----------------
	signal b	: std_logic_vector(2 downto 0); --binary in
	signal g	: std_logic_vector(2 downto 0); --gray out

	type data_pair is record
		col1: std_logic_vector(2 downto 0);
		col2: std_logic_vector(2 downto 0);
	end record;

	type table is array (1 to 8) of data_pair;
	constant templates: table := (
		("000", "000"),
		("001", "001"),
		("010", "011"),
		("011", "010"),
		("100", "110"),
		("101", "111"),
		("110", "101"),
		("111", "100")
	);

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

	---stimuli generation and comparison:----
	process
	begin
		wait for 70 ns;	-- reset time

		for i in table'range loop
			b <= templates(i).col1;
			wait for tp;

			assert g=templates(i).col2
				report "mismatch at iteration=" & integer'image(i)
				severity failure;
			wait for period-tp;
		end loop;

		assert false
		report "no error found!"
		severity note;

	end process;
end architecture;
