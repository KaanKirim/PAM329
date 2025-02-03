library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity MUX2x8 is
  Port (a: in STD_LOGIC_VECTOR(15 downto 0);
  		b: in STD_LOGIC_VECTOR(15 downto 0);
  		sel: in STD_LOGIC;
  		output: out STD_LOGIC_VECTOR(15 downto 0));
end MUX2x8;

architecture Behavioral of MUX2x8 is

begin

gen_mux: for i in 15 downto 0 generate
output(i)<= ((not sel) and a(i)) or (sel and b(i));
end generate gen_mux;
end Behavioral;

