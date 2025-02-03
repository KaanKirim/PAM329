
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUX16x16 is
  Port (sel:in STD_LOGIC_VECTOR(3 downto 0);
  		a  :in STD_LOGIC_VECTOR(15 downto 0);
  		b  :in STD_LOGIC_VECTOR(15 downto 0);
  		c  :in STD_LOGIC_VECTOR(15 downto 0);
  		d  :in STD_LOGIC_VECTOR(15 downto 0);
  		e  :in STD_LOGIC_VECTOR(15 downto 0);
  		f  :in STD_LOGIC_VECTOR(15 downto 0);
  		g  :in STD_LOGIC_VECTOR(15 downto 0);
  		h  :in STD_LOGIC_VECTOR(15 downto 0);
  		z  :in STD_LOGIC_VECTOR(15 downto 0);
  		j  :in STD_LOGIC_VECTOR(15 downto 0);
  		k  :in STD_LOGIC_VECTOR(15 downto 0);
  		l  :in STD_LOGIC_VECTOR(15 downto 0);
  		m  :in STD_LOGIC_VECTOR(15 downto 0);
  		n  :in STD_LOGIC_VECTOR(15 downto 0);
  		o  :in STD_LOGIC_VECTOR(15 downto 0);
  		p  :in STD_LOGIC_VECTOR(15 downto 0);
  		output: out STD_LOGIC_VECTOR(15 downto 0));
end MUX16x16;

architecture Behavioral of MUX16x16 is



begin
process(sel,a,b,c,d,e,f,g,h,z,j,k,l,m,n,o,p)
begin
case sel is 
		when x"0"=> output <= a;
		when x"1"=> output <= b;
		when x"2"=> output <= c;
		when x"3"=> output <= d;
		when x"4"=> output <= e;
		when x"5"=> output <= f;
		when x"6"=> output <= g;
		when x"7"=> output <= h;
		when x"8"=> output <= z;
		when x"9"=> output <= j;
		when x"A"=> output <= k;
		when x"B"=> output <= l;
		when x"C"=> output <= m;
		when x"D"=> output <= n;
		when x"E"=> output <= o;
		when x"F"=> output <= p;
		when others=> output<=x"FFFF";
	end case;
	end process;



end Behavioral;
