library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity RAM is

 port(
  clk  : in  std_logic;--clock
  we   : in  std_logic; --write enable
  addr : in  std_logic_vector(15 downto 0);--address
  di   : in  std_logic_vector(15 downto 0);--data in
  do   : out std_logic_vector(15 downto 0));--data out

end RAM;
architecture behavioral of RAM is
 type ram_type is array (65535 downto 0) of std_logic_vector(15 downto 0);
 signal RAM : ram_type := (others => (others => '0'));


begin
 process(clk)
 begin
  if rising_edge(clk) then
   do <= RAM(conv_integer(addr));
    if we = '1' then
     RAM(conv_integer(addr))(15 downto 0) <= di(15 downto 0);
    end if;
  end if;
 end process;

end behavioral;