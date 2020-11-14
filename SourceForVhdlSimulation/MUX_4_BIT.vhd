---------------------------------------------------------------------------------------------------
--
-- Title       : MUX_4_BIT
-- Design      : D_FF
-- Author      : Alex
-- Company     : Eu
--
---------------------------------------------------------------------------------------------------
--
-- File        : MUX_4_BIT.vhd
-- Generated   : Fri Mar 27 12:40:35 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {MUX_4_BIT} architecture {CHOICE4}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MUX_4_BIT is
	port (A,B: in STD_LOGIC_VECTOR(3 downto 0);
			C: in STD_LOGIC;
			S: out STD_LOGIC_VECTOR(3 downto 0));
end MUX_4_BIT;

--}} End of automatically maintained section

architecture CHOICE4 of MUX_4_BIT is
	component MUX_2_TO_1 is
		port (A,B,C: in STD_LOGIC;
				S: out STD_LOGIC);
	end component;
begin
	C1: MUX_2_TO_1 port map (A(0),B(0),C,S(0));
	C2: MUX_2_TO_1 port map (A(1),B(1),C,S(1));
	C3: MUX_2_TO_1 port map (A(2),B(2),C,S(2));
	C4: MUX_2_TO_1 port map (A(3),B(3),C,S(3));
end CHOICE4;
