library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity numarator_pozitie is
	port(	  
		up_down : in std_logic; --- 0 count down, 1 count up
		enable : in std_logic;
		mode : out std_logic_vector(1 downto 0)
		);
end numarator_pozitie;

architecture numarator_pozitie_arch of numarator_pozitie is
begin
	process (enable)
	variable nr : integer := 0;	
	begin 
		if(enable = '1' and up_down = '1') then
			nr := nr + 1;
	