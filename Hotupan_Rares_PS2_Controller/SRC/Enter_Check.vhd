library IEEE;
use IEEE.std_logic_1164.all;

--HOTUPAN

entity enter_check is
	 port(
		intrare: in STD_LOGIC_VECTOR (7 downto 0);
	 	iesire: out STD_LOGIC;
	 	enable: in STD_LOGIC
	     );
end enter_check;

architecture comp of enter_check is
begin

	 process(enable)
	begin
	if (intrare(7 downto 0) = "01011010" and enable = '1') then
		  iesire <= '1';
	else 
		  iesire <= '0';
	end if;
	end process;

end architecture;
