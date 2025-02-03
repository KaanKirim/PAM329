
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity toppest is
  Port (weRAM: in STD_LOGIC;
        reRAM: in STD_LOGIC;
        diRAM: in  std_logic_vector(15 downto 0);  -- data in
        doRAM: out std_logic_vector(15 downto 0);

        o_reg0: out STD_LOGIC_VECTOR(15 downto 0);
        o_reg1: out STD_LOGIC_VECTOR(15 downto 0);
        o_reg2: out STD_LOGIC_VECTOR(15 downto 0);
        o_reg3: out STD_LOGIC_VECTOR(15 downto 0);
        o_reg4: out STD_LOGIC_VECTOR(15 downto 0);
        o_reg5: out STD_LOGIC_VECTOR(15 downto 0);
        o_reg6: out STD_LOGIC_VECTOR(15 downto 0);
        o_reg7: out STD_LOGIC_VECTOR(15 downto 0);
        o_reg8: out STD_LOGIC_VECTOR(15 downto 0);
        o_reg9: out STD_LOGIC_VECTOR(15 downto 0);
        o_reg10: out STD_LOGIC_VECTOR(15 downto 0);
        o_reg11: out STD_LOGIC_VECTOR(15 downto 0);
        o_reg12: out STD_LOGIC_VECTOR(15 downto 0);
        o_reg13: out STD_LOGIC_VECTOR(15 downto 0);
        o_reg14: out STD_LOGIC_VECTOR(15 downto 0);
        o_reg15: out STD_LOGIC_VECTOR(15 downto 0));


end toppest;

architecture Behavioral of toppest is

component CPUregisters is
  Port (instruction: in STD_LOGIC_VECTOR(15 downto 0);
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
        overflown: out std_logic);

end component CPUregisters;

component yardimuwu is
	  Port (branch_opcodeg: in STD_LOGIC_VECTOR(3 downto 0);
        	overflowng: in STD_LOGIC;
	        imm_addressg: in STD_LOGIC_VECTOR(15 downto 0);
        	clockg: in STD_LOGIC;

        	weRAM: in STD_LOGIC;
        	reRAM: in STD_LOGIC;
        	diRAM: in  std_logic_vector(15 downto 0);  -- data in
        	doRAM: out std_logic_vector(15 downto 0));
end component yardimuwu;

signal instructionkaan: std_logic_vector(15 downto 0):=(others=>'0');i
signal overflownkaan: std_logic:='0';

begin

Heart: yardimuwu port map(instructionkaan(15 downto 12),overflownkaan,instructionkaan)


end Behavioral;
