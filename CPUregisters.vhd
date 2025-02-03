library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity CPUregisters is

  Port (mclk: in std_logic;
        instruction: in STD_LOGIC_VECTOR(15 downto 0);
        freg0: out STD_LOGIC_VECTOR(15 downto 0);
        freg1: out STD_LOGIC_VECTOR(15 downto 0);
        freg2: out STD_LOGIC_VECTOR(15 downto 0);
        freg3: out STD_LOGIC_VECTOR(15 downto 0);
        freg4: out STD_LOGIC_VECTOR(15 downto 0);
        freg5: out STD_LOGIC_VECTOR(15 downto 0);
        freg6: out STD_LOGIC_VECTOR(15 downto 0);
        freg7: out STD_LOGIC_VECTOR(15 downto 0);
        freg8: out STD_LOGIC_VECTOR(15 downto 0);
        freg9: out STD_LOGIC_VECTOR(15 downto 0);
        freg10: out STD_LOGIC_VECTOR(15 downto 0);
        freg11: out STD_LOGIC_VECTOR(15 downto 0);
        freg12: out STD_LOGIC_VECTOR(15 downto 0);
        freg13: out STD_LOGIC_VECTOR(15 downto 0);
        freg14: out STD_LOGIC_VECTOR(15 downto 0);
        freg15: out STD_LOGIC_VECTOR(15 downto 0);
        overflown: out std_logic;
        BTN: in STD_LOGIC;
        input: in STD_LOGIC_VECTOR(15 downto 0));

end CPUregisters;

architecture Behavioral of CPUregisters is

component customRegister16 is
  Port (data: in STD_LOGIC_VECTOR(15 downto 0);
      enable: in STD_LOGIC;
      output: out STD_LOGIC_VECTOR(15 downto 0);
      clk: in STD_LOGIC);
end component customRegister16;


component MUX16x16 is
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
end component MUX16x16;

component ALU is
  Port (a: in std_logic_vector(15 downto 0);
        b: in std_logic_vector(15 downto 0);
        control: in std_logic_vector(3 downto 0);
        sum: out std_logic_vector(15 downto 0);
        overflown: out std_logic);
end component ALU;

component SgnExtnd8to16 is
  Port ( i_data: in STD_LOGIC_VECTOR(7 downto 0);
       o_data: out STD_LOGIC_VECTOR(15 downto 0));
end component SgnExtnd8to16;

component MUX2x8 is
  Port (a: in STD_LOGIC_VECTOR(15 downto 0);
      b: in STD_LOGIC_VECTOR(15 downto 0);
      sel: in STD_LOGIC;
      output: out STD_LOGIC_VECTOR(15 downto 0));
end component MUX2x8;

