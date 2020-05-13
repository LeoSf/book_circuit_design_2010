----------------------------------------------------------------------------------
-- Company:             None
-- Engineer:            Leandro D. Medus
--
-- Create Date:         18:17:00 13/05/2020 (dd/mm/yyyy)
-- Design Name:         Proff of Concept: alias
-- Module Name:         poc_alias - Behavioral
-- Project Name:        poc_alias
-- Target Devices:      Basys 3
-- tool versions:       Vivado 2019.1
-- Description:
--
-- Dependencies:
--
--
-- Revision History:
--      13/05/2020  v0.01 File created
--
-- Additional Comments:
--
----------------------------------------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity poc_alias is
    port (
        -- input ports
        clk_i   : in std_logic;
        rst_n   : in std_logic;
        data_i  : in std_logic_vector(31 downto 0);

        -- output ports
        valid_o : out std_logic;
        data_o        : out std_logic_vector(31 downto 0);
        upper_bus1_o  : out std_logic_vector(15 downto 0);
        upper_bus2_o  : out std_logic_vector(15 downto 0);
        lower_bus1_o  : out std_logic_vector(15 downto 0);
        lower_bus2_o  : out std_logic_vector(15 downto 0)

    );
end entity;

architecture arch of poc_alias is

    signal bus1_o   : std_logic_vector(31 downto 0);
    signal bus2_o   : std_logic_vector(31 downto 0);
    signal bus3_o   : std_logic_vector(31 downto 0);


    -----------------------------------------------------------------------
    -- This is the object to which alias will be applied:
    signal data_bus: std_logic_vector(31 downto 0);
    -----------------------------------------------------------------------
    --bus1 is a new name for data_bus:
    alias bus1 is data_bus;
    -----------------------------------------------------------------------
    --bus2 is a new name for data_bus, but with a modified range:
    alias bus2: std_logic_vector(32 downto 1) is data_bus;
    -----------------------------------------------------------------------
    --bus3 is another name for data_bus, with an ascending range:
    alias bus3: std_logic_vector(1 to 32) is data_bus;
    -----------------------------------------------------------------------
    --upper_bus1 is a new name for the upper half of data_bus
    alias upper_bus1 is data_bus(31 downto 16);
    -----------------------------------------------------------------------
    --upper_bus2 is a new name for the upper half of data_bus, but
    --with a modified range:
    alias upper_bus2: std_logic_vector(17 to 32) is data_bus(31 downto 16);
    -----------------------------------------------------------------------
    --lower_bus1 is a new name for the lower half of data_bus
    alias lower_bus1 is data_bus(15 downto 0);
    -----------------------------------------------------------------------
    --lower_bus2 is a new name for the lower half of data_bus, but
    --with a modified range:
    alias lower_bus2: std_logic_vector(1 to 16) is data_bus(15 downto 0);
    -----------------------------------------------------------------------
begin

    -- valid_o <= '1' when
    --     data_i = std_logic_vector(to_unsigned(16#FFFF_FFFF#, data_i'length))
    --     else '0';

    valid_o <= '1' when data_i = x"FFFF_FFFF" else '0';

    -- data_bus <= data_i;

    -- bus3 <= x"A41D_F327"; -- no effect on the ascending order
    bus3 <= b"1110_0000_0111_0000_0000_0000_0000_0000"; -- this neither
    bus1_o  <= bus1;
    bus2_o  <= bus2;
    bus3_o  <= bus3;
    upper_bus1_o    <= upper_bus1;
    upper_bus2_o    <= upper_bus2;
    lower_bus1_o    <= lower_bus1;
    lower_bus2_o    <= lower_bus2;

end architecture;
