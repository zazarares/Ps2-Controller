library IEEE;
use IEEE.std_logic_1164.all;


---HOTUPAN
entity Backspace_checker is
	 port(
	 intrare: in STD_LOGIC_VECTOR	(7 downto 0);
	 iesire: out STD_LOGIC;
	 enable: in STD_LOGIC
	     );
end Backspace_checker;

architecture comp of Backspace_checker is
begin
process(enable)
begin
	if (intrare(7 downto 0) = "01100110" and enable = '1') then
		  iesire <= '1';
	else 
		  iesire <= '0';
	end if;
	end process;

end architecture;
