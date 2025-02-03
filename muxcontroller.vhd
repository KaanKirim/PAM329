

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity muxcontroller is
  Port (A: in STD_LOGIC_VECTOR(3 downto 0);
  		B: in STD_LOGIC;
  		controlsignal: out STD_LOGIC);
end muxcontroller;

architecture Behavioral of muxcontroller is

begin
controlsignal<= (A(3) and (not A(2)) and (not A(1)) and A(0)) or 
          (A(3) and A(2) and (not A(1)) and (not A(0)) and (not B)) or 
          (A(3) and (not A(2)) and A(1) and (not A(0)) and B);

end Behavioral;
