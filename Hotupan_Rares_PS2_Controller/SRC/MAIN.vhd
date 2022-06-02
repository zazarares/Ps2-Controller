library IEEE;
use IEEE.STD_LOGIC_1164.all;

---CIUPE + HOTUPAN :)

entity PS2 is
	port(
		data : in std_logic;
		clk : in std_logic;
		catod1 : inout std_logic_vector(6 downto 0);
		catod2 : inout std_logic_vector(6 downto 0);
		catod3 : inout std_logic_vector(6 downto 0);
		catod4 : inout std_logic_vector(6 downto 0);
		anod : out std_logic_vector(3 downto 0)
		);
end PS2;

architecture PS2_arch of PS2 is

component shift_reg is
	port(
		d : in std_logic;
		clk : in std_logic;
		carry : out std_logic := '0';
		data : inout std_logic_vector(10 downto 0) := (others => '0')
		);
end component shift_reg;

component E0_check is
	port(
		data_in : in STD_LOGIC_VECTOR (7 downto 0);
		rezultat : out STD_LOGIC;
		enable : in STD_LOGIC
		);
end component E0_check;

component AFISARE
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
end component AFISARE;

component transformare
	port (
		DATA : in STD_LOGIC_VECTOR (7 downto 0);
		ENABLE : in STD_LOGIC;
		SEG : out STD_LOGIC_VECTOR (6 downto 0)
		);
end component transformare; 

component counter11
	port(
		clk : in std_logic;
		nr_11 : out std_logic := '0'
		);
end component counter11;

component Backspace_checker
	port(
	 intrare: in STD_LOGIC_VECTOR	(7 downto 0);
	 iesire: out STD_LOGIC;
	 enable: in STD_LOGIC
	     );
end component Backspace_checker;

component error_check 
	port(
	 biti : in STD_LOGIC_VECTOR(10 downto 0);
	 enable : in STD_LOGIC; 
	 iesire : out STD_LOGIC
	     );
end component error_check;

component counter4
	port(
	 Enable : in STD_LOGIC;
	 up_down: in STD_LOGIC;
	 iesire: out STD_LOGIC_VECTOR(1 downto 0)
	     );
end component counter4;

component enter_check
	port(
		intrare: in STD_LOGIC_VECTOR (7 downto 0);
	 	iesire: out STD_LOGIC;
	 	enable: in STD_LOGIC
	     );
end component enter_check;

component verificare 
	port(
	 intrare1: in STD_LOGIC_VECTOR	(7 downto 0);
	 intrare2: in STD_LOGIC_VECTOR	(7 downto 0);
	 iesire: out STD_LOGIC;
	 enable: in STD_LOGIC
	     );
end component verificare;

component transformare_speciala
	port (
		DATA : in STD_LOGIC_VECTOR (7 downto 0); 
		ENABLE : in STD_LOGIC;
		SENS : out STD_LOGIC
		); 
end component transformare_speciala;

---declarare semnale
signal carry1, carry2, carry3, carry4, carry5 : std_logic;
signal data_reg1, data_reg2, data_reg3, data_reg4, data_reg5 : std_logic_vector(10 downto 0);
signal eroare : std_logic;
signal numara11_en, numara4_en : std_logic; 
signal E0_3_rezultat : std_logic;
signal E0_5_rezultat : std_logic;
signal E0_enable : std_logic;
signal back_1_rezultat, back_3_rezultat, backspace_enable : std_logic;
signal enter_1_rezultat, enter_3_rezultat, enter_enable, afisare_enable : std_logic;
signal verif_reg1, verif_reg2 : std_logic := '0'; 
signal transformare_enable, transformare_spec_enable : std_logic;
signal cod_transformat : std_logic_vector(6 downto 0);
signal tr_spec_mode : std_logic := '0';
signal mode : std_logic_vector(1 downto 0);
signal mode_afisare : std_logic_vector(2 downto 0);

begin
	---shiftarea
	shiftare1 : shift_reg port map (data, clk, carry1, data_reg1);
	shiftare2 : shift_reg port map (data_reg1(0), clk, carry2, data_reg2);
	shiftare3 : shift_reg port map (data_reg2(0), clk, carry3, data_reg3);
	shiftare4 : shift_reg port map (data_reg3(0), clk, carry4, data_reg4);
	shiftare5 : shift_reg port map (data_reg4(0), clk, carry5, data_reg5);
	
	count11 : counter11 port map (clk, numara11_en);
	
	eroare_date : error_check port map (data_reg1(10 downto 0), numara11_en, eroare); 
	
	E0_reg3 : E0_check port map (data_reg3(8 downto 1), E0_3_rezultat, numara11_en); 
	E0_reg5 : E0_check port map (data_reg5(8 downto 1), E0_5_rezultat, numara11_en);
	
	E0_enable <= E0_3_rezultat and E0_5_rezultat;
	
	backspace_reg1 : backspace_checker port map (data_reg1(8 downto 1), back_1_rezultat, numara11_en);
	backspace_reg3 : backspace_checker port map (data_reg3(8 downto 1), back_3_rezultat, numara11_en);
	
	backspace_enable <= back_1_rezultat and back_3_rezultat;
	
	enter_reg1 : enter_check port map (data_reg1(8 downto 1), enter_1_rezultat, numara11_en);
   	enter_reg3 : enter_check port map (data_reg3(8 downto 1), enter_3_rezultat, numara11_en);

	enter_enable <= enter_1_rezultat and enter_3_rezultat;
	
	verificare_registrii : verificare port map (data_reg1(8 downto 1), data_reg3(8 downto 1), verif_reg1, numara11_en);
	verificare_registrii2 : verificare port map (data_reg1(8 downto 1), data_reg4(8 downto 1), verif_reg2, numara11_en); -- pentru sageti
	
	transformare_enable <= not(E0_enable) and not(backspace_enable) and not(enter_enable) and numara11_en and verif_reg1;
	transformare_spec_enable <= E0_enable and numara11_en and verif_reg2;
	
	transform : transformare port map (data_reg3(8 downto 1), '1' , cod_transformat);
	transform_spec : transformare_speciala port map(data_reg4(8 downto 1), '1', tr_spec_mode);	

	numara4_en <= E0_enable and numara11_en;

	numara_patru : counter4 port map (numara4_en, tr_spec_mode, mode);
	
	mode_afisare(1 downto 0) <= mode(1 downto 0);
	mode_afisare(2) <= backspace_enable;
	
	afisare_enable <= (numara11_en and verif_reg1) or (numara11_en and verif_reg2);
	afisaree : AFISARE port map (cod_transformat, afisare_enable, E0_enable, mode_afisare, enter_enable, catod1, catod2, catod3, catod4, anod);
	
end PS2_arch;