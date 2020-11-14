---------------------------------------------------------------------------------------------------
--
-- Title       : FULL_CLOCK
-- Design      : D_FF
-- Author      : Alex
-- Company     : Eu
--
---------------------------------------------------------------------------------------------------
--
-- File        : mainClokck.vhd
-- Generated   : Mon Mar 30 14:14:44 2020
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
--{entity {FULL_CLOCK} architecture {TIMER}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity FULL_CLOCK is	
	port (E,EL,CLK: in STD_LOGIC;
	LS2,LS1,LM2,LM1: in STD_LOGIC_VECTOR(3 downto 0);
	EN: out STD_LOGIC;
	S2,S1,M2,M1: out STD_LOGIC_VECTOR(3 downto 0));
end FULL_CLOCK;

--}} End of automatically maintained section

architecture TIMER of FULL_CLOCK is
component REV_COUNTER is
 port (E,EL,CLK: in STD_LOGIC;
 		L: in STD_LOGIC_VECTOR(3 downto 0);
 		RL: in STD_LOGIC_VECTOR(3 downto 0);
		FQ: out STD_LOGIC;
		T: out STD_LOGIC_VECTOR(3 downto 0));
end component;

component AND4_GATE is	   
	port (A,B,C,D,CLK: in STD_LOGIC;
			S: out STD_LOGIC);
end component;				
signal F1,F2,F3,F4,O1,O2,O3,O4: STD_LOGIC;
begin
	C1: REV_COUNTER port map (E,EL,CLK,LS2,"1001",F1,S2);
	C2: REV_COUNTER port map (E,EL,F1,LS1,"0101",F2,S1);
	C3: REV_COUNTER port map (E,EL,F2,LM2,"1001",F3,M2);
	C4: REV_COUNTER port map (E,EL,F3,LM1,"0101",F4,M1);
	O1<=not F1;	
	O2<=not F2;
	O3<=not F3;
	O4<=not F4;
	EN<= F1 and F2 and F3 and F4;
end TIMER;
