library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity XORer is

  Port (a: in std_logic_vector(15 downto 0);
        b: in std_logic_vector(15 downto 0); 
        sum: out std_logic_vector(15 downto 0)
        );
  
end XORer;

architecture Behavioral of XORer is

begin

    gen_AND: for i in 0 to 15 generate
        sum(i)<=a(i) xor b(i);
    end generate gen_AND;

end Behavioral;
