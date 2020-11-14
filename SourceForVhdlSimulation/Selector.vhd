library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Selector is
	port(I: in std_logic_vector (31 downto 0) ;	
	SEL: in std_logic;
	Q:out std_logic_vector (15 downto 0)
	);
end Selector;


architecture Selector of Selector is
signal REZ : std_logic_vector (15 downto 0);
begin 
	process(SEL,I)
	begin
		if(SEL='1')	then 
		  REZ(0) <= I(0);
		  REZ(1) <= I(1);
		  REZ(2) <= I(2);
		  REZ(3) <= I(3);
		  REZ(4) <= I(4);
		  REZ(5) <= I(5); 
		  REZ(6) <= I(6);
		  REZ(7) <= I(7);
		  REZ(8) <= I(8);
		  REZ(9) <= I(9);
		  REZ(10) <= I(10);
		  REZ(11) <= I(11);
		  REZ(12) <= I(12);
		  REZ(13) <= I(13);
		  REZ(14) <= I(14);
		  REZ(15) <= I(15);	 
		else if (SEL='0') then
		  REZ(0) <= I(16);
		  REZ(1) <= I(17);
		  REZ(2) <= I(18);
		  REZ(3) <= I(19);
		  REZ(4) <= I(20);
		  REZ(5) <= I(21); 
		  REZ(6) <= I(22);
		  REZ(7) <= I(23);
		  REZ(8) <= I(24);
		  REZ(9) <= I(25);
		  REZ(10) <= I(26);
		  REZ(11) <= I(27);
		  REZ(12) <= I(28);
		  REZ(13) <= I(29);
		  REZ(14) <= I(30);
		  REZ(15) <= I(31);
			end if;	
		end if;	
	end process;  
	Q<=REZ;

end Selector;
