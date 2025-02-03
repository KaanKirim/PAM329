library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity sevenseg is
    Port ( clk_in : in STD_LOGIC;
           instruction: STD_LOGIC_VECTOR(15 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end sevenseg;

architecture Behavioral of sevenseg is
signal one_second_enable: std_logic;

signal displayed_number: STD_LOGIC_VECTOR (15 downto 0);

signal led_binary_coded_decimal: STD_LOGIC_VECTOR (3 downto 0);
signal counter: STD_LOGIC_VECTOR (19 downto 0);

signal top_2_of_counter: std_logic_vector(1 downto 0);

begin

displayed_number <= instruction;

process(led_binary_coded_decimal)
begin
    case led_binary_coded_decimal is ---   gfedcba
                when "0000" => seg <= "1000000";-- 1    
                when "0001" => seg <= "1111001";-- 2
                when "0010" => seg <= "0100100";-- 3
                when "0011" => seg <= "0110000";-- 4
                when "0100" => seg <= "0011001";-- 5
                when "0101" => seg <= "0010010";-- 6
                when "0110" => seg <= "0000010";-- 7
                when "0111" => seg <= "1111000";-- 8
                when "1000" => seg <= "0000000";-- 9
                when "1001" => seg <= "0010000";-- a
                when "1010" => seg <= "0001000";-- b
                when "1011" => seg <= "0000011";-- c
                when "1100" => seg <= "1000110";-- d
                when "1101" => seg <= "0100001";-- e
                when "1110" => seg <= "0000110";-- f
                when "1111" => seg <= "0001110";-- g
                when others => seg <= "1111111";
    end case;
end process;

process(clk_in)
begin
	if(rising_edge(clk_in)) then
        counter <= counter + 1;
    end if;
end process;
 top_2_of_counter <= counter(19 downto 18);
 
process(top_2_of_counter, displayed_number)
begin
    case top_2_of_counter is
    when "00" =>
        an <= "0111";
       
        led_binary_coded_decimal <= displayed_number(15 downto 12);
       
    when "01" =>
        an <= "1011";
       
        led_binary_coded_decimal <= displayed_number(11 downto 8);
       
    when "10" =>
        an <= "1101";
       
        led_binary_coded_decimal <= displayed_number(7 downto 4);
       
          
    when "11" =>
        an <= "1110";
       
        led_binary_coded_decimal <= displayed_number(3 downto 0);
         
    when others =>
        an <= "1111";
       
        led_binary_coded_decimal <= displayed_number(3 downto 0);
         
    end case;
end process;

end Behavioral;