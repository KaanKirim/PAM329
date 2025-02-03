library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity RAMWriter is
  Port ( REG0: in STD_LOGIC_VECTOR(15 downto 0);
  		 REG1: in STD_LOGIC_VECTOR(15 downto 0);
  		 REG2: in STD_LOGIC_VECTOR(15 downto 0);
  		 REG3: in STD_LOGIC_VECTOR(15 downto 0);
  		 REG4: in STD_LOGIC_VECTOR(15 downto 0);
  		 REG5: in STD_LOGIC_VECTOR(15 downto 0);
  		 REG6: in STD_LOGIC_VECTOR(15 downto 0);
  		 REG7: in STD_LOGIC_VECTOR(15 downto 0);
  		 REG8: in STD_LOGIC_VECTOR(15 downto 0);
  		 REG9: in STD_LOGIC_VECTOR(15 downto 0);
  		 REGA: in STD_LOGIC_VECTOR(15 downto 0);
  		 REGB: in STD_LOGIC_VECTOR(15 downto 0);
  		 REGC: in STD_LOGIC_VECTOR(15 downto 0);
  		 REGD: in STD_LOGIC_VECTOR(15 downto 0);
  		 REGE: in STD_LOGIC_VECTOR(15 downto 0);
  		 REGF: in STD_LOGIC_VECTOR(15 downto 0);
  		 instruction: in STD_LOGIC_VECTOR(15 downto 0);
  		 we: out STD_LOGIC;
  		 eaddr: out STD_LOGIC_VECTOR(15 downto 0);
  		 d_out: out STD_LOGIC_VECTOR(15 downto 0));

end RAMWriter;

architecture Behavioral of RAMWriter is



begin
PROCESS(instruction,REG0,REG1,REG2,REG3,REG4,REG5,REG6,REG7,REG8,REG9,REGA,REGB,REGC,REGD,REGE,REGF)
begin
if instruction(15 downto 12)="1011" then
	we<='1';
	case instruction(11 downto 8) is 
		when x"0"=> eaddr <= REG0;
		when x"1"=> eaddr <= REG1;
		when x"2"=> eaddr <= REG2;
		when x"3"=> eaddr <= REG3;
		when x"4"=> eaddr <= REG4;
		when x"5"=> eaddr <= REG5;
		when x"6"=> eaddr <= REG6;
		when x"7"=> eaddr <= REG7;
		when x"8"=> eaddr <= REG8;
		when x"9"=> eaddr <= REG9;
		when x"A"=> eaddr <= REGA;
		when x"B"=> eaddr <= REGB;
		when x"C"=> eaddr <= REGC;
		when x"D"=> eaddr <= REGD;
		when x"E"=> eaddr <= REGE;
		when x"F"=> eaddr <= REGF;
	end case;
	case instruction(7 downto 4) is 
		when x"0"=> d_out <= REG0;
		when x"1"=> d_out <= REG1;
		when x"2"=> d_out <= REG2;
		when x"3"=> d_out <= REG3;
		when x"4"=> d_out <= REG4;
		when x"5"=> d_out <= REG5;
		when x"6"=> d_out <= REG6;
		when x"7"=> d_out <= REG7;
		when x"8"=> d_out <= REG8;
		when x"9"=> d_out <= REG9;
		when x"A"=> d_out <= REGA;
		when x"B"=> d_out <= REGB;
		when x"C"=> d_out <= REGC;
		when x"D"=> d_out <= REGD;
		when x"E"=> d_out <= REGE;
		when x"F"=> d_out <= REGF;
	end case;
else
we<='0';
end if;
end process;
end Behavioral;