

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity SgnExtnd8to16 is
  Port ( i_data: in STD_LOGIC_VECTOR(7 downto 0);
  		   o_data: out STD_LOGIC_VECTOR(15 downto 0));
end SgnExtnd8to16;

architecture Behavioral of SgnExtnd8to16 is

begin


gen_large:for i in 15 downto 8 generate
	o_data(i)<=i_data(7);
end generate gen_large;

gen_same: for i in 7 downto 0 generate
o_data(i)<=i_data(i);
end generate gen_same;

end Behavioral;
