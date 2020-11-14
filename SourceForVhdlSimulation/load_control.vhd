
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity load_control is 
	port(
	Numbers:in std_logic_vector(15 downto 0);
	Load:in std_logic;
	OK: out std_logic
	);
end load_control;

--}} End of automatically maintained section

architecture load_control of load_control is

begin	 
	process(Numbers,Load)
	begin 
		if(Load='1') then
			if(Numbers="0000000000000000" or Numbers="UUUUUUUUUUUUUUUU" ) then
			    Ok<='1';
			else OK<='0';
			end if;
		else OK<='0';
		end if;
		
	end process;
	
	 -- enter your statements here --

end load_control;
