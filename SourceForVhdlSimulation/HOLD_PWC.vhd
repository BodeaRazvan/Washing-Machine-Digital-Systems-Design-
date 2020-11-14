library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity HOLD_PWC is	
	port(PWC: in std_logic;
	STATE: in std_logic_vector(3 downto 0);
	PWC_REZ: out std_logic
	);
end HOLD_PWC;


architecture HOLD_PWC of HOLD_PWC is
signal PWC_HOLD : std_logic;
begin	
	process(PWC,STATE)
	begin
		if(PWC = '1') then 
			PWC_HOLD <='1';
		end if;
		if (STATE = "0100") then 
			if(PWC_HOLD='1')then
				PWC_REZ <='1';
				end if;
		end if;
		if (STATE = "0110")	then
			if(PWC_HOLD='1')then
				PWC_REZ <='1';
			  end if;
		end if;
		if(STATE /="0100" and STATE /="0110")then 
			PWC_REZ <='0';
			end if;
	end process;			

end HOLD_PWC; 

