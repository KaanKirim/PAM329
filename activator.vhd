library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

	entity activator is
	  Port (control: in STD_LOGIC_VECTOR(3 downto 0);
	  		check: in STD_LOGIC_VECTOR(3 downto 0);
	  		output:out STD_LOGIC);

	end activator;

architecture Behavioral of activator is

begin

output <= (control(0) xnor check(0)) and (control(1) xnor check(1)) and (control(2) xnor check(2)) and (control(3) xnor check(3));

end Behavioral;
