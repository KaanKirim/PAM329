library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity ORer is

  Port (a: in std_logic_vector(15 downto 0);
        b: in std_logic_vector(15 downto 0); 
        sum: out std_logic_vector(15 downto 0)
        );
  
end ORer;

architecture Behavioral of ORer is

begin

    gen_OR: for i in 0 to 15 generate
        sum(i)<=a(i) or b(i);
    end generate gen_OR;

end Behavioral;
