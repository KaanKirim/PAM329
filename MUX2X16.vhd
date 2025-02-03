

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity MUX2X16 is
  Port (a: in STD_LOGIC_VECTOR(15 downto 0);
  		b: in STD_LOGIC_VECTOR(15 downto 0);
  		sel: in STD_LOGIC;
  		d_out: out STD_LOGIC_VECTOR(15 downto 0));
end MUX2X16;

architecture Behavioral of MUX2X16 is

signal gated_a: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal gated_b: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');


begin

gen0: for i in 15 downto 0 generate
gated_a(i)<=a(i) and sel;
end generate gen0;

gen1: for i in 15 downto 0 generate
gated_b(i)<=b(i) and (not sel);
end generate gen1;

gen2: for i in 15 downto 0 generate
d_out(i)<= gated_a(i) or gated_b(i);
end generate gen2; 

end Behavioral;