component Decoder4b is
  Port (number: in STD_LOGIC_VECTOR(3 downto 0);
      opcode : in std_logic_vector(3 downto 0);
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
end component Decoder4b;


--register things
constant reg0 : std_logic_vector(3 downto 0) := "0000";
constant reg1 : std_logic_vector(3 downto 0) := "0001";
constant reg2 : std_logic_vector(3 downto 0) := "0010";
constant reg3 : std_logic_vector(3 downto 0) := "0011";
constant reg4 : std_logic_vector(3 downto 0) := "0100";
constant reg5 : std_logic_vector(3 downto 0) := "0101";
constant reg6 : std_logic_vector(3 downto 0) := "0110";
constant reg7 : std_logic_vector(3 downto 0) := "0111";
constant reg8 : std_logic_vector(3 downto 0) := "1000";
constant reg9 : std_logic_vector(3 downto 0) := "1001";
constant reg10: std_logic_vector(3 downto 0) := "1010";
constant reg11: std_logic_vector(3 downto 0) := "1011";
constant reg12: std_logic_vector(3 downto 0) := "1100";
constant reg13: std_logic_vector(3 downto 0) := "1101";
constant reg14: std_logic_vector(3 downto 0) := "1110";
constant reg15: std_logic_vector(3 downto 0) := "1111";

signal en0:STD_LOGIC:='1';
signal en1:STD_LOGIC:='1';
signal en2:STD_LOGIC:='1';
signal en3:STD_LOGIC:='1';
signal en4:STD_LOGIC:='1';
signal en5:STD_LOGIC:='1';
signal en6:STD_LOGIC:='1';
signal en7:STD_LOGIC:='1';
signal en8:STD_LOGIC:='1';
signal en9:STD_LOGIC:='1';
signal en10:STD_LOGIC:='1';
signal en11:STD_LOGIC:='1';
signal en12:STD_LOGIC:='1';
signal en13:STD_LOGIC:='1';
signal en14:STD_LOGIC:='1';
signal en15:STD_LOGIC:='1';

signal o_Reg0 : STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
signal o_Reg1 : STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
signal o_Reg2 : STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
signal o_Reg3 : STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
signal o_Reg4 : STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
signal o_Reg5 : STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
signal o_Reg6 : STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
signal o_Reg7 : STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
signal o_Reg8 : STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
signal o_Reg9 : STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
signal o_Reg10: STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
signal o_Reg11: STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
signal o_Reg12: STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
signal o_Reg13: STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
signal o_Reg14: STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
signal o_Reg15: STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
--end of register things




--ALU things
signal i_PortA: STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
signal i_portB: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');

signal o_ALU: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');

signal data: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
--end of ALU things


signal extended_signal: STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');

signal iswrt: std_logic:='0';

begin

iswrt <= instruction(15) and (not instruction(14)) and (not instruction(13)) and (not instruction(12));

register0 : customRegister16 port map(data,en0,o_Reg0,mclk);
register1 : customRegister16 port map(data,en1,o_Reg1,mclk);
register2 : customRegister16 port map(data,en2,o_Reg2,mclk);
register3 : customRegister16 port map(data,en3,o_Reg3,mclk);
register4 : customRegister16 port map(data,en4,o_Reg4,mclk);
register5 : customRegister16 port map(data,en5,o_Reg5,mclk);
register6 : customRegister16 port map(input,BTN,o_Reg6,mclk);
register7 : customRegister16 port map(data,en7,o_Reg7,mclk);
register8 : customRegister16 port map(data,en8,o_Reg8,mclk);
register9 : customRegister16 port map(data,en9,o_Reg9,mclk);
register10: customRegister16 port map(data,en10,o_Reg10,mclk);
register11: customRegister16 port map(data,en11,o_Reg11,mclk);
register12: customRegister16 port map(data,en12,o_Reg12,mclk);
register13: customRegister16 port map(data,en13,o_Reg13,mclk);
register14: customRegister16 port map(data,en14,o_Reg14,mclk);
register15: customRegister16 port map(data,en15,o_Reg15,mclk);



ins_PortA: MUX16x16 port map(instruction(7 downto 4),o_Reg0,o_Reg1,o_Reg2,o_Reg3,o_Reg4,o_Reg5,o_Reg6,o_Reg7,o_Reg8,o_Reg9,o_Reg10,o_Reg11,o_Reg12,o_Reg13,o_Reg14,o_Reg15, i_PortA);
ins_PortB: MUX16x16 port map(instruction(3 downto 0),o_Reg0,o_Reg1,o_Reg2,o_Reg3,o_Reg4,o_Reg5,o_Reg6,o_Reg7,o_Reg8,o_Reg9,o_Reg10,o_Reg11,o_Reg12,o_Reg13,o_Reg14,o_Reg15, i_PortB);

ins_ALU:ALU port map(i_portA,i_portB,instruction(15 downto 12),o_ALU,overflown);

ins_SignExtender: SgnExtnd8to16 port map(instruction(7 downto 0),extended_signal);

ChooseALUorWRT: MUX2x8 port map(o_ALU,extended_signal,iswrt,data);

AddrDecoder: Decoder4b port map(instruction(11 downto 8),instruction(15 downto 12),en0,en1,en2,en3,en4,en5,en6,en7,en8,en9,en10,en11,en12,en13,en14,en15);

freg0 <= o_Reg0;
freg1 <= o_Reg1;
freg2 <= o_Reg2;
freg3 <= o_Reg3;
freg4 <= o_Reg4;
freg5 <= o_Reg5;
freg6 <= o_Reg6;
freg7 <= o_Reg7;
freg8 <= o_Reg8;
freg9 <= o_Reg9;
freg10<= o_Reg10;
freg11<= o_Reg11;
freg12<= o_Reg12;
freg13<= o_Reg13;
freg14<= o_Reg14;
freg15<= o_Reg15;

end Behavioral;
