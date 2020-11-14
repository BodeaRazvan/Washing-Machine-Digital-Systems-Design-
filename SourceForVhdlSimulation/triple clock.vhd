---------------------------------------------------------------------------------------------------
--
-- Title       : T_CLOCK
-- Design      : D_FF
-- Author      : Alex
-- Company     : Eu
--
---------------------------------------------------------------------------------------------------
--
-- File        : triple clock.vhd
-- Generated   : Mon May 18 14:07:39 2020
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
--{entity {T_CLOCK} architecture {CLOCKS}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity T_CLOCK is	
	port( 
		  CLK: in STD_LOGIC;
		  EL1: in STD_LOGIC;
		  ML1: in STD_LOGIC_VECTOR(15 downto 0); 
		  EL2: in STD_LOGIC;
		  ML2: in STD_LOGIC_VECTOR(15 downto 0);
		  EL3: in STD_LOGIC;
		  ML3: in STD_LOGIC_VECTOR(15 downto 0);
		  T1: out STD_LOGIC_VECTOR(15 downto 0);
		  Z1: out STD_LOGIC;  
		  T2: out STD_LOGIC_VECTOR(15 downto 0);
		  Z2: out STD_LOGIC;
		  T3: out STD_LOGIC_VECTOR(15 downto 0);
		  Z3: out STD_LOGIC);
end T_CLOCK;

--}} End of automatically maintained section

architecture CLOCKS of T_CLOCK is	 
	component FULL_CLOCK is	
		port (E,EL,CLK: in STD_LOGIC;
		LS2,LS1,LM2,LM1: in STD_LOGIC_VECTOR(3 downto 0);
		EN: out STD_LOGIC;
		S2,S1,M2,M1: out STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	signal RA: STD_LOGIC;
begin
  C1: FULL_CLOCK port map ('1',EL1,CLK,ML1(3 downto 0),ML1(7 downto 4),ML1(11 downto 8),ML1(15 downto 12),Z1,T1(3 downto 0),T1(7 downto 4),T1(11 downto 8),T1(15 downto 12));
  C2: FULL_CLOCK port map ('1',EL2,CLK,ML2(3 downto 0),ML2(7 downto 4),ML2(11 downto 8),ML2(15 downto 12),RA,T2(3 downto 0),T2(7 downto 4),T2(11 downto 8),T2(15 downto 12));
  C3: FULL_CLOCK port map ('1',EL3,CLK,ML3(3 downto 0),ML3(7 downto 4),ML3(11 downto 8),ML3(15 downto 12),Z3,T3(3 downto 0),T3(7 downto 4),T3(11 downto 8),T3(15 downto 12));
end CLOCKS;
