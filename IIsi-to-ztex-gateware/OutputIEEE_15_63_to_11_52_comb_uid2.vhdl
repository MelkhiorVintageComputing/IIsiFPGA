--------------------------------------------------------------------------------
--                    OutputIEEE_15_63_to_11_52_comb_uid2
-- VHDL generated for Kintex7 @ 0MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: F. Ferrandi  (2009-2012)
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

entity OutputIEEE_15_63_to_11_52_comb_uid2 is
    port (X : in  std_logic_vector(15+63+2 downto 0);
          R : out  std_logic_vector(63 downto 0)   );
end entity;

architecture arch of OutputIEEE_15_63_to_11_52_comb_uid2 is
signal fracX :  std_logic_vector(62 downto 0);
signal exnX :  std_logic_vector(1 downto 0);
signal expX :  std_logic_vector(14 downto 0);
signal sX :  std_logic;
signal expZero :  std_logic;
signal unSub :  std_logic_vector(15 downto 0);
signal underflow :  std_logic;
signal ovSub :  std_logic_vector(15 downto 0);
signal overflow :  std_logic;
signal in_is_zero :  std_logic;
signal in_is_normal :  std_logic;
signal in_is_inf :  std_logic;
signal in_is_nan :  std_logic;
signal expXO :  std_logic_vector(10 downto 0);
signal resultLSB :  std_logic;
signal roundBit :  std_logic;
signal sticky :  std_logic;
signal round :  std_logic;
signal expfracR0 :  std_logic_vector(63 downto 0);
signal roundOverflow :  std_logic;
signal fracR :  std_logic_vector(51 downto 0);
signal expR :  std_logic_vector(10 downto 0);
begin
   fracX  <= X(62 downto 0);
   exnX  <= X(80 downto 79);
   expX  <= X(77 downto 63);
   sX  <= X(78) when (exnX = "01" or exnX = "10" or exnX = "00") else '0';
   expZero  <= '1' when expX = (14 downto 0 => '0') else '0';
   -- min exponent value without underflow, biased with input bias: 15359
   unSub <= ('0' & expX) - CONV_STD_LOGIC_VECTOR(15359,16);
   underflow <= unSub(15);
   -- max exponent value without overflow, biased with input bias: 17406
   ovSub <= CONV_STD_LOGIC_VECTOR(17406,16)  -  ('0' & expX);
   overflow <= ovSub(15);
   in_is_zero <= '1' when (exnX="00") else '0';
   in_is_normal <= '1' when (exnX="01") else '0';
   in_is_inf <= '1' when (exnX="10") else '0';
   in_is_nan <= '1' when (exnX="11") else '0';
   expXO <= (not expX(10)) & expX(9 downto 0);
   -- wFO < wFI, need to round fraction
   resultLSB <= fracX(11);
   roundBit <= fracX(10);
   sticky <=  '0' when fracX(9 downto 0) = CONV_STD_LOGIC_VECTOR(0,9)   else '1';
   round <= roundBit and (sticky or resultLSB);
   -- The following addition may overflow
   expfracR0 <= ('0' & expXO & fracX(62 downto 11))  +  (CONV_STD_LOGIC_VECTOR(0,63) & round);
   roundOverflow <= '1' when (expXO=((10 downto 0 => '1'))) else expfracR0(63);
   fracR <= 
      expfracR0(51 downto 0) when (in_is_nan or (in_is_normal and not (underflow or overflow or roundOverflow))) else 
      (51 downto 0 => '0');
   expR <=  
      (10 downto 0 => '0') when (in_is_zero or underflow) else
      (10 downto 0 => '1') when (in_is_inf or in_is_nan or overflow or roundOverflow) else
      expfracR0(62 downto 52);
   R <= sX & expR & fracR; 
end architecture;

