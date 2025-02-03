--PROGRAMMABLE ANALYTIC MACHINE-329 


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;




entity PAM329 is
  Port (clk: in STD_LOGIC;
        HSYNC: out STD_LOGIC;
        VSYNC: out STD_LOGIC;
        COLOR: out STD_LOGIC_VECTOR(3 downto 0);
        AN : out STD_LOGIC_VECTOR (3 downto 0);
        SEG : out STD_LOGIC_VECTOR (6 downto 0);
        O_REGC: out STD_LOGIC_VECTOR(15 downto 0);
        BUTTON: in STd_LOGIC;
        SWINPUT: STD_LOGIC_VECTOR(15 DOWNTO 0));
end PAM329;

architecture Behavioral of PAM329 is

component PC is
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
end component PC;

component CPUregisters is
  Port (mclk: in STD_LOGIC;
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

end component CPUregisters;

component RAM is

 port(
  we   : in  std_logic; --write enable
  paddr : in  std_logic_vector(15 downto 0); --address for program
  eaddr: in std_logic_vector(15 downto 0); --address for editing
  saddr: in std_logic_vector(15 downto 0);--address for screen
  di   : in  std_logic_vector(15 downto 0); --data in
  instruction   : out std_logic_vector(15 downto 0); --instruction output 
  screen: out std_logic_vector(15 downto 0)); --screen output

end component RAM ;

component screen is
  port (
    clk: in STD_LOGIC;
    byteselect: out std_logic_vector(15 downto 0);
    byte: in std_logic_vector(15 downto 0);
    o_h_sync: out STD_LOGIC;
    o_v_sync: out STD_LOGIC;
    blue: out STD_LOGIC_VECTOR(3 downto 0));
end component screen;

component RAMWriter is
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

end component RAMWriter;

component sevenseg is
    Port ( clk_in : in STD_LOGIC;
           instruction: STD_LOGIC_VECTOR(15 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end component sevenseg;

component clockslower is
    Port ( clk : in STD_LOGIC;
           slowclk : out STD_LOGIC);
end component clockslower;


signal s_instruction: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal s_reg0: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal s_reg1: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal s_reg2: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal s_reg3: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal s_reg4: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal s_reg5: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal s_reg6: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal s_reg7: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal s_reg8: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal s_reg9: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal s_reg10: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal s_reg11: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal s_reg12: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal s_reg13: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal s_reg14: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal s_reg15: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal s_overflown: std_logic:='0';

signal s_pointer: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');


signal we_RAM: std_logic:='0';
signal e_RAM: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal di_RAM: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');

signal s_RAM: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
signal s_byte: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');

signal slowclk1: STD_LOGIC:='0';



begin

CPU: CPUregisters port map(slowclk1,s_instruction,s_reg0,s_reg1,s_reg2,s_reg3,s_reg4,s_reg5,s_reg6,s_reg7,s_reg8,s_reg9,s_reg10,s_reg11,s_reg12,s_reg13,s_reg14,s_reg15,s_overflown,BUTTON,SWINPUT);
Program_Counter: PC port map(slowclk1,s_instruction,s_overflown,s_reg0,s_reg1,s_reg2,s_reg3,s_reg4,s_reg5,s_reg6,s_reg7,s_reg8,s_reg9,s_reg10,s_reg11,s_reg12,s_reg13,s_reg14,s_reg15,s_pointer);
the_RAM: RAM port map(we_RAM,s_pointer,e_RAM,s_RAM,di_RAM,s_instruction,s_byte);
Graphical_Unit: screen port map(clk,s_RAM,s_byte,HSYNC,VSYNC,COLOR);
RAMbus: RAMWriter port map(s_reg0,s_reg1,s_reg2,s_reg3,s_reg4,s_reg5,s_reg6,s_reg7,s_reg8,s_reg9,s_reg10,s_reg11,s_reg12,s_reg13,s_reg14,s_reg15, s_instruction,we_RAM,e_RAM,di_RAM);
Instruction_Display: sevenseg port map(clk,s_instruction,AN,SEG);
clock_slower: clockslower port map(clk,slowclk1);
O_REGC<=s_reg12;

end Behavioral;
