---------------------------------------------------------------------------------------------------
--
-- Title       : AND4_GATE
-- Design      : D_FF
-- Author      : Alex
-- Company     : Eu
--
---------------------------------------------------------------------------------------------------
--
-- File        : and.vhd
-- Generated   : Fri Mar 27 15:03:04 2020
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
--{entity {AND4_GATE} architecture {AND4}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

--I had something else in mind when I named it

entity AND4_GATE is	   
	port (A,B,C,D,CLK: in STD_LOGIC;
			S: out STD_LOGIC);
end AND4_GATE;				


architecture AND4 of AND4_GATE is
begin
	process(CLK)
	begin
		if(A='0' and B='0' and C='0' and D='0' and CLK='1') then
			S<='1';
		else
			S<='0';
			end if;
	end process;
end AND4;
