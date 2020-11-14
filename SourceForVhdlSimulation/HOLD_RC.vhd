library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity HOLD_RC is
	port(RC: in std_logic;
	STATE: in std_logic_vector(3 downto 0);
	RC_REZ: out std_logic
	);
end HOLD_RC;


architecture HOLD_RC of HOLD_RC is 
signal RC_HOLD: std_logic;
begin 
	process(RC,STATE)
	begin
	if(RC = '1') then 
		RC_HOLD <='1';
	end if;	 
	if(STATE="1010") then
		if(RC_HOLD='1') then
			RC_REZ <='1';
		end if;
	end if;
	if(STATE /="1010") then
		RC_REZ <='0';
	end if;
		
	end process;
	
end HOLD_RC;
