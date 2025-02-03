
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity halfAdder is
  Port (A: in STD_LOGIC;
  		B: in STD_LOGIC;
  		Sum: out STD_LOGIC;
  		Cout: out STD_LOGIC);
end halfAdder;

architecture Behavioral of halfAdder is

begin

Cout <= a and b;
Sum <= a xor b;

end Behavioral;
