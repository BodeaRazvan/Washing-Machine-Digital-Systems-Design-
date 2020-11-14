library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Register_Memory is
	port( CLK: in std_logic;
	Q_NEXT :in std_logic_vector(3 downto 0);
	DATA_COUNT: in std_logic_vector(15 downto 0);
	COUNT_LOAD: in std_logic_vector(3 downto 0);
	ZPWC: in std_logic;
	ZRC: in std_logic;
	Z_TEMP: in std_logic_vector(3 downto 0);
	Z_ROT: in std_logic_vector(3 downto 0);	  
	
	Q_NEXT_OUT :out std_logic_vector(3 downto 0);
	DATA_COUNT_OUT: out std_logic_vector(15 downto 0);
	COUNT_LOAD_OUT: out std_logic_vector(3 downto 0);
	ZPWC_OUT: out std_logic;
	ZRC_OUT: out std_logic;
	Z_TEMP_OUT: out std_logic_vector(3 downto 0);
	Z_ROT_OUT: out std_logic_vector(3 downto 0)
	);	
end Register_Memory;



architecture Register_Memory of Register_Memory is

begin
	process(CLK)  
	begin
	if (rising_edge(CLK)) then	 
		Q_NEXT_OUT <= Q_NEXT;
	    DATA_COUNT_OUT <=DATA_COUNT;
		COUNT_LOAD_OUT	<=COUNT_LOAD;
		ZPWC_OUT   <=ZPWC;
		ZRC_OUT	  <=ZRC;
		Z_TEMP_OUT	 <=Z_TEMP;
		Z_ROT_OUT	<=Z_ROT;
	end if;
end process;
 
end Register_Memory;
