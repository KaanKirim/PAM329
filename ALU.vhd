library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ALU is
  Port (a: in std_logic_vector(15 downto 0);
        b: in std_logic_vector(15 downto 0);
        control: in std_logic_vector(3 downto 0);
        sum: out std_logic_vector(15 downto 0);
        overflown: out std_logic);
end ALU;

architecture Behavioral of ALU is





    component adderSubber 
        Port (a: in std_logic_vector(15 downto 0);
              b: in std_logic_vector(15 downto 0);
              d: in std_logic;
              sum: out std_logic_vector(15 downto 0);
              overflown: out std_logic);
    end component;


    component SHLer 
      Port (a: in std_logic_vector(15 downto 0);
            sum: out std_logic_vector(15 downto 0)
            );
    end component;
    
    component SHRer 
      Port (a: in std_logic_vector(15 downto 0);
            sum: out std_logic_vector(15 downto 0)
            );
    end component;
    
    
    
    
    component ANDer 

      Port (a: in std_logic_vector(15 downto 0);
            b: in std_logic_vector(15 downto 0); 
            sum: out std_logic_vector(15 downto 0)
            );
  
    end component;
    
    
    
    
    
    
    component ORer 

      Port (a: in std_logic_vector(15 downto 0);
            b: in std_logic_vector(15 downto 0); 
            sum: out std_logic_vector(15 downto 0)
            );
  
    end component;
    
    
    
    
    component XORer 

      Port (a: in std_logic_vector(15 downto 0);
            b: in std_logic_vector(15 downto 0); 
            sum: out std_logic_vector(15 downto 0)
            );
  
    end component;
    
    
    
    component NEGer 

      Port (a: in std_logic_vector(15 downto 0);
            sum: out std_logic_vector(15 downto 0)
            );
  
    end component;

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
    
    

    
    
    
    
    





    signal o_adderSubber: std_logic_vector(15 downto 0):=(others=>'0');
    signal o_ANDer: std_logic_vector(15 downto 0):=(others=>'0');
    signal o_ORer: std_logic_vector(15 downto 0):=(others=>'0');
    signal o_XORer: std_logic_vector(15 downto 0):=(others=>'0');
    signal o_NEGer: std_logic_vector(15 downto 0):=(others=>'0');
    signal o_SHRer: std_logic_vector(15 downto 0):=(others=>'0');
    signal o_SHLer: std_logic_vector(15 downto 0):=(others=>'0');
    
  
    signal zeroes: std_logic_vector(15 downto 0):="0000000000000000";




begin
zeroes<="0000000000000000";



adderSubber_ins: adderSubber port map(a,b,control(0),o_adderSubber, overflown);
ANDer_ins: ANDer port map(a,b,o_ANDer);
ORer_ins: ORer port map(a,b,o_ORer);
XORer_ins: XORer port map(a,b,o_XORer);
NEGer_ins: NEGer port map(a,o_NEGer);
SHRer_ins: SHRer port map(a,o_SHRer);
SHLer_ins: SHLer port map(a,o_SHLer);

UNITE: MUX16x16 port map(control,o_adderSubber,o_adderSubber,o_ANDer,o_ORer,o_XORer,o_NEGer,o_SHRer,o_SHLer,o_adderSubber,o_adderSubber,o_ANDer,o_ORer,o_XORer,o_NEGer,o_SHRer,o_SHLer,sum);

end Behavioral;
