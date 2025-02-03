library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity NEGer is

  Port (a: in std_logic_vector(15 downto 0);
        sum: out std_logic_vector(15 downto 0)
        );
  
end NEGer;

architecture Behavioral of NEGer is

begin

    gen_NEG: for i in 0 to 15 generate
        sum(i)<= not a(i);
    end generate gen_NEG;

end Behavioral;
