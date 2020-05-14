----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 14/05/2020 (dd/mm/yyyy)
-- Design Name:         Generic Address Decoder with GENERATE
-- Module Name:         address_decoder  - Behavioral
-- Project Name:        ex_5.4
-- Target Devices:      Basys 3
-- Tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      14/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity tb_address_decoder is
	generic (
		N : natural := 3
	);
end tb_address_decoder;

architecture behavioral of tb_address_decoder is

    -- component declarations
    component address_decoder
	generic (
		N : natural := 3
	);
	port(
		-- input ports
		ena			: in	std_logic;
		address		: in	std_logic_vector (N-1 downto 0);
		-- output ports
		word_line	: out	std_logic_vector(2**N-1 downto 0)
	);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    -- input signals
	signal s_clk		: std_logic := '0';
	signal s_rst_n		: std_logic := '0';
	signal s_ena		: std_logic := '0';
	signal s_address	: std_logic_vector (N-1 downto 0) := (others => '0');

	-- output signals
	signal s_word_line	: std_logic_vector(2**N-1 downto 0);

begin
	-- instantiation of the Unit under test
	uut : entity work.address_decoder(decoder)
	generic map(
		N => N
	)
	port map(
		-- input ports
		ena			=> s_ena,
		address		=> s_address,
		-- output ports
		word_line	=> s_word_line
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
		s_ena <= '0';
		s_address <= "110";
		wait for c_CLK_PERIOD;

		s_ena <= '1';
		test_vec : for i in 0 to s_word_line'high loop
			s_address <= std_logic_vector(to_unsigned(i, s_address'length));
			wait for c_CLK_PERIOD;
		end loop;

        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
