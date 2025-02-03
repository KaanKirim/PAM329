
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity ProgramCounter1 is
	port(clk: in STD_LOGIC;
		 output: out STD_LOGIC_VECTOR(15 downto 0));
end ProgramCounter1;



architecture Behavioral of ProgramCounter1 is



component customRegister16 is
  Port (data: in STD_LOGIC_VECTOR(15 downto 0);
  		enable: in STD_LOGIC;
  		output: out STD_LOGIC_VECTOR(15 downto 0));
end component customRegister16;

component Incrementer is
  Port (a: in STD_LOGIC_VECTOR(15 downto 0);
  		b: out STD_LOGIC_VECTOR(15 downto 0));
end component Incrementer;

signal o_INC: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal o_DFF1: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal o_DFF2: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal notclk: STD_LOGIC:='0';


begin

notclk<=not clk;

ins_INC: Incrementer port map(o_DFF2,o_INC);
ins_DFF1: customRegister16 port map(o_INC,clk,o_DFF1);
ins_DFF2: customRegister16 port map(o_DFF1,notclk,o_DFF2);
output<=o_DFF2;

end Behavioral;
