--------------------------------------------------------------------------------
--                          selFunction_Freq100_uid4
-- VHDL generated for Kintex7 @ 100MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007-2022)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 10
-- Target frequency (MHz): 100
-- Input signals: X
-- Output signals: Y

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity selFunction_Freq100_uid4 is
    port (X : in  std_logic_vector(8 downto 0);
          Y : out  std_logic_vector(2 downto 0)   );
end entity;

architecture arch of selFunction_Freq100_uid4 is
signal Y0 :  std_logic_vector(2 downto 0);
attribute ram_extract: string;
attribute ram_style: string;
attribute ram_extract of Y0: signal is "yes";
attribute ram_style of Y0: signal is "distributed";
signal Y1 :  std_logic_vector(2 downto 0);
begin
   with X  select  Y0 <= 
      "000" when "000000000",
      "000" when "000000001",
      "000" when "000000010",
      "000" when "000000011",
      "000" when "000000100",
      "000" when "000000101",
      "000" when "000000110",
      "000" when "000000111",
      "000" when "000001000",
      "000" when "000001001",
      "000" when "000001010",
      "000" when "000001011",
      "000" when "000001100",
      "000" when "000001101",
      "000" when "000001110",
      "000" when "000001111",
      "001" when "000010000",
      "000" when "000010001",
      "000" when "000010010",
      "000" when "000010011",
      "000" when "000010100",
      "000" when "000010101",
      "000" when "000010110",
      "000" when "000010111",
      "001" when "000011000",
      "001" when "000011001",
      "001" when "000011010",
      "001" when "000011011",
      "000" when "000011100",
      "000" when "000011101",
      "000" when "000011110",
      "000" when "000011111",
      "001" when "000100000",
      "001" when "000100001",
      "001" when "000100010",
      "001" when "000100011",
      "001" when "000100100",
      "001" when "000100101",
      "001" when "000100110",
      "000" when "000100111",
      "001" when "000101000",
      "001" when "000101001",
      "001" when "000101010",
      "001" when "000101011",
      "001" when "000101100",
      "001" when "000101101",
      "001" when "000101110",
      "001" when "000101111",
      "010" when "000110000",
      "001" when "000110001",
      "001" when "000110010",
      "001" when "000110011",
      "001" when "000110100",
      "001" when "000110101",
      "001" when "000110110",
      "001" when "000110111",
      "010" when "000111000",
      "010" when "000111001",
      "001" when "000111010",
      "001" when "000111011",
      "001" when "000111100",
      "001" when "000111101",
      "001" when "000111110",
      "001" when "000111111",
      "010" when "001000000",
      "010" when "001000001",
      "010" when "001000010",
      "001" when "001000011",
      "001" when "001000100",
      "001" when "001000101",
      "001" when "001000110",
      "001" when "001000111",
      "010" when "001001000",
      "010" when "001001001",
      "010" when "001001010",
      "010" when "001001011",
      "001" when "001001100",
      "001" when "001001101",
      "001" when "001001110",
      "001" when "001001111",
      "010" when "001010000",
      "010" when "001010001",
      "010" when "001010010",
      "010" when "001010011",
      "010" when "001010100",
      "010" when "001010101",
      "001" when "001010110",
      "001" when "001010111",
      "010" when "001011000",
      "010" when "001011001",
      "010" when "001011010",
      "010" when "001011011",
      "010" when "001011100",
      "010" when "001011101",
      "010" when "001011110",
      "001" when "001011111",
      "010" when "001100000",
      "010" when "001100001",
      "010" when "001100010",
      "010" when "001100011",
      "010" when "001100100",
      "010" when "001100101",
      "010" when "001100110",
      "010" when "001100111",
      "010" when "001101000",
      "010" when "001101001",
      "010" when "001101010",
      "010" when "001101011",
      "010" when "001101100",
      "010" when "001101101",
      "010" when "001101110",
      "010" when "001101111",
      "010" when "001110000",
      "010" when "001110001",
      "010" when "001110010",
      "010" when "001110011",
      "010" when "001110100",
      "010" when "001110101",
      "010" when "001110110",
      "010" when "001110111",
      "010" when "001111000",
      "010" when "001111001",
      "010" when "001111010",
      "010" when "001111011",
      "010" when "001111100",
      "010" when "001111101",
      "010" when "001111110",
      "010" when "001111111",
      "010" when "010000000",
      "010" when "010000001",
      "010" when "010000010",
      "010" when "010000011",
      "010" when "010000100",
      "010" when "010000101",
      "010" when "010000110",
      "010" when "010000111",
      "010" when "010001000",
      "010" when "010001001",
      "010" when "010001010",
      "010" when "010001011",
      "010" when "010001100",
      "010" when "010001101",
      "010" when "010001110",
      "010" when "010001111",
      "010" when "010010000",
      "010" when "010010001",
      "010" when "010010010",
      "010" when "010010011",
      "010" when "010010100",
      "010" when "010010101",
      "010" when "010010110",
      "010" when "010010111",
      "010" when "010011000",
      "010" when "010011001",
      "010" when "010011010",
      "010" when "010011011",
      "010" when "010011100",
      "010" when "010011101",
      "010" when "010011110",
      "010" when "010011111",
      "010" when "010100000",
      "010" when "010100001",
      "010" when "010100010",
      "010" when "010100011",
      "010" when "010100100",
      "010" when "010100101",
      "010" when "010100110",
      "010" when "010100111",
      "010" when "010101000",
      "010" when "010101001",
      "010" when "010101010",
      "010" when "010101011",
      "010" when "010101100",
      "010" when "010101101",
      "010" when "010101110",
      "010" when "010101111",
      "010" when "010110000",
      "010" when "010110001",
      "010" when "010110010",
      "010" when "010110011",
      "010" when "010110100",
      "010" when "010110101",
      "010" when "010110110",
      "010" when "010110111",
      "010" when "010111000",
      "010" when "010111001",
      "010" when "010111010",
      "010" when "010111011",
      "010" when "010111100",
      "010" when "010111101",
      "010" when "010111110",
      "010" when "010111111",
      "010" when "011000000",
      "010" when "011000001",
      "010" when "011000010",
      "010" when "011000011",
      "010" when "011000100",
      "010" when "011000101",
      "010" when "011000110",
      "010" when "011000111",
      "010" when "011001000",
      "010" when "011001001",
      "010" when "011001010",
      "010" when "011001011",
      "010" when "011001100",
      "010" when "011001101",
      "010" when "011001110",
      "010" when "011001111",
      "010" when "011010000",
      "010" when "011010001",
      "010" when "011010010",
      "010" when "011010011",
      "010" when "011010100",
      "010" when "011010101",
      "010" when "011010110",
      "010" when "011010111",
      "010" when "011011000",
      "010" when "011011001",
      "010" when "011011010",
      "010" when "011011011",
      "010" when "011011100",
      "010" when "011011101",
      "010" when "011011110",
      "010" when "011011111",
      "010" when "011100000",
      "010" when "011100001",
      "010" when "011100010",
      "010" when "011100011",
      "010" when "011100100",
      "010" when "011100101",
      "010" when "011100110",
      "010" when "011100111",
      "010" when "011101000",
      "010" when "011101001",
      "010" when "011101010",
      "010" when "011101011",
      "010" when "011101100",
      "010" when "011101101",
      "010" when "011101110",
      "010" when "011101111",
      "010" when "011110000",
      "010" when "011110001",
      "010" when "011110010",
      "010" when "011110011",
      "010" when "011110100",
      "010" when "011110101",
      "010" when "011110110",
      "010" when "011110111",
      "010" when "011111000",
      "010" when "011111001",
      "010" when "011111010",
      "010" when "011111011",
      "010" when "011111100",
      "010" when "011111101",
      "010" when "011111110",
      "010" when "011111111",
      "110" when "100000000",
      "110" when "100000001",
      "110" when "100000010",
      "110" when "100000011",
      "110" when "100000100",
      "110" when "100000101",
      "110" when "100000110",
      "110" when "100000111",
      "110" when "100001000",
      "110" when "100001001",
      "110" when "100001010",
      "110" when "100001011",
      "110" when "100001100",
      "110" when "100001101",
      "110" when "100001110",
      "110" when "100001111",
      "110" when "100010000",
      "110" when "100010001",
      "110" when "100010010",
      "110" when "100010011",
      "110" when "100010100",
      "110" when "100010101",
      "110" when "100010110",
      "110" when "100010111",
      "110" when "100011000",
      "110" when "100011001",
      "110" when "100011010",
      "110" when "100011011",
      "110" when "100011100",
      "110" when "100011101",
      "110" when "100011110",
      "110" when "100011111",
      "110" when "100100000",
      "110" when "100100001",
      "110" when "100100010",
      "110" when "100100011",
      "110" when "100100100",
      "110" when "100100101",
      "110" when "100100110",
      "110" when "100100111",
      "110" when "100101000",
      "110" when "100101001",
      "110" when "100101010",
      "110" when "100101011",
      "110" when "100101100",
      "110" when "100101101",
      "110" when "100101110",
      "110" when "100101111",
      "110" when "100110000",
      "110" when "100110001",
      "110" when "100110010",
      "110" when "100110011",
      "110" when "100110100",
      "110" when "100110101",
      "110" when "100110110",
      "110" when "100110111",
      "110" when "100111000",
      "110" when "100111001",
      "110" when "100111010",
      "110" when "100111011",
      "110" when "100111100",
      "110" when "100111101",
      "110" when "100111110",
      "110" when "100111111",
      "110" when "101000000",
      "110" when "101000001",
      "110" when "101000010",
      "110" when "101000011",
      "110" when "101000100",
      "110" when "101000101",
      "110" when "101000110",
      "110" when "101000111",
      "110" when "101001000",
      "110" when "101001001",
      "110" when "101001010",
      "110" when "101001011",
      "110" when "101001100",
      "110" when "101001101",
      "110" when "101001110",
      "110" when "101001111",
      "110" when "101010000",
      "110" when "101010001",
      "110" when "101010010",
      "110" when "101010011",
      "110" when "101010100",
      "110" when "101010101",
      "110" when "101010110",
      "110" when "101010111",
      "110" when "101011000",
      "110" when "101011001",
      "110" when "101011010",
      "110" when "101011011",
      "110" when "101011100",
      "110" when "101011101",
      "110" when "101011110",
      "110" when "101011111",
      "110" when "101100000",
      "110" when "101100001",
      "110" when "101100010",
      "110" when "101100011",
      "110" when "101100100",
      "110" when "101100101",
      "110" when "101100110",
      "110" when "101100111",
      "110" when "101101000",
      "110" when "101101001",
      "110" when "101101010",
      "110" when "101101011",
      "110" when "101101100",
      "110" when "101101101",
      "110" when "101101110",
      "110" when "101101111",
      "110" when "101110000",
      "110" when "101110001",
      "110" when "101110010",
      "110" when "101110011",
      "110" when "101110100",
      "110" when "101110101",
      "110" when "101110110",
      "110" when "101110111",
      "110" when "101111000",
      "110" when "101111001",
      "110" when "101111010",
      "110" when "101111011",
      "110" when "101111100",
      "110" when "101111101",
      "110" when "101111110",
      "110" when "101111111",
      "110" when "110000000",
      "110" when "110000001",
      "110" when "110000010",
      "110" when "110000011",
      "110" when "110000100",
      "110" when "110000101",
      "110" when "110000110",
      "110" when "110000111",
      "110" when "110001000",
      "110" when "110001001",
      "110" when "110001010",
      "110" when "110001011",
      "110" when "110001100",
      "110" when "110001101",
      "110" when "110001110",
      "110" when "110001111",
      "110" when "110010000",
      "110" when "110010001",
      "110" when "110010010",
      "110" when "110010011",
      "110" when "110010100",
      "110" when "110010101",
      "110" when "110010110",
      "110" when "110010111",
      "110" when "110011000",
      "110" when "110011001",
      "110" when "110011010",
      "110" when "110011011",
      "110" when "110011100",
      "110" when "110011101",
      "110" when "110011110",
      "110" when "110011111",
      "110" when "110100000",
      "110" when "110100001",
      "110" when "110100010",
      "110" when "110100011",
      "110" when "110100100",
      "110" when "110100101",
      "110" when "110100110",
      "110" when "110100111",
      "110" when "110101000",
      "110" when "110101001",
      "110" when "110101010",
      "110" when "110101011",
      "110" when "110101100",
      "110" when "110101101",
      "110" when "110101110",
      "111" when "110101111",
      "110" when "110110000",
      "110" when "110110001",
      "110" when "110110010",
      "110" when "110110011",
      "110" when "110110100",
      "111" when "110110101",
      "111" when "110110110",
      "111" when "110110111",
      "110" when "110111000",
      "110" when "110111001",
      "110" when "110111010",
      "110" when "110111011",
      "111" when "110111100",
      "111" when "110111101",
      "111" when "110111110",
      "111" when "110111111",
      "110" when "111000000",
      "110" when "111000001",
      "111" when "111000010",
      "111" when "111000011",
      "111" when "111000100",
      "111" when "111000101",
      "111" when "111000110",
      "111" when "111000111",
      "110" when "111001000",
      "111" when "111001001",
      "111" when "111001010",
      "111" when "111001011",
      "111" when "111001100",
      "111" when "111001101",
      "111" when "111001110",
      "111" when "111001111",
      "111" when "111010000",
      "111" when "111010001",
      "111" when "111010010",
      "111" when "111010011",
      "111" when "111010100",
      "111" when "111010101",
      "111" when "111010110",
      "111" when "111010111",
      "111" when "111011000",
      "111" when "111011001",
      "111" when "111011010",
      "111" when "111011011",
      "111" when "111011100",
      "111" when "111011101",
      "111" when "111011110",
      "111" when "111011111",
      "111" when "111100000",
      "111" when "111100001",
      "111" when "111100010",
      "111" when "111100011",
      "111" when "111100100",
      "111" when "111100101",
      "111" when "111100110",
      "111" when "111100111",
      "111" when "111101000",
      "111" when "111101001",
      "111" when "111101010",
      "111" when "111101011",
      "000" when "111101100",
      "000" when "111101101",
      "000" when "111101110",
      "000" when "111101111",
      "000" when "111110000",
      "000" when "111110001",
      "000" when "111110010",
      "000" when "111110011",
      "000" when "111110100",
      "000" when "111110101",
      "000" when "111110110",
      "000" when "111110111",
      "000" when "111111000",
      "000" when "111111001",
      "000" when "111111010",
      "000" when "111111011",
      "000" when "111111100",
      "000" when "111111101",
      "000" when "111111110",
      "000" when "111111111",
      "---" when others;
   Y1 <= Y0; -- for the possible blockram register
   Y <= Y1;
