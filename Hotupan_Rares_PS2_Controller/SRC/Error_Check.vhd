library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all; 

---HOTUPAN

entity error_check is
	 port(
	 biti : in STD_LOGIC_VECTOR(10 downto 0);
	 enable : in STD_LOGIC; 
	 iesire : out STD_LOGIC
	     );
end error_check;

architecture comp of error_check is
begin
process(enable)
	variable parity: std_logic;
	begin
		parity := biti(1) xor biti(2) xor biti(3) xor biti(4) xor biti(5) xor biti(6) xor biti(7) xor biti(8) xor biti(9);
	if (biti(10) = '1' and biti(0) = '0' and parity = '1' and enable = '1' ) then
				iesire <= '0';
		  else  
				iesire <= '1';
	end if;
	end process;	
end architecture;
