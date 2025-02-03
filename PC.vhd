library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity PC is
  Port (clk: in STD_LOGIC;
        instruction: in STD_LOGIC_VECTOR(15 downto 0);
        overflown: in STD_LOGIC;
        REG0: in STD_LOGIC_VECTOR(15 downto 0);
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
        pointer: out std_logic_vector(15 downto 0));
end PC;

architecture Behavioral of PC is

component DFF_16bit is
    Port ( clk : in STD_LOGIC;
           d : in STD_LOGIC_VECTOR(15 downto 0);
           q : out STD_LOGIC_VECTOR(15 downto 0));
end component DFF_16bit;

component Incrementer is
    port (
        input: in std_logic_vector(15 downto 0);
        output: out std_logic_vector(15 downto 0)
    );
end component Incrementer;

component MUX2X16 is
  Port (a: in STD_LOGIC_VECTOR(15 downto 0);
        b: in STD_LOGIC_VECTOR(15 downto 0);
        sel: in STD_LOGIC:='0';
        d_out: out STD_LOGIC_VECTOR(15 downto 0));
end component MUX2X16;

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



signal oinc: std_logic_vector(15 downto 0):=(others=>'0');
signal odff: std_logic_vector(15 downto 0):=(others=>'0');
signal omux: std_logic_vector(15 downto 0):=(others=>'0');
signal control: STD_LOGIC:='0';
signal registers:std_logic_vector(15 downto 0):=(others=>'0');



begin
control<= ((instruction(15) and (not instruction(14)) and (not instruction(13)) and instruction(12) and (overflown)) or (instruction(15) and (not instruction(14)) and (instruction(13)) and (not instruction(12))));


gen: DFF_16bit port map(clk,omux,odff);
gen1: MUX2X16 port map(registers,oinc,control,omux);
gen2: Incrementer port map(odff,oinc);
gen3: MUX16x16 port map(instruction(11 downto 8),REG0,REG1,REG2,REG3,REG4,REG5,REG6,REG7,REG8,REG9,REGA,REGB,REGC,REGD,REGE,REGF,registers);

pointer<=odff;

end Behavioral;