end architecture;

--------------------------------------------------------------------------------
--                          FPDiv_15_63_Freq100_uid2
-- VHDL generated for Kintex7 @ 100MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Maxime Christ, Florent de Dinechin (2015)
--------------------------------------------------------------------------------
-- Pipeline depth: 8 cycles
-- Clock period (ns): 10
-- Target frequency (MHz): 100
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity FPDiv_15_63_Freq100_uid2 is
    port (clk : in std_logic;
          X : in  std_logic_vector(15+63+2 downto 0);
          Y : in  std_logic_vector(15+63+2 downto 0);
          R : out  std_logic_vector(15+63+2 downto 0)   );
end entity;

architecture arch of FPDiv_15_63_Freq100_uid2 is
   component selFunction_Freq100_uid4 is
      port ( X : in  std_logic_vector(8 downto 0);
             Y : out  std_logic_vector(2 downto 0)   );
   end component;

signal fX :  std_logic_vector(63 downto 0);
signal fY :  std_logic_vector(63 downto 0);
signal expR0, expR0_d1, expR0_d2, expR0_d3, expR0_d4, expR0_d5, expR0_d6, expR0_d7, expR0_d8 :  std_logic_vector(16 downto 0);
signal sR, sR_d1, sR_d2, sR_d3, sR_d4, sR_d5, sR_d6, sR_d7, sR_d8 :  std_logic;
signal exnXY :  std_logic_vector(3 downto 0);
signal exnR0, exnR0_d1, exnR0_d2, exnR0_d3, exnR0_d4, exnR0_d5, exnR0_d6, exnR0_d7, exnR0_d8 :  std_logic_vector(1 downto 0);
signal D, D_d1, D_d2, D_d3, D_d4, D_d5, D_d6, D_d7 :  std_logic_vector(63 downto 0);
signal psX :  std_logic_vector(64 downto 0);
signal betaw34 :  std_logic_vector(66 downto 0);
signal sel34 :  std_logic_vector(8 downto 0);
signal q34 :  std_logic_vector(2 downto 0);
signal q34_copy5 :  std_logic_vector(2 downto 0);
signal absq34D :  std_logic_vector(66 downto 0);
signal w33 :  std_logic_vector(66 downto 0);
signal betaw33 :  std_logic_vector(66 downto 0);
signal sel33 :  std_logic_vector(8 downto 0);
signal q33 :  std_logic_vector(2 downto 0);
signal q33_copy6 :  std_logic_vector(2 downto 0);
signal absq33D :  std_logic_vector(66 downto 0);
signal w32 :  std_logic_vector(66 downto 0);
signal betaw32 :  std_logic_vector(66 downto 0);
signal sel32 :  std_logic_vector(8 downto 0);
signal q32 :  std_logic_vector(2 downto 0);
signal q32_copy7 :  std_logic_vector(2 downto 0);
signal absq32D :  std_logic_vector(66 downto 0);
signal w31 :  std_logic_vector(66 downto 0);
signal betaw31 :  std_logic_vector(66 downto 0);
signal sel31 :  std_logic_vector(8 downto 0);
signal q31 :  std_logic_vector(2 downto 0);
signal q31_copy8 :  std_logic_vector(2 downto 0);
signal absq31D :  std_logic_vector(66 downto 0);
signal w30 :  std_logic_vector(66 downto 0);
signal betaw30, betaw30_d1 :  std_logic_vector(66 downto 0);
signal sel30 :  std_logic_vector(8 downto 0);
signal q30 :  std_logic_vector(2 downto 0);
signal q30_copy9, q30_copy9_d1 :  std_logic_vector(2 downto 0);
signal absq30D :  std_logic_vector(66 downto 0);
signal w29 :  std_logic_vector(66 downto 0);
signal betaw29 :  std_logic_vector(66 downto 0);
signal sel29 :  std_logic_vector(8 downto 0);
signal q29 :  std_logic_vector(2 downto 0);
signal q29_copy10 :  std_logic_vector(2 downto 0);
signal absq29D :  std_logic_vector(66 downto 0);
signal w28 :  std_logic_vector(66 downto 0);
signal betaw28 :  std_logic_vector(66 downto 0);
signal sel28 :  std_logic_vector(8 downto 0);
signal q28 :  std_logic_vector(2 downto 0);
signal q28_copy11 :  std_logic_vector(2 downto 0);
signal absq28D :  std_logic_vector(66 downto 0);
signal w27 :  std_logic_vector(66 downto 0);
signal betaw27 :  std_logic_vector(66 downto 0);
signal sel27 :  std_logic_vector(8 downto 0);
signal q27 :  std_logic_vector(2 downto 0);
signal q27_copy12 :  std_logic_vector(2 downto 0);
signal absq27D :  std_logic_vector(66 downto 0);
signal w26 :  std_logic_vector(66 downto 0);
signal betaw26, betaw26_d1 :  std_logic_vector(66 downto 0);
signal sel26 :  std_logic_vector(8 downto 0);
signal q26, q26_d1 :  std_logic_vector(2 downto 0);
signal q26_copy13 :  std_logic_vector(2 downto 0);
signal absq26D, absq26D_d1 :  std_logic_vector(66 downto 0);
signal w25 :  std_logic_vector(66 downto 0);
signal betaw25 :  std_logic_vector(66 downto 0);
signal sel25 :  std_logic_vector(8 downto 0);
signal q25 :  std_logic_vector(2 downto 0);
signal q25_copy14 :  std_logic_vector(2 downto 0);
signal absq25D :  std_logic_vector(66 downto 0);
signal w24 :  std_logic_vector(66 downto 0);
signal betaw24 :  std_logic_vector(66 downto 0);
signal sel24 :  std_logic_vector(8 downto 0);
signal q24 :  std_logic_vector(2 downto 0);
signal q24_copy15 :  std_logic_vector(2 downto 0);
signal absq24D :  std_logic_vector(66 downto 0);
signal w23 :  std_logic_vector(66 downto 0);
signal betaw23 :  std_logic_vector(66 downto 0);
signal sel23 :  std_logic_vector(8 downto 0);
signal q23 :  std_logic_vector(2 downto 0);
signal q23_copy16 :  std_logic_vector(2 downto 0);
signal absq23D :  std_logic_vector(66 downto 0);
signal w22 :  std_logic_vector(66 downto 0);
signal betaw22, betaw22_d1 :  std_logic_vector(66 downto 0);
signal sel22 :  std_logic_vector(8 downto 0);
signal q22, q22_d1 :  std_logic_vector(2 downto 0);
signal q22_copy17 :  std_logic_vector(2 downto 0);
signal absq22D, absq22D_d1 :  std_logic_vector(66 downto 0);
signal w21 :  std_logic_vector(66 downto 0);
signal betaw21 :  std_logic_vector(66 downto 0);
signal sel21 :  std_logic_vector(8 downto 0);
signal q21 :  std_logic_vector(2 downto 0);
signal q21_copy18 :  std_logic_vector(2 downto 0);
signal absq21D :  std_logic_vector(66 downto 0);
signal w20 :  std_logic_vector(66 downto 0);
signal betaw20 :  std_logic_vector(66 downto 0);
signal sel20 :  std_logic_vector(8 downto 0);
signal q20 :  std_logic_vector(2 downto 0);
signal q20_copy19 :  std_logic_vector(2 downto 0);
signal absq20D :  std_logic_vector(66 downto 0);
signal w19 :  std_logic_vector(66 downto 0);
signal betaw19 :  std_logic_vector(66 downto 0);
signal sel19 :  std_logic_vector(8 downto 0);
signal q19 :  std_logic_vector(2 downto 0);
signal q19_copy20 :  std_logic_vector(2 downto 0);
signal absq19D :  std_logic_vector(66 downto 0);
signal w18 :  std_logic_vector(66 downto 0);
signal betaw18, betaw18_d1 :  std_logic_vector(66 downto 0);
signal sel18 :  std_logic_vector(8 downto 0);
signal q18, q18_d1 :  std_logic_vector(2 downto 0);
signal q18_copy21 :  std_logic_vector(2 downto 0);
signal absq18D, absq18D_d1 :  std_logic_vector(66 downto 0);
signal w17 :  std_logic_vector(66 downto 0);
signal betaw17 :  std_logic_vector(66 downto 0);
signal sel17 :  std_logic_vector(8 downto 0);
signal q17 :  std_logic_vector(2 downto 0);
signal q17_copy22 :  std_logic_vector(2 downto 0);
signal absq17D :  std_logic_vector(66 downto 0);
signal w16 :  std_logic_vector(66 downto 0);
signal betaw16 :  std_logic_vector(66 downto 0);
signal sel16 :  std_logic_vector(8 downto 0);
signal q16 :  std_logic_vector(2 downto 0);
signal q16_copy23 :  std_logic_vector(2 downto 0);
signal absq16D :  std_logic_vector(66 downto 0);
signal w15 :  std_logic_vector(66 downto 0);
signal betaw15 :  std_logic_vector(66 downto 0);
signal sel15 :  std_logic_vector(8 downto 0);
signal q15 :  std_logic_vector(2 downto 0);
signal q15_copy24 :  std_logic_vector(2 downto 0);
signal absq15D :  std_logic_vector(66 downto 0);
signal w14 :  std_logic_vector(66 downto 0);
signal betaw14 :  std_logic_vector(66 downto 0);
signal sel14 :  std_logic_vector(8 downto 0);
signal q14 :  std_logic_vector(2 downto 0);
signal q14_copy25 :  std_logic_vector(2 downto 0);
signal absq14D :  std_logic_vector(66 downto 0);
signal w13 :  std_logic_vector(66 downto 0);
signal betaw13, betaw13_d1 :  std_logic_vector(66 downto 0);
signal sel13 :  std_logic_vector(8 downto 0);
signal q13 :  std_logic_vector(2 downto 0);
signal q13_copy26, q13_copy26_d1 :  std_logic_vector(2 downto 0);
signal absq13D :  std_logic_vector(66 downto 0);
signal w12 :  std_logic_vector(66 downto 0);
signal betaw12 :  std_logic_vector(66 downto 0);
signal sel12 :  std_logic_vector(8 downto 0);
signal q12 :  std_logic_vector(2 downto 0);
signal q12_copy27 :  std_logic_vector(2 downto 0);
signal absq12D :  std_logic_vector(66 downto 0);
signal w11 :  std_logic_vector(66 downto 0);
signal betaw11 :  std_logic_vector(66 downto 0);
signal sel11 :  std_logic_vector(8 downto 0);
signal q11 :  std_logic_vector(2 downto 0);
signal q11_copy28 :  std_logic_vector(2 downto 0);
signal absq11D :  std_logic_vector(66 downto 0);
signal w10 :  std_logic_vector(66 downto 0);
signal betaw10 :  std_logic_vector(66 downto 0);
signal sel10 :  std_logic_vector(8 downto 0);
signal q10 :  std_logic_vector(2 downto 0);
signal q10_copy29 :  std_logic_vector(2 downto 0);
signal absq10D :  std_logic_vector(66 downto 0);
signal w9 :  std_logic_vector(66 downto 0);
signal betaw9, betaw9_d1 :  std_logic_vector(66 downto 0);
signal sel9 :  std_logic_vector(8 downto 0);
signal q9, q9_d1 :  std_logic_vector(2 downto 0);
signal q9_copy30 :  std_logic_vector(2 downto 0);
signal absq9D, absq9D_d1 :  std_logic_vector(66 downto 0);
signal w8 :  std_logic_vector(66 downto 0);
signal betaw8 :  std_logic_vector(66 downto 0);
signal sel8 :  std_logic_vector(8 downto 0);
signal q8 :  std_logic_vector(2 downto 0);
signal q8_copy31 :  std_logic_vector(2 downto 0);
signal absq8D :  std_logic_vector(66 downto 0);
signal w7 :  std_logic_vector(66 downto 0);
signal betaw7 :  std_logic_vector(66 downto 0);
signal sel7 :  std_logic_vector(8 downto 0);
signal q7 :  std_logic_vector(2 downto 0);
signal q7_copy32 :  std_logic_vector(2 downto 0);
signal absq7D :  std_logic_vector(66 downto 0);
signal w6 :  std_logic_vector(66 downto 0);
signal betaw6 :  std_logic_vector(66 downto 0);
signal sel6 :  std_logic_vector(8 downto 0);
signal q6 :  std_logic_vector(2 downto 0);
signal q6_copy33 :  std_logic_vector(2 downto 0);
signal absq6D :  std_logic_vector(66 downto 0);
signal w5 :  std_logic_vector(66 downto 0);
signal betaw5, betaw5_d1 :  std_logic_vector(66 downto 0);
signal sel5 :  std_logic_vector(8 downto 0);
signal q5, q5_d1 :  std_logic_vector(2 downto 0);
signal q5_copy34 :  std_logic_vector(2 downto 0);
signal absq5D, absq5D_d1 :  std_logic_vector(66 downto 0);
signal w4 :  std_logic_vector(66 downto 0);
signal betaw4 :  std_logic_vector(66 downto 0);
signal sel4 :  std_logic_vector(8 downto 0);
signal q4 :  std_logic_vector(2 downto 0);
signal q4_copy35 :  std_logic_vector(2 downto 0);
signal absq4D :  std_logic_vector(66 downto 0);
signal w3 :  std_logic_vector(66 downto 0);
signal betaw3 :  std_logic_vector(66 downto 0);
signal sel3 :  std_logic_vector(8 downto 0);
signal q3 :  std_logic_vector(2 downto 0);
signal q3_copy36 :  std_logic_vector(2 downto 0);
signal absq3D :  std_logic_vector(66 downto 0);
signal w2 :  std_logic_vector(66 downto 0);
signal betaw2 :  std_logic_vector(66 downto 0);
signal sel2 :  std_logic_vector(8 downto 0);
signal q2 :  std_logic_vector(2 downto 0);
signal q2_copy37 :  std_logic_vector(2 downto 0);
signal absq2D :  std_logic_vector(66 downto 0);
signal w1 :  std_logic_vector(66 downto 0);
signal betaw1, betaw1_d1 :  std_logic_vector(66 downto 0);
signal sel1 :  std_logic_vector(8 downto 0);
signal q1, q1_d1 :  std_logic_vector(2 downto 0);
signal q1_copy38 :  std_logic_vector(2 downto 0);
signal absq1D, absq1D_d1 :  std_logic_vector(66 downto 0);
signal w0 :  std_logic_vector(66 downto 0);
signal wfinal :  std_logic_vector(64 downto 0);
signal qM0 :  std_logic;
signal qP34, qP34_d1, qP34_d2, qP34_d3, qP34_d4, qP34_d5, qP34_d6, qP34_d7 :  std_logic_vector(1 downto 0);
signal qM34, qM34_d1, qM34_d2, qM34_d3, qM34_d4, qM34_d5, qM34_d6, qM34_d7, qM34_d8 :  std_logic_vector(1 downto 0);
signal qP33, qP33_d1, qP33_d2, qP33_d3, qP33_d4, qP33_d5, qP33_d6, qP33_d7 :  std_logic_vector(1 downto 0);
signal qM33, qM33_d1, qM33_d2, qM33_d3, qM33_d4, qM33_d5, qM33_d6, qM33_d7, qM33_d8 :  std_logic_vector(1 downto 0);
signal qP32, qP32_d1, qP32_d2, qP32_d3, qP32_d4, qP32_d5, qP32_d6, qP32_d7 :  std_logic_vector(1 downto 0);
signal qM32, qM32_d1, qM32_d2, qM32_d3, qM32_d4, qM32_d5, qM32_d6, qM32_d7, qM32_d8 :  std_logic_vector(1 downto 0);
signal qP31, qP31_d1, qP31_d2, qP31_d3, qP31_d4, qP31_d5, qP31_d6, qP31_d7 :  std_logic_vector(1 downto 0);
signal qM31, qM31_d1, qM31_d2, qM31_d3, qM31_d4, qM31_d5, qM31_d6, qM31_d7, qM31_d8 :  std_logic_vector(1 downto 0);
signal qP30, qP30_d1, qP30_d2, qP30_d3, qP30_d4, qP30_d5, qP30_d6 :  std_logic_vector(1 downto 0);
signal qM30, qM30_d1, qM30_d2, qM30_d3, qM30_d4, qM30_d5, qM30_d6, qM30_d7 :  std_logic_vector(1 downto 0);
signal qP29, qP29_d1, qP29_d2, qP29_d3, qP29_d4, qP29_d5, qP29_d6 :  std_logic_vector(1 downto 0);
signal qM29, qM29_d1, qM29_d2, qM29_d3, qM29_d4, qM29_d5, qM29_d6, qM29_d7 :  std_logic_vector(1 downto 0);
signal qP28, qP28_d1, qP28_d2, qP28_d3, qP28_d4, qP28_d5, qP28_d6 :  std_logic_vector(1 downto 0);
signal qM28, qM28_d1, qM28_d2, qM28_d3, qM28_d4, qM28_d5, qM28_d6, qM28_d7 :  std_logic_vector(1 downto 0);
signal qP27, qP27_d1, qP27_d2, qP27_d3, qP27_d4, qP27_d5, qP27_d6 :  std_logic_vector(1 downto 0);
signal qM27, qM27_d1, qM27_d2, qM27_d3, qM27_d4, qM27_d5, qM27_d6, qM27_d7 :  std_logic_vector(1 downto 0);
signal qP26, qP26_d1, qP26_d2, qP26_d3, qP26_d4, qP26_d5, qP26_d6 :  std_logic_vector(1 downto 0);
signal qM26, qM26_d1, qM26_d2, qM26_d3, qM26_d4, qM26_d5, qM26_d6, qM26_d7 :  std_logic_vector(1 downto 0);
signal qP25, qP25_d1, qP25_d2, qP25_d3, qP25_d4, qP25_d5 :  std_logic_vector(1 downto 0);
signal qM25, qM25_d1, qM25_d2, qM25_d3, qM25_d4, qM25_d5, qM25_d6 :  std_logic_vector(1 downto 0);
signal qP24, qP24_d1, qP24_d2, qP24_d3, qP24_d4, qP24_d5 :  std_logic_vector(1 downto 0);
signal qM24, qM24_d1, qM24_d2, qM24_d3, qM24_d4, qM24_d5, qM24_d6 :  std_logic_vector(1 downto 0);
signal qP23, qP23_d1, qP23_d2, qP23_d3, qP23_d4, qP23_d5 :  std_logic_vector(1 downto 0);
signal qM23, qM23_d1, qM23_d2, qM23_d3, qM23_d4, qM23_d5, qM23_d6 :  std_logic_vector(1 downto 0);
signal qP22, qP22_d1, qP22_d2, qP22_d3, qP22_d4, qP22_d5 :  std_logic_vector(1 downto 0);
signal qM22, qM22_d1, qM22_d2, qM22_d3, qM22_d4, qM22_d5, qM22_d6 :  std_logic_vector(1 downto 0);
signal qP21, qP21_d1, qP21_d2, qP21_d3, qP21_d4 :  std_logic_vector(1 downto 0);
signal qM21, qM21_d1, qM21_d2, qM21_d3, qM21_d4, qM21_d5 :  std_logic_vector(1 downto 0);
signal qP20, qP20_d1, qP20_d2, qP20_d3, qP20_d4 :  std_logic_vector(1 downto 0);
signal qM20, qM20_d1, qM20_d2, qM20_d3, qM20_d4, qM20_d5 :  std_logic_vector(1 downto 0);
signal qP19, qP19_d1, qP19_d2, qP19_d3, qP19_d4 :  std_logic_vector(1 downto 0);
signal qM19, qM19_d1, qM19_d2, qM19_d3, qM19_d4, qM19_d5 :  std_logic_vector(1 downto 0);
signal qP18, qP18_d1, qP18_d2, qP18_d3, qP18_d4 :  std_logic_vector(1 downto 0);
signal qM18, qM18_d1, qM18_d2, qM18_d3, qM18_d4, qM18_d5 :  std_logic_vector(1 downto 0);
signal qP17, qP17_d1, qP17_d2, qP17_d3 :  std_logic_vector(1 downto 0);
signal qM17, qM17_d1, qM17_d2, qM17_d3, qM17_d4 :  std_logic_vector(1 downto 0);
signal qP16, qP16_d1, qP16_d2, qP16_d3 :  std_logic_vector(1 downto 0);
signal qM16, qM16_d1, qM16_d2, qM16_d3, qM16_d4 :  std_logic_vector(1 downto 0);
signal qP15, qP15_d1, qP15_d2, qP15_d3 :  std_logic_vector(1 downto 0);
signal qM15, qM15_d1, qM15_d2, qM15_d3, qM15_d4 :  std_logic_vector(1 downto 0);
signal qP14, qP14_d1, qP14_d2, qP14_d3 :  std_logic_vector(1 downto 0);
signal qM14, qM14_d1, qM14_d2, qM14_d3, qM14_d4 :  std_logic_vector(1 downto 0);
signal qP13, qP13_d1, qP13_d2 :  std_logic_vector(1 downto 0);
signal qM13, qM13_d1, qM13_d2, qM13_d3 :  std_logic_vector(1 downto 0);
signal qP12, qP12_d1, qP12_d2 :  std_logic_vector(1 downto 0);
signal qM12, qM12_d1, qM12_d2, qM12_d3 :  std_logic_vector(1 downto 0);
signal qP11, qP11_d1, qP11_d2 :  std_logic_vector(1 downto 0);
signal qM11, qM11_d1, qM11_d2, qM11_d3 :  std_logic_vector(1 downto 0);
signal qP10, qP10_d1, qP10_d2 :  std_logic_vector(1 downto 0);
signal qM10, qM10_d1, qM10_d2, qM10_d3 :  std_logic_vector(1 downto 0);
signal qP9, qP9_d1, qP9_d2 :  std_logic_vector(1 downto 0);
signal qM9, qM9_d1, qM9_d2, qM9_d3 :  std_logic_vector(1 downto 0);
signal qP8, qP8_d1 :  std_logic_vector(1 downto 0);
signal qM8, qM8_d1, qM8_d2 :  std_logic_vector(1 downto 0);
signal qP7, qP7_d1 :  std_logic_vector(1 downto 0);
signal qM7, qM7_d1, qM7_d2 :  std_logic_vector(1 downto 0);
signal qP6, qP6_d1 :  std_logic_vector(1 downto 0);
signal qM6, qM6_d1, qM6_d2 :  std_logic_vector(1 downto 0);
signal qP5, qP5_d1 :  std_logic_vector(1 downto 0);
signal qM5, qM5_d1, qM5_d2 :  std_logic_vector(1 downto 0);
signal qP4 :  std_logic_vector(1 downto 0);
signal qM4, qM4_d1 :  std_logic_vector(1 downto 0);
signal qP3 :  std_logic_vector(1 downto 0);
signal qM3, qM3_d1 :  std_logic_vector(1 downto 0);
signal qP2 :  std_logic_vector(1 downto 0);
signal qM2, qM2_d1 :  std_logic_vector(1 downto 0);
signal qP1 :  std_logic_vector(1 downto 0);
signal qM1, qM1_d1 :  std_logic_vector(1 downto 0);
signal qP, qP_d1 :  std_logic_vector(67 downto 0);
signal qM :  std_logic_vector(67 downto 0);
signal quotient :  std_logic_vector(67 downto 0);
signal mR :  std_logic_vector(65 downto 0);
signal fRnorm :  std_logic_vector(63 downto 0);
signal round :  std_logic;
signal expR1 :  std_logic_vector(16 downto 0);
signal expfrac :  std_logic_vector(79 downto 0);
signal expfracR :  std_logic_vector(79 downto 0);
signal exnR :  std_logic_vector(1 downto 0);
signal exnRfinal :  std_logic_vector(1 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            expR0_d1 <=  expR0;
            expR0_d2 <=  expR0_d1;
            expR0_d3 <=  expR0_d2;
            expR0_d4 <=  expR0_d3;
            expR0_d5 <=  expR0_d4;
            expR0_d6 <=  expR0_d5;
            expR0_d7 <=  expR0_d6;
            expR0_d8 <=  expR0_d7;
            sR_d1 <=  sR;
            sR_d2 <=  sR_d1;
            sR_d3 <=  sR_d2;
            sR_d4 <=  sR_d3;
            sR_d5 <=  sR_d4;
            sR_d6 <=  sR_d5;
            sR_d7 <=  sR_d6;
            sR_d8 <=  sR_d7;
            exnR0_d1 <=  exnR0;
            exnR0_d2 <=  exnR0_d1;
            exnR0_d3 <=  exnR0_d2;
            exnR0_d4 <=  exnR0_d3;
            exnR0_d5 <=  exnR0_d4;
            exnR0_d6 <=  exnR0_d5;
            exnR0_d7 <=  exnR0_d6;
            exnR0_d8 <=  exnR0_d7;
            D_d1 <=  D;
            D_d2 <=  D_d1;
            D_d3 <=  D_d2;
            D_d4 <=  D_d3;
            D_d5 <=  D_d4;
            D_d6 <=  D_d5;
            D_d7 <=  D_d6;
            betaw30_d1 <=  betaw30;
            q30_copy9_d1 <=  q30_copy9;
            betaw26_d1 <=  betaw26;
            q26_d1 <=  q26;
            absq26D_d1 <=  absq26D;
            betaw22_d1 <=  betaw22;
            q22_d1 <=  q22;
            absq22D_d1 <=  absq22D;
            betaw18_d1 <=  betaw18;
            q18_d1 <=  q18;
            absq18D_d1 <=  absq18D;
            betaw13_d1 <=  betaw13;
            q13_copy26_d1 <=  q13_copy26;
            betaw9_d1 <=  betaw9;
            q9_d1 <=  q9;
            absq9D_d1 <=  absq9D;
            betaw5_d1 <=  betaw5;
            q5_d1 <=  q5;
            absq5D_d1 <=  absq5D;
            betaw1_d1 <=  betaw1;
            q1_d1 <=  q1;
            absq1D_d1 <=  absq1D;
            qP34_d1 <=  qP34;
            qP34_d2 <=  qP34_d1;
            qP34_d3 <=  qP34_d2;
            qP34_d4 <=  qP34_d3;
            qP34_d5 <=  qP34_d4;
            qP34_d6 <=  qP34_d5;
            qP34_d7 <=  qP34_d6;
            qM34_d1 <=  qM34;
            qM34_d2 <=  qM34_d1;
            qM34_d3 <=  qM34_d2;
            qM34_d4 <=  qM34_d3;
            qM34_d5 <=  qM34_d4;
            qM34_d6 <=  qM34_d5;
            qM34_d7 <=  qM34_d6;
            qM34_d8 <=  qM34_d7;
            qP33_d1 <=  qP33;
            qP33_d2 <=  qP33_d1;
            qP33_d3 <=  qP33_d2;
            qP33_d4 <=  qP33_d3;
            qP33_d5 <=  qP33_d4;
            qP33_d6 <=  qP33_d5;
            qP33_d7 <=  qP33_d6;
            qM33_d1 <=  qM33;
            qM33_d2 <=  qM33_d1;
            qM33_d3 <=  qM33_d2;
            qM33_d4 <=  qM33_d3;
            qM33_d5 <=  qM33_d4;
            qM33_d6 <=  qM33_d5;
            qM33_d7 <=  qM33_d6;
            qM33_d8 <=  qM33_d7;
            qP32_d1 <=  qP32;
            qP32_d2 <=  qP32_d1;
            qP32_d3 <=  qP32_d2;
            qP32_d4 <=  qP32_d3;
            qP32_d5 <=  qP32_d4;
            qP32_d6 <=  qP32_d5;
            qP32_d7 <=  qP32_d6;
            qM32_d1 <=  qM32;
            qM32_d2 <=  qM32_d1;
            qM32_d3 <=  qM32_d2;
            qM32_d4 <=  qM32_d3;
            qM32_d5 <=  qM32_d4;
            qM32_d6 <=  qM32_d5;
            qM32_d7 <=  qM32_d6;
            qM32_d8 <=  qM32_d7;
            qP31_d1 <=  qP31;
            qP31_d2 <=  qP31_d1;
            qP31_d3 <=  qP31_d2;
            qP31_d4 <=  qP31_d3;
            qP31_d5 <=  qP31_d4;
            qP31_d6 <=  qP31_d5;
            qP31_d7 <=  qP31_d6;
            qM31_d1 <=  qM31;
            qM31_d2 <=  qM31_d1;
            qM31_d3 <=  qM31_d2;
            qM31_d4 <=  qM31_d3;
            qM31_d5 <=  qM31_d4;
            qM31_d6 <=  qM31_d5;
            qM31_d7 <=  qM31_d6;
            qM31_d8 <=  qM31_d7;
            qP30_d1 <=  qP30;
            qP30_d2 <=  qP30_d1;
            qP30_d3 <=  qP30_d2;
            qP30_d4 <=  qP30_d3;
            qP30_d5 <=  qP30_d4;
            qP30_d6 <=  qP30_d5;
            qM30_d1 <=  qM30;
            qM30_d2 <=  qM30_d1;
            qM30_d3 <=  qM30_d2;
            qM30_d4 <=  qM30_d3;
            qM30_d5 <=  qM30_d4;
            qM30_d6 <=  qM30_d5;
            qM30_d7 <=  qM30_d6;
            qP29_d1 <=  qP29;
            qP29_d2 <=  qP29_d1;
            qP29_d3 <=  qP29_d2;
            qP29_d4 <=  qP29_d3;
            qP29_d5 <=  qP29_d4;
            qP29_d6 <=  qP29_d5;
            qM29_d1 <=  qM29;
            qM29_d2 <=  qM29_d1;
            qM29_d3 <=  qM29_d2;
            qM29_d4 <=  qM29_d3;
            qM29_d5 <=  qM29_d4;
            qM29_d6 <=  qM29_d5;
            qM29_d7 <=  qM29_d6;
            qP28_d1 <=  qP28;
            qP28_d2 <=  qP28_d1;
            qP28_d3 <=  qP28_d2;
            qP28_d4 <=  qP28_d3;
            qP28_d5 <=  qP28_d4;
            qP28_d6 <=  qP28_d5;
            qM28_d1 <=  qM28;
            qM28_d2 <=  qM28_d1;
            qM28_d3 <=  qM28_d2;
            qM28_d4 <=  qM28_d3;
            qM28_d5 <=  qM28_d4;
            qM28_d6 <=  qM28_d5;
            qM28_d7 <=  qM28_d6;
            qP27_d1 <=  qP27;
            qP27_d2 <=  qP27_d1;
            qP27_d3 <=  qP27_d2;
            qP27_d4 <=  qP27_d3;
            qP27_d5 <=  qP27_d4;
            qP27_d6 <=  qP27_d5;
            qM27_d1 <=  qM27;
            qM27_d2 <=  qM27_d1;
            qM27_d3 <=  qM27_d2;
            qM27_d4 <=  qM27_d3;
            qM27_d5 <=  qM27_d4;
            qM27_d6 <=  qM27_d5;
            qM27_d7 <=  qM27_d6;
            qP26_d1 <=  qP26;
            qP26_d2 <=  qP26_d1;
            qP26_d3 <=  qP26_d2;
            qP26_d4 <=  qP26_d3;
            qP26_d5 <=  qP26_d4;
            qP26_d6 <=  qP26_d5;
            qM26_d1 <=  qM26;
            qM26_d2 <=  qM26_d1;
            qM26_d3 <=  qM26_d2;
            qM26_d4 <=  qM26_d3;
            qM26_d5 <=  qM26_d4;
            qM26_d6 <=  qM26_d5;
            qM26_d7 <=  qM26_d6;
            qP25_d1 <=  qP25;
            qP25_d2 <=  qP25_d1;
            qP25_d3 <=  qP25_d2;
            qP25_d4 <=  qP25_d3;
            qP25_d5 <=  qP25_d4;
            qM25_d1 <=  qM25;
            qM25_d2 <=  qM25_d1;
            qM25_d3 <=  qM25_d2;
            qM25_d4 <=  qM25_d3;
            qM25_d5 <=  qM25_d4;
            qM25_d6 <=  qM25_d5;
            qP24_d1 <=  qP24;
            qP24_d2 <=  qP24_d1;
            qP24_d3 <=  qP24_d2;
            qP24_d4 <=  qP24_d3;
            qP24_d5 <=  qP24_d4;
            qM24_d1 <=  qM24;
            qM24_d2 <=  qM24_d1;
            qM24_d3 <=  qM24_d2;
            qM24_d4 <=  qM24_d3;
            qM24_d5 <=  qM24_d4;
            qM24_d6 <=  qM24_d5;
            qP23_d1 <=  qP23;
            qP23_d2 <=  qP23_d1;
            qP23_d3 <=  qP23_d2;
            qP23_d4 <=  qP23_d3;
            qP23_d5 <=  qP23_d4;
            qM23_d1 <=  qM23;
            qM23_d2 <=  qM23_d1;
            qM23_d3 <=  qM23_d2;
            qM23_d4 <=  qM23_d3;
            qM23_d5 <=  qM23_d4;
            qM23_d6 <=  qM23_d5;
            qP22_d1 <=  qP22;
            qP22_d2 <=  qP22_d1;
            qP22_d3 <=  qP22_d2;
            qP22_d4 <=  qP22_d3;
            qP22_d5 <=  qP22_d4;
            qM22_d1 <=  qM22;
            qM22_d2 <=  qM22_d1;
            qM22_d3 <=  qM22_d2;
            qM22_d4 <=  qM22_d3;
            qM22_d5 <=  qM22_d4;
            qM22_d6 <=  qM22_d5;
            qP21_d1 <=  qP21;
            qP21_d2 <=  qP21_d1;
            qP21_d3 <=  qP21_d2;
            qP21_d4 <=  qP21_d3;
            qM21_d1 <=  qM21;
            qM21_d2 <=  qM21_d1;
            qM21_d3 <=  qM21_d2;
            qM21_d4 <=  qM21_d3;
            qM21_d5 <=  qM21_d4;
            qP20_d1 <=  qP20;
            qP20_d2 <=  qP20_d1;
            qP20_d3 <=  qP20_d2;
            qP20_d4 <=  qP20_d3;
            qM20_d1 <=  qM20;
            qM20_d2 <=  qM20_d1;
            qM20_d3 <=  qM20_d2;
            qM20_d4 <=  qM20_d3;
            qM20_d5 <=  qM20_d4;
            qP19_d1 <=  qP19;
            qP19_d2 <=  qP19_d1;
            qP19_d3 <=  qP19_d2;
            qP19_d4 <=  qP19_d3;
            qM19_d1 <=  qM19;
            qM19_d2 <=  qM19_d1;
            qM19_d3 <=  qM19_d2;
            qM19_d4 <=  qM19_d3;
            qM19_d5 <=  qM19_d4;
            qP18_d1 <=  qP18;
            qP18_d2 <=  qP18_d1;
            qP18_d3 <=  qP18_d2;
            qP18_d4 <=  qP18_d3;
            qM18_d1 <=  qM18;
            qM18_d2 <=  qM18_d1;
            qM18_d3 <=  qM18_d2;
            qM18_d4 <=  qM18_d3;
            qM18_d5 <=  qM18_d4;
            qP17_d1 <=  qP17;
            qP17_d2 <=  qP17_d1;
            qP17_d3 <=  qP17_d2;
            qM17_d1 <=  qM17;
            qM17_d2 <=  qM17_d1;
            qM17_d3 <=  qM17_d2;
            qM17_d4 <=  qM17_d3;
            qP16_d1 <=  qP16;
            qP16_d2 <=  qP16_d1;
            qP16_d3 <=  qP16_d2;
            qM16_d1 <=  qM16;
            qM16_d2 <=  qM16_d1;
            qM16_d3 <=  qM16_d2;
            qM16_d4 <=  qM16_d3;
            qP15_d1 <=  qP15;
            qP15_d2 <=  qP15_d1;
            qP15_d3 <=  qP15_d2;
            qM15_d1 <=  qM15;
            qM15_d2 <=  qM15_d1;
            qM15_d3 <=  qM15_d2;
            qM15_d4 <=  qM15_d3;
            qP14_d1 <=  qP14;
            qP14_d2 <=  qP14_d1;
            qP14_d3 <=  qP14_d2;
            qM14_d1 <=  qM14;
            qM14_d2 <=  qM14_d1;
            qM14_d3 <=  qM14_d2;
            qM14_d4 <=  qM14_d3;
            qP13_d1 <=  qP13;
            qP13_d2 <=  qP13_d1;
            qM13_d1 <=  qM13;
            qM13_d2 <=  qM13_d1;
            qM13_d3 <=  qM13_d2;
            qP12_d1 <=  qP12;
            qP12_d2 <=  qP12_d1;
            qM12_d1 <=  qM12;
            qM12_d2 <=  qM12_d1;
            qM12_d3 <=  qM12_d2;
            qP11_d1 <=  qP11;
            qP11_d2 <=  qP11_d1;
            qM11_d1 <=  qM11;
            qM11_d2 <=  qM11_d1;
            qM11_d3 <=  qM11_d2;
            qP10_d1 <=  qP10;
            qP10_d2 <=  qP10_d1;
            qM10_d1 <=  qM10;
            qM10_d2 <=  qM10_d1;
            qM10_d3 <=  qM10_d2;
            qP9_d1 <=  qP9;
            qP9_d2 <=  qP9_d1;
            qM9_d1 <=  qM9;
            qM9_d2 <=  qM9_d1;
            qM9_d3 <=  qM9_d2;
            qP8_d1 <=  qP8;
            qM8_d1 <=  qM8;
            qM8_d2 <=  qM8_d1;
            qP7_d1 <=  qP7;
            qM7_d1 <=  qM7;
            qM7_d2 <=  qM7_d1;
            qP6_d1 <=  qP6;
            qM6_d1 <=  qM6;
            qM6_d2 <=  qM6_d1;
            qP5_d1 <=  qP5;
            qM5_d1 <=  qM5;
            qM5_d2 <=  qM5_d1;
            qM4_d1 <=  qM4;
            qM3_d1 <=  qM3;
            qM2_d1 <=  qM2;
            qM1_d1 <=  qM1;
            qP_d1 <=  qP;
         end if;
      end process;
   fX <= "1" & X(62 downto 0);
   fY <= "1" & Y(62 downto 0);
   -- exponent difference, sign and exception combination computed early, to have fewer bits to pipeline
   expR0 <= ("00" & X(77 downto 63)) - ("00" & Y(77 downto 63));
   sR <= X(78) xor Y(78);
   -- early exception handling 
   exnXY <= X(80 downto 79) & Y(80 downto 79);
   with exnXY  select 
      exnR0 <= 
         "01"	 when "0101",										-- normal
         "00"	 when "0001" | "0010" | "0110", -- zero
         "10"	 when "0100" | "1000" | "1001", -- overflow
         "11"	 when others;										-- NaN
   D <= fY ;
   psX <= "0" & fX ;
   betaw34 <=  "00" & psX;
   sel34 <= betaw34(66 downto 61) & D(62 downto 60);
   SelFunctionTable34: selFunction_Freq100_uid4
      port map ( X => sel34,
                 Y => q34_copy5);
   q34 <= q34_copy5; -- output copy to hold a pipeline register if needed

   with q34  select 
      absq34D <= 
         "000" & D						 when "001" | "111", -- mult by 1
         "00" & D & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q34(2)  select 
   w33<= betaw34 - absq34D when '0',
         betaw34 + absq34D when others;

   betaw33 <= w33(64 downto 0) & "00"; -- multiplication by the radix
   sel33 <= betaw33(66 downto 61) & D(62 downto 60);
   SelFunctionTable33: selFunction_Freq100_uid4
      port map ( X => sel33,
                 Y => q33_copy6);
   q33 <= q33_copy6; -- output copy to hold a pipeline register if needed

   with q33  select 
      absq33D <= 
         "000" & D						 when "001" | "111", -- mult by 1
         "00" & D & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q33(2)  select 
   w32<= betaw33 - absq33D when '0',
         betaw33 + absq33D when others;

   betaw32 <= w32(64 downto 0) & "00"; -- multiplication by the radix
   sel32 <= betaw32(66 downto 61) & D(62 downto 60);
   SelFunctionTable32: selFunction_Freq100_uid4
      port map ( X => sel32,
                 Y => q32_copy7);
   q32 <= q32_copy7; -- output copy to hold a pipeline register if needed

   with q32  select 
      absq32D <= 
         "000" & D						 when "001" | "111", -- mult by 1
         "00" & D & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q32(2)  select 
   w31<= betaw32 - absq32D when '0',
         betaw32 + absq32D when others;

   betaw31 <= w31(64 downto 0) & "00"; -- multiplication by the radix
   sel31 <= betaw31(66 downto 61) & D(62 downto 60);
   SelFunctionTable31: selFunction_Freq100_uid4
      port map ( X => sel31,
                 Y => q31_copy8);
   q31 <= q31_copy8; -- output copy to hold a pipeline register if needed

   with q31  select 
      absq31D <= 
         "000" & D						 when "001" | "111", -- mult by 1
         "00" & D & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q31(2)  select 
   w30<= betaw31 - absq31D when '0',
         betaw31 + absq31D when others;

   betaw30 <= w30(64 downto 0) & "00"; -- multiplication by the radix
   sel30 <= betaw30(66 downto 61) & D(62 downto 60);
   SelFunctionTable30: selFunction_Freq100_uid4
      port map ( X => sel30,
                 Y => q30_copy9);
   q30 <= q30_copy9_d1; -- output copy to hold a pipeline register if needed

   with q30  select 
      absq30D <= 
         "000" & D_d1						 when "001" | "111", -- mult by 1
         "00" & D_d1 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q30(2)  select 
   w29<= betaw30_d1 - absq30D when '0',
         betaw30_d1 + absq30D when others;

   betaw29 <= w29(64 downto 0) & "00"; -- multiplication by the radix
   sel29 <= betaw29(66 downto 61) & D_d1(62 downto 60);
   SelFunctionTable29: selFunction_Freq100_uid4
      port map ( X => sel29,
                 Y => q29_copy10);
   q29 <= q29_copy10; -- output copy to hold a pipeline register if needed

   with q29  select 
      absq29D <= 
         "000" & D_d1						 when "001" | "111", -- mult by 1
         "00" & D_d1 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q29(2)  select 
   w28<= betaw29 - absq29D when '0',
         betaw29 + absq29D when others;

   betaw28 <= w28(64 downto 0) & "00"; -- multiplication by the radix
   sel28 <= betaw28(66 downto 61) & D_d1(62 downto 60);
   SelFunctionTable28: selFunction_Freq100_uid4
      port map ( X => sel28,
                 Y => q28_copy11);
   q28 <= q28_copy11; -- output copy to hold a pipeline register if needed

   with q28  select 
      absq28D <= 
         "000" & D_d1						 when "001" | "111", -- mult by 1
         "00" & D_d1 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q28(2)  select 
   w27<= betaw28 - absq28D when '0',
         betaw28 + absq28D when others;

   betaw27 <= w27(64 downto 0) & "00"; -- multiplication by the radix
   sel27 <= betaw27(66 downto 61) & D_d1(62 downto 60);
   SelFunctionTable27: selFunction_Freq100_uid4
      port map ( X => sel27,
                 Y => q27_copy12);
   q27 <= q27_copy12; -- output copy to hold a pipeline register if needed

   with q27  select 
      absq27D <= 
         "000" & D_d1						 when "001" | "111", -- mult by 1
         "00" & D_d1 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q27(2)  select 
   w26<= betaw27 - absq27D when '0',
         betaw27 + absq27D when others;

   betaw26 <= w26(64 downto 0) & "00"; -- multiplication by the radix
   sel26 <= betaw26(66 downto 61) & D_d1(62 downto 60);
   SelFunctionTable26: selFunction_Freq100_uid4
      port map ( X => sel26,
                 Y => q26_copy13);
   q26 <= q26_copy13; -- output copy to hold a pipeline register if needed

   with q26  select 
      absq26D <= 
         "000" & D_d1						 when "001" | "111", -- mult by 1
         "00" & D_d1 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q26_d1(2)  select 
   w25<= betaw26_d1 - absq26D_d1 when '0',
         betaw26_d1 + absq26D_d1 when others;

   betaw25 <= w25(64 downto 0) & "00"; -- multiplication by the radix
   sel25 <= betaw25(66 downto 61) & D_d2(62 downto 60);
   SelFunctionTable25: selFunction_Freq100_uid4
      port map ( X => sel25,
                 Y => q25_copy14);
   q25 <= q25_copy14; -- output copy to hold a pipeline register if needed

   with q25  select 
      absq25D <= 
         "000" & D_d2						 when "001" | "111", -- mult by 1
         "00" & D_d2 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q25(2)  select 
   w24<= betaw25 - absq25D when '0',
         betaw25 + absq25D when others;

   betaw24 <= w24(64 downto 0) & "00"; -- multiplication by the radix
   sel24 <= betaw24(66 downto 61) & D_d2(62 downto 60);
   SelFunctionTable24: selFunction_Freq100_uid4
      port map ( X => sel24,
                 Y => q24_copy15);
   q24 <= q24_copy15; -- output copy to hold a pipeline register if needed

   with q24  select 
      absq24D <= 
         "000" & D_d2						 when "001" | "111", -- mult by 1
         "00" & D_d2 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q24(2)  select 
   w23<= betaw24 - absq24D when '0',
         betaw24 + absq24D when others;

   betaw23 <= w23(64 downto 0) & "00"; -- multiplication by the radix
   sel23 <= betaw23(66 downto 61) & D_d2(62 downto 60);
   SelFunctionTable23: selFunction_Freq100_uid4
      port map ( X => sel23,
                 Y => q23_copy16);
   q23 <= q23_copy16; -- output copy to hold a pipeline register if needed

   with q23  select 
      absq23D <= 
         "000" & D_d2						 when "001" | "111", -- mult by 1
         "00" & D_d2 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q23(2)  select 
   w22<= betaw23 - absq23D when '0',
         betaw23 + absq23D when others;

   betaw22 <= w22(64 downto 0) & "00"; -- multiplication by the radix
   sel22 <= betaw22(66 downto 61) & D_d2(62 downto 60);
   SelFunctionTable22: selFunction_Freq100_uid4
      port map ( X => sel22,
                 Y => q22_copy17);
   q22 <= q22_copy17; -- output copy to hold a pipeline register if needed

   with q22  select 
      absq22D <= 
         "000" & D_d2						 when "001" | "111", -- mult by 1
         "00" & D_d2 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q22_d1(2)  select 
   w21<= betaw22_d1 - absq22D_d1 when '0',
         betaw22_d1 + absq22D_d1 when others;

   betaw21 <= w21(64 downto 0) & "00"; -- multiplication by the radix
   sel21 <= betaw21(66 downto 61) & D_d3(62 downto 60);
   SelFunctionTable21: selFunction_Freq100_uid4
      port map ( X => sel21,
                 Y => q21_copy18);
   q21 <= q21_copy18; -- output copy to hold a pipeline register if needed

   with q21  select 
      absq21D <= 
         "000" & D_d3						 when "001" | "111", -- mult by 1
         "00" & D_d3 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q21(2)  select 
   w20<= betaw21 - absq21D when '0',
         betaw21 + absq21D when others;

   betaw20 <= w20(64 downto 0) & "00"; -- multiplication by the radix
   sel20 <= betaw20(66 downto 61) & D_d3(62 downto 60);
   SelFunctionTable20: selFunction_Freq100_uid4
      port map ( X => sel20,
                 Y => q20_copy19);
   q20 <= q20_copy19; -- output copy to hold a pipeline register if needed

   with q20  select 
      absq20D <= 
         "000" & D_d3						 when "001" | "111", -- mult by 1
         "00" & D_d3 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q20(2)  select 
   w19<= betaw20 - absq20D when '0',
         betaw20 + absq20D when others;

   betaw19 <= w19(64 downto 0) & "00"; -- multiplication by the radix
   sel19 <= betaw19(66 downto 61) & D_d3(62 downto 60);
   SelFunctionTable19: selFunction_Freq100_uid4
      port map ( X => sel19,
                 Y => q19_copy20);
   q19 <= q19_copy20; -- output copy to hold a pipeline register if needed

   with q19  select 
      absq19D <= 
         "000" & D_d3						 when "001" | "111", -- mult by 1
         "00" & D_d3 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q19(2)  select 
   w18<= betaw19 - absq19D when '0',
         betaw19 + absq19D when others;

   betaw18 <= w18(64 downto 0) & "00"; -- multiplication by the radix
   sel18 <= betaw18(66 downto 61) & D_d3(62 downto 60);
   SelFunctionTable18: selFunction_Freq100_uid4
      port map ( X => sel18,
                 Y => q18_copy21);
   q18 <= q18_copy21; -- output copy to hold a pipeline register if needed

   with q18  select 
      absq18D <= 
         "000" & D_d3						 when "001" | "111", -- mult by 1
         "00" & D_d3 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q18_d1(2)  select 
   w17<= betaw18_d1 - absq18D_d1 when '0',
         betaw18_d1 + absq18D_d1 when others;

   betaw17 <= w17(64 downto 0) & "00"; -- multiplication by the radix
   sel17 <= betaw17(66 downto 61) & D_d4(62 downto 60);
   SelFunctionTable17: selFunction_Freq100_uid4
      port map ( X => sel17,
                 Y => q17_copy22);
   q17 <= q17_copy22; -- output copy to hold a pipeline register if needed

   with q17  select 
      absq17D <= 
         "000" & D_d4						 when "001" | "111", -- mult by 1
         "00" & D_d4 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q17(2)  select 
   w16<= betaw17 - absq17D when '0',
         betaw17 + absq17D when others;

   betaw16 <= w16(64 downto 0) & "00"; -- multiplication by the radix
   sel16 <= betaw16(66 downto 61) & D_d4(62 downto 60);
   SelFunctionTable16: selFunction_Freq100_uid4
      port map ( X => sel16,
                 Y => q16_copy23);
   q16 <= q16_copy23; -- output copy to hold a pipeline register if needed

   with q16  select 
      absq16D <= 
         "000" & D_d4						 when "001" | "111", -- mult by 1
         "00" & D_d4 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q16(2)  select 
   w15<= betaw16 - absq16D when '0',
         betaw16 + absq16D when others;

   betaw15 <= w15(64 downto 0) & "00"; -- multiplication by the radix
   sel15 <= betaw15(66 downto 61) & D_d4(62 downto 60);
   SelFunctionTable15: selFunction_Freq100_uid4
      port map ( X => sel15,
                 Y => q15_copy24);
   q15 <= q15_copy24; -- output copy to hold a pipeline register if needed

   with q15  select 
      absq15D <= 
         "000" & D_d4						 when "001" | "111", -- mult by 1
         "00" & D_d4 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q15(2)  select 
   w14<= betaw15 - absq15D when '0',
         betaw15 + absq15D when others;

   betaw14 <= w14(64 downto 0) & "00"; -- multiplication by the radix
   sel14 <= betaw14(66 downto 61) & D_d4(62 downto 60);
   SelFunctionTable14: selFunction_Freq100_uid4
      port map ( X => sel14,
                 Y => q14_copy25);
   q14 <= q14_copy25; -- output copy to hold a pipeline register if needed

   with q14  select 
      absq14D <= 
         "000" & D_d4						 when "001" | "111", -- mult by 1
         "00" & D_d4 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q14(2)  select 
   w13<= betaw14 - absq14D when '0',
         betaw14 + absq14D when others;

   betaw13 <= w13(64 downto 0) & "00"; -- multiplication by the radix
   sel13 <= betaw13(66 downto 61) & D_d4(62 downto 60);
   SelFunctionTable13: selFunction_Freq100_uid4
      port map ( X => sel13,
                 Y => q13_copy26);
   q13 <= q13_copy26_d1; -- output copy to hold a pipeline register if needed

   with q13  select 
      absq13D <= 
         "000" & D_d5						 when "001" | "111", -- mult by 1
         "00" & D_d5 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q13(2)  select 
   w12<= betaw13_d1 - absq13D when '0',
         betaw13_d1 + absq13D when others;

   betaw12 <= w12(64 downto 0) & "00"; -- multiplication by the radix
   sel12 <= betaw12(66 downto 61) & D_d5(62 downto 60);
   SelFunctionTable12: selFunction_Freq100_uid4
      port map ( X => sel12,
                 Y => q12_copy27);
   q12 <= q12_copy27; -- output copy to hold a pipeline register if needed

   with q12  select 
      absq12D <= 
         "000" & D_d5						 when "001" | "111", -- mult by 1
         "00" & D_d5 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q12(2)  select 
   w11<= betaw12 - absq12D when '0',
         betaw12 + absq12D when others;

   betaw11 <= w11(64 downto 0) & "00"; -- multiplication by the radix
   sel11 <= betaw11(66 downto 61) & D_d5(62 downto 60);
   SelFunctionTable11: selFunction_Freq100_uid4
      port map ( X => sel11,
                 Y => q11_copy28);
   q11 <= q11_copy28; -- output copy to hold a pipeline register if needed

   with q11  select 
      absq11D <= 
         "000" & D_d5						 when "001" | "111", -- mult by 1
         "00" & D_d5 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q11(2)  select 
   w10<= betaw11 - absq11D when '0',
         betaw11 + absq11D when others;

   betaw10 <= w10(64 downto 0) & "00"; -- multiplication by the radix
   sel10 <= betaw10(66 downto 61) & D_d5(62 downto 60);
   SelFunctionTable10: selFunction_Freq100_uid4
      port map ( X => sel10,
                 Y => q10_copy29);
   q10 <= q10_copy29; -- output copy to hold a pipeline register if needed

   with q10  select 
      absq10D <= 
         "000" & D_d5						 when "001" | "111", -- mult by 1
         "00" & D_d5 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q10(2)  select 
   w9<= betaw10 - absq10D when '0',
         betaw10 + absq10D when others;

   betaw9 <= w9(64 downto 0) & "00"; -- multiplication by the radix
   sel9 <= betaw9(66 downto 61) & D_d5(62 downto 60);
   SelFunctionTable9: selFunction_Freq100_uid4
      port map ( X => sel9,
                 Y => q9_copy30);
   q9 <= q9_copy30; -- output copy to hold a pipeline register if needed

   with q9  select 
      absq9D <= 
         "000" & D_d5						 when "001" | "111", -- mult by 1
         "00" & D_d5 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q9_d1(2)  select 
   w8<= betaw9_d1 - absq9D_d1 when '0',
         betaw9_d1 + absq9D_d1 when others;

   betaw8 <= w8(64 downto 0) & "00"; -- multiplication by the radix
   sel8 <= betaw8(66 downto 61) & D_d6(62 downto 60);
   SelFunctionTable8: selFunction_Freq100_uid4
      port map ( X => sel8,
                 Y => q8_copy31);
   q8 <= q8_copy31; -- output copy to hold a pipeline register if needed

   with q8  select 
      absq8D <= 
         "000" & D_d6						 when "001" | "111", -- mult by 1
         "00" & D_d6 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q8(2)  select 
   w7<= betaw8 - absq8D when '0',
         betaw8 + absq8D when others;

   betaw7 <= w7(64 downto 0) & "00"; -- multiplication by the radix
   sel7 <= betaw7(66 downto 61) & D_d6(62 downto 60);
   SelFunctionTable7: selFunction_Freq100_uid4
      port map ( X => sel7,
                 Y => q7_copy32);
   q7 <= q7_copy32; -- output copy to hold a pipeline register if needed

   with q7  select 
      absq7D <= 
         "000" & D_d6						 when "001" | "111", -- mult by 1
         "00" & D_d6 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q7(2)  select 
   w6<= betaw7 - absq7D when '0',
         betaw7 + absq7D when others;

   betaw6 <= w6(64 downto 0) & "00"; -- multiplication by the radix
   sel6 <= betaw6(66 downto 61) & D_d6(62 downto 60);
   SelFunctionTable6: selFunction_Freq100_uid4
      port map ( X => sel6,
                 Y => q6_copy33);
   q6 <= q6_copy33; -- output copy to hold a pipeline register if needed

   with q6  select 
      absq6D <= 
         "000" & D_d6						 when "001" | "111", -- mult by 1
         "00" & D_d6 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q6(2)  select 
   w5<= betaw6 - absq6D when '0',
         betaw6 + absq6D when others;

   betaw5 <= w5(64 downto 0) & "00"; -- multiplication by the radix
   sel5 <= betaw5(66 downto 61) & D_d6(62 downto 60);
   SelFunctionTable5: selFunction_Freq100_uid4
      port map ( X => sel5,
                 Y => q5_copy34);
   q5 <= q5_copy34; -- output copy to hold a pipeline register if needed

   with q5  select 
      absq5D <= 
         "000" & D_d6						 when "001" | "111", -- mult by 1
         "00" & D_d6 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q5_d1(2)  select 
   w4<= betaw5_d1 - absq5D_d1 when '0',
         betaw5_d1 + absq5D_d1 when others;

   betaw4 <= w4(64 downto 0) & "00"; -- multiplication by the radix
   sel4 <= betaw4(66 downto 61) & D_d7(62 downto 60);
   SelFunctionTable4: selFunction_Freq100_uid4
      port map ( X => sel4,
                 Y => q4_copy35);
   q4 <= q4_copy35; -- output copy to hold a pipeline register if needed

   with q4  select 
      absq4D <= 
         "000" & D_d7						 when "001" | "111", -- mult by 1
         "00" & D_d7 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q4(2)  select 
   w3<= betaw4 - absq4D when '0',
         betaw4 + absq4D when others;

   betaw3 <= w3(64 downto 0) & "00"; -- multiplication by the radix
   sel3 <= betaw3(66 downto 61) & D_d7(62 downto 60);
   SelFunctionTable3: selFunction_Freq100_uid4
      port map ( X => sel3,
                 Y => q3_copy36);
   q3 <= q3_copy36; -- output copy to hold a pipeline register if needed

   with q3  select 
      absq3D <= 
         "000" & D_d7						 when "001" | "111", -- mult by 1
         "00" & D_d7 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q3(2)  select 
   w2<= betaw3 - absq3D when '0',
         betaw3 + absq3D when others;

   betaw2 <= w2(64 downto 0) & "00"; -- multiplication by the radix
   sel2 <= betaw2(66 downto 61) & D_d7(62 downto 60);
   SelFunctionTable2: selFunction_Freq100_uid4
      port map ( X => sel2,
                 Y => q2_copy37);
   q2 <= q2_copy37; -- output copy to hold a pipeline register if needed

   with q2  select 
      absq2D <= 
         "000" & D_d7						 when "001" | "111", -- mult by 1
         "00" & D_d7 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q2(2)  select 
   w1<= betaw2 - absq2D when '0',
         betaw2 + absq2D when others;

   betaw1 <= w1(64 downto 0) & "00"; -- multiplication by the radix
   sel1 <= betaw1(66 downto 61) & D_d7(62 downto 60);
   SelFunctionTable1: selFunction_Freq100_uid4
      port map ( X => sel1,
                 Y => q1_copy38);
   q1 <= q1_copy38; -- output copy to hold a pipeline register if needed

   with q1  select 
      absq1D <= 
         "000" & D_d7						 when "001" | "111", -- mult by 1
         "00" & D_d7 & "0"			   when "010" | "110", -- mult by 2
         (66 downto 0 => '0')	 when others;        -- mult by 0

   with q1_d1(2)  select 
   w0<= betaw1_d1 - absq1D_d1 when '0',
         betaw1_d1 + absq1D_d1 when others;

   wfinal <= w0(64 downto 0);
   qM0 <= wfinal(64); -- rounding bit is the sign of the remainder
   qP34 <=      q34(1 downto 0);
   qM34 <=      q34(2) & "0";
   qP33 <=      q33(1 downto 0);
   qM33 <=      q33(2) & "0";
   qP32 <=      q32(1 downto 0);
   qM32 <=      q32(2) & "0";
   qP31 <=      q31(1 downto 0);
   qM31 <=      q31(2) & "0";
   qP30 <=      q30(1 downto 0);
   qM30 <=      q30(2) & "0";
   qP29 <=      q29(1 downto 0);
   qM29 <=      q29(2) & "0";
   qP28 <=      q28(1 downto 0);
   qM28 <=      q28(2) & "0";
   qP27 <=      q27(1 downto 0);
   qM27 <=      q27(2) & "0";
   qP26 <=      q26(1 downto 0);
   qM26 <=      q26(2) & "0";
   qP25 <=      q25(1 downto 0);
   qM25 <=      q25(2) & "0";
   qP24 <=      q24(1 downto 0);
   qM24 <=      q24(2) & "0";
   qP23 <=      q23(1 downto 0);
   qM23 <=      q23(2) & "0";
   qP22 <=      q22(1 downto 0);
   qM22 <=      q22(2) & "0";
   qP21 <=      q21(1 downto 0);
   qM21 <=      q21(2) & "0";
   qP20 <=      q20(1 downto 0);
   qM20 <=      q20(2) & "0";
   qP19 <=      q19(1 downto 0);
   qM19 <=      q19(2) & "0";
   qP18 <=      q18(1 downto 0);
   qM18 <=      q18(2) & "0";
   qP17 <=      q17(1 downto 0);
   qM17 <=      q17(2) & "0";
   qP16 <=      q16(1 downto 0);
   qM16 <=      q16(2) & "0";
   qP15 <=      q15(1 downto 0);
   qM15 <=      q15(2) & "0";
   qP14 <=      q14(1 downto 0);
   qM14 <=      q14(2) & "0";
   qP13 <=      q13(1 downto 0);
   qM13 <=      q13(2) & "0";
   qP12 <=      q12(1 downto 0);
   qM12 <=      q12(2) & "0";
   qP11 <=      q11(1 downto 0);
   qM11 <=      q11(2) & "0";
   qP10 <=      q10(1 downto 0);
   qM10 <=      q10(2) & "0";
   qP9 <=      q9(1 downto 0);
   qM9 <=      q9(2) & "0";
   qP8 <=      q8(1 downto 0);
   qM8 <=      q8(2) & "0";
   qP7 <=      q7(1 downto 0);
   qM7 <=      q7(2) & "0";
   qP6 <=      q6(1 downto 0);
   qM6 <=      q6(2) & "0";
   qP5 <=      q5(1 downto 0);
   qM5 <=      q5(2) & "0";
   qP4 <=      q4(1 downto 0);
   qM4 <=      q4(2) & "0";
   qP3 <=      q3(1 downto 0);
   qM3 <=      q3(2) & "0";
   qP2 <=      q2(1 downto 0);
   qM2 <=      q2(2) & "0";
   qP1 <=      q1(1 downto 0);
   qM1 <=      q1(2) & "0";
   qP <= qP34_d7 & qP33_d7 & qP32_d7 & qP31_d7 & qP30_d6 & qP29_d6 & qP28_d6 & qP27_d6 & qP26_d6 & qP25_d5 & qP24_d5 & qP23_d5 & qP22_d5 & qP21_d4 & qP20_d4 & qP19_d4 & qP18_d4 & qP17_d3 & qP16_d3 & qP15_d3 & qP14_d3 & qP13_d2 & qP12_d2 & qP11_d2 & qP10_d2 & qP9_d2 & qP8_d1 & qP7_d1 & qP6_d1 & qP5_d1 & qP4 & qP3 & qP2 & qP1;
   qM <= qM34_d8(0) & qM33_d8 & qM32_d8 & qM31_d8 & qM30_d7 & qM29_d7 & qM28_d7 & qM27_d7 & qM26_d7 & qM25_d6 & qM24_d6 & qM23_d6 & qM22_d6 & qM21_d5 & qM20_d5 & qM19_d5 & qM18_d5 & qM17_d4 & qM16_d4 & qM15_d4 & qM14_d4 & qM13_d3 & qM12_d3 & qM11_d3 & qM10_d3 & qM9_d3 & qM8_d2 & qM7_d2 & qM6_d2 & qM5_d2 & qM4_d1 & qM3_d1 & qM2_d1 & qM1_d1 & qM0;
   quotient <= qP_d1 - qM;
   -- We need a mR in (0, -wf-2) format: 1+wF fraction bits, 1 round bit, and 1 guard bit for the normalisation,
   -- quotient is the truncation of the exact quotient to at least 2^(-wF-2) bits
   -- now discarding its possible known MSB zeroes, and dropping the possible extra LSB bit (due to radix 4) 
   mR <= quotient(66 downto 1); 
   -- normalisation
   fRnorm <=    mR(64 downto 1)  when mR(65)= '1'
           else mR(63 downto 0);  -- now fRnorm is a (-1, -wF-1) fraction
   round <= fRnorm(0); 
   expR1 <= expR0_d8 + ("000" & (13 downto 1 => '1') & mR(65)); -- add back bias
   -- final rounding
   expfrac <= expR1 & fRnorm(63 downto 1) ;
   expfracR <= expfrac + ((79 downto 1 => '0') & round);
   exnR <=      "00"  when expfracR(79) = '1'   -- underflow
           else "10"  when  expfracR(79 downto 78) =  "01" -- overflow
           else "01";      -- 00, normal case
   with exnR0_d8  select 
      exnRfinal <= 
         exnR   when "01", -- normal
         exnR0_d8  when others;
   R <= exnRfinal & sR_d8 & expfracR(77 downto 0);
end architecture;

