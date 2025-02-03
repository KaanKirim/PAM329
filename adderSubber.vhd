library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity adderSubber is
    Port (a: in std_logic_vector(15 downto 0);
          b: in std_logic_vector(15 downto 0);
          d: in std_logic;
          sum: out std_logic_vector(15 downto 0);
          overflown: out std_logic);
end adderSubber;

architecture Behavioral of adderSubber is
    component fullAdder
        Port (
            a : in std_logic;
            b : in std_logic;
            cin : in std_logic;
            sum : out std_logic;
            cout : out std_logic
        );
    end component;
    
    signal carry: std_logic_vector(16 downto 0) :=(others=>'0');
    signal mb: std_logic_vector(15 downto 0) :=(others=>'0');
begin
    carry(0) <= d;
     gen_fa: for i in 0 to 15 generate
        muxedB: mb(i) <= ((not d) and  b(i)) or (d and (not b(i)));
        FA: fullAdder port map(mb(i), a(i), carry(i), sum(i), carry(i+1));
    end generate gen_fa;

    overflown <= carry(16);


end Behavioral;
