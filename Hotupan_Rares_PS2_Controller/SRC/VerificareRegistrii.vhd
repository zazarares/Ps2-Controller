library IEEE;
use IEEE.std_logic_1164.all;

---HOTUPAN

entity verificare is
	 port(
	 intrare1: in STD_LOGIC_VECTOR	(7 downto 0);
	 intrare2: in STD_LOGIC_VECTOR	(7 downto 0);
	 iesire: out STD_LOGIC;
	 enable: in STD_LOGIC
	     );
end verificare;

architecture comp of verificare is
begin
process(enable)
	begin
	if (intrare1(7 downto 0) = intrare2(7 downto 0) and enable = '1') then
		  iesire <= '1';
	else 
		  iesire <= '0';
	end if;
	end process;
end architecture;
