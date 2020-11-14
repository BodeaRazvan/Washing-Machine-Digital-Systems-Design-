library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MemoryAndRegister is
	port(
	CLK:in std_logic;
	Door: in std_logic;
	PreW: in std_logic;
	Rinse: in std_logic;
	
	
	Temp: in std_logic_vector(1 downto 0);
	Rot: in std_logic_vector(1 downto 0);
	Programmed:in std_logic_vector(4 downto 0);
	Start: in std_logic;
	
	QN: inout std_logic_vector(3 downto 0);
	
	Z:out std_logic_vector(15 downto 0);
	ZLoad: out std_logic_vector(3 downto 0);
	ZPWC_OUT: inout std_logic;
	ZRC_OUT: inout std_logic;
	ZTemp: out std_logic_vector(3 downto 0);
	ZRot: out std_logic_vector(3 downto 0)
	);
end MemoryAndRegister;

--}} End of automatically maintained section

architecture MemoryAndRegister of MemoryAndRegister is 

component Register_Memory is
	port( 
	CLK: in std_logic;
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
end component;

component ROM_WASH is	 
	port(
	I:in std_logic_vector (18 downto 0);
	Z:out std_logic_vector (35 downto 0)
	);
end component; 

component HOLD_PWC is	
	port(PWC: in std_logic;
	STATE: in std_logic_vector(3 downto 0);
	PWC_REZ: out std_logic
	);
end component;

component HOLD_RC is
	port(RC: in std_logic;
	STATE: in std_logic_vector(3 downto 0);
	RC_REZ: out std_logic
	);
end component;

signal Imemory: std_logic_vector(18 downto 0);
signal Ztemporary: std_logic_vector(35 downto 0); 
signal PWC_REZ: std_logic; 
signal RC_REZ: std_logic;

signal RinseRez: std_logic;
signal PreWashRez: std_logic;

begin
   Imemory(18 downto 15)<=QN;
   Imemory(14)<=Door;
   Imemory(13)<=PreW;
   Imemory(12)<=Rinse;
   Imemory(11)<=ZPWC_OUT;
   Imemory(10)<=ZRC_OUT;
   Imemory(9 downto 8)<=Temp;
   Imemory(7 downto 6)<=Rot;
   Imemory(5 downto 1)<=Programmed;
   Imemory(0)<=Start;
  C1:ROM_WASH port map(Imemory,Ztemporary); 
  C2:Register_Memory port map (CLK,Ztemporary(35 downto 32),Ztemporary(31 downto 16 ),Ztemporary(15 downto 12),Ztemporary(9),Ztemporary(8),Ztemporary(7 downto 4),Ztemporary(3 downto 0),QN,Z,ZLoad,RinseRez,PreWashRez,ZTemp,ZRot) ;
  C3:HOLD_PWC port map(PreWashRez,QN,PWC_REZ);
   ZPWC_OUT<=PWC_REZ; 
  C4:HOLD_RC port map(RinseRez,QN,RC_REZ);
   ZRC_OUT<=RC_REZ;

	 -- enter your statements here --

end MemoryAndRegister;
