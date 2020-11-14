library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Divider is
	port( CLK_Divider: in std_logic;
	DOUT:out std_logic);
end Divider;



architecture Divider of Divider is
signal f1:std_logic:='0';
signal n:integer:=0;
begin
	process(CLK_Divider)
	begin
		if(rising_edge(CLK_Divider)) then
			if (n>=499999) then
				n<=0;
				f1<=not f1;
			else
				n<=n+1;
			end if;
		end if;
	end process;
	DOUT<=f1;	


end Divider;
