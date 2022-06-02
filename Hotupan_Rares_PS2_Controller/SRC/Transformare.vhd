library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

----CIUPE

entity transformare is 
	port (
		DATA : in STD_LOGIC_VECTOR (7 downto 0);
		ENABLE : in STD_LOGIC;
		SEG : out STD_LOGIC_VECTOR (6 downto 0)
		); 
end transformare;

architecture transformare_arch of transformare is 	
begin
process(DATA, ENABLE)  
begin 
	
	if ENABLE = '0' then SEG <= "0000000";
	
	else
	case DATA is  
		---
    	when x"16" => SEG <= "0110000";	 --1
		when x"1e" => SEG <= "1101101";	 --2
		when x"26" => SEG <= "1111001";  --3
		when x"25" => SEG <= "0110011";	 --4
		when x"2e" => SEG <= "1011011";	 --5
		when x"36" => SEG <= "1011111";	 --6
		when x"3d" => SEG <= "1110000";	 --7
		when x"3e" => SEG <= "1111111";	 --8
		when x"46" => SEG <= "1111011";	 --9
		when x"45" => SEG <= "1111110";	 --0
		when x"4e" => SEG <= "0000001";  -- -
		when x"55" => SEG <= "1000001";	 --	=
		---
		when x"15" => SEG <= "1110011";	 --q
		when x"1d" => SEG <= "0101010";	 --w
		when x"24" => SEG <= "1001111";	 --e
		when x"2d" => SEG <= "1100110";	 --r   
		when x"2c" => SEG <= "0001111";	 --t
		when x"35" => SEG <= "0111011";	 --y
		when x"3c" => SEG <= "0111110";	 --u
		when x"43" => SEG <= "0000110";	 --i
		when x"44" => SEG <= "0011101";	 --o
		when x"4d" => SEG <= "1100111";	 --p
		when x"54" => SEG <= "0001101";	 --[  
		when x"5b" => SEG <= "0011001";	 --]
		when x"5d" => SEG <= "0000011";	 --\ 
		---
		when x"1c" => SEG <= "1110111";	 --a
		when x"1b" => SEG <= "1011011";	 --s
		when x"23" => SEG <= "0111101";	 --d
		when x"2b" => SEG <= "1000111";	 --f
		when x"34" => SEG <= "1011110";	 --g
		when x"33" => SEG <= "0010111";	 --h
		when x"3b" => SEG <= "0111100";	 --j
		when x"42" => SEG <= "1010111";	 --k
		when x"4b" => SEG <= "0001110";	 --l
		when x"4c" => SEG <= "0001001";	 --;   
		when x"52" => SEG <= "0000010";	 --'
		---
		when x"1a" => SEG <= "1101001";	 --z 
		when x"22" => SEG <= "0110111";	 --x
		when x"21" => SEG <= "1001110";	 --c
		when x"2a" => SEG <= "0011100";	 --v
		when x"32" => SEG <= "0011111";	 --b
		when x"31" => SEG <= "1110110";	 --n
		when x"3a" => SEG <= "1010100";	 --m
		when x"41" => SEG <= "0011000";	 --,
		when x"49" => SEG <= "0001000";	 --.
		when x"4a" => SEG <= "0100001";	 --/
		when x"29" => SEG <= "0000000";  -- spatiu
		--- backspace
		when x"66" => SEG <= "0000000"; --bs
		when others => SEG <= "0000000";
end case; 
	end if;
end process;
end transformare_arch;