library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity SHLer is

  Port (a: in std_logic_vector(15 downto 0);
        sum: out std_logic_vector(15 downto 0)
        );
  
end SHLer;

architecture Behavioral of SHLer is

begin
    sum(0)<='0';
    gen_SHL: for i in 0 to 14 generate
        sum(i+1)<= a(i);
    end generate gen_SHL;

end Behavioral;
