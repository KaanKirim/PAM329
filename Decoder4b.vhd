library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity decoder4b is
  Port (number: in STD_LOGIC_VECTOR(3 downto 0);
        opcode: in STD_LOGIC_VECTOR(3 downto 0);
  		a: out STD_LOGIC;
  		b: out STD_LOGIC;
  		c: out STD_LOGIC;
  		d: out STD_LOGIC;
  		e: out STD_LOGIC;
  		f: out STD_LOGIC;
  		g: out STD_LOGIC;
  		h: out STD_LOGIC;
  		z: out STD_LOGIC;
  		j: out STD_LOGIC;
  		k: out STD_LOGIC;
  		l: out STD_LOGIC;
  		m: out STD_LOGIC;
  		n: out STD_LOGIC;
  		o: out STD_LOGIC;
  		p: out STD_LOGIC);
end decoder4b;

architecture Behavioral of decoder4b is

begin



a <= (not number(3)) and (not number(2)) and (not number(1)) and (not number(0)) and (not opcode(3) or (opcode(3) and (not opcode(2)) and (not opcode(1)) and (not opcode(0))));
b <= (not number(3)) and (not number(2)) and (not number(1)) and number(0) and (not opcode(3) or (opcode(3) and (not opcode(2)) and (not opcode(1)) and (not opcode(0))));
c <= (not number(3)) and (not number(2)) and number(1) and (not number(0)) and (not opcode(3) or (opcode(3) and (not opcode(2)) and (not opcode(1)) and (not opcode(0))));
d <= (not number(3)) and (not number(2)) and number(1) and number(0) and (not opcode(3) or (opcode(3) and (not opcode(2)) and (not opcode(1)) and (not opcode(0))));
e <= (not number(3)) and number(2) and (not number(1)) and (not number(0)) and (not opcode(3) or (opcode(3) and (not opcode(2)) and (not opcode(1)) and (not opcode(0))));
f <= (not number(3)) and number(2) and (not number(1)) and number(0) and (not opcode(3) or (opcode(3) and (not opcode(2)) and (not opcode(1)) and (not opcode(0))));
g <= (not number(3)) and number(2) and number(1) and (not number(0)) and (not opcode(3) or (opcode(3) and (not opcode(2)) and (not opcode(1)) and (not opcode(0))));
h <= (not number(3)) and number(2) and number(1) and number(0) and (not opcode(3) or (opcode(3) and (not opcode(2)) and (not opcode(1)) and (not opcode(0))));
z <= number(3) and (not number(2)) and (not number(1)) and (not number(0)) and (not opcode(3) or (opcode(3) and (not opcode(2)) and (not opcode(1)) and (not opcode(0))));
j <= number(3) and (not number(2)) and (not number(1)) and number(0) and (not opcode(3) or (opcode(3) and (not opcode(2)) and (not opcode(1)) and (not opcode(0))));
k <= number(3) and (not number(2)) and number(1) and (not number(0)) and (not opcode(3) or (opcode(3) and (not opcode(2)) and (not opcode(1)) and (not opcode(0))));
l <= number(3) and (not number(2)) and number(1) and number(0) and (not opcode(3) or (opcode(3) and (not opcode(2)) and (not opcode(1)) and (not opcode(0))));
m <= number(3) and number(2) and (not number(1)) and (not number(0)) and (not opcode(3) or (opcode(3) and (not opcode(2)) and (not opcode(1)) and (not opcode(0))));
n <= number(3) and number(2) and (not number(1)) and number(0) and (not opcode(3) or (opcode(3) and (not opcode(2)) and (not opcode(1)) and (not opcode(0))));
o <= number(3) and number(2) and number(1) and (not number(0)) and (not opcode(3) or (opcode(3) and (not opcode(2)) and (not opcode(1)) and (not opcode(0))));
p <= number(3) and number(2) and number(1) and number(0) and (not opcode(3) or (opcode(3) and (not opcode(2)) and (not opcode(1)) and (not opcode(0))));

end Behavioral;
