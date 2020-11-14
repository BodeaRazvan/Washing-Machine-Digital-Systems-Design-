library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Debugger is
	port(  
	CLK:in std_logic ;
	Q: in std_logic_vector (3 downto 0);
	Start_sig: in std_logic;
	Counter_Finished:in std_logic;
	Debug_sig: out std_logic
	);
end Debugger;

--}} End of automatically maintained section

architecture Debugger of Debugger is 

begin 
process	(CLK)
begin
if(rising_edge(CLK)) then
   if(Start_sig='1') then
	   if(Q="0000" or Q="0001" or Counter_Finished='1' or Q="UUUU" or Q="0010" or Q="0110" or Q="1010") then 
		   Debug_sig <= '1' ;
	   else
		   Debug_sig <='0';
	   end if;
	   else
		   Debug_sig  <='0';
   end if;
   else Debug_sig <='0';
 end if;  
   end process;

end Debugger;
