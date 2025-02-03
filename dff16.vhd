-----------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity DFF16 is
  Port (data: in STD_LOGIC_VECTOR(15 downto 0);
      clk: in STD_LOGIC;
      Q: out STD_LOGIC_VECTOR(15 downto 0));
end DFF16;

architecture Behavioral of DFF16 is

component DFF is
    Port ( D : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Q : out STD_LOGIC);
end component DFF;

begin

gen_DFFs: for i in 15 downto 0 generate
ins_DFF:DFF port map(data(i),clk,Q(i));
end generate; 

end Behavioral;
