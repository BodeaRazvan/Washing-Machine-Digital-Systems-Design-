library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity NAND16 is
	port( DATA_IN: in std_logic_vector(15 downto 0);
	END_LED: out std_logic
	);
end NAND16;


architecture NAND16 of NAND16 is
begin
	process(DATA_IN)
	begin
		if(DATA_IN = "0000000000000001") then
			END_LED <='1';
		else
			END_LED <='0';
		end if;
	end process;

end NAND16;
