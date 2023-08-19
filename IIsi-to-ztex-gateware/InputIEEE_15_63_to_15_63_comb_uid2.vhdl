--------------------------------------------------------------------------------
--                     InputIEEE_15_63_to_15_63_comb_uid2
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

entity InputIEEE_15_63_to_15_63_comb_uid2 is
    port (X : in  std_logic_vector(78 downto 0);
          R : out  std_logic_vector(15+63+2 downto 0)   );
end entity;

architecture arch of InputIEEE_15_63_to_15_63_comb_uid2 is
signal expX :  std_logic_vector(14 downto 0);
signal fracX :  std_logic_vector(62 downto 0);
signal sX :  std_logic;
signal expZero :  std_logic;
signal expInfty :  std_logic;
signal fracZero :  std_logic;
signal reprSubNormal :  std_logic;
signal sfracX :  std_logic_vector(62 downto 0);
signal fracR :  std_logic_vector(62 downto 0);
signal expR :  std_logic_vector(14 downto 0);
signal infinity :  std_logic;
signal zero :  std_logic;
signal NaN :  std_logic;
signal exnR :  std_logic_vector(1 downto 0);
begin
   expX  <= X(77 downto 63);
   fracX  <= X(62 downto 0);
   sX  <= X(78);
   expZero  <= '1' when expX = (14 downto 0 => '0') else '0';
   expInfty  <= '1' when expX = (14 downto 0 => '1') else '0';
   fracZero <= '1' when fracX = (62 downto 0 => '0') else '0';
   reprSubNormal <= fracX(62);
   -- since we have one more exponent value than IEEE (field 0...0, value emin-1),
   -- we can represent subnormal numbers whose mantissa field begins with a 1
   sfracX <= fracX(61 downto 0) & '0' when (expZero='1' and reprSubNormal='1')    else fracX;
   fracR <= sfracX;
   -- copy exponent. This will be OK even for subnormals, zero and infty since in such cases the exn bits will prevail
   expR <= expX;
   infinity <= expInfty and fracZero;
   zero <= expZero and not reprSubNormal;
   NaN <= expInfty and not fracZero;
   exnR <= 
           "00" when zero='1' 
      else "10" when infinity='1' 
      else "11" when NaN='1' 
      else "01" ;  -- normal number
   R <= exnR & sX & expR & fracR; 
end architecture;

