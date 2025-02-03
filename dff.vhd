library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFF is
    Port ( D : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Q : out STD_LOGIC);
end DFF;


architecture Behavioral of DFF is

signal Qz: STD_LOGIC:='0';


begin
Q<=Qz;
    process(CLK)
    begin
        if rising_edge(CLK) then
            Qz <= D;    -- Update the output with the value of the input D on clock rising edge
        end if;
    end process;
end Behavioral;
