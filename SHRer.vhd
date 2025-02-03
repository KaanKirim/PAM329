library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity SHRer is

  Port (a: in std_logic_vector(15 downto 0);
        sum: out std_logic_vector(15 downto 0)
        );
  
end SHRer;

architecture Behavioral of SHRer is

begin
    sum(15)<='0';
    gen_SHR: for i in 0 to 14 generate
        sum(i)<= a(i+1);
    end generate gen_SHR;

end Behavioral;
