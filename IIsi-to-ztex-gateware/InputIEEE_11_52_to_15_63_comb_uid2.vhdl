--------------------------------------------------------------------------------
--                     InputIEEE_11_52_to_15_63_comb_uid2
-- VHDL generated for Kintex7 @ 0MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin (2008)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): inf
-- Target frequency (MHz): 0
-- Input signals: X
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity InputIEEE_11_52_to_15_63_comb_uid2 is
    port (X : in  std_logic_vector(63 downto 0);
          R : out  std_logic_vector(15+63+2 downto 0)   );
end entity;

architecture arch of InputIEEE_11_52_to_15_63_comb_uid2 is
signal expX :  std_logic_vector(10 downto 0);
signal fracX :  std_logic_vector(51 downto 0);
signal sX :  std_logic;
signal expZero :  std_logic;
signal expInfty :  std_logic;
signal fracZero :  std_logic;
signal overflow :  std_logic;
signal underflow :  std_logic;
signal expR :  std_logic_vector(14 downto 0);
signal fracR :  std_logic_vector(62 downto 0);
signal roundOverflow :  std_logic;
signal NaN :  std_logic;
signal infinity :  std_logic;
signal zero :  std_logic;
signal exnR :  std_logic_vector(1 downto 0);
begin
   expX  <= X(62 downto 52);
   fracX  <= X(51 downto 0);
   sX  <= X(63);
   expZero  <= '1' when expX = (10 downto 0 => '0') else '0';
   expInfty  <= '1' when expX = (10 downto 0 => '1') else '0';
   fracZero <= '1' when fracX = (51 downto 0 => '0') else '0';
   overflow <= '0';--  overflow never happens for these (wE_in, wE_out)
   underflow <= '0';--  underflow never happens for these (wE_in, wE_out)
   expR <= ((14 downto 11 => '0')  & expX) + "011110000000000";
   fracR <= fracX & CONV_STD_LOGIC_VECTOR(0,11);
   roundOverflow <= '0';
   NaN <= expInfty and not fracZero;
   infinity <= (expInfty and fracZero) or (not NaN and (overflow or roundOverflow));
   zero <= expZero or underflow;
   exnR <= 
           "11" when NaN='1' 
      else "10" when infinity='1' 
      else "00" when zero='1' 
      else "01" ;  -- normal number
   R <= exnR & sX & expR & fracR; 
end architecture;

