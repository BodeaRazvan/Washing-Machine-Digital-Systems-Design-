---------------------------------------------------------------------------------------------------
--
-- Title       : MUX_2_TO_1
-- Design      : D_FF
-- Author      : Alex
-- Company     : Eu
--
---------------------------------------------------------------------------------------------------
--
-- File        : MUX.vhd
-- Generated   : Fri Mar 27 12:37:38 2020
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
--{entity {MUX_2_TO_1} architecture {CHOICE}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MUX_2_TO_1 is
	port (A,B,C: in STD_LOGIC;
			S: out STD_LOGIC);
end MUX_2_TO_1;

--}} End of automatically maintained section

architecture CHOICE of MUX_2_TO_1 is
begin
	S<=(A and C) or (B and not C);
end CHOICE;
