library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity ANDer is

  Port (a: in std_logic_vector(15 downto 0);
        b: in std_logic_vector(15 downto 0); 
        sum: out std_logic_vector(15 downto 0)
        );
  
end ANDer;

architecture Behavioral of ANDer is

begin

    gen_AND: for i in 0 to 15 generate
        sum(i)<=a(i) and b(i);
    end generate gen_AND;

end Behavioral;
