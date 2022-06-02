library IEEE;
use IEEE.std_logic_1164.all;

---CIUPE

entity AFISARE is
	port(
		data_in : in std_logic_vector (6 downto 0); --- data pentru afisoare
		enable : in std_logic;
		E0 : in std_logic; --daca este sageata
		mode : in std_logic_vector (2 downto 0);
		enter : in std_logic; 
		---catozii
	 	cat1 : inout std_logic_vector (6 downto 0)  := (others => '0');
		cat2 : inout std_logic_vector (6 downto 0)  := (others => '0');
		cat3 : inout std_logic_vector (6 downto 0)  := (others => '0');
		cat4 : inout std_logic_vector (6 downto 0)  := (others => '0');
		anod : out std_logic_vector (3 downto 0) := (0 => '0', others => '1')
		);
end AFISARE;
		 
architecture AFISARE_ARCH of AFISARE is --- comportamental	--- dupa tabelul de adevar de la afisare din documentatie
begin
	process(enable)
	begin
		if(enter = '0') then 
			if(E0 = '0') then
			case mode is
			when "000" =>
				if(enable = '1') then
					cat1(6 downto 0) <= data_in(6 downto 0);
					cat2(6 downto 0) <= cat1(6 downto 0);
					cat3(6 downto 0) <= cat2(6 downto 0);
					cat4(6 downto 0) <= cat3(6 downto 0);
					--- suntem pe primul afisor
					anod(0) <= '0';
					anod(1) <= '1';
					anod(2) <= '1';
					anod(3) <= '1';
				end if;	
			when "001" => 	
				if(enable = '1') then
					---cat1(6 downto 0) <= cat1(6 downto 0);
					cat2(6 downto 0) <= data_in(6 downto 0);
					cat3(6 downto 0) <= cat2(6 downto 0);
					cat4(6 downto 0) <= cat3(6 downto 0);
					---suntem pe al doilea afisor
					anod(0) <= '1';
					anod(1) <= '0';
					anod(2) <= '1';
					anod(3) <= '1';
				end if;	
			when "010" =>
				if(enable = '1') then
					--cat1(6 downto 0) <= cat1(6 downto 0);
					--cat2(6 downto 0) <= cat2(6 downto 0);
					cat3(6 downto 0) <= data_in(6 downto 0);
					cat4(6 downto 0) <= cat3(6 downto 0);
					--- suntem pe al 3 lea afisor
					anod(0) <= '1';
					anod(1) <= '1';
					anod(2) <= '0';
					anod(3) <= '1';
				end if;
			when "011" =>
				if(enable = '1') then
					--cat1(6 downto 0) <= cat1(6 downto 0);
					--cat2(6 downto 0) <= cat2(6 downto 0);
					--cat3(6 downto 0) <= cat3(6 downto 0);
					cat4(6 downto 0) <= data_in(6 downto 0);
					--- suntem pe al 4 lea afisor
					anod(0) <= '1';
					anod(1) <= '1';
					anod(2) <= '1';
					anod(3) <= '0';
				end if;	  
	---avem backspace
			when "100" =>
				if(enable = '1') then
					cat1(6 downto 0) <= cat2(6 downto 0);
					cat2(6 downto 0) <= cat3(6 downto 0);
					cat3(6 downto 0) <= cat4(6 downto 0);
					cat4(6 downto 0) <= "0000000";
					--- suntem pe primul afisor
					anod(0) <= '0';
					anod(1) <= '1';
					anod(2) <= '1';
					anod(3) <= '1';
				end if;
			when "101" =>
				if(enable = '1') then
					cat1(6 downto 0) <= cat1(6 downto 0);
					cat2(6 downto 0) <= cat3(6 downto 0);
					cat3(6 downto 0) <= cat4(6 downto 0);
					cat4(6 downto 0) <= "0000000";
					--- suntem pe al 2 lea afisor
					anod(0) <= '1';
					anod(1) <= '0';
					anod(2) <= '1';
					anod(3) <= '1';
				end if;
			when "110" =>
				if(enable = '1') then
					cat1(6 downto 0) <= cat1(6 downto 0);
					cat2(6 downto 0) <= cat2(6 downto 0);
					cat3(6 downto 0) <= cat4(6 downto 0);
					cat4(6 downto 0) <= "0000000";
					--- suntem pe al 3 lea afisor
					anod(0) <= '1';
					anod(1) <= '1';
					anod(2) <= '0';
					anod(3) <= '1';
				end if;
			when "111" =>
				if(enable = '1') then
					cat1(6 downto 0) <= cat1(6 downto 0);
					cat2(6 downto 0) <= cat2(6 downto 0);
					cat3(6 downto 0) <= cat3(6 downto 0);
					cat4(6 downto 0) <= "0000000";
					--- suntem pe al 4 lea afisor
					anod(0) <= '1';
					anod(1) <= '1';
					anod(2) <= '1';
					anod(3) <= '0';
				end if;	  
			when others =>
					cat1(6 downto 0) <= "0000000";
					cat2(6 downto 0) <= "0000000";
					cat3(6 downto 0) <= "0000000";
					cat4(6 downto 0) <= "0000000";
			end case;
	---sagetile
		elsif (E0 = '1') then
			case mode is
			when "000" =>
				if(enable = '1') then
					anod(0) <= '0';
					anod(1) <= '1';
					anod(2) <= '1';
					anod(3) <= '1';
				end if;
			when "001" =>
				if(enable = '1') then
					anod(0) <= '1';
					anod(1) <= '0';
					anod(2) <= '1';
					anod(3) <= '1';
				end if;
			when "010" =>
				if(enable = '1') then
					anod(0) <= '1';
					anod(1) <= '1';
					anod(2) <= '0';
					anod(3) <= '1';
				end if;
			when "011" =>
				if(enable = '1') then
					anod(0) <= '1';
					anod(1) <= '1';
					anod(2) <= '1';
					anod(3) <= '0';
				end if;		
			when "100" =>
				if(enable = '1') then
					anod(0) <= '0';
					anod(1) <= '1';
					anod(2) <= '1';
					anod(3) <= '1';
				end if;		
			when "101" =>
				if(enable = '1') then
					anod(0) <= '1';
					anod(1) <= '0';
					anod(2) <= '1';
					anod(3) <= '1';
				end if;		
			when "110" =>
				if(enable = '1') then
					anod(0) <= '1';
					anod(1) <= '1';
					anod(2) <= '0';
					anod(3) <= '1';
				end if;		
			when "111" =>
				if(enable = '1') then
					anod(0) <= '1';
					anod(1) <= '1';
					anod(2) <= '1';
					anod(3) <= '0';
				end if;	
			when others =>
					anod(0) <= '0';
					anod(1) <= '1';
					anod(2) <= '1';
					anod(3) <= '1';
			end case;
		end if;
		else ---avem enter
			cat1(6 downto 0) <= "0000000";
			cat2(6 downto 0) <= "0000000";
			cat3(6 downto 0) <= "0000000";
			cat4(6 downto 0) <= "0000000";
		end if;
	end process;
end AFISARE_ARCH;
			
			
		
		
		