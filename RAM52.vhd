-- most sincere thanks to prof. atalar for RAM
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity RAM is

 port(
  we   : in  std_logic; --write enable
  paddr : in  std_logic_vector(15 downto 0); --address for program
  eaddr: in std_logic_vector(15 downto 0); --address for editing
  saddr: in std_logic_vector(15 downto 0);--address for screen
  di   : in  std_logic_vector(15 downto 0); --data in
  instruction   : out std_logic_vector(15 downto 0); --instruction output 
  screen: out std_logic_vector(15 downto 0)); --screen output

end RAM ;
architecture behavioral of RAM is
 type ram_type is array (1023 downto 0) of std_logic_vector(15 downto 0);
signal RAM : ram_type := (
    0=>x"8001",
    1=>x"8101",
    2=>x"8202",
    3=>x"0A60",
    4=>x"8909",
    5=>x"FFFF",
    6=>x"FFFF",
    7=>x"FFFF",
    8=>x"0B60",
    9=>x"0CAB",
    10=>x"0AB0",
    11=>x"0BC0",
    12=>x"A900",


    others => (others => '0')
);

begin
    process (paddr, saddr, we, eaddr, di)
    begin
        instruction <= RAM(conv_integer(paddr));
        screen <= RAM(conv_integer(saddr));

        if we = '1' then
            RAM(conv_integer(eaddr)) <= di;
        end if;
    end process;
end behavioral;
