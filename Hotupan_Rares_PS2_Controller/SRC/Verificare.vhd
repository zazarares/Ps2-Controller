library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
 
entity transformare is 
	port (
		DATA_PS2 : in STD_LOGIC_VECTOR (10 downto 0);
		EROARE : out STD_LOGIC
		); 
end transformare;

architecture transformare_arch of transformare is 
signal s : std_logic;
begin			 
	process(DATA_PS2)
	variable nr : integer;
	begin
		nr := 0;
		EROARE <= '0';
		if data_ps2(0) = '1' then EROARE <= '1';   
		end if;
		if data_ps2(10) = '0' then EROARE <= '1';	
		end if;	
		nr <= nr + conv_std_logic(data_ps2(1), nr'length);
		nr <= nr + conv_std_logic(data_ps2(2), nr'length);
		nr <= nr + conv_std_logic(data_ps2(3), nr'length);
		nr <= nr + conv_std_logic(data_ps2(4), nr'length);
		nr <= nr + conv_std_logic(data_ps2(5), nr'length);
		nr <= nr + conv_std_logic(data_ps2(6), nr'length);
		nr <= nr + conv_std_logic(data_ps2(7), nr'length);
		nr <= nr + conv_std_logic(data_ps2(8), nr'length);
		if nr mod 2 = data_ps2(9) then EROARE <= '0';
		else
			EROARE <= '1'; 
		end if;
	end process;
end transformare_arch;