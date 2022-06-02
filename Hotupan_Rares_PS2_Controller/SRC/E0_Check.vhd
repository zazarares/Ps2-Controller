library IEEE;
use IEEE.std_logic_1164.all;

---CIUPE

entity E0_check is 
	port(
		data_in : in STD_LOGIC_VECTOR (7 downto 0);
		rezultat : out STD_LOGIC;
		enable : in STD_LOGIC
		);
end E0_check;

architecture E0_check_arch of E0_check is
begin
	process(enable)
	begin
		if(data_in(7 downto 0) = "11100000" and enable = '1') then rezultat <= '1';
		else 
			rezultat <= '0';
		end if;	
	end process;
end E0_check_arch;
			