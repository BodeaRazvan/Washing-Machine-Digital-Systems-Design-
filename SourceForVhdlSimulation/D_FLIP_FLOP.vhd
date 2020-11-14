---------------------------------------------------------------------------------------------------
--
-- Title       : D_FLIP_FLOP
-- Design      : D_FF
-- Author      : Alex
-- Company     : Eu
--
---------------------------------------------------------------------------------------------------
--
-- File        : D_FLIP_FLOP.vhd
-- Generated   : Thu Mar 26 12:51:46 2020
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
--{entity {D_FLIP_FLOP} architecture {VALUE}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D_FLIP_FLOP is
	port (E,D,EL,L,CLK: in STD_LOGIC;
		Q,NQ: out STD_LOGIC);
end D_FLIP_FLOP;

-- E= Enable
-- EL= Enable Load
-- CLK= Clock
-- D= Data In
-- L= Data for load
-- Q= D
-- NQ= not D

architecture VALUE of D_FLIP_FLOP is
begin
	process(E,CLK,EL,L) 
	begin	
		if(EL='1') then
			Q<='0';
			NQ<=not L;
		else
			if(CLK='1' and E='1') then
			Q<=D;
			NQ<=not D;
		end if;
	end if;	
	end process;
end VALUE;
