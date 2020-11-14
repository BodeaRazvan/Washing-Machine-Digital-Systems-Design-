---------------------------------------------------------------------------------------------------
--
-- Title       : D_FF4
-- Design      : D_FF
-- Author      : Alex
-- Company     : Eu
--
---------------------------------------------------------------------------------------------------
--
-- File        : D_FF4.vhd
-- Generated   : Thu Mar 26 13:05:44 2020
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
--{entity {D_FF4} architecture {CLOCK1}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D_FF4 is				 
	port (E,EL,CLK: in STD_LOGIC;
	L: in STD_LOGIC_VECTOR(3 downto 0);
	T: out STD_LOGIC_VECTOR(3 downto 0));
end D_FF4;

--E= Enable
--EL= Enable Load
--CLK= Clock
--L= 4 Bit data load
--FQ= Becomes 1 whhen the counter is at 0
--T= Time 

architecture CLOCK1 of D_FF4 is
	component D_FLIP_FLOP is
		port (E,D,EL,L,CLK: in STD_LOGIC;
		Q,NQ: out STD_LOGIC);  
	end component;			   
	signal D,ND: STD_LOGIC_VECTOR(4 downto 1);
--D and ND are 4 downto 1 because I was lazy, they were initialy separate values(D1,D2,etc)
	signal INT1,INT2,INT3: STD_LOGIC;
begin				
	C1: D_FLIP_FLOP port map(E,ND(1),EL,L(0),CLK,D(1),ND(1));
	C2: D_FLIP_FLOP port map(E,ND(2),EL,L(1),INT1,D(2),ND(2));
	C3: D_FLIP_FLOP port map(E,ND(3),EL,L(2),INT2,D(3),ND(3));
	C4: D_FLIP_FLOP port map(E,ND(4),EL,L(3),INT3,D(4),ND(4));	
	INT1<=D(1) and (not EL);
	INT2<=D(2) and (not EL);
	INT3<=D(3) and (not EL);
	T<=not ND;													
end CLOCK1;
