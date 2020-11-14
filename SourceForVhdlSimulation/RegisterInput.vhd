library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity RegisterInput is
	port( I: in std_logic_vector (12 downto 0);
	DOUT: out std_logic_vector (12 downto 0)
	);
end RegisterInput;


architecture RegisterInput of RegisterInput is
signal DATA: std_logic_vector (12 downto 0);
begin
	process(I)
	begin
		DATA<=I;
	end process;
	DOUT <=DATA;
end RegisterInput;
