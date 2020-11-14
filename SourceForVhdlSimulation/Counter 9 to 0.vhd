---------------------------------------------------------------------------------------------------
--
-- Title       : REV_COUNTER
-- Design      : D_FF
-- Author      : Alex
-- Company     : Eu
--
---------------------------------------------------------------------------------------------------
--
-- File        : Counter 9 to 0.vhd
-- Generated   : Fri Mar 27 12:31:28 2020
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
--{entity {REV_COUNTER} architecture {COUNT}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity REV_COUNTER is
 port (E,EL,CLK: in STD_LOGIC;
 		L: in STD_LOGIC_VECTOR(3 downto 0);
 		RL: in STD_LOGIC_VECTOR(3 downto 0);
		FQ: out STD_LOGIC;
		T: out STD_LOGIC_VECTOR(3 downto 0));
end REV_COUNTER;

--RL is the val taken when the counter reaches 0, this way it can be used to reset to 5 or to 9

architecture COUNT of REV_COUNTER is   
 	component D_FF4 is				 
	port (E,EL,CLK: in STD_LOGIC;
			L: in STD_LOGIC_VECTOR(3 downto 0);
			T: out STD_LOGIC_VECTOR(3 downto 0));
    end component;
	
	component MUX_4_BIT is
	port (A,B: in STD_LOGIC_VECTOR(3 downto 0);
			C: in STD_LOGIC;
			S: out STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component AND4_GATE is	   
		port (A,B,C,D,CLK: in STD_LOGIC;
				S: out STD_LOGIC);
	end component;		
	
	signal M,N: STD_LOGIC;
	signal ML,CT: STD_LOGIC_VECTOR(3 downto 0);
begin
	C1: MUX_4_BIT port map (L,RL,EL,ML);  
	C2: D_FF4 port map (E,M,CLK,ML,CT);
	C3: AND4_GATE port map (CT(0),CT(1),CT(2),CT(3),CLK,N);
	T<=CT;
	FQ<=N;
	M<=N or EL;
end COUNT;
