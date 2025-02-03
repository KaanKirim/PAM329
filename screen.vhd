library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity screen is
  port (
    clk: in STD_LOGIC;
    byteselect: out std_logic_vector(15 downto 0);
    byte: in std_logic_vector(15 downto 0);
    o_h_sync: out STD_LOGIC;
    o_v_sync: out STD_LOGIC;
    blue: out STD_LOGIC_VECTOR(3 downto 0));
end screen;

architecture Behavioral of screen is

  component clk_wiz_0 is
    port (
      clk_in1: in STD_LOGIC;
      clk_out1: out STD_LOGIC
    );
  end component;

  signal hi: integer:=0;
  signal vi: integer:=0;
  signal clk315: STD_LOGIC:='0';
  signal h_sync, v_sync: STD_LOGIC:='1';






begin
  o_h_sync <= h_sync;
  o_v_sync <= v_sync;
  byteselect<=std_logic_vector(TO_UNSIGNED((((hi/10)+(vi/10)*64)/16)+828,16));
  inst_clk_wiz: clk_wiz_0 port map(clk,clk315);

  process(clk315)
  begin
    if rising_edge(clk315) then
      --h_sync control
      if (hi>663) and (hi<704) then
        h_sync <= '0';
      else
        h_sync <= '1';
      end if;
      
      if (hi>=0) and (hi<640) then
      --DRAWING FUNCTION HERE
        if byte(((hi/10)+(vi/10)*64) mod 16)='1' then
            blue<="1111";
        else
            blue<="0000";
        end if;
      --DRAWING FUNCTION ENDS HERE
      else
        blue <= "0000";
      end if;

      
      

      --v_sync control
      if (vi=489) or (vi=490) then
        v_sync <= '0';
      else
        v_sync <= '1';
      end if;

      -- Update output signals
      o_h_sync <= h_sync;
      o_v_sync <= v_sync;

      -- Update counters
      if hi<832 then
        hi <= hi+1;
      else
        hi <= 0;
        if vi<520 then
          vi <= vi+1;
        else
          vi <= 0;
        end if;
      end if;
    end if;
  end process;

end Behavioral;




