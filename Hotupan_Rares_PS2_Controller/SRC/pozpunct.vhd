library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

---HOTUPAN

entity counter4 is
	 port(
	 Enable : in STD_LOGIC;
	 up_down: in STD_LOGIC;
	 iesire: out STD_LOGIC_VECTOR(1 downto 0)
	     );
end entity;
architecture comp of counter4 is
begin
process (Enable)
		variable valoare: integer range -1 to 4 := 0;
    begin
        if (Enable = '1' and up_down = '1' ) then 
			valoare := valoare + 1;
		elsif (Enable = '1' and up_down = '0' ) then 
			valoare := valoare - 1;
		end if;
		
		if (valoare = 4) then 
			valoare := 0;
			iesire <= std_logic_vector(to_unsigned(valoare,2));
		elsif (valoare = -1) then
			valoare := 3;
			iesire <= std_logic_vector(to_unsigned(valoare,2));
		else
			iesire <= std_logic_vector(to_unsigned(valoare,2));
		end if;		  
		end process;

end architecture;
