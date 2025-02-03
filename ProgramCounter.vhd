
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity ProgramCounter is
  Port (immediateAddr: in STD_LOGIC_VECTOR(15 downto 0);
  		opcode: in STD_LOGIC_VECTOR(3 downto 0);
  		overflow:in STD_LOGIC;
  		nextAddr: out STD_LOGIC_VECTOR(15 downto 0);
  		clk: in STD_LOGIC);
end ProgramCounter;



architecture Behavioral of ProgramCounter is

component MUX2x8 is
  Port (a: in STD_LOGIC_VECTOR(15 downto 0);
  		b: in STD_LOGIC_VECTOR(15 downto 0);
  		sel: in STD_LOGIC;
  		output: out STD_LOGIC_VECTOR(15 downto 0));
end component MUX2x8;

component customRegister16 is
  Port (data: in STD_LOGIC_VECTOR(15 downto 0);
  		enable: in STD_LOGIC;
  		output: out STD_LOGIC_VECTOR(15 downto 0));
end component customRegister16;

component Incrementer is
  Port (a: in STD_LOGIC_VECTOR(15 downto 0);
  		b: out STD_LOGIC_VECTOR(15 downto 0));
end component Incrementer;

signal muxsel: STD_LOGIC:='0';
signal o_INC: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal o_DFF1: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal o_DFF2: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal o_MUX: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal notclk: STD_LOGIC:='0';


begin
o_MUX<="0000000000000000";
muxsel<=opcode(3) and (((not opcode(2)) and (not opcode(1)) and opcode(0)) or (not opcode(2) and opcode(1) and opcode(0) and overflow) or (opcode(2) and (not opcode(1)) and (not opcode(0)) and (not overflow)));  
notclk<=not clk;
ins_INC: Incrementer port map(o_MUX,o_INC);
ins_DFF1: customRegister16 port map(o_INC,clk,o_DFF1);
ins_DFF2: customRegister16 port map(o_DFF1,notclk,o_DFF2);
ins_MUX: MUX2x8 port map(immediateAddr,o_DFF2,muxsel,o_MUX);
nextAddr<=o_MUX; 


end Behavioral;
