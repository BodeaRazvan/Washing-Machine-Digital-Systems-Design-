library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Main is 
	port(
	MainClock: in std_logic;
	
	Door_In: in std_logic;
	Pre_Wash_In:in std_logic;
	Rinse_In:in std_logic;
	Temperature_In1: in std_logic;
	Temperature_In2: in std_logic;
	Rotation_In1:in std_logic; 
	Rotation_In2:in std_logic;
	QuickWash:in std_logic;
	Shirts : in std_logic;
	Colored:in std_logic;
	Laundry: in std_logic;
	AntiAllergic: in std_logic;
	Start: in std_logic; 
	
	SelectTime:in std_logic;
	
	LedEnd:out std_logic;
	LedTemp3 :out std_logic;
	LedTemp2:out std_logic;
	LedTemp1:out std_logic;
	LedTemp0:out std_logic;
	LedRot3	:out std_logic;
	LedRot2:out std_logic;
	LedRot1:out std_logic;
	LedRot0:out std_logic;
	
	DisplaySegment:out std_logic_vector(27 downto 0)
	);
end Main;

--architecture

architecture Main of Main is 

component MemoryAndRegister is
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
end component; 

component T_CLOCK is	
	port( 
		  CLK: in STD_LOGIC;
		  EL1: in STD_LOGIC;
		  ML1: in STD_LOGIC_VECTOR(15 downto 0); 
		  EL2: in STD_LOGIC;
		  ML2: in STD_LOGIC_VECTOR(15 downto 0);
		  EL3: in STD_LOGIC;
		  ML3: in STD_LOGIC_VECTOR(15 downto 0);
		  T1: out STD_LOGIC_VECTOR(15 downto 0);
		  Z1: out STD_LOGIC;  
		  T2: out STD_LOGIC_VECTOR(15 downto 0);
		  Z2: out STD_LOGIC;
		  T3: out STD_LOGIC_VECTOR(15 downto 0);
		  Z3: out STD_LOGIC
		  );
end component;

component RegisterInput is
	port( 
	I: in std_logic_vector (12 downto 0);
	DOUT: out std_logic_vector (12 downto 0)
	);
end component;

component Display_Unit is 
	port(
	DIN_Display: in std_logic_vector(31 downto 0);
	SEL: in std_logic;
	DOUT_Display: out std_logic_vector(27 downto 0)
	);
end component;

component Divider is
	port(
	CLK_Divider: in std_logic;
	DOUT:out std_logic
	);	
end component;

component Debugger is
	port( 
	CLK:in std_logic;
	Q: in std_logic_vector (3 downto 0);
	Start_sig: in std_logic;
	Counter_Finished:in std_logic;
	Debug_sig: out std_logic
	);	
end component; 

component  load_control is 
	port(
	Numbers:in std_logic_vector(15 downto 0);
	Load:in std_logic;
	OK: out std_logic
	);
end component;

component NAND16 is
	port(
	DATA_IN: in std_logic_vector(15 downto 0);
	END_LED: out std_logic
	);
 end component;

signal Outside_Inputs: std_logic_vector(12 downto 0);
signal Register_Outputs: std_logic_vector(12 downto 0);
signal Clk_Memory: std_logic;
signal QN: std_logic_vector(3 downto 0):="0000";
signal Z:std_logic_vector(15 downto 0);
signal ZLoad:std_logic_vector(3 downto 0);
signal ZPWC_OUT: std_logic;
signal ZRC_OUT:std_logic;
signal ZTemp:std_logic_vector(3 downto 0);
signal Zrot: std_logic_vector(3 downto 0);
signal Time_1: std_logic_vector(15 downto 0):="0000000000000000";
signal Time_2: std_logic_vector(15 downto 0):="0000000000000000";
signal Time_3: std_logic_vector(15 downto 0):="0000000000000000";
signal Finished1:std_logic;	
signal Finished2:std_logic;
signal Finished3:std_logic;
signal Debug_Sig:std_logic;	 
signal OK :std_logic;
signal ForceNext:std_logic;	
signal Time_for_counter_3: std_logic_vector(15 downto 0);

signal Time_For_Display: std_logic_vector (31 downto 0);

begin
Outside_Inputs(12) <=Door_in;
Outside_Inputs(11) <=Pre_Wash_in;
Outside_Inputs(10) <= Rinse_In;
Outside_Inputs(9) <= Temperature_In1;
Outside_Inputs(8) <= Temperature_In2;
Outside_Inputs(7) <= Rotation_In1;
Outside_Inputs(6) <= Rotation_In2;
Outside_Inputs(5) <= QuickWash;
Outside_Inputs(4) <= Shirts ;
Outside_Inputs(3) <= Colored ;
Outside_Inputs(2) <= Laundry  ;
Outside_Inputs(1) <= AntiAllergic;
Outside_Inputs(0) <= Start;
Clk_Memory<=Debug_sig;

LedEnd<=Finished1;
LedTemp3<=ZTemp(3);
LedTemp2<=ZTemp(2);
LedTemp1<=ZTemp(1);
LedTemp0<=ZTemp(0);
LedRot3<= ZRot(3);
LedRot2	<=ZRot(2);
LedRot1	<= ZRot(1);
LedRot0	<=ZRot(0);
Time_for_counter_3(15 downto 0) <=Z(15 downto 0);

Time_For_Display(31 downto 16)<=Time_1;
Time_For_Display(15 downto 0) <=Time_2;


C1:	RegisterInput port map(Outside_Inputs,Register_Outputs);
C2:	MemoryAndRegister port map(Clk_Memory,Register_Outputs(12),Register_Outputs(11),Register_Outputs(10),Register_Outputs(9 downto 8),Register_Outputs(7 downto 6),Register_Outputs(5 downto 1),Register_Outputs(0),QN,Z,ZLoad,ZPWC_OUT,ZRC_OUT,ZTemp,Zrot);
C3: T_CLOCK port map(MainClock,ZLoad(2),Z,ZLoad(1),Z,OK,Time_For_Counter_3,Time_1,Finished1,Time_2,Finished2,Time_3,Finished3 );
C4: Display_Unit port map(Time_For_Display,SelectTime,DisplaySegment);
C5: Debugger port map(MainClock,QN,Start,ForceNext,Debug_sig);
C6: Load_Control port map(Time_3,ZLoad(0),OK); 
C7: NAND16 port map(Time_3,ForceNext);
end Main;
