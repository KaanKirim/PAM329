library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clockslower is
    Port ( clk : in STD_LOGIC;
           slowclk : out STD_LOGIC);
end clockslower;

architecture Behavioral of clockslower is
    signal counter_reg : STD_LOGIC_VECTOR (25 downto 0) := (others => '0');
begin
    process(clk)
    begin
        if rising_edge(clk) then
            counter_reg <= counter_reg + 1;
        end if;
    end process;

    slowclk <= counter_reg(25);
end Behavioral;
