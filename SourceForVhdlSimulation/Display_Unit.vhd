library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Display_Unit is 
	port(DIN_Display: in std_logic_vector(31 downto 0);
	SEL: in std_logic;
	DOUT_Display: out std_logic_vector(27 downto 0)
	);
end Display_Unit;

--}} End of automatically maintained section

architecture Display_Unit of Display_Unit is 

component Selector is
	port(I: in std_logic_vector (31 downto 0) ;	
	SEL: in std_logic;
	Q:out std_logic_vector (15 downto 0)
	);
end component;

component bcd_7segment is 
	Port (BCDin : in STD_LOGIC_VECTOR (3 downto 0);
	DOUT : out STD_LOGIC_VECTOR (6 downto 0));
end component; 

signal Q:std_logic_vector(15 downto 0);
begin  
C1: Selector port map(DIN_Display,SEL,Q);
C2:	bcd_7segment port map(Q(15 downto 12),DOUT_Display(27 downto 21));
C3:	bcd_7segment port map(Q(11 downto 8),DOUT_Display(20 downto 14));
c4:	bcd_7segment port map(Q(7 downto 4), DOUT_Display(13 downto 7));
c5: bcd_7segment port map(Q(3 downto 0),DOUT_Display(6 downto 0));

end Display_Unit;
