library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

---CIUPE

entity counter11 is
	port(
		clk : in std_logic;
		nr_11 : out std_logic := '0'
		);
end counter11;

architecture counter11_arch of counter11 is
begin
	process(clk)
	variable nr : integer range 0 to 12 := 0;
	begin
		if(clk'event and clk = '1') then
			nr := nr + 1;
		end if;
		
		if(nr = 11) then
			nr := 0;
			nr_11 <= '1';
		else
			nr_11 <= '0';
		end if;
		end process;
end counter11_arch;