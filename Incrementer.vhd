

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Incrementer is
  Port (a: in STD_LOGIC_VECTOR(15 downto 0);
  		b: out STD_LOGIC_VECTOR(15 downto 0));
end Incrementer;

architecture Behavioral of Incrementer is

component halfAdder is
	Port (a: in STD_LOGIC;
		  b: in STD_LOGIC;
		  sum: out STD_LOGIC;
		  cout: out STD_LOGIC);
end component halfAdder;

signal cout: STD_LOGIC_VECTOR(15 downto 0):= (others=>'0');

begin
HA0: halfAdder port map(a(0),'1',b(0),cout(0));

gen_HA:for i in 15 downto 1 generate
	HA: halfAdder port map(a(i),cout(i-1),b(i),cout(i));
	end generate;


end Behavioral;
