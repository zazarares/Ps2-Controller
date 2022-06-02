library IEEE;
use IEEE.std_logic_1164.all;

---CIUPE
entity shift_reg is
	port(
		d : in std_logic;
		clk : in std_logic;
		carry : out std_logic := '0';
		data : inout std_logic_vector(10 downto 0) := (others => '0')
		);
end shift_reg;

architecture shift_reg_arch of shift_reg is
begin
	process(clk)
	begin
		if(clk'event and clk = '1') then
			data(9 downto 0) <= data(10 downto 1); --shiftam
			carry <= data(0);
			data(10) <= d;
		end if;
	end process;
end shift_reg_arch;
			