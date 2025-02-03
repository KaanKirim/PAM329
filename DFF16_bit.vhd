library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFF_16bit is
    Port ( clk : in STD_LOGIC;
           d : in STD_LOGIC_VECTOR(15 downto 0);
           q : out STD_LOGIC_VECTOR(15 downto 0));
end DFF_16bit;

architecture Behavioral of DFF_16bit is


    signal q_int : STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');

begin

    process(clk)
    begin
        if rising_edge(clk) then
                q_int <= d;
        end if;
    end process;

    q <= q_int;

end Behavioral;
