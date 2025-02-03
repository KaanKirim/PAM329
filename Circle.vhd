

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Circle is
  Port (branch_opcode: in STD_LOGIC_VECTOR(3 downto 0);
        overflown: in STD_LOGIC;
        imm_address: in STD_LOGIC_VECTOR(15 downto 0);
        pointer: out STD_LOGIC_VECTOR(15 downto 0);
        clock: in STD_LOGIC);
end Circle;

architecture Behavioral of Circle is

component Incrementer is
    Port ( inA : in  STD_LOGIC_VECTOR(15 downto 0);
           outB : out  STD_LOGIC_VECTOR(15 downto 0));
end component Incrementer;

COMPONENT DFF16 is
  Port (data: in STD_LOGIC_VECTOR(15 downto 0);
      clk: in STD_LOGIC;
      Q: out STD_LOGIC_VECTOR(15 downto 0));
end COMPONENT DFF16;

component MUX42 is
  Port (a: in STD_LOGIC_VECTOR(15 downto 0);
      b: in STD_LOGIC_VECTOR(15 downto 0);
      sel: in STD_LOGIC;
      output: out STD_LOGIC_VECTOR(15 downto 0));
end component MUX42;

component muxcontroller is
  Port (A: in STD_LOGIC_VECTOR(3 downto 0);
      B: in STD_LOGIC;
      controlsignal: out STD_LOGIC);
end component muxcontroller;

signal outDFF: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal outINC: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal outMUX: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal muxcontrol: STD_LOGIC:='0';







begin





ins_muxcontroller: muxcontroller port map(branch_opcode,overflown,muxcontrol);

ins_inc: Incrementer port map(inA => outDFF,
                              outB =>outINC);

ins_MUX: MUX42 port map(outINC,imm_address,muxcontrol,outMUX);

ins_dff: DFF16 port map(data=>outMUX,
                        Q=>outDFF,
                        clk=>clock);


pointer<=outINC;




end Behavioral;
