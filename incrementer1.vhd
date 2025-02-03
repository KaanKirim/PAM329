library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Incrementer is
    Port ( inA : in  STD_LOGIC_VECTOR(15 downto 0);
           outB : out  STD_LOGIC_VECTOR(15 downto 0));
end Incrementer;

architecture Behavioral of Incrementer is

    component halfAdder is
        Port ( A : in  STD_LOGIC;
               B : in  STD_LOGIC;
               Sum : out  STD_LOGIC;
               Cout : out  STD_LOGIC);
    end component;

    signal Sum_temp : std_logic_vector(15 downto 0):=(others=>'0');
    signal Cout_temp : std_logic_vector(15 downto 0):=(others=>'0');

begin

    Sum_temp(0) <= not inA(0); 
    Cout_temp(0) <= inA(0);

    halfAdders: for i in 1 to 15 generate
        Adder_i: halfAdder port map(inA(i), Cout_temp(i-1), Sum_temp(i), Cout_temp(i));
    end generate halfAdders;

    outB <= Sum_temp;

end Behavioral;
