library ieee;
use ieee.std_logic_1164.all;


entity Incrementer is
    port (
        input: in std_logic_vector(15 downto 0);
        output: out std_logic_vector(15 downto 0)
    );
end entity Incrementer;

architecture behavior of Incrementer is

component half_adder is
	Port (a: in std_logic;
		  b: in std_logic;
		  sum: out std_logic;
		  cout: out std_logic);
end component half_adder;

signal one: std_logic_vector(15 downto 0):=(others=>'0');
signal cout: std_logic_vector(15 downto 0):=(others=>'0');
signal sum: std_logic_vector(15 downto 0):=(others=>'0');



begin
one<=x"0001";


hmm1: half_adder port map(input(0),one(0),sum(0),cout(0));
gen: for i in 1 to 15 generate
hmm: half_adder port map(input(i),cout(i-1),sum(i),cout(i));
end generate;

output<=sum;
end architecture behavior;


