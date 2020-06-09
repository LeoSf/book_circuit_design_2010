----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 05/06/2020 (dd/mm/yyyy)
-- Design Name:         ROM Design
-- Module Name:         rom - Behavioral
-- Project Name:        ex_13.4
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      05/06/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity tb_rom is
end tb_rom;

architecture behavioral of tb_rom is

    -- component declarations
    component rom
	port(
		-- input ports
		clk       : in	std_logic;
		address   : in	integer range 0 to 15;
		-- output ports
		data_out  : out	std_logic_vector(7 downto 0)
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
	signal s_rst_n     : std_logic := '0';
	signal s_clk       : std_logic;
	signal s_address   : integer range 0 to 15 := 0;

	-- output signals
	signal s_data_out  : std_logic_vector(7 downto 0);

begin
	-- instantiation of the Unit under test
	uut : entity work.rom(rom)
	port map(
		-- input ports
		clk	      => s_clk,
		address	  => s_address,
		-- output ports
		data_out  => s_data_out
	);

	-- Clock process definitions
    p_clk_process : process
    begin
        s_clk <= '0';
        wait for c_CLK_PERIOD/2;
        s_clk <= '1';
        wait for c_CLK_PERIOD/2;
    end process;

	-- stimulus process
    p_stim : process
    begin
        s_rst_n <= '0';
        wait for 40 ns;
        s_rst_n <= '1';

        wait for c_CLK_PERIOD;

        -- add code here
        stim_cycle : for i in 0 to 15 loop
                s_address <= i;
                wait for c_CLK_PERIOD;
        end loop;

        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
