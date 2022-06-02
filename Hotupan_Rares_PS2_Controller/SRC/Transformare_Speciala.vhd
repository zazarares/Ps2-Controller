library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

---HOTUPAN

entity transformare_speciala is 
	port (
		DATA : in STD_LOGIC_VECTOR (7 downto 0); 
		ENABLE : in STD_LOGIC;
		SENS : out STD_LOGIC
		); 
end entity;

architecture comp of transformare_speciala is 	
begin
process(DATA, ENABLE) 
begin				 
	if(ENABLE = '1') then
	case DATA is  
    	when x"75" => SENS <= '1';	 -- ->
		when x"74" => SENS <= '1';	 --	 up
		when x"6B" => SENS <= '0';  -- <-
		when x"72" => SENS <= '0';	 -- down
		when others => SENS <= '0';
	end case;
	end if;
end process;
end architecture ;