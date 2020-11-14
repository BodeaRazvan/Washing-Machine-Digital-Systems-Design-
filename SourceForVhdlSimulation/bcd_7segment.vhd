library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;

entity bcd_7segment is 
	Port (BCDin : in STD_LOGIC_VECTOR (3 downto 0);
	DOUT : out STD_LOGIC_VECTOR (6 downto 0));
end bcd_7segment;


architecture Behavioral of bcd_7segment is
begin 
process(BCDin)
begin
	case BCDin is
		when "0000" => DOUT <= "0000001";	  --0
		when "0001" => DOUT <= "1001111";	  --1
		when "0010" => DOUT <= "0010010";	  --2
		when "0011" => DOUT <= "0000110";	  --3
		when "0100" => DOUT <= "1001100";	  --4
		when "0101" => DOUT <= "0100100";	  --5
		when "0110" => DOUT <= "0100000";	  --6
		when "0111" => DOUT <= "0001111";	  --7
		when "1000" => DOUT <= "0000000";	  --8
		when "1001" => DOUT <= "0000100";	  --9 
		when others => DOUT <= "1111111";	
	end case;
end process;
end Behavioral;
