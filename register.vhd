
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity customRegister16 is
  Port (data: in STD_LOGIC_VECTOR(15 downto 0);
  		enable: in STD_LOGIC;
  		output: out STD_LOGIC_VECTOR(15 downto 0);
      clk: in STD_LOGIC);
end customRegister16;



architecture Behavioral of customRegister16 is
signal s_out: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');


begin
process(enable,data,clk)
begin
if falling_edge(clk) then
  if enable='1'then
    s_out<=data;
  end if;
end if;
end process;
output<=s_out;

end Behavioral;
