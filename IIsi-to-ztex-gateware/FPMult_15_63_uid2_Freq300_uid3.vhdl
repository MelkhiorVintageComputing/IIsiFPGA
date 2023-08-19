--------------------------------------------------------------------------------
--                       Compressor_23_3_Freq300_uid32
-- VHDL generated for Kintex7 @ 300MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 3.33333
-- Target frequency (MHz): 300
-- Input signals: X1 X0
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Compressor_23_3_Freq300_uid32 is
    port (X1 : in  std_logic_vector(1 downto 0);
          X0 : in  std_logic_vector(2 downto 0);
          R : out  std_logic_vector(2 downto 0)   );
end entity;

architecture arch of Compressor_23_3_Freq300_uid32 is
signal X :  std_logic_vector(4 downto 0);
signal R0 :  std_logic_vector(2 downto 0);
begin
   X <= X1 & X0 ;

   with X  select  R0 <= 
      "000" when "00000",
      "001" when "00001" | "00010" | "00100",
      "010" when "00011" | "00101" | "00110" | "01000" | "10000",
      "011" when "00111" | "01001" | "01010" | "01100" | "10001" | "10010" | "10100",
      "100" when "01011" | "01101" | "01110" | "10011" | "10101" | "10110" | "11000",
      "101" when "01111" | "10111" | "11001" | "11010" | "11100",
      "110" when "11011" | "11101" | "11110",
      "111" when "11111",
      "---" when others;
   R <= R0;
end architecture;

--------------------------------------------------------------------------------
--                        Compressor_3_2_Freq300_uid40
-- VHDL generated for Kintex7 @ 300MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 3.33333
-- Target frequency (MHz): 300
-- Input signals: X0
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Compressor_3_2_Freq300_uid40 is
    port (X0 : in  std_logic_vector(2 downto 0);
          R : out  std_logic_vector(1 downto 0)   );
end entity;

architecture arch of Compressor_3_2_Freq300_uid40 is
signal X :  std_logic_vector(2 downto 0);
signal R0 :  std_logic_vector(1 downto 0);
begin
   X <= X0 ;

   with X  select  R0 <= 
      "00" when "000",
      "01" when "001" | "010" | "100",
      "10" when "011" | "101" | "110",
      "11" when "111",
      "--" when others;
   R <= R0;
end architecture;

--------------------------------------------------------------------------------
--                       Compressor_14_3_Freq300_uid54
-- VHDL generated for Kintex7 @ 300MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 3.33333
-- Target frequency (MHz): 300
-- Input signals: X1 X0
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Compressor_14_3_Freq300_uid54 is
    port (X1 : in  std_logic_vector(0 downto 0);
          X0 : in  std_logic_vector(3 downto 0);
          R : out  std_logic_vector(2 downto 0)   );
end entity;

architecture arch of Compressor_14_3_Freq300_uid54 is
signal X :  std_logic_vector(4 downto 0);
signal R0 :  std_logic_vector(2 downto 0);
begin
   X <= X1 & X0 ;

   with X  select  R0 <= 
      "000" when "00000",
      "001" when "00001" | "00010" | "00100" | "01000",
      "010" when "00011" | "00101" | "00110" | "01001" | "01010" | "01100" | "10000",
      "011" when "00111" | "01011" | "01101" | "01110" | "10001" | "10010" | "10100" | "11000",
      "100" when "01111" | "10011" | "10101" | "10110" | "11001" | "11010" | "11100",
      "101" when "10111" | "11011" | "11101" | "11110",
      "110" when "11111",
      "---" when others;
   R <= R0;
end architecture;

--------------------------------------------------------------------------------
--                        Compressor_6_3_Freq300_uid90
-- VHDL generated for Kintex7 @ 300MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 3.33333
-- Target frequency (MHz): 300
-- Input signals: X0
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Compressor_6_3_Freq300_uid90 is
    port (X0 : in  std_logic_vector(5 downto 0);
          R : out  std_logic_vector(2 downto 0)   );
end entity;

architecture arch of Compressor_6_3_Freq300_uid90 is
signal X :  std_logic_vector(5 downto 0);
signal R0 :  std_logic_vector(2 downto 0);
begin
   X <= X0 ;

   with X  select  R0 <= 
      "000" when "000000",
      "001" when "000001" | "000010" | "000100" | "001000" | "010000" | "100000",
      "010" when "000011" | "000101" | "000110" | "001001" | "001010" | "001100" | "010001" | "010010" | "010100" | "011000" | "100001" | "100010" | "100100" | "101000" | "110000",
      "011" when "000111" | "001011" | "001101" | "001110" | "010011" | "010101" | "010110" | "011001" | "011010" | "011100" | "100011" | "100101" | "100110" | "101001" | "101010" | "101100" | "110001" | "110010" | "110100" | "111000",
      "100" when "001111" | "010111" | "011011" | "011101" | "011110" | "100111" | "101011" | "101101" | "101110" | "110011" | "110101" | "110110" | "111001" | "111010" | "111100",
      "101" when "011111" | "101111" | "110111" | "111011" | "111101" | "111110",
      "110" when "111111",
      "---" when others;
   R <= R0;
end architecture;

--------------------------------------------------------------------------------
--                        DSPBlock_24x17_Freq300_uid9
-- VHDL generated for Kintex7 @ 300MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 3.33333
-- Target frequency (MHz): 300
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity DSPBlock_24x17_Freq300_uid9 is
    port (clk : in std_logic;
          X : in  std_logic_vector(23 downto 0);
          Y : in  std_logic_vector(16 downto 0);
          R : out  std_logic_vector(40 downto 0)   );
end entity;

architecture arch of DSPBlock_24x17_Freq300_uid9 is
signal Mint :  std_logic_vector(40 downto 0);
signal M :  std_logic_vector(40 downto 0);
signal Rtmp :  std_logic_vector(40 downto 0);
begin
   Mint <= std_logic_vector(unsigned(X) * unsigned(Y)); -- multiplier
   M <= Mint(40 downto 0);
   Rtmp <= M;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                        DSPBlock_24x17_Freq300_uid11
-- VHDL generated for Kintex7 @ 300MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 3.33333
-- Target frequency (MHz): 300
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity DSPBlock_24x17_Freq300_uid11 is
    port (clk : in std_logic;
          X : in  std_logic_vector(23 downto 0);
          Y : in  std_logic_vector(16 downto 0);
          R : out  std_logic_vector(40 downto 0)   );
end entity;

architecture arch of DSPBlock_24x17_Freq300_uid11 is
signal Mint :  std_logic_vector(40 downto 0);
signal M :  std_logic_vector(40 downto 0);
signal Rtmp :  std_logic_vector(40 downto 0);
begin
   Mint <= std_logic_vector(unsigned(X) * unsigned(Y)); -- multiplier
   M <= Mint(40 downto 0);
   Rtmp <= M;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                        DSPBlock_24x17_Freq300_uid13
-- VHDL generated for Kintex7 @ 300MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 3.33333
-- Target frequency (MHz): 300
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity DSPBlock_24x17_Freq300_uid13 is
    port (clk : in std_logic;
          X : in  std_logic_vector(23 downto 0);
          Y : in  std_logic_vector(16 downto 0);
          R : out  std_logic_vector(40 downto 0)   );
end entity;

architecture arch of DSPBlock_24x17_Freq300_uid13 is
signal Mint :  std_logic_vector(40 downto 0);
signal M :  std_logic_vector(40 downto 0);
signal Rtmp :  std_logic_vector(40 downto 0);
begin
   Mint <= std_logic_vector(unsigned(X) * unsigned(Y)); -- multiplier
   M <= Mint(40 downto 0);
   Rtmp <= M;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                        DSPBlock_24x17_Freq300_uid15
-- VHDL generated for Kintex7 @ 300MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 3.33333
-- Target frequency (MHz): 300
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity DSPBlock_24x17_Freq300_uid15 is
    port (clk : in std_logic;
          X : in  std_logic_vector(23 downto 0);
          Y : in  std_logic_vector(16 downto 0);
          R : out  std_logic_vector(40 downto 0)   );
end entity;

architecture arch of DSPBlock_24x17_Freq300_uid15 is
signal Mint :  std_logic_vector(40 downto 0);
signal M :  std_logic_vector(40 downto 0);
signal Rtmp :  std_logic_vector(40 downto 0);
begin
   Mint <= std_logic_vector(unsigned(X) * unsigned(Y)); -- multiplier
   M <= Mint(40 downto 0);
   Rtmp <= M;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                        DSPBlock_24x17_Freq300_uid17
-- VHDL generated for Kintex7 @ 300MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 3.33333
-- Target frequency (MHz): 300
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity DSPBlock_24x17_Freq300_uid17 is
    port (clk : in std_logic;
          X : in  std_logic_vector(23 downto 0);
          Y : in  std_logic_vector(16 downto 0);
          R : out  std_logic_vector(40 downto 0)   );
end entity;

architecture arch of DSPBlock_24x17_Freq300_uid17 is
signal Mint :  std_logic_vector(40 downto 0);
signal M :  std_logic_vector(40 downto 0);
signal Rtmp :  std_logic_vector(40 downto 0);
begin
   Mint <= std_logic_vector(unsigned(X) * unsigned(Y)); -- multiplier
   M <= Mint(40 downto 0);
   Rtmp <= M;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                        DSPBlock_24x17_Freq300_uid19
-- VHDL generated for Kintex7 @ 300MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 3.33333
-- Target frequency (MHz): 300
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity DSPBlock_24x17_Freq300_uid19 is
    port (clk : in std_logic;
          X : in  std_logic_vector(23 downto 0);
          Y : in  std_logic_vector(16 downto 0);
          R : out  std_logic_vector(40 downto 0)   );
end entity;

architecture arch of DSPBlock_24x17_Freq300_uid19 is
signal Mint :  std_logic_vector(40 downto 0);
signal M :  std_logic_vector(40 downto 0);
signal Rtmp :  std_logic_vector(40 downto 0);
begin
   Mint <= std_logic_vector(unsigned(X) * unsigned(Y)); -- multiplier
   M <= Mint(40 downto 0);
   Rtmp <= M;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                        DSPBlock_16x17_Freq300_uid21
-- VHDL generated for Kintex7 @ 300MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 3.33333
-- Target frequency (MHz): 300
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity DSPBlock_16x17_Freq300_uid21 is
    port (clk : in std_logic;
          X : in  std_logic_vector(15 downto 0);
          Y : in  std_logic_vector(16 downto 0);
          R : out  std_logic_vector(32 downto 0)   );
end entity;

architecture arch of DSPBlock_16x17_Freq300_uid21 is
signal Mint :  std_logic_vector(32 downto 0);
signal M :  std_logic_vector(32 downto 0);
signal Rtmp :  std_logic_vector(32 downto 0);
begin
   Mint <= std_logic_vector(unsigned(X) * unsigned(Y)); -- multiplier
   M <= Mint(32 downto 0);
   Rtmp <= M;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                        DSPBlock_16x24_Freq300_uid23
-- VHDL generated for Kintex7 @ 300MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 3.33333
-- Target frequency (MHz): 300
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity DSPBlock_16x24_Freq300_uid23 is
    port (clk : in std_logic;
          X : in  std_logic_vector(15 downto 0);
          Y : in  std_logic_vector(23 downto 0);
          R : out  std_logic_vector(39 downto 0)   );
end entity;

architecture arch of DSPBlock_16x24_Freq300_uid23 is
signal Mint :  std_logic_vector(39 downto 0);
signal M :  std_logic_vector(39 downto 0);
signal Rtmp :  std_logic_vector(39 downto 0);
begin
   Mint <= std_logic_vector(unsigned(X) * unsigned(Y)); -- multiplier
   M <= Mint(39 downto 0);
   Rtmp <= M;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                        DSPBlock_24x13_Freq300_uid25
-- VHDL generated for Kintex7 @ 300MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 3.33333
-- Target frequency (MHz): 300
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity DSPBlock_24x13_Freq300_uid25 is
    port (clk : in std_logic;
          X : in  std_logic_vector(23 downto 0);
          Y : in  std_logic_vector(12 downto 0);
          R : out  std_logic_vector(36 downto 0)   );
end entity;

architecture arch of DSPBlock_24x13_Freq300_uid25 is
signal Mint :  std_logic_vector(36 downto 0);
signal M :  std_logic_vector(36 downto 0);
signal Rtmp :  std_logic_vector(36 downto 0);
begin
   Mint <= std_logic_vector(unsigned(X) * unsigned(Y)); -- multiplier
   M <= Mint(36 downto 0);
   Rtmp <= M;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                        DSPBlock_24x13_Freq300_uid27
-- VHDL generated for Kintex7 @ 300MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 3.33333
-- Target frequency (MHz): 300
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity DSPBlock_24x13_Freq300_uid27 is
    port (clk : in std_logic;
          X : in  std_logic_vector(23 downto 0);
          Y : in  std_logic_vector(12 downto 0);
          R : out  std_logic_vector(36 downto 0)   );
end entity;

architecture arch of DSPBlock_24x13_Freq300_uid27 is
signal Mint :  std_logic_vector(36 downto 0);
signal M :  std_logic_vector(36 downto 0);
signal Rtmp :  std_logic_vector(36 downto 0);
begin
   Mint <= std_logic_vector(unsigned(X) * unsigned(Y)); -- multiplier
   M <= Mint(36 downto 0);
   Rtmp <= M;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                        DSPBlock_16x23_Freq300_uid29
-- VHDL generated for Kintex7 @ 300MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 3.33333
-- Target frequency (MHz): 300
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity DSPBlock_16x23_Freq300_uid29 is
    port (clk : in std_logic;
          X : in  std_logic_vector(15 downto 0);
          Y : in  std_logic_vector(22 downto 0);
          R : out  std_logic_vector(38 downto 0)   );
end entity;

architecture arch of DSPBlock_16x23_Freq300_uid29 is
signal Mint :  std_logic_vector(38 downto 0);
signal M :  std_logic_vector(38 downto 0);
signal Rtmp :  std_logic_vector(38 downto 0);
begin
   Mint <= std_logic_vector(unsigned(X) * unsigned(Y)); -- multiplier
   M <= Mint(38 downto 0);
   Rtmp <= M;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                        IntAdder_106_Freq300_uid392
-- VHDL generated for Kintex7 @ 300MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2016)
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles
-- Clock period (ns): 3.33333
-- Target frequency (MHz): 300
-- Input signals: X Y Cin
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_106_Freq300_uid392 is
    port (clk : in std_logic;
          X : in  std_logic_vector(105 downto 0);
          Y : in  std_logic_vector(105 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(105 downto 0)   );
end entity;

architecture arch of IntAdder_106_Freq300_uid392 is
signal Rtmp :  std_logic_vector(105 downto 0);
signal X_d1 :  std_logic_vector(105 downto 0);
signal Y_d1 :  std_logic_vector(105 downto 0);
signal Cin_d1 :  std_logic;
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            X_d1 <=  X;
            Y_d1 <=  Y;
            Cin_d1 <=  Cin;
         end if;
      end process;
   Rtmp <= X_d1 + Y_d1 + Cin_d1;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                         IntMultiplier_Freq300_uid5
-- VHDL generated for Kintex7 @ 300MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Martin Kumm, Florent de Dinechin, Kinga Illyes, Bogdan Popa, Bogdan Pasca, 2012
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles
-- Clock period (ns): 3.33333
-- Target frequency (MHz): 300
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity IntMultiplier_Freq300_uid5 is
    port (clk : in std_logic;
          X : in  std_logic_vector(63 downto 0);
          Y : in  std_logic_vector(63 downto 0);
          R : out  std_logic_vector(127 downto 0)   );
end entity;

architecture arch of IntMultiplier_Freq300_uid5 is
   component DSPBlock_24x17_Freq300_uid9 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(23 downto 0);
             Y : in  std_logic_vector(16 downto 0);
             R : out  std_logic_vector(40 downto 0)   );
   end component;

   component DSPBlock_24x17_Freq300_uid11 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(23 downto 0);
             Y : in  std_logic_vector(16 downto 0);
             R : out  std_logic_vector(40 downto 0)   );
   end component;

   component DSPBlock_24x17_Freq300_uid13 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(23 downto 0);
             Y : in  std_logic_vector(16 downto 0);
             R : out  std_logic_vector(40 downto 0)   );
   end component;

   component DSPBlock_24x17_Freq300_uid15 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(23 downto 0);
             Y : in  std_logic_vector(16 downto 0);
             R : out  std_logic_vector(40 downto 0)   );
   end component;

   component DSPBlock_24x17_Freq300_uid17 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(23 downto 0);
             Y : in  std_logic_vector(16 downto 0);
             R : out  std_logic_vector(40 downto 0)   );
   end component;

   component DSPBlock_24x17_Freq300_uid19 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(23 downto 0);
             Y : in  std_logic_vector(16 downto 0);
             R : out  std_logic_vector(40 downto 0)   );
   end component;

   component DSPBlock_16x17_Freq300_uid21 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(15 downto 0);
             Y : in  std_logic_vector(16 downto 0);
             R : out  std_logic_vector(32 downto 0)   );
   end component;

   component DSPBlock_16x24_Freq300_uid23 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(15 downto 0);
             Y : in  std_logic_vector(23 downto 0);
             R : out  std_logic_vector(39 downto 0)   );
   end component;

   component DSPBlock_24x13_Freq300_uid25 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(23 downto 0);
             Y : in  std_logic_vector(12 downto 0);
             R : out  std_logic_vector(36 downto 0)   );
   end component;

   component DSPBlock_24x13_Freq300_uid27 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(23 downto 0);
             Y : in  std_logic_vector(12 downto 0);
             R : out  std_logic_vector(36 downto 0)   );
   end component;

   component DSPBlock_16x23_Freq300_uid29 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(15 downto 0);
             Y : in  std_logic_vector(22 downto 0);
             R : out  std_logic_vector(38 downto 0)   );
   end component;

   component Compressor_23_3_Freq300_uid32 is
      port ( X1 : in  std_logic_vector(1 downto 0);
             X0 : in  std_logic_vector(2 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component Compressor_3_2_Freq300_uid40 is
      port ( X0 : in  std_logic_vector(2 downto 0);
             R : out  std_logic_vector(1 downto 0)   );
   end component;

   component Compressor_14_3_Freq300_uid54 is
      port ( X1 : in  std_logic_vector(0 downto 0);
             X0 : in  std_logic_vector(3 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component Compressor_6_3_Freq300_uid90 is
      port ( X0 : in  std_logic_vector(5 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component IntAdder_106_Freq300_uid392 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(105 downto 0);
             Y : in  std_logic_vector(105 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(105 downto 0)   );
   end component;

signal XX_m6 :  std_logic_vector(63 downto 0);
signal YY_m6 :  std_logic_vector(63 downto 0);
signal tile_0_X :  std_logic_vector(23 downto 0);
signal tile_0_Y :  std_logic_vector(16 downto 0);
signal tile_0_output :  std_logic_vector(40 downto 0);
signal tile_0_filtered_output :  unsigned(40-0 downto 0);
signal bh7_w0_0 :  std_logic;
signal bh7_w1_0 :  std_logic;
signal bh7_w2_0 :  std_logic;
signal bh7_w3_0 :  std_logic;
signal bh7_w4_0 :  std_logic;
signal bh7_w5_0 :  std_logic;
signal bh7_w6_0 :  std_logic;
signal bh7_w7_0 :  std_logic;
signal bh7_w8_0 :  std_logic;
signal bh7_w9_0 :  std_logic;
signal bh7_w10_0 :  std_logic;
signal bh7_w11_0 :  std_logic;
signal bh7_w12_0 :  std_logic;
signal bh7_w13_0 :  std_logic;
signal bh7_w14_0 :  std_logic;
signal bh7_w15_0 :  std_logic;
signal bh7_w16_0 :  std_logic;
signal bh7_w17_0 :  std_logic;
signal bh7_w18_0 :  std_logic;
signal bh7_w19_0 :  std_logic;
signal bh7_w20_0 :  std_logic;
signal bh7_w21_0 :  std_logic;
signal bh7_w22_0 :  std_logic;
signal bh7_w23_0 :  std_logic;
signal bh7_w24_0 :  std_logic;
signal bh7_w25_0 :  std_logic;
signal bh7_w26_0 :  std_logic;
signal bh7_w27_0 :  std_logic;
signal bh7_w28_0 :  std_logic;
signal bh7_w29_0 :  std_logic;
signal bh7_w30_0 :  std_logic;
signal bh7_w31_0 :  std_logic;
signal bh7_w32_0 :  std_logic;
signal bh7_w33_0 :  std_logic;
signal bh7_w34_0 :  std_logic;
signal bh7_w35_0 :  std_logic;
signal bh7_w36_0 :  std_logic;
signal bh7_w37_0 :  std_logic;
signal bh7_w38_0 :  std_logic;
signal bh7_w39_0 :  std_logic;
signal bh7_w40_0 :  std_logic;
signal tile_1_X :  std_logic_vector(23 downto 0);
signal tile_1_Y :  std_logic_vector(16 downto 0);
signal tile_1_output :  std_logic_vector(40 downto 0);
signal tile_1_filtered_output :  unsigned(40-0 downto 0);
signal bh7_w17_1 :  std_logic;
signal bh7_w18_1 :  std_logic;
signal bh7_w19_1 :  std_logic;
signal bh7_w20_1 :  std_logic;
signal bh7_w21_1 :  std_logic;
signal bh7_w22_1 :  std_logic;
signal bh7_w23_1 :  std_logic;
signal bh7_w24_1 :  std_logic;
signal bh7_w25_1 :  std_logic;
signal bh7_w26_1 :  std_logic;
signal bh7_w27_1 :  std_logic;
signal bh7_w28_1 :  std_logic;
signal bh7_w29_1 :  std_logic;
signal bh7_w30_1 :  std_logic;
signal bh7_w31_1 :  std_logic;
signal bh7_w32_1 :  std_logic;
signal bh7_w33_1 :  std_logic;
signal bh7_w34_1 :  std_logic;
signal bh7_w35_1 :  std_logic;
signal bh7_w36_1 :  std_logic;
signal bh7_w37_1 :  std_logic;
signal bh7_w38_1 :  std_logic;
signal bh7_w39_1 :  std_logic;
signal bh7_w40_1 :  std_logic;
signal bh7_w41_0 :  std_logic;
signal bh7_w42_0 :  std_logic;
signal bh7_w43_0 :  std_logic;
signal bh7_w44_0 :  std_logic;
signal bh7_w45_0 :  std_logic;
signal bh7_w46_0 :  std_logic;
signal bh7_w47_0 :  std_logic;
signal bh7_w48_0 :  std_logic;
signal bh7_w49_0 :  std_logic;
signal bh7_w50_0 :  std_logic;
signal bh7_w51_0 :  std_logic;
signal bh7_w52_0 :  std_logic;
signal bh7_w53_0 :  std_logic;
signal bh7_w54_0 :  std_logic;
signal bh7_w55_0 :  std_logic;
signal bh7_w56_0 :  std_logic;
signal bh7_w57_0 :  std_logic;
signal tile_2_X :  std_logic_vector(23 downto 0);
signal tile_2_Y :  std_logic_vector(16 downto 0);
signal tile_2_output :  std_logic_vector(40 downto 0);
signal tile_2_filtered_output :  unsigned(40-0 downto 0);
signal bh7_w24_2 :  std_logic;
signal bh7_w25_2 :  std_logic;
signal bh7_w26_2 :  std_logic;
signal bh7_w27_2 :  std_logic;
signal bh7_w28_2 :  std_logic;
signal bh7_w29_2 :  std_logic;
signal bh7_w30_2 :  std_logic;
signal bh7_w31_2 :  std_logic;
signal bh7_w32_2 :  std_logic;
signal bh7_w33_2 :  std_logic;
signal bh7_w34_2 :  std_logic;
signal bh7_w35_2 :  std_logic;
signal bh7_w36_2 :  std_logic;
signal bh7_w37_2 :  std_logic;
signal bh7_w38_2 :  std_logic;
signal bh7_w39_2 :  std_logic;
signal bh7_w40_2 :  std_logic;
signal bh7_w41_1 :  std_logic;
signal bh7_w42_1 :  std_logic;
signal bh7_w43_1 :  std_logic;
signal bh7_w44_1 :  std_logic;
signal bh7_w45_1 :  std_logic;
signal bh7_w46_1 :  std_logic;
signal bh7_w47_1 :  std_logic;
signal bh7_w48_1 :  std_logic;
signal bh7_w49_1 :  std_logic;
signal bh7_w50_1 :  std_logic;
signal bh7_w51_1 :  std_logic;
signal bh7_w52_1 :  std_logic;
signal bh7_w53_1 :  std_logic;
signal bh7_w54_1 :  std_logic;
signal bh7_w55_1 :  std_logic;
signal bh7_w56_1 :  std_logic;
signal bh7_w57_1 :  std_logic;
signal bh7_w58_0 :  std_logic;
signal bh7_w59_0 :  std_logic;
signal bh7_w60_0 :  std_logic;
signal bh7_w61_0 :  std_logic;
signal bh7_w62_0 :  std_logic;
signal bh7_w63_0 :  std_logic;
signal bh7_w64_0 :  std_logic;
signal tile_3_X :  std_logic_vector(23 downto 0);
signal tile_3_Y :  std_logic_vector(16 downto 0);
signal tile_3_output :  std_logic_vector(40 downto 0);
signal tile_3_filtered_output :  unsigned(40-0 downto 0);
signal bh7_w41_2 :  std_logic;
signal bh7_w42_2 :  std_logic;
signal bh7_w43_2 :  std_logic;
signal bh7_w44_2 :  std_logic;
signal bh7_w45_2 :  std_logic;
signal bh7_w46_2 :  std_logic;
signal bh7_w47_2 :  std_logic;
signal bh7_w48_2 :  std_logic;
signal bh7_w49_2 :  std_logic;
signal bh7_w50_2 :  std_logic;
signal bh7_w51_2 :  std_logic;
signal bh7_w52_2 :  std_logic;
signal bh7_w53_2 :  std_logic;
signal bh7_w54_2 :  std_logic;
signal bh7_w55_2 :  std_logic;
signal bh7_w56_2 :  std_logic;
signal bh7_w57_2 :  std_logic;
signal bh7_w58_1 :  std_logic;
signal bh7_w59_1 :  std_logic;
signal bh7_w60_1 :  std_logic;
signal bh7_w61_1 :  std_logic;
signal bh7_w62_1 :  std_logic;
signal bh7_w63_1 :  std_logic;
signal bh7_w64_1 :  std_logic;
signal bh7_w65_0 :  std_logic;
signal bh7_w66_0 :  std_logic;
signal bh7_w67_0 :  std_logic;
signal bh7_w68_0 :  std_logic;
signal bh7_w69_0 :  std_logic;
signal bh7_w70_0 :  std_logic;
signal bh7_w71_0 :  std_logic;
signal bh7_w72_0 :  std_logic;
signal bh7_w73_0 :  std_logic;
signal bh7_w74_0 :  std_logic;
signal bh7_w75_0 :  std_logic;
signal bh7_w76_0 :  std_logic;
signal bh7_w77_0 :  std_logic;
signal bh7_w78_0 :  std_logic;
signal bh7_w79_0 :  std_logic;
signal bh7_w80_0 :  std_logic;
signal bh7_w81_0 :  std_logic;
signal tile_4_X :  std_logic_vector(23 downto 0);
signal tile_4_Y :  std_logic_vector(16 downto 0);
signal tile_4_output :  std_logic_vector(40 downto 0);
signal tile_4_filtered_output :  unsigned(40-0 downto 0);
signal bh7_w34_3 :  std_logic;
signal bh7_w35_3 :  std_logic;
signal bh7_w36_3 :  std_logic;
signal bh7_w37_3 :  std_logic;
signal bh7_w38_3 :  std_logic;
signal bh7_w39_3 :  std_logic;
signal bh7_w40_3 :  std_logic;
signal bh7_w41_3 :  std_logic;
signal bh7_w42_3 :  std_logic;
signal bh7_w43_3 :  std_logic;
signal bh7_w44_3 :  std_logic;
signal bh7_w45_3 :  std_logic;
signal bh7_w46_3 :  std_logic;
signal bh7_w47_3 :  std_logic;
signal bh7_w48_3 :  std_logic;
signal bh7_w49_3 :  std_logic;
signal bh7_w50_3 :  std_logic;
signal bh7_w51_3 :  std_logic;
signal bh7_w52_3 :  std_logic;
signal bh7_w53_3 :  std_logic;
signal bh7_w54_3 :  std_logic;
signal bh7_w55_3 :  std_logic;
signal bh7_w56_3 :  std_logic;
signal bh7_w57_3 :  std_logic;
signal bh7_w58_2 :  std_logic;
signal bh7_w59_2 :  std_logic;
signal bh7_w60_2 :  std_logic;
signal bh7_w61_2 :  std_logic;
signal bh7_w62_2 :  std_logic;
signal bh7_w63_2 :  std_logic;
signal bh7_w64_2 :  std_logic;
signal bh7_w65_1 :  std_logic;
signal bh7_w66_1 :  std_logic;
signal bh7_w67_1 :  std_logic;
signal bh7_w68_1 :  std_logic;
signal bh7_w69_1 :  std_logic;
signal bh7_w70_1 :  std_logic;
signal bh7_w71_1 :  std_logic;
signal bh7_w72_1 :  std_logic;
signal bh7_w73_1 :  std_logic;
signal bh7_w74_1 :  std_logic;
signal tile_5_X :  std_logic_vector(23 downto 0);
signal tile_5_Y :  std_logic_vector(16 downto 0);
signal tile_5_output :  std_logic_vector(40 downto 0);
signal tile_5_filtered_output :  unsigned(40-0 downto 0);
signal bh7_w58_3 :  std_logic;
signal bh7_w59_3 :  std_logic;
signal bh7_w60_3 :  std_logic;
signal bh7_w61_3 :  std_logic;
signal bh7_w62_3 :  std_logic;
signal bh7_w63_3 :  std_logic;
signal bh7_w64_3 :  std_logic;
signal bh7_w65_2 :  std_logic;
signal bh7_w66_2 :  std_logic;
signal bh7_w67_2 :  std_logic;
signal bh7_w68_2 :  std_logic;
signal bh7_w69_2 :  std_logic;
signal bh7_w70_2 :  std_logic;
signal bh7_w71_2 :  std_logic;
signal bh7_w72_2 :  std_logic;
signal bh7_w73_2 :  std_logic;
signal bh7_w74_2 :  std_logic;
signal bh7_w75_1 :  std_logic;
signal bh7_w76_1 :  std_logic;
signal bh7_w77_1 :  std_logic;
signal bh7_w78_1 :  std_logic;
signal bh7_w79_1 :  std_logic;
signal bh7_w80_1 :  std_logic;
signal bh7_w81_1 :  std_logic;
signal bh7_w82_0 :  std_logic;
signal bh7_w83_0 :  std_logic;
signal bh7_w84_0 :  std_logic;
signal bh7_w85_0 :  std_logic;
signal bh7_w86_0 :  std_logic;
signal bh7_w87_0 :  std_logic;
signal bh7_w88_0 :  std_logic;
signal bh7_w89_0 :  std_logic;
signal bh7_w90_0 :  std_logic;
signal bh7_w91_0 :  std_logic;
signal bh7_w92_0 :  std_logic;
signal bh7_w93_0 :  std_logic;
signal bh7_w94_0 :  std_logic;
signal bh7_w95_0 :  std_logic;
signal bh7_w96_0 :  std_logic;
signal bh7_w97_0 :  std_logic;
signal bh7_w98_0 :  std_logic;
signal tile_6_X :  std_logic_vector(15 downto 0);
signal tile_6_Y :  std_logic_vector(16 downto 0);
signal tile_6_output :  std_logic_vector(32 downto 0);
signal tile_6_filtered_output :  unsigned(32-0 downto 0);
signal bh7_w48_4 :  std_logic;
signal bh7_w49_4 :  std_logic;
signal bh7_w50_4 :  std_logic;
signal bh7_w51_4 :  std_logic;
signal bh7_w52_4 :  std_logic;
signal bh7_w53_4 :  std_logic;
signal bh7_w54_4 :  std_logic;
signal bh7_w55_4 :  std_logic;
signal bh7_w56_4 :  std_logic;
signal bh7_w57_4 :  std_logic;
signal bh7_w58_4 :  std_logic;
signal bh7_w59_4 :  std_logic;
signal bh7_w60_4 :  std_logic;
signal bh7_w61_4 :  std_logic;
signal bh7_w62_4 :  std_logic;
signal bh7_w63_4 :  std_logic;
signal bh7_w64_4 :  std_logic;
signal bh7_w65_3 :  std_logic;
signal bh7_w66_3 :  std_logic;
signal bh7_w67_3 :  std_logic;
signal bh7_w68_3 :  std_logic;
signal bh7_w69_3 :  std_logic;
signal bh7_w70_3 :  std_logic;
signal bh7_w71_3 :  std_logic;
signal bh7_w72_3 :  std_logic;
signal bh7_w73_3 :  std_logic;
signal bh7_w74_3 :  std_logic;
signal bh7_w75_2 :  std_logic;
signal bh7_w76_2 :  std_logic;
signal bh7_w77_2 :  std_logic;
signal bh7_w78_2 :  std_logic;
signal bh7_w79_2 :  std_logic;
signal bh7_w80_2 :  std_logic;
signal tile_7_X :  std_logic_vector(15 downto 0);
signal tile_7_Y :  std_logic_vector(23 downto 0);
signal tile_7_output :  std_logic_vector(39 downto 0);
signal tile_7_filtered_output :  unsigned(39-0 downto 0);
signal bh7_w65_4 :  std_logic;
signal bh7_w66_4 :  std_logic;
signal bh7_w67_4 :  std_logic;
signal bh7_w68_4 :  std_logic;
signal bh7_w69_4 :  std_logic;
signal bh7_w70_4 :  std_logic;
signal bh7_w71_4 :  std_logic;
signal bh7_w72_4 :  std_logic;
signal bh7_w73_4 :  std_logic;
signal bh7_w74_4 :  std_logic;
signal bh7_w75_3 :  std_logic;
signal bh7_w76_3 :  std_logic;
signal bh7_w77_3 :  std_logic;
signal bh7_w78_3 :  std_logic;
signal bh7_w79_3 :  std_logic;
signal bh7_w80_3 :  std_logic;
signal bh7_w81_2 :  std_logic;
signal bh7_w82_1 :  std_logic;
signal bh7_w83_1 :  std_logic;
signal bh7_w84_1 :  std_logic;
signal bh7_w85_1 :  std_logic;
signal bh7_w86_1 :  std_logic;
signal bh7_w87_1 :  std_logic;
signal bh7_w88_1 :  std_logic;
signal bh7_w89_1 :  std_logic;
signal bh7_w90_1 :  std_logic;
signal bh7_w91_1 :  std_logic;
signal bh7_w92_1 :  std_logic;
signal bh7_w93_1 :  std_logic;
signal bh7_w94_1 :  std_logic;
signal bh7_w95_1 :  std_logic;
signal bh7_w96_1 :  std_logic;
signal bh7_w97_1 :  std_logic;
signal bh7_w98_1 :  std_logic;
signal bh7_w99_0 :  std_logic;
signal bh7_w100_0 :  std_logic;
signal bh7_w101_0 :  std_logic;
signal bh7_w102_0 :  std_logic;
signal bh7_w103_0 :  std_logic;
signal bh7_w104_0 :  std_logic;
signal tile_8_X :  std_logic_vector(23 downto 0);
signal tile_8_Y :  std_logic_vector(12 downto 0);
signal tile_8_output :  std_logic_vector(36 downto 0);
signal tile_8_filtered_output :  unsigned(36-0 downto 0);
signal bh7_w51_5 :  std_logic;
signal bh7_w52_5 :  std_logic;
signal bh7_w53_5 :  std_logic;
signal bh7_w54_5 :  std_logic;
signal bh7_w55_5 :  std_logic;
signal bh7_w56_5 :  std_logic;
signal bh7_w57_5 :  std_logic;
signal bh7_w58_5 :  std_logic;
signal bh7_w59_5 :  std_logic;
signal bh7_w60_5 :  std_logic;
signal bh7_w61_5 :  std_logic;
signal bh7_w62_5 :  std_logic;
signal bh7_w63_5 :  std_logic;
signal bh7_w64_5 :  std_logic;
signal bh7_w65_5 :  std_logic;
signal bh7_w66_5 :  std_logic;
signal bh7_w67_5 :  std_logic;
signal bh7_w68_5 :  std_logic;
signal bh7_w69_5 :  std_logic;
signal bh7_w70_5 :  std_logic;
signal bh7_w71_5 :  std_logic;
signal bh7_w72_5 :  std_logic;
signal bh7_w73_5 :  std_logic;
signal bh7_w74_5 :  std_logic;
signal bh7_w75_4 :  std_logic;
signal bh7_w76_4 :  std_logic;
signal bh7_w77_4 :  std_logic;
signal bh7_w78_4 :  std_logic;
signal bh7_w79_4 :  std_logic;
signal bh7_w80_4 :  std_logic;
signal bh7_w81_3 :  std_logic;
signal bh7_w82_2 :  std_logic;
signal bh7_w83_2 :  std_logic;
signal bh7_w84_2 :  std_logic;
signal bh7_w85_2 :  std_logic;
signal bh7_w86_2 :  std_logic;
signal bh7_w87_2 :  std_logic;
signal tile_9_X :  std_logic_vector(23 downto 0);
signal tile_9_Y :  std_logic_vector(12 downto 0);
signal tile_9_output :  std_logic_vector(36 downto 0);
signal tile_9_filtered_output :  unsigned(36-0 downto 0);
signal bh7_w75_5 :  std_logic;
signal bh7_w76_5 :  std_logic;
signal bh7_w77_5 :  std_logic;
signal bh7_w78_5 :  std_logic;
signal bh7_w79_5 :  std_logic;
signal bh7_w80_5 :  std_logic;
signal bh7_w81_4 :  std_logic;
signal bh7_w82_3 :  std_logic;
signal bh7_w83_3 :  std_logic;
signal bh7_w84_3 :  std_logic;
signal bh7_w85_3 :  std_logic;
signal bh7_w86_3 :  std_logic;
signal bh7_w87_3 :  std_logic;
signal bh7_w88_2 :  std_logic;
signal bh7_w89_2 :  std_logic;
signal bh7_w90_2 :  std_logic;
signal bh7_w91_2 :  std_logic;
signal bh7_w92_2 :  std_logic;
signal bh7_w93_2 :  std_logic;
signal bh7_w94_2 :  std_logic;
signal bh7_w95_2 :  std_logic;
signal bh7_w96_2 :  std_logic;
signal bh7_w97_2 :  std_logic;
signal bh7_w98_2 :  std_logic;
signal bh7_w99_1 :  std_logic;
signal bh7_w100_1 :  std_logic;
signal bh7_w101_1 :  std_logic;
signal bh7_w102_1 :  std_logic;
signal bh7_w103_1 :  std_logic;
signal bh7_w104_1 :  std_logic;
signal bh7_w105_0 :  std_logic;
signal bh7_w106_0 :  std_logic;
signal bh7_w107_0 :  std_logic;
signal bh7_w108_0 :  std_logic;
signal bh7_w109_0 :  std_logic;
signal bh7_w110_0 :  std_logic;
signal bh7_w111_0 :  std_logic;
signal tile_10_X :  std_logic_vector(15 downto 0);
signal tile_10_Y :  std_logic_vector(22 downto 0);
signal tile_10_output :  std_logic_vector(38 downto 0);
signal tile_10_filtered_output :  unsigned(38-0 downto 0);
signal bh7_w89_3 :  std_logic;
signal bh7_w90_3 :  std_logic;
signal bh7_w91_3 :  std_logic;
signal bh7_w92_3 :  std_logic;
signal bh7_w93_3 :  std_logic;
signal bh7_w94_3 :  std_logic;
signal bh7_w95_3 :  std_logic;
signal bh7_w96_3 :  std_logic;
signal bh7_w97_3 :  std_logic;
signal bh7_w98_3 :  std_logic;
signal bh7_w99_2 :  std_logic;
signal bh7_w100_2 :  std_logic;
signal bh7_w101_2 :  std_logic;
signal bh7_w102_2 :  std_logic;
signal bh7_w103_2 :  std_logic;
signal bh7_w104_2 :  std_logic;
signal bh7_w105_1 :  std_logic;
signal bh7_w106_1 :  std_logic;
signal bh7_w107_1 :  std_logic;
signal bh7_w108_1 :  std_logic;
signal bh7_w109_1 :  std_logic;
signal bh7_w110_1 :  std_logic;
signal bh7_w111_1 :  std_logic;
signal bh7_w112_0 :  std_logic;
signal bh7_w113_0 :  std_logic;
signal bh7_w114_0 :  std_logic;
signal bh7_w115_0 :  std_logic;
signal bh7_w116_0 :  std_logic;
signal bh7_w117_0 :  std_logic;
signal bh7_w118_0 :  std_logic;
signal bh7_w119_0 :  std_logic;
signal bh7_w120_0 :  std_logic;
signal bh7_w121_0 :  std_logic;
signal bh7_w122_0 :  std_logic;
signal bh7_w123_0 :  std_logic;
signal bh7_w124_0 :  std_logic;
signal bh7_w125_0 :  std_logic;
signal bh7_w126_0 :  std_logic;
signal bh7_w127_0 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid33_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid33_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid33_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w17_2 :  std_logic;
signal bh7_w18_2 :  std_logic;
signal bh7_w19_2 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid33_Out0_copy34 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid35_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid35_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid35_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w19_3 :  std_logic;
signal bh7_w20_2 :  std_logic;
signal bh7_w21_2 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid35_Out0_copy36 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid37_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid37_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid37_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w21_3 :  std_logic;
signal bh7_w22_2 :  std_logic;
signal bh7_w23_2 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid37_Out0_copy38 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid41_In0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid41_Out0 :  std_logic_vector(1 downto 0);
signal bh7_w23_3 :  std_logic;
signal bh7_w24_3 :  std_logic;
signal Compressor_3_2_Freq300_uid40_bh7_uid41_Out0_copy42 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid43_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid43_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid43_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w24_4 :  std_logic;
signal bh7_w25_3 :  std_logic;
signal bh7_w26_3 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid43_Out0_copy44 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid45_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid45_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid45_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w26_4 :  std_logic;
signal bh7_w27_3 :  std_logic;
signal bh7_w28_3 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid45_Out0_copy46 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid47_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid47_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid47_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w28_4 :  std_logic;
signal bh7_w29_3 :  std_logic;
signal bh7_w30_3 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid47_Out0_copy48 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid49_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid49_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid49_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w30_4 :  std_logic;
signal bh7_w31_3 :  std_logic;
signal bh7_w32_3 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid49_Out0_copy50 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid51_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid51_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid51_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w32_4 :  std_logic;
signal bh7_w33_3 :  std_logic;
signal bh7_w34_4 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid51_Out0_copy52 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid55_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid55_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid55_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w34_5 :  std_logic;
signal bh7_w35_4 :  std_logic;
signal bh7_w36_4 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid55_Out0_copy56 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid57_In0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid57_Out0 :  std_logic_vector(1 downto 0);
signal bh7_w35_5 :  std_logic;
signal bh7_w36_5 :  std_logic;
signal Compressor_3_2_Freq300_uid40_bh7_uid57_Out0_copy58 :  std_logic_vector(1 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid59_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid59_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid59_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w36_6 :  std_logic;
signal bh7_w37_4 :  std_logic;
signal bh7_w38_4 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid59_Out0_copy60 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid61_In0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid61_Out0 :  std_logic_vector(1 downto 0);
signal bh7_w37_5 :  std_logic;
signal bh7_w38_5 :  std_logic;
signal Compressor_3_2_Freq300_uid40_bh7_uid61_Out0_copy62 :  std_logic_vector(1 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid63_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid63_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid63_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w38_6 :  std_logic;
signal bh7_w39_4 :  std_logic;
signal bh7_w40_4 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid63_Out0_copy64 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid65_In0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid65_Out0 :  std_logic_vector(1 downto 0);
signal bh7_w39_5 :  std_logic;
signal bh7_w40_5 :  std_logic;
signal Compressor_3_2_Freq300_uid40_bh7_uid65_Out0_copy66 :  std_logic_vector(1 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid67_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid67_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid67_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w40_6 :  std_logic;
signal bh7_w41_4 :  std_logic;
signal bh7_w42_4 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid67_Out0_copy68 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid69_In0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid69_Out0 :  std_logic_vector(1 downto 0);
signal bh7_w41_5 :  std_logic;
signal bh7_w42_5 :  std_logic;
signal Compressor_3_2_Freq300_uid40_bh7_uid69_Out0_copy70 :  std_logic_vector(1 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid71_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid71_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid71_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w42_6 :  std_logic;
signal bh7_w43_4 :  std_logic;
signal bh7_w44_4 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid71_Out0_copy72 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid73_In0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid73_Out0 :  std_logic_vector(1 downto 0);
signal bh7_w43_5 :  std_logic;
signal bh7_w44_5 :  std_logic;
signal Compressor_3_2_Freq300_uid40_bh7_uid73_Out0_copy74 :  std_logic_vector(1 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid75_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid75_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid75_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w44_6 :  std_logic;
signal bh7_w45_4 :  std_logic;
signal bh7_w46_4 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid75_Out0_copy76 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid77_In0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid77_Out0 :  std_logic_vector(1 downto 0);
signal bh7_w45_5 :  std_logic;
signal bh7_w46_5 :  std_logic;
signal Compressor_3_2_Freq300_uid40_bh7_uid77_Out0_copy78 :  std_logic_vector(1 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid79_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid79_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid79_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w46_6 :  std_logic;
signal bh7_w47_4 :  std_logic;
signal bh7_w48_5 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid79_Out0_copy80 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid81_In0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid81_Out0 :  std_logic_vector(1 downto 0);
signal bh7_w47_5 :  std_logic;
signal bh7_w48_6 :  std_logic;
signal Compressor_3_2_Freq300_uid40_bh7_uid81_Out0_copy82 :  std_logic_vector(1 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid83_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid83_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid83_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w48_7 :  std_logic;
signal bh7_w49_5 :  std_logic;
signal bh7_w50_5 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid83_Out0_copy84 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid85_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid85_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid85_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w49_6 :  std_logic;
signal bh7_w50_6 :  std_logic;
signal bh7_w51_6 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid85_Out0_copy86 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid87_In0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid87_Out0 :  std_logic_vector(1 downto 0);
signal bh7_w50_7 :  std_logic;
signal bh7_w51_7 :  std_logic;
signal Compressor_3_2_Freq300_uid40_bh7_uid87_Out0_copy88 :  std_logic_vector(1 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid91_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid91_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w51_8 :  std_logic;
signal bh7_w52_6 :  std_logic;
signal bh7_w53_6 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid91_Out0_copy92 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid93_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid93_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w52_7 :  std_logic;
signal bh7_w53_7 :  std_logic;
signal bh7_w54_6 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid93_Out0_copy94 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid95_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid95_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w53_8 :  std_logic;
signal bh7_w54_7 :  std_logic;
signal bh7_w55_6 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid95_Out0_copy96 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid97_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid97_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w54_8 :  std_logic;
signal bh7_w55_7 :  std_logic;
signal bh7_w56_6 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid97_Out0_copy98 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid99_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid99_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w55_8 :  std_logic;
signal bh7_w56_7 :  std_logic;
signal bh7_w57_6 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid99_Out0_copy100 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid101_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid101_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w56_8 :  std_logic;
signal bh7_w57_7 :  std_logic;
signal bh7_w58_6 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid101_Out0_copy102 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid103_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid103_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w57_8 :  std_logic;
signal bh7_w58_7 :  std_logic;
signal bh7_w59_6 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid103_Out0_copy104 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid105_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid105_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w58_8 :  std_logic;
signal bh7_w59_7 :  std_logic;
signal bh7_w60_6 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid105_Out0_copy106 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid107_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid107_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w59_8 :  std_logic;
signal bh7_w60_7 :  std_logic;
signal bh7_w61_6 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid107_Out0_copy108 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid109_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid109_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w60_8 :  std_logic;
signal bh7_w61_7 :  std_logic;
signal bh7_w62_6 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid109_Out0_copy110 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid111_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid111_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w61_8 :  std_logic;
signal bh7_w62_7 :  std_logic;
signal bh7_w63_6 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid111_Out0_copy112 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid113_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid113_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w62_8 :  std_logic;
signal bh7_w63_7 :  std_logic;
signal bh7_w64_6 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid113_Out0_copy114 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid115_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid115_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w63_8 :  std_logic;
signal bh7_w64_7 :  std_logic;
signal bh7_w65_6 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid115_Out0_copy116 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid117_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid117_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w64_8 :  std_logic;
signal bh7_w65_7 :  std_logic;
signal bh7_w66_6 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid117_Out0_copy118 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid119_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid119_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w65_8 :  std_logic;
signal bh7_w66_7 :  std_logic;
signal bh7_w67_6 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid119_Out0_copy120 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid121_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid121_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w66_8 :  std_logic;
signal bh7_w67_7 :  std_logic;
signal bh7_w68_6 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid121_Out0_copy122 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid123_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid123_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w67_8 :  std_logic;
signal bh7_w68_7 :  std_logic;
signal bh7_w69_6 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid123_Out0_copy124 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid125_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid125_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w68_8 :  std_logic;
signal bh7_w69_7 :  std_logic;
signal bh7_w70_6 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid125_Out0_copy126 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid127_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid127_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w69_8 :  std_logic;
signal bh7_w70_7 :  std_logic;
signal bh7_w71_6 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid127_Out0_copy128 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid129_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid129_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w70_8 :  std_logic;
signal bh7_w71_7 :  std_logic;
signal bh7_w72_6 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid129_Out0_copy130 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid131_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid131_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w71_8 :  std_logic;
signal bh7_w72_7 :  std_logic;
signal bh7_w73_6 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid131_Out0_copy132 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid133_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid133_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w72_8 :  std_logic;
signal bh7_w73_7 :  std_logic;
signal bh7_w74_6 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid133_Out0_copy134 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid135_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid135_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w73_8 :  std_logic;
signal bh7_w74_7 :  std_logic;
signal bh7_w75_6 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid135_Out0_copy136 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid137_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid137_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w74_8 :  std_logic;
signal bh7_w75_7 :  std_logic;
signal bh7_w76_6 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid137_Out0_copy138 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid139_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid139_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w75_8 :  std_logic;
signal bh7_w76_7 :  std_logic;
signal bh7_w77_6 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid139_Out0_copy140 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid141_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid141_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w76_8 :  std_logic;
signal bh7_w77_7 :  std_logic;
signal bh7_w78_6 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid141_Out0_copy142 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid143_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid143_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w77_8 :  std_logic;
signal bh7_w78_7 :  std_logic;
signal bh7_w79_6 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid143_Out0_copy144 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid145_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid145_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w78_8 :  std_logic;
signal bh7_w79_7 :  std_logic;
signal bh7_w80_6 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid145_Out0_copy146 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid147_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid147_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w79_8 :  std_logic;
signal bh7_w80_7 :  std_logic;
signal bh7_w81_5 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid147_Out0_copy148 :  std_logic_vector(2 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid149_In0 :  std_logic_vector(5 downto 0);
signal Compressor_6_3_Freq300_uid90_bh7_uid149_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w80_8 :  std_logic;
signal bh7_w81_6 :  std_logic;
signal bh7_w82_4 :  std_logic;
signal Compressor_6_3_Freq300_uid90_bh7_uid149_Out0_copy150 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid151_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid151_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid151_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w81_7 :  std_logic;
signal bh7_w82_5 :  std_logic;
signal bh7_w83_4 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid151_Out0_copy152 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid153_In0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid153_Out0 :  std_logic_vector(1 downto 0);
signal bh7_w82_6 :  std_logic;
signal bh7_w83_5 :  std_logic;
signal Compressor_3_2_Freq300_uid40_bh7_uid153_Out0_copy154 :  std_logic_vector(1 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid155_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid155_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid155_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w83_6 :  std_logic;
signal bh7_w84_4 :  std_logic;
signal bh7_w85_4 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid155_Out0_copy156 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid157_In0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid157_Out0 :  std_logic_vector(1 downto 0);
signal bh7_w84_5 :  std_logic;
signal bh7_w85_5 :  std_logic;
signal Compressor_3_2_Freq300_uid40_bh7_uid157_Out0_copy158 :  std_logic_vector(1 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid159_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid159_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid159_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w85_6 :  std_logic;
signal bh7_w86_4 :  std_logic;
signal bh7_w87_4 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid159_Out0_copy160 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid161_In0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid161_Out0 :  std_logic_vector(1 downto 0);
signal bh7_w86_5 :  std_logic;
signal bh7_w87_5 :  std_logic;
signal Compressor_3_2_Freq300_uid40_bh7_uid161_Out0_copy162 :  std_logic_vector(1 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid163_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid163_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid163_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w87_6 :  std_logic;
signal bh7_w88_3 :  std_logic;
signal bh7_w89_4 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid163_Out0_copy164 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid165_In0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid165_Out0 :  std_logic_vector(1 downto 0);
signal bh7_w88_4 :  std_logic;
signal bh7_w89_5 :  std_logic;
signal Compressor_3_2_Freq300_uid40_bh7_uid165_Out0_copy166 :  std_logic_vector(1 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid167_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid167_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid167_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w89_6 :  std_logic;
signal bh7_w90_4 :  std_logic;
signal bh7_w91_4 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid167_Out0_copy168 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid169_In0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid169_Out0 :  std_logic_vector(1 downto 0);
signal bh7_w90_5 :  std_logic;
signal bh7_w91_5 :  std_logic;
signal Compressor_3_2_Freq300_uid40_bh7_uid169_Out0_copy170 :  std_logic_vector(1 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid171_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid171_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid171_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w91_6 :  std_logic;
signal bh7_w92_4 :  std_logic;
signal bh7_w93_4 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid171_Out0_copy172 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid173_In0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid173_Out0 :  std_logic_vector(1 downto 0);
signal bh7_w92_5 :  std_logic;
signal bh7_w93_5 :  std_logic;
signal Compressor_3_2_Freq300_uid40_bh7_uid173_Out0_copy174 :  std_logic_vector(1 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid175_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid175_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid175_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w93_6 :  std_logic;
signal bh7_w94_4 :  std_logic;
signal bh7_w95_4 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid175_Out0_copy176 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid177_In0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid177_Out0 :  std_logic_vector(1 downto 0);
signal bh7_w94_5 :  std_logic;
signal bh7_w95_5 :  std_logic;
signal Compressor_3_2_Freq300_uid40_bh7_uid177_Out0_copy178 :  std_logic_vector(1 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid179_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid179_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid179_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w95_6 :  std_logic;
signal bh7_w96_4 :  std_logic;
signal bh7_w97_4 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid179_Out0_copy180 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid181_In0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid181_Out0 :  std_logic_vector(1 downto 0);
signal bh7_w96_5 :  std_logic;
signal bh7_w97_5 :  std_logic;
signal Compressor_3_2_Freq300_uid40_bh7_uid181_Out0_copy182 :  std_logic_vector(1 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid183_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid183_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid183_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w97_6 :  std_logic;
signal bh7_w98_4 :  std_logic;
signal bh7_w99_3 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid183_Out0_copy184 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid185_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid185_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid185_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w98_5 :  std_logic;
signal bh7_w99_4 :  std_logic;
signal bh7_w100_3 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid185_Out0_copy186 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid187_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid187_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid187_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w100_4 :  std_logic;
signal bh7_w101_3 :  std_logic;
signal bh7_w102_3 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid187_Out0_copy188 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid189_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid189_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid189_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w102_4 :  std_logic;
signal bh7_w103_3 :  std_logic;
signal bh7_w104_3 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid189_Out0_copy190 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid191_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid191_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid191_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w104_4 :  std_logic;
signal bh7_w105_2 :  std_logic;
signal bh7_w106_2 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid191_Out0_copy192 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid193_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid193_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid193_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w106_3 :  std_logic;
signal bh7_w107_2 :  std_logic;
signal bh7_w108_2 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid193_Out0_copy194 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid195_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid195_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid195_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w108_3 :  std_logic;
signal bh7_w109_2 :  std_logic;
signal bh7_w110_2 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid195_Out0_copy196 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid197_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid197_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid197_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w110_3 :  std_logic;
signal bh7_w111_2 :  std_logic;
signal bh7_w112_1 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid197_Out0_copy198 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid199_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid199_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid199_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w19_4 :  std_logic;
signal bh7_w20_3 :  std_logic;
signal bh7_w21_4 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid199_Out0_copy200 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid201_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid201_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid201_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w21_5 :  std_logic;
signal bh7_w22_3 :  std_logic;
signal bh7_w23_4 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid201_Out0_copy202 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid203_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid203_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid203_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w23_5 :  std_logic;
signal bh7_w24_5 :  std_logic;
signal bh7_w25_4 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid203_Out0_copy204 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid205_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid205_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid205_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w25_5 :  std_logic;
signal bh7_w26_5 :  std_logic;
signal bh7_w27_4 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid205_Out0_copy206 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid207_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid207_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid207_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w27_5 :  std_logic;
signal bh7_w28_5 :  std_logic;
signal bh7_w29_4 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid207_Out0_copy208 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid209_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid209_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid209_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w29_5 :  std_logic;
signal bh7_w30_5 :  std_logic;
signal bh7_w31_4 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid209_Out0_copy210 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid211_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid211_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid211_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w31_5 :  std_logic;
signal bh7_w32_5 :  std_logic;
signal bh7_w33_4 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid211_Out0_copy212 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid213_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid213_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid213_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w33_5 :  std_logic;
signal bh7_w34_6 :  std_logic;
signal bh7_w35_6 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid213_Out0_copy214 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid215_In0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid215_Out0 :  std_logic_vector(1 downto 0);
signal bh7_w35_7 :  std_logic;
signal bh7_w36_7 :  std_logic;
signal Compressor_3_2_Freq300_uid40_bh7_uid215_Out0_copy216 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid217_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid217_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid217_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w36_8 :  std_logic;
signal bh7_w37_6 :  std_logic;
signal bh7_w38_7 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid217_Out0_copy218 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid219_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid219_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid219_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w38_8 :  std_logic;
signal bh7_w39_6 :  std_logic;
signal bh7_w40_7 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid219_Out0_copy220 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid221_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid221_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid221_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w40_8 :  std_logic;
signal bh7_w41_6 :  std_logic;
signal bh7_w42_7 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid221_Out0_copy222 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid223_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid223_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid223_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w42_8 :  std_logic;
signal bh7_w43_6 :  std_logic;
signal bh7_w44_7 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid223_Out0_copy224 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid225_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid225_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid225_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w44_8 :  std_logic;
signal bh7_w45_6 :  std_logic;
signal bh7_w46_7 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid225_Out0_copy226 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid227_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid227_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid227_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w46_8 :  std_logic;
signal bh7_w47_6 :  std_logic;
signal bh7_w48_8 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid227_Out0_copy228 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid229_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid229_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid229_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w48_9 :  std_logic;
signal bh7_w49_7 :  std_logic;
signal bh7_w50_8 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid229_Out0_copy230 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid231_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid231_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid231_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w50_9 :  std_logic;
signal bh7_w51_9 :  std_logic;
signal bh7_w52_8 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid231_Out0_copy232 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid233_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid233_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid233_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w51_10 :  std_logic;
signal bh7_w52_9 :  std_logic;
signal bh7_w53_9 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid233_Out0_copy234 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid235_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid235_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid235_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w53_10 :  std_logic;
signal bh7_w54_9 :  std_logic;
signal bh7_w55_9 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid235_Out0_copy236 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid237_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid237_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid237_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w55_10 :  std_logic;
signal bh7_w56_9 :  std_logic;
signal bh7_w57_9 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid237_Out0_copy238 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid239_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid239_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid239_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w57_10 :  std_logic;
signal bh7_w58_9 :  std_logic;
signal bh7_w59_9 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid239_Out0_copy240 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid241_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid241_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid241_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w59_10 :  std_logic;
signal bh7_w60_9 :  std_logic;
signal bh7_w61_9 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid241_Out0_copy242 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid243_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid243_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid243_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w61_10 :  std_logic;
signal bh7_w62_9 :  std_logic;
signal bh7_w63_9 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid243_Out0_copy244 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid245_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid245_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid245_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w63_10 :  std_logic;
signal bh7_w64_9 :  std_logic;
signal bh7_w65_9 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid245_Out0_copy246 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid247_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid247_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid247_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w65_10 :  std_logic;
signal bh7_w66_9 :  std_logic;
signal bh7_w67_9 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid247_Out0_copy248 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid249_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid249_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid249_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w67_10 :  std_logic;
signal bh7_w68_9 :  std_logic;
signal bh7_w69_9 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid249_Out0_copy250 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid251_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid251_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid251_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w69_10 :  std_logic;
signal bh7_w70_9 :  std_logic;
signal bh7_w71_9 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid251_Out0_copy252 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid253_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid253_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid253_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w71_10 :  std_logic;
signal bh7_w72_9 :  std_logic;
signal bh7_w73_9 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid253_Out0_copy254 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid255_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid255_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid255_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w73_10 :  std_logic;
signal bh7_w74_9 :  std_logic;
signal bh7_w75_9 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid255_Out0_copy256 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid257_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid257_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid257_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w75_10 :  std_logic;
signal bh7_w76_9 :  std_logic;
signal bh7_w77_9 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid257_Out0_copy258 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid259_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid259_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid259_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w77_10 :  std_logic;
signal bh7_w78_9 :  std_logic;
signal bh7_w79_9 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid259_Out0_copy260 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid261_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid261_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid261_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w79_10 :  std_logic;
signal bh7_w80_9 :  std_logic;
signal bh7_w81_8 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid261_Out0_copy262 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid263_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid263_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid263_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w81_9 :  std_logic;
signal bh7_w82_7 :  std_logic;
signal bh7_w83_7 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid263_Out0_copy264 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid265_In0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid265_Out0 :  std_logic_vector(1 downto 0);
signal bh7_w82_8 :  std_logic;
signal bh7_w83_8 :  std_logic;
signal Compressor_3_2_Freq300_uid40_bh7_uid265_Out0_copy266 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid267_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid267_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid267_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w83_9 :  std_logic;
signal bh7_w84_6 :  std_logic;
signal bh7_w85_7 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid267_Out0_copy268 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid269_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid269_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid269_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w85_8 :  std_logic;
signal bh7_w86_6 :  std_logic;
signal bh7_w87_7 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid269_Out0_copy270 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid271_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid271_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid271_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w87_8 :  std_logic;
signal bh7_w88_5 :  std_logic;
signal bh7_w89_7 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid271_Out0_copy272 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid273_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid273_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid273_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w89_8 :  std_logic;
signal bh7_w90_6 :  std_logic;
signal bh7_w91_7 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid273_Out0_copy274 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid275_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid275_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid275_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w91_8 :  std_logic;
signal bh7_w92_6 :  std_logic;
signal bh7_w93_7 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid275_Out0_copy276 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid277_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid277_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid277_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w93_8 :  std_logic;
signal bh7_w94_6 :  std_logic;
signal bh7_w95_7 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid277_Out0_copy278 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid279_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid279_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid279_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w95_8 :  std_logic;
signal bh7_w96_6 :  std_logic;
signal bh7_w97_7 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid279_Out0_copy280 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid281_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid281_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid281_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w97_8 :  std_logic;
signal bh7_w98_6 :  std_logic;
signal bh7_w99_5 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid281_Out0_copy282 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid283_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid283_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid283_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w99_6 :  std_logic;
signal bh7_w100_5 :  std_logic;
signal bh7_w101_4 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid283_Out0_copy284 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid285_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid285_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid285_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w101_5 :  std_logic;
signal bh7_w102_5 :  std_logic;
signal bh7_w103_4 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid285_Out0_copy286 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid287_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid287_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid287_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w103_5 :  std_logic;
signal bh7_w104_5 :  std_logic;
signal bh7_w105_3 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid287_Out0_copy288 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid289_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid289_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid289_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w106_4 :  std_logic;
signal bh7_w107_3 :  std_logic;
signal bh7_w108_4 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid289_Out0_copy290 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid291_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid291_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid291_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w108_5 :  std_logic;
signal bh7_w109_3 :  std_logic;
signal bh7_w110_4 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid291_Out0_copy292 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid293_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid293_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid293_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w110_5 :  std_logic;
signal bh7_w111_3 :  std_logic;
signal bh7_w112_2 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid293_Out0_copy294 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid295_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid295_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid295_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w112_3 :  std_logic;
signal bh7_w113_1 :  std_logic;
signal bh7_w114_1 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid295_Out0_copy296 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid297_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid297_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid297_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w21_6 :  std_logic;
signal bh7_w22_4 :  std_logic;
signal bh7_w23_6 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid297_Out0_copy298 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid299_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid299_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid299_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w23_7 :  std_logic;
signal bh7_w24_6 :  std_logic;
signal bh7_w25_6 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid299_Out0_copy300 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid301_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid301_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid301_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w25_7 :  std_logic;
signal bh7_w26_6 :  std_logic;
signal bh7_w27_6 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid301_Out0_copy302 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid303_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid303_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid303_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w27_7 :  std_logic;
signal bh7_w28_6 :  std_logic;
signal bh7_w29_6 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid303_Out0_copy304 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid305_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid305_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid305_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w29_7 :  std_logic;
signal bh7_w30_6 :  std_logic;
signal bh7_w31_6 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid305_Out0_copy306 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid307_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid307_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid307_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w31_7 :  std_logic;
signal bh7_w32_6 :  std_logic;
signal bh7_w33_6 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid307_Out0_copy308 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid309_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid309_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid309_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w33_7 :  std_logic;
signal bh7_w34_7 :  std_logic;
signal bh7_w35_8 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid309_Out0_copy310 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid311_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid311_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid311_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w35_9 :  std_logic;
signal bh7_w36_9 :  std_logic;
signal bh7_w37_7 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid311_Out0_copy312 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid313_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid313_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid313_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w38_9 :  std_logic;
signal bh7_w39_7 :  std_logic;
signal bh7_w40_9 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid313_Out0_copy314 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid315_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid315_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid315_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w40_10 :  std_logic;
signal bh7_w41_7 :  std_logic;
signal bh7_w42_9 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid315_Out0_copy316 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid317_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid317_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid317_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w42_10 :  std_logic;
signal bh7_w43_7 :  std_logic;
signal bh7_w44_9 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid317_Out0_copy318 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid319_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid319_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid319_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w44_10 :  std_logic;
signal bh7_w45_7 :  std_logic;
signal bh7_w46_9 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid319_Out0_copy320 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid321_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid321_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid321_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w46_10 :  std_logic;
signal bh7_w47_7 :  std_logic;
signal bh7_w48_10 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid321_Out0_copy322 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid323_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid323_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid323_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w48_11 :  std_logic;
signal bh7_w49_8 :  std_logic;
signal bh7_w50_10 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid323_Out0_copy324 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid325_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid325_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid325_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w50_11 :  std_logic;
signal bh7_w51_11 :  std_logic;
signal bh7_w52_10 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid325_Out0_copy326 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid327_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid327_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid327_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w52_11 :  std_logic;
signal bh7_w53_11 :  std_logic;
signal bh7_w54_10 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid327_Out0_copy328 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid329_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid329_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid329_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w54_11 :  std_logic;
signal bh7_w55_11 :  std_logic;
signal bh7_w56_10 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid329_Out0_copy330 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid331_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid331_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid331_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w56_11 :  std_logic;
signal bh7_w57_11 :  std_logic;
signal bh7_w58_10 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid331_Out0_copy332 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid333_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid333_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid333_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w58_11 :  std_logic;
signal bh7_w59_11 :  std_logic;
signal bh7_w60_10 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid333_Out0_copy334 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid335_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid335_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid335_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w60_11 :  std_logic;
signal bh7_w61_11 :  std_logic;
signal bh7_w62_10 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid335_Out0_copy336 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid337_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid337_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid337_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w62_11 :  std_logic;
signal bh7_w63_11 :  std_logic;
signal bh7_w64_10 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid337_Out0_copy338 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid339_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid339_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid339_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w64_11 :  std_logic;
signal bh7_w65_11 :  std_logic;
signal bh7_w66_10 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid339_Out0_copy340 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid341_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid341_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid341_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w66_11 :  std_logic;
signal bh7_w67_11 :  std_logic;
signal bh7_w68_10 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid341_Out0_copy342 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid343_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid343_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid343_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w68_11 :  std_logic;
signal bh7_w69_11 :  std_logic;
signal bh7_w70_10 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid343_Out0_copy344 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid345_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid345_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid345_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w70_11 :  std_logic;
signal bh7_w71_11 :  std_logic;
signal bh7_w72_10 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid345_Out0_copy346 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid347_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid347_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid347_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w72_11 :  std_logic;
signal bh7_w73_11 :  std_logic;
signal bh7_w74_10 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid347_Out0_copy348 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid349_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid349_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid349_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w74_11 :  std_logic;
signal bh7_w75_11 :  std_logic;
signal bh7_w76_10 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid349_Out0_copy350 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid351_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid351_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid351_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w76_11 :  std_logic;
signal bh7_w77_11 :  std_logic;
signal bh7_w78_10 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid351_Out0_copy352 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid353_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid353_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid353_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w78_11 :  std_logic;
signal bh7_w79_11 :  std_logic;
signal bh7_w80_10 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid353_Out0_copy354 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid355_In0 :  std_logic_vector(2 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid355_In1 :  std_logic_vector(1 downto 0);
signal Compressor_23_3_Freq300_uid32_bh7_uid355_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w80_11 :  std_logic;
signal bh7_w81_10 :  std_logic;
signal bh7_w82_9 :  std_logic;
signal Compressor_23_3_Freq300_uid32_bh7_uid355_Out0_copy356 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid357_In0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid357_Out0 :  std_logic_vector(1 downto 0);
signal bh7_w82_10 :  std_logic;
signal bh7_w83_10 :  std_logic;
signal Compressor_3_2_Freq300_uid40_bh7_uid357_Out0_copy358 :  std_logic_vector(1 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid359_In0 :  std_logic_vector(2 downto 0);
signal Compressor_3_2_Freq300_uid40_bh7_uid359_Out0 :  std_logic_vector(1 downto 0);
signal bh7_w83_11 :  std_logic;
signal bh7_w84_7 :  std_logic;
signal Compressor_3_2_Freq300_uid40_bh7_uid359_Out0_copy360 :  std_logic_vector(1 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid361_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid361_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid361_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w85_9 :  std_logic;
signal bh7_w86_7 :  std_logic;
signal bh7_w87_9 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid361_Out0_copy362 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid363_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid363_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid363_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w87_10 :  std_logic;
signal bh7_w88_6 :  std_logic;
signal bh7_w89_9 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid363_Out0_copy364 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid365_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid365_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid365_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w89_10 :  std_logic;
signal bh7_w90_7 :  std_logic;
signal bh7_w91_9 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid365_Out0_copy366 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid367_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid367_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid367_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w91_10 :  std_logic;
signal bh7_w92_7 :  std_logic;
signal bh7_w93_9 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid367_Out0_copy368 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid369_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid369_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid369_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w93_10 :  std_logic;
signal bh7_w94_7 :  std_logic;
signal bh7_w95_9 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid369_Out0_copy370 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid371_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid371_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid371_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w95_10 :  std_logic;
signal bh7_w96_7 :  std_logic;
signal bh7_w97_9 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid371_Out0_copy372 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid373_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid373_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid373_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w97_10 :  std_logic;
signal bh7_w98_7 :  std_logic;
signal bh7_w99_7 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid373_Out0_copy374 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid375_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid375_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid375_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w99_8 :  std_logic;
signal bh7_w100_6 :  std_logic;
signal bh7_w101_6 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid375_Out0_copy376 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid377_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid377_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid377_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w101_7 :  std_logic;
signal bh7_w102_6 :  std_logic;
signal bh7_w103_6 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid377_Out0_copy378 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid379_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid379_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid379_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w103_7 :  std_logic;
signal bh7_w104_6 :  std_logic;
signal bh7_w105_4 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid379_Out0_copy380 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid381_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid381_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid381_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w105_5 :  std_logic;
signal bh7_w106_5 :  std_logic;
signal bh7_w107_4 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid381_Out0_copy382 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid383_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid383_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid383_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w108_6 :  std_logic;
signal bh7_w109_4 :  std_logic;
signal bh7_w110_6 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid383_Out0_copy384 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid385_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid385_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid385_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w110_7 :  std_logic;
signal bh7_w111_4 :  std_logic;
signal bh7_w112_4 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid385_Out0_copy386 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid387_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid387_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid387_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w112_5 :  std_logic;
signal bh7_w113_2 :  std_logic;
signal bh7_w114_2 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid387_Out0_copy388 :  std_logic_vector(2 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid389_In0 :  std_logic_vector(3 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid389_In1 :  std_logic_vector(0 downto 0);
signal Compressor_14_3_Freq300_uid54_bh7_uid389_Out0 :  std_logic_vector(2 downto 0);
signal bh7_w114_3 :  std_logic;
signal bh7_w115_1 :  std_logic;
signal bh7_w116_1 :  std_logic;
signal Compressor_14_3_Freq300_uid54_bh7_uid389_Out0_copy390 :  std_logic_vector(2 downto 0);
signal tmp_bitheapResult_bh7_22, tmp_bitheapResult_bh7_22_d1 :  std_logic_vector(22 downto 0);
signal bitheapFinalAdd_bh7_In0 :  std_logic_vector(105 downto 0);
signal bitheapFinalAdd_bh7_In1 :  std_logic_vector(105 downto 0);
signal bitheapFinalAdd_bh7_Cin :  std_logic;
signal bitheapFinalAdd_bh7_Out :  std_logic_vector(105 downto 0);
signal bitheapResult_bh7 :  std_logic_vector(127 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            tmp_bitheapResult_bh7_22_d1 <=  tmp_bitheapResult_bh7_22;
         end if;
      end process;
   XX_m6 <= X ;
   YY_m6 <= Y ;
   tile_0_X <= X(23 downto 0);
   tile_0_Y <= Y(16 downto 0);
   tile_0_mult: DSPBlock_24x17_Freq300_uid9
      port map ( clk  => clk,
                 X => tile_0_X,
                 Y => tile_0_Y,
                 R => tile_0_output);

   tile_0_filtered_output <= unsigned(tile_0_output(40 downto 0));
   bh7_w0_0 <= tile_0_filtered_output(0);
   bh7_w1_0 <= tile_0_filtered_output(1);
   bh7_w2_0 <= tile_0_filtered_output(2);
   bh7_w3_0 <= tile_0_filtered_output(3);
   bh7_w4_0 <= tile_0_filtered_output(4);
   bh7_w5_0 <= tile_0_filtered_output(5);
   bh7_w6_0 <= tile_0_filtered_output(6);
   bh7_w7_0 <= tile_0_filtered_output(7);
   bh7_w8_0 <= tile_0_filtered_output(8);
   bh7_w9_0 <= tile_0_filtered_output(9);
   bh7_w10_0 <= tile_0_filtered_output(10);
   bh7_w11_0 <= tile_0_filtered_output(11);
   bh7_w12_0 <= tile_0_filtered_output(12);
   bh7_w13_0 <= tile_0_filtered_output(13);
   bh7_w14_0 <= tile_0_filtered_output(14);
   bh7_w15_0 <= tile_0_filtered_output(15);
   bh7_w16_0 <= tile_0_filtered_output(16);
   bh7_w17_0 <= tile_0_filtered_output(17);
   bh7_w18_0 <= tile_0_filtered_output(18);
   bh7_w19_0 <= tile_0_filtered_output(19);
   bh7_w20_0 <= tile_0_filtered_output(20);
   bh7_w21_0 <= tile_0_filtered_output(21);
   bh7_w22_0 <= tile_0_filtered_output(22);
   bh7_w23_0 <= tile_0_filtered_output(23);
   bh7_w24_0 <= tile_0_filtered_output(24);
   bh7_w25_0 <= tile_0_filtered_output(25);
   bh7_w26_0 <= tile_0_filtered_output(26);
   bh7_w27_0 <= tile_0_filtered_output(27);
   bh7_w28_0 <= tile_0_filtered_output(28);
   bh7_w29_0 <= tile_0_filtered_output(29);
   bh7_w30_0 <= tile_0_filtered_output(30);
   bh7_w31_0 <= tile_0_filtered_output(31);
   bh7_w32_0 <= tile_0_filtered_output(32);
   bh7_w33_0 <= tile_0_filtered_output(33);
   bh7_w34_0 <= tile_0_filtered_output(34);
   bh7_w35_0 <= tile_0_filtered_output(35);
   bh7_w36_0 <= tile_0_filtered_output(36);
   bh7_w37_0 <= tile_0_filtered_output(37);
   bh7_w38_0 <= tile_0_filtered_output(38);
   bh7_w39_0 <= tile_0_filtered_output(39);
   bh7_w40_0 <= tile_0_filtered_output(40);
   tile_1_X <= X(23 downto 0);
   tile_1_Y <= Y(33 downto 17);
   tile_1_mult: DSPBlock_24x17_Freq300_uid11
      port map ( clk  => clk,
                 X => tile_1_X,
                 Y => tile_1_Y,
                 R => tile_1_output);

   tile_1_filtered_output <= unsigned(tile_1_output(40 downto 0));
   bh7_w17_1 <= tile_1_filtered_output(0);
   bh7_w18_1 <= tile_1_filtered_output(1);
   bh7_w19_1 <= tile_1_filtered_output(2);
   bh7_w20_1 <= tile_1_filtered_output(3);
   bh7_w21_1 <= tile_1_filtered_output(4);
   bh7_w22_1 <= tile_1_filtered_output(5);
   bh7_w23_1 <= tile_1_filtered_output(6);
   bh7_w24_1 <= tile_1_filtered_output(7);
   bh7_w25_1 <= tile_1_filtered_output(8);
   bh7_w26_1 <= tile_1_filtered_output(9);
   bh7_w27_1 <= tile_1_filtered_output(10);
   bh7_w28_1 <= tile_1_filtered_output(11);
   bh7_w29_1 <= tile_1_filtered_output(12);
   bh7_w30_1 <= tile_1_filtered_output(13);
   bh7_w31_1 <= tile_1_filtered_output(14);
   bh7_w32_1 <= tile_1_filtered_output(15);
   bh7_w33_1 <= tile_1_filtered_output(16);
   bh7_w34_1 <= tile_1_filtered_output(17);
   bh7_w35_1 <= tile_1_filtered_output(18);
   bh7_w36_1 <= tile_1_filtered_output(19);
   bh7_w37_1 <= tile_1_filtered_output(20);
   bh7_w38_1 <= tile_1_filtered_output(21);
   bh7_w39_1 <= tile_1_filtered_output(22);
   bh7_w40_1 <= tile_1_filtered_output(23);
   bh7_w41_0 <= tile_1_filtered_output(24);
   bh7_w42_0 <= tile_1_filtered_output(25);
   bh7_w43_0 <= tile_1_filtered_output(26);
   bh7_w44_0 <= tile_1_filtered_output(27);
   bh7_w45_0 <= tile_1_filtered_output(28);
   bh7_w46_0 <= tile_1_filtered_output(29);
   bh7_w47_0 <= tile_1_filtered_output(30);
   bh7_w48_0 <= tile_1_filtered_output(31);
   bh7_w49_0 <= tile_1_filtered_output(32);
   bh7_w50_0 <= tile_1_filtered_output(33);
   bh7_w51_0 <= tile_1_filtered_output(34);
   bh7_w52_0 <= tile_1_filtered_output(35);
   bh7_w53_0 <= tile_1_filtered_output(36);
   bh7_w54_0 <= tile_1_filtered_output(37);
   bh7_w55_0 <= tile_1_filtered_output(38);
   bh7_w56_0 <= tile_1_filtered_output(39);
   bh7_w57_0 <= tile_1_filtered_output(40);
   tile_2_X <= X(47 downto 24);
   tile_2_Y <= Y(16 downto 0);
   tile_2_mult: DSPBlock_24x17_Freq300_uid13
      port map ( clk  => clk,
                 X => tile_2_X,
                 Y => tile_2_Y,
                 R => tile_2_output);

   tile_2_filtered_output <= unsigned(tile_2_output(40 downto 0));
   bh7_w24_2 <= tile_2_filtered_output(0);
   bh7_w25_2 <= tile_2_filtered_output(1);
   bh7_w26_2 <= tile_2_filtered_output(2);
   bh7_w27_2 <= tile_2_filtered_output(3);
   bh7_w28_2 <= tile_2_filtered_output(4);
   bh7_w29_2 <= tile_2_filtered_output(5);
   bh7_w30_2 <= tile_2_filtered_output(6);
   bh7_w31_2 <= tile_2_filtered_output(7);
   bh7_w32_2 <= tile_2_filtered_output(8);
   bh7_w33_2 <= tile_2_filtered_output(9);
   bh7_w34_2 <= tile_2_filtered_output(10);
   bh7_w35_2 <= tile_2_filtered_output(11);
   bh7_w36_2 <= tile_2_filtered_output(12);
   bh7_w37_2 <= tile_2_filtered_output(13);
   bh7_w38_2 <= tile_2_filtered_output(14);
   bh7_w39_2 <= tile_2_filtered_output(15);
   bh7_w40_2 <= tile_2_filtered_output(16);
   bh7_w41_1 <= tile_2_filtered_output(17);
   bh7_w42_1 <= tile_2_filtered_output(18);
   bh7_w43_1 <= tile_2_filtered_output(19);
   bh7_w44_1 <= tile_2_filtered_output(20);
   bh7_w45_1 <= tile_2_filtered_output(21);
   bh7_w46_1 <= tile_2_filtered_output(22);
   bh7_w47_1 <= tile_2_filtered_output(23);
   bh7_w48_1 <= tile_2_filtered_output(24);
   bh7_w49_1 <= tile_2_filtered_output(25);
   bh7_w50_1 <= tile_2_filtered_output(26);
   bh7_w51_1 <= tile_2_filtered_output(27);
   bh7_w52_1 <= tile_2_filtered_output(28);
   bh7_w53_1 <= tile_2_filtered_output(29);
   bh7_w54_1 <= tile_2_filtered_output(30);
   bh7_w55_1 <= tile_2_filtered_output(31);
   bh7_w56_1 <= tile_2_filtered_output(32);
   bh7_w57_1 <= tile_2_filtered_output(33);
   bh7_w58_0 <= tile_2_filtered_output(34);
   bh7_w59_0 <= tile_2_filtered_output(35);
   bh7_w60_0 <= tile_2_filtered_output(36);
   bh7_w61_0 <= tile_2_filtered_output(37);
   bh7_w62_0 <= tile_2_filtered_output(38);
   bh7_w63_0 <= tile_2_filtered_output(39);
   bh7_w64_0 <= tile_2_filtered_output(40);
   tile_3_X <= X(47 downto 24);
   tile_3_Y <= Y(33 downto 17);
   tile_3_mult: DSPBlock_24x17_Freq300_uid15
      port map ( clk  => clk,
                 X => tile_3_X,
                 Y => tile_3_Y,
                 R => tile_3_output);

   tile_3_filtered_output <= unsigned(tile_3_output(40 downto 0));
   bh7_w41_2 <= tile_3_filtered_output(0);
   bh7_w42_2 <= tile_3_filtered_output(1);
   bh7_w43_2 <= tile_3_filtered_output(2);
   bh7_w44_2 <= tile_3_filtered_output(3);
   bh7_w45_2 <= tile_3_filtered_output(4);
   bh7_w46_2 <= tile_3_filtered_output(5);
   bh7_w47_2 <= tile_3_filtered_output(6);
   bh7_w48_2 <= tile_3_filtered_output(7);
   bh7_w49_2 <= tile_3_filtered_output(8);
   bh7_w50_2 <= tile_3_filtered_output(9);
   bh7_w51_2 <= tile_3_filtered_output(10);
   bh7_w52_2 <= tile_3_filtered_output(11);
   bh7_w53_2 <= tile_3_filtered_output(12);
   bh7_w54_2 <= tile_3_filtered_output(13);
   bh7_w55_2 <= tile_3_filtered_output(14);
   bh7_w56_2 <= tile_3_filtered_output(15);
   bh7_w57_2 <= tile_3_filtered_output(16);
   bh7_w58_1 <= tile_3_filtered_output(17);
   bh7_w59_1 <= tile_3_filtered_output(18);
   bh7_w60_1 <= tile_3_filtered_output(19);
   bh7_w61_1 <= tile_3_filtered_output(20);
   bh7_w62_1 <= tile_3_filtered_output(21);
   bh7_w63_1 <= tile_3_filtered_output(22);
   bh7_w64_1 <= tile_3_filtered_output(23);
   bh7_w65_0 <= tile_3_filtered_output(24);
   bh7_w66_0 <= tile_3_filtered_output(25);
   bh7_w67_0 <= tile_3_filtered_output(26);
   bh7_w68_0 <= tile_3_filtered_output(27);
   bh7_w69_0 <= tile_3_filtered_output(28);
   bh7_w70_0 <= tile_3_filtered_output(29);
   bh7_w71_0 <= tile_3_filtered_output(30);
   bh7_w72_0 <= tile_3_filtered_output(31);
   bh7_w73_0 <= tile_3_filtered_output(32);
   bh7_w74_0 <= tile_3_filtered_output(33);
   bh7_w75_0 <= tile_3_filtered_output(34);
   bh7_w76_0 <= tile_3_filtered_output(35);
   bh7_w77_0 <= tile_3_filtered_output(36);
   bh7_w78_0 <= tile_3_filtered_output(37);
   bh7_w79_0 <= tile_3_filtered_output(38);
   bh7_w80_0 <= tile_3_filtered_output(39);
   bh7_w81_0 <= tile_3_filtered_output(40);
   tile_4_X <= X(23 downto 0);
   tile_4_Y <= Y(50 downto 34);
   tile_4_mult: DSPBlock_24x17_Freq300_uid17
      port map ( clk  => clk,
                 X => tile_4_X,
                 Y => tile_4_Y,
                 R => tile_4_output);

   tile_4_filtered_output <= unsigned(tile_4_output(40 downto 0));
   bh7_w34_3 <= tile_4_filtered_output(0);
   bh7_w35_3 <= tile_4_filtered_output(1);
   bh7_w36_3 <= tile_4_filtered_output(2);
   bh7_w37_3 <= tile_4_filtered_output(3);
   bh7_w38_3 <= tile_4_filtered_output(4);
   bh7_w39_3 <= tile_4_filtered_output(5);
   bh7_w40_3 <= tile_4_filtered_output(6);
   bh7_w41_3 <= tile_4_filtered_output(7);
   bh7_w42_3 <= tile_4_filtered_output(8);
   bh7_w43_3 <= tile_4_filtered_output(9);
   bh7_w44_3 <= tile_4_filtered_output(10);
   bh7_w45_3 <= tile_4_filtered_output(11);
   bh7_w46_3 <= tile_4_filtered_output(12);
   bh7_w47_3 <= tile_4_filtered_output(13);
   bh7_w48_3 <= tile_4_filtered_output(14);
   bh7_w49_3 <= tile_4_filtered_output(15);
   bh7_w50_3 <= tile_4_filtered_output(16);
   bh7_w51_3 <= tile_4_filtered_output(17);
   bh7_w52_3 <= tile_4_filtered_output(18);
   bh7_w53_3 <= tile_4_filtered_output(19);
   bh7_w54_3 <= tile_4_filtered_output(20);
   bh7_w55_3 <= tile_4_filtered_output(21);
   bh7_w56_3 <= tile_4_filtered_output(22);
   bh7_w57_3 <= tile_4_filtered_output(23);
   bh7_w58_2 <= tile_4_filtered_output(24);
   bh7_w59_2 <= tile_4_filtered_output(25);
   bh7_w60_2 <= tile_4_filtered_output(26);
   bh7_w61_2 <= tile_4_filtered_output(27);
   bh7_w62_2 <= tile_4_filtered_output(28);
   bh7_w63_2 <= tile_4_filtered_output(29);
   bh7_w64_2 <= tile_4_filtered_output(30);
   bh7_w65_1 <= tile_4_filtered_output(31);
   bh7_w66_1 <= tile_4_filtered_output(32);
   bh7_w67_1 <= tile_4_filtered_output(33);
   bh7_w68_1 <= tile_4_filtered_output(34);
   bh7_w69_1 <= tile_4_filtered_output(35);
   bh7_w70_1 <= tile_4_filtered_output(36);
   bh7_w71_1 <= tile_4_filtered_output(37);
   bh7_w72_1 <= tile_4_filtered_output(38);
   bh7_w73_1 <= tile_4_filtered_output(39);
   bh7_w74_1 <= tile_4_filtered_output(40);
   tile_5_X <= X(47 downto 24);
   tile_5_Y <= Y(50 downto 34);
   tile_5_mult: DSPBlock_24x17_Freq300_uid19
      port map ( clk  => clk,
                 X => tile_5_X,
                 Y => tile_5_Y,
                 R => tile_5_output);

   tile_5_filtered_output <= unsigned(tile_5_output(40 downto 0));
   bh7_w58_3 <= tile_5_filtered_output(0);
   bh7_w59_3 <= tile_5_filtered_output(1);
   bh7_w60_3 <= tile_5_filtered_output(2);
   bh7_w61_3 <= tile_5_filtered_output(3);
   bh7_w62_3 <= tile_5_filtered_output(4);
   bh7_w63_3 <= tile_5_filtered_output(5);
   bh7_w64_3 <= tile_5_filtered_output(6);
   bh7_w65_2 <= tile_5_filtered_output(7);
   bh7_w66_2 <= tile_5_filtered_output(8);
   bh7_w67_2 <= tile_5_filtered_output(9);
   bh7_w68_2 <= tile_5_filtered_output(10);
   bh7_w69_2 <= tile_5_filtered_output(11);
   bh7_w70_2 <= tile_5_filtered_output(12);
   bh7_w71_2 <= tile_5_filtered_output(13);
   bh7_w72_2 <= tile_5_filtered_output(14);
   bh7_w73_2 <= tile_5_filtered_output(15);
   bh7_w74_2 <= tile_5_filtered_output(16);
   bh7_w75_1 <= tile_5_filtered_output(17);
   bh7_w76_1 <= tile_5_filtered_output(18);
   bh7_w77_1 <= tile_5_filtered_output(19);
   bh7_w78_1 <= tile_5_filtered_output(20);
   bh7_w79_1 <= tile_5_filtered_output(21);
   bh7_w80_1 <= tile_5_filtered_output(22);
   bh7_w81_1 <= tile_5_filtered_output(23);
   bh7_w82_0 <= tile_5_filtered_output(24);
   bh7_w83_0 <= tile_5_filtered_output(25);
   bh7_w84_0 <= tile_5_filtered_output(26);
   bh7_w85_0 <= tile_5_filtered_output(27);
   bh7_w86_0 <= tile_5_filtered_output(28);
   bh7_w87_0 <= tile_5_filtered_output(29);
   bh7_w88_0 <= tile_5_filtered_output(30);
   bh7_w89_0 <= tile_5_filtered_output(31);
   bh7_w90_0 <= tile_5_filtered_output(32);
   bh7_w91_0 <= tile_5_filtered_output(33);
   bh7_w92_0 <= tile_5_filtered_output(34);
   bh7_w93_0 <= tile_5_filtered_output(35);
   bh7_w94_0 <= tile_5_filtered_output(36);
   bh7_w95_0 <= tile_5_filtered_output(37);
   bh7_w96_0 <= tile_5_filtered_output(38);
   bh7_w97_0 <= tile_5_filtered_output(39);
   bh7_w98_0 <= tile_5_filtered_output(40);
   tile_6_X <= X(63 downto 48);
   tile_6_Y <= Y(16 downto 0);
   tile_6_mult: DSPBlock_16x17_Freq300_uid21
      port map ( clk  => clk,
                 X => tile_6_X,
                 Y => tile_6_Y,
                 R => tile_6_output);

   tile_6_filtered_output <= unsigned(tile_6_output(32 downto 0));
   bh7_w48_4 <= tile_6_filtered_output(0);
   bh7_w49_4 <= tile_6_filtered_output(1);
   bh7_w50_4 <= tile_6_filtered_output(2);
   bh7_w51_4 <= tile_6_filtered_output(3);
   bh7_w52_4 <= tile_6_filtered_output(4);
   bh7_w53_4 <= tile_6_filtered_output(5);
   bh7_w54_4 <= tile_6_filtered_output(6);
   bh7_w55_4 <= tile_6_filtered_output(7);
   bh7_w56_4 <= tile_6_filtered_output(8);
   bh7_w57_4 <= tile_6_filtered_output(9);
   bh7_w58_4 <= tile_6_filtered_output(10);
   bh7_w59_4 <= tile_6_filtered_output(11);
   bh7_w60_4 <= tile_6_filtered_output(12);
   bh7_w61_4 <= tile_6_filtered_output(13);
   bh7_w62_4 <= tile_6_filtered_output(14);
   bh7_w63_4 <= tile_6_filtered_output(15);
   bh7_w64_4 <= tile_6_filtered_output(16);
   bh7_w65_3 <= tile_6_filtered_output(17);
   bh7_w66_3 <= tile_6_filtered_output(18);
   bh7_w67_3 <= tile_6_filtered_output(19);
   bh7_w68_3 <= tile_6_filtered_output(20);
   bh7_w69_3 <= tile_6_filtered_output(21);
   bh7_w70_3 <= tile_6_filtered_output(22);
   bh7_w71_3 <= tile_6_filtered_output(23);
   bh7_w72_3 <= tile_6_filtered_output(24);
   bh7_w73_3 <= tile_6_filtered_output(25);
   bh7_w74_3 <= tile_6_filtered_output(26);
   bh7_w75_2 <= tile_6_filtered_output(27);
   bh7_w76_2 <= tile_6_filtered_output(28);
   bh7_w77_2 <= tile_6_filtered_output(29);
   bh7_w78_2 <= tile_6_filtered_output(30);
   bh7_w79_2 <= tile_6_filtered_output(31);
   bh7_w80_2 <= tile_6_filtered_output(32);
   tile_7_X <= X(63 downto 48);
   tile_7_Y <= Y(40 downto 17);
   tile_7_mult: DSPBlock_16x24_Freq300_uid23
      port map ( clk  => clk,
                 X => tile_7_X,
                 Y => tile_7_Y,
                 R => tile_7_output);

   tile_7_filtered_output <= unsigned(tile_7_output(39 downto 0));
   bh7_w65_4 <= tile_7_filtered_output(0);
   bh7_w66_4 <= tile_7_filtered_output(1);
   bh7_w67_4 <= tile_7_filtered_output(2);
   bh7_w68_4 <= tile_7_filtered_output(3);
   bh7_w69_4 <= tile_7_filtered_output(4);
   bh7_w70_4 <= tile_7_filtered_output(5);
   bh7_w71_4 <= tile_7_filtered_output(6);
   bh7_w72_4 <= tile_7_filtered_output(7);
   bh7_w73_4 <= tile_7_filtered_output(8);
   bh7_w74_4 <= tile_7_filtered_output(9);
   bh7_w75_3 <= tile_7_filtered_output(10);
   bh7_w76_3 <= tile_7_filtered_output(11);
   bh7_w77_3 <= tile_7_filtered_output(12);
   bh7_w78_3 <= tile_7_filtered_output(13);
   bh7_w79_3 <= tile_7_filtered_output(14);
   bh7_w80_3 <= tile_7_filtered_output(15);
   bh7_w81_2 <= tile_7_filtered_output(16);
   bh7_w82_1 <= tile_7_filtered_output(17);
   bh7_w83_1 <= tile_7_filtered_output(18);
   bh7_w84_1 <= tile_7_filtered_output(19);
   bh7_w85_1 <= tile_7_filtered_output(20);
   bh7_w86_1 <= tile_7_filtered_output(21);
   bh7_w87_1 <= tile_7_filtered_output(22);
   bh7_w88_1 <= tile_7_filtered_output(23);
   bh7_w89_1 <= tile_7_filtered_output(24);
   bh7_w90_1 <= tile_7_filtered_output(25);
   bh7_w91_1 <= tile_7_filtered_output(26);
   bh7_w92_1 <= tile_7_filtered_output(27);
   bh7_w93_1 <= tile_7_filtered_output(28);
   bh7_w94_1 <= tile_7_filtered_output(29);
   bh7_w95_1 <= tile_7_filtered_output(30);
   bh7_w96_1 <= tile_7_filtered_output(31);
   bh7_w97_1 <= tile_7_filtered_output(32);
   bh7_w98_1 <= tile_7_filtered_output(33);
   bh7_w99_0 <= tile_7_filtered_output(34);
   bh7_w100_0 <= tile_7_filtered_output(35);
   bh7_w101_0 <= tile_7_filtered_output(36);
   bh7_w102_0 <= tile_7_filtered_output(37);
   bh7_w103_0 <= tile_7_filtered_output(38);
   bh7_w104_0 <= tile_7_filtered_output(39);
   tile_8_X <= X(23 downto 0);
   tile_8_Y <= Y(63 downto 51);
   tile_8_mult: DSPBlock_24x13_Freq300_uid25
      port map ( clk  => clk,
                 X => tile_8_X,
                 Y => tile_8_Y,
                 R => tile_8_output);

   tile_8_filtered_output <= unsigned(tile_8_output(36 downto 0));
   bh7_w51_5 <= tile_8_filtered_output(0);
   bh7_w52_5 <= tile_8_filtered_output(1);
   bh7_w53_5 <= tile_8_filtered_output(2);
   bh7_w54_5 <= tile_8_filtered_output(3);
   bh7_w55_5 <= tile_8_filtered_output(4);
   bh7_w56_5 <= tile_8_filtered_output(5);
   bh7_w57_5 <= tile_8_filtered_output(6);
   bh7_w58_5 <= tile_8_filtered_output(7);
   bh7_w59_5 <= tile_8_filtered_output(8);
   bh7_w60_5 <= tile_8_filtered_output(9);
   bh7_w61_5 <= tile_8_filtered_output(10);
   bh7_w62_5 <= tile_8_filtered_output(11);
   bh7_w63_5 <= tile_8_filtered_output(12);
   bh7_w64_5 <= tile_8_filtered_output(13);
   bh7_w65_5 <= tile_8_filtered_output(14);
   bh7_w66_5 <= tile_8_filtered_output(15);
   bh7_w67_5 <= tile_8_filtered_output(16);
   bh7_w68_5 <= tile_8_filtered_output(17);
   bh7_w69_5 <= tile_8_filtered_output(18);
   bh7_w70_5 <= tile_8_filtered_output(19);
   bh7_w71_5 <= tile_8_filtered_output(20);
   bh7_w72_5 <= tile_8_filtered_output(21);
   bh7_w73_5 <= tile_8_filtered_output(22);
   bh7_w74_5 <= tile_8_filtered_output(23);
   bh7_w75_4 <= tile_8_filtered_output(24);
   bh7_w76_4 <= tile_8_filtered_output(25);
   bh7_w77_4 <= tile_8_filtered_output(26);
   bh7_w78_4 <= tile_8_filtered_output(27);
   bh7_w79_4 <= tile_8_filtered_output(28);
   bh7_w80_4 <= tile_8_filtered_output(29);
   bh7_w81_3 <= tile_8_filtered_output(30);
   bh7_w82_2 <= tile_8_filtered_output(31);
   bh7_w83_2 <= tile_8_filtered_output(32);
   bh7_w84_2 <= tile_8_filtered_output(33);
   bh7_w85_2 <= tile_8_filtered_output(34);
   bh7_w86_2 <= tile_8_filtered_output(35);
   bh7_w87_2 <= tile_8_filtered_output(36);
   tile_9_X <= X(47 downto 24);
   tile_9_Y <= Y(63 downto 51);
   tile_9_mult: DSPBlock_24x13_Freq300_uid27
      port map ( clk  => clk,
                 X => tile_9_X,
                 Y => tile_9_Y,
                 R => tile_9_output);

   tile_9_filtered_output <= unsigned(tile_9_output(36 downto 0));
   bh7_w75_5 <= tile_9_filtered_output(0);
   bh7_w76_5 <= tile_9_filtered_output(1);
   bh7_w77_5 <= tile_9_filtered_output(2);
   bh7_w78_5 <= tile_9_filtered_output(3);
   bh7_w79_5 <= tile_9_filtered_output(4);
   bh7_w80_5 <= tile_9_filtered_output(5);
   bh7_w81_4 <= tile_9_filtered_output(6);
   bh7_w82_3 <= tile_9_filtered_output(7);
   bh7_w83_3 <= tile_9_filtered_output(8);
   bh7_w84_3 <= tile_9_filtered_output(9);
   bh7_w85_3 <= tile_9_filtered_output(10);
   bh7_w86_3 <= tile_9_filtered_output(11);
   bh7_w87_3 <= tile_9_filtered_output(12);
   bh7_w88_2 <= tile_9_filtered_output(13);
   bh7_w89_2 <= tile_9_filtered_output(14);
   bh7_w90_2 <= tile_9_filtered_output(15);
   bh7_w91_2 <= tile_9_filtered_output(16);
   bh7_w92_2 <= tile_9_filtered_output(17);
   bh7_w93_2 <= tile_9_filtered_output(18);
   bh7_w94_2 <= tile_9_filtered_output(19);
   bh7_w95_2 <= tile_9_filtered_output(20);
   bh7_w96_2 <= tile_9_filtered_output(21);
   bh7_w97_2 <= tile_9_filtered_output(22);
   bh7_w98_2 <= tile_9_filtered_output(23);
   bh7_w99_1 <= tile_9_filtered_output(24);
   bh7_w100_1 <= tile_9_filtered_output(25);
   bh7_w101_1 <= tile_9_filtered_output(26);
   bh7_w102_1 <= tile_9_filtered_output(27);
   bh7_w103_1 <= tile_9_filtered_output(28);
   bh7_w104_1 <= tile_9_filtered_output(29);
   bh7_w105_0 <= tile_9_filtered_output(30);
   bh7_w106_0 <= tile_9_filtered_output(31);
   bh7_w107_0 <= tile_9_filtered_output(32);
   bh7_w108_0 <= tile_9_filtered_output(33);
   bh7_w109_0 <= tile_9_filtered_output(34);
   bh7_w110_0 <= tile_9_filtered_output(35);
   bh7_w111_0 <= tile_9_filtered_output(36);
   tile_10_X <= X(63 downto 48);
   tile_10_Y <= Y(63 downto 41);
   tile_10_mult: DSPBlock_16x23_Freq300_uid29
      port map ( clk  => clk,
                 X => tile_10_X,
                 Y => tile_10_Y,
                 R => tile_10_output);

   tile_10_filtered_output <= unsigned(tile_10_output(38 downto 0));
   bh7_w89_3 <= tile_10_filtered_output(0);
   bh7_w90_3 <= tile_10_filtered_output(1);
   bh7_w91_3 <= tile_10_filtered_output(2);
   bh7_w92_3 <= tile_10_filtered_output(3);
   bh7_w93_3 <= tile_10_filtered_output(4);
   bh7_w94_3 <= tile_10_filtered_output(5);
   bh7_w95_3 <= tile_10_filtered_output(6);
   bh7_w96_3 <= tile_10_filtered_output(7);
   bh7_w97_3 <= tile_10_filtered_output(8);
   bh7_w98_3 <= tile_10_filtered_output(9);
   bh7_w99_2 <= tile_10_filtered_output(10);
   bh7_w100_2 <= tile_10_filtered_output(11);
   bh7_w101_2 <= tile_10_filtered_output(12);
   bh7_w102_2 <= tile_10_filtered_output(13);
   bh7_w103_2 <= tile_10_filtered_output(14);
   bh7_w104_2 <= tile_10_filtered_output(15);
   bh7_w105_1 <= tile_10_filtered_output(16);
   bh7_w106_1 <= tile_10_filtered_output(17);
   bh7_w107_1 <= tile_10_filtered_output(18);
   bh7_w108_1 <= tile_10_filtered_output(19);
   bh7_w109_1 <= tile_10_filtered_output(20);
   bh7_w110_1 <= tile_10_filtered_output(21);
   bh7_w111_1 <= tile_10_filtered_output(22);
   bh7_w112_0 <= tile_10_filtered_output(23);
   bh7_w113_0 <= tile_10_filtered_output(24);
   bh7_w114_0 <= tile_10_filtered_output(25);
   bh7_w115_0 <= tile_10_filtered_output(26);
   bh7_w116_0 <= tile_10_filtered_output(27);
   bh7_w117_0 <= tile_10_filtered_output(28);
   bh7_w118_0 <= tile_10_filtered_output(29);
   bh7_w119_0 <= tile_10_filtered_output(30);
   bh7_w120_0 <= tile_10_filtered_output(31);
   bh7_w121_0 <= tile_10_filtered_output(32);
   bh7_w122_0 <= tile_10_filtered_output(33);
   bh7_w123_0 <= tile_10_filtered_output(34);
   bh7_w124_0 <= tile_10_filtered_output(35);
   bh7_w125_0 <= tile_10_filtered_output(36);
   bh7_w126_0 <= tile_10_filtered_output(37);
   bh7_w127_0 <= tile_10_filtered_output(38);

   -- Adding the constant bits 
      -- All the constant bits are zero, nothing to add


   Compressor_23_3_Freq300_uid32_bh7_uid33_In0 <= "" & bh7_w17_0 & bh7_w17_1 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid33_In1 <= "" & bh7_w18_0 & bh7_w18_1;
   bh7_w17_2 <= Compressor_23_3_Freq300_uid32_bh7_uid33_Out0(0);
   bh7_w18_2 <= Compressor_23_3_Freq300_uid32_bh7_uid33_Out0(1);
   bh7_w19_2 <= Compressor_23_3_Freq300_uid32_bh7_uid33_Out0(2);
   Compressor_23_3_Freq300_uid32_uid33: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid33_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid33_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid33_Out0_copy34);
   Compressor_23_3_Freq300_uid32_bh7_uid33_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid33_Out0_copy34; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid35_In0 <= "" & bh7_w19_0 & bh7_w19_1 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid35_In1 <= "" & bh7_w20_0 & bh7_w20_1;
   bh7_w19_3 <= Compressor_23_3_Freq300_uid32_bh7_uid35_Out0(0);
   bh7_w20_2 <= Compressor_23_3_Freq300_uid32_bh7_uid35_Out0(1);
   bh7_w21_2 <= Compressor_23_3_Freq300_uid32_bh7_uid35_Out0(2);
   Compressor_23_3_Freq300_uid32_uid35: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid35_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid35_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid35_Out0_copy36);
   Compressor_23_3_Freq300_uid32_bh7_uid35_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid35_Out0_copy36; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid37_In0 <= "" & bh7_w21_0 & bh7_w21_1 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid37_In1 <= "" & bh7_w22_0 & bh7_w22_1;
   bh7_w21_3 <= Compressor_23_3_Freq300_uid32_bh7_uid37_Out0(0);
   bh7_w22_2 <= Compressor_23_3_Freq300_uid32_bh7_uid37_Out0(1);
   bh7_w23_2 <= Compressor_23_3_Freq300_uid32_bh7_uid37_Out0(2);
   Compressor_23_3_Freq300_uid32_uid37: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid37_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid37_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid37_Out0_copy38);
   Compressor_23_3_Freq300_uid32_bh7_uid37_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid37_Out0_copy38; -- output copy to hold a pipeline register if needed


   Compressor_3_2_Freq300_uid40_bh7_uid41_In0 <= "" & bh7_w23_0 & bh7_w23_1 & "0";
   bh7_w23_3 <= Compressor_3_2_Freq300_uid40_bh7_uid41_Out0(0);
   bh7_w24_3 <= Compressor_3_2_Freq300_uid40_bh7_uid41_Out0(1);
   Compressor_3_2_Freq300_uid40_uid41: Compressor_3_2_Freq300_uid40
      port map ( X0 => Compressor_3_2_Freq300_uid40_bh7_uid41_In0,
                 R => Compressor_3_2_Freq300_uid40_bh7_uid41_Out0_copy42);
   Compressor_3_2_Freq300_uid40_bh7_uid41_Out0 <= Compressor_3_2_Freq300_uid40_bh7_uid41_Out0_copy42; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid43_In0 <= "" & bh7_w24_0 & bh7_w24_1 & bh7_w24_2;
   Compressor_23_3_Freq300_uid32_bh7_uid43_In1 <= "" & bh7_w25_0 & bh7_w25_1;
   bh7_w24_4 <= Compressor_23_3_Freq300_uid32_bh7_uid43_Out0(0);
   bh7_w25_3 <= Compressor_23_3_Freq300_uid32_bh7_uid43_Out0(1);
   bh7_w26_3 <= Compressor_23_3_Freq300_uid32_bh7_uid43_Out0(2);
   Compressor_23_3_Freq300_uid32_uid43: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid43_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid43_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid43_Out0_copy44);
   Compressor_23_3_Freq300_uid32_bh7_uid43_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid43_Out0_copy44; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid45_In0 <= "" & bh7_w26_0 & bh7_w26_1 & bh7_w26_2;
   Compressor_23_3_Freq300_uid32_bh7_uid45_In1 <= "" & bh7_w27_0 & bh7_w27_1;
   bh7_w26_4 <= Compressor_23_3_Freq300_uid32_bh7_uid45_Out0(0);
   bh7_w27_3 <= Compressor_23_3_Freq300_uid32_bh7_uid45_Out0(1);
   bh7_w28_3 <= Compressor_23_3_Freq300_uid32_bh7_uid45_Out0(2);
   Compressor_23_3_Freq300_uid32_uid45: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid45_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid45_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid45_Out0_copy46);
   Compressor_23_3_Freq300_uid32_bh7_uid45_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid45_Out0_copy46; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid47_In0 <= "" & bh7_w28_0 & bh7_w28_1 & bh7_w28_2;
   Compressor_23_3_Freq300_uid32_bh7_uid47_In1 <= "" & bh7_w29_0 & bh7_w29_1;
   bh7_w28_4 <= Compressor_23_3_Freq300_uid32_bh7_uid47_Out0(0);
   bh7_w29_3 <= Compressor_23_3_Freq300_uid32_bh7_uid47_Out0(1);
   bh7_w30_3 <= Compressor_23_3_Freq300_uid32_bh7_uid47_Out0(2);
   Compressor_23_3_Freq300_uid32_uid47: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid47_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid47_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid47_Out0_copy48);
   Compressor_23_3_Freq300_uid32_bh7_uid47_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid47_Out0_copy48; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid49_In0 <= "" & bh7_w30_0 & bh7_w30_1 & bh7_w30_2;
   Compressor_23_3_Freq300_uid32_bh7_uid49_In1 <= "" & bh7_w31_0 & bh7_w31_1;
   bh7_w30_4 <= Compressor_23_3_Freq300_uid32_bh7_uid49_Out0(0);
   bh7_w31_3 <= Compressor_23_3_Freq300_uid32_bh7_uid49_Out0(1);
   bh7_w32_3 <= Compressor_23_3_Freq300_uid32_bh7_uid49_Out0(2);
   Compressor_23_3_Freq300_uid32_uid49: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid49_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid49_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid49_Out0_copy50);
   Compressor_23_3_Freq300_uid32_bh7_uid49_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid49_Out0_copy50; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid51_In0 <= "" & bh7_w32_0 & bh7_w32_1 & bh7_w32_2;
   Compressor_23_3_Freq300_uid32_bh7_uid51_In1 <= "" & bh7_w33_0 & bh7_w33_1;
   bh7_w32_4 <= Compressor_23_3_Freq300_uid32_bh7_uid51_Out0(0);
   bh7_w33_3 <= Compressor_23_3_Freq300_uid32_bh7_uid51_Out0(1);
   bh7_w34_4 <= Compressor_23_3_Freq300_uid32_bh7_uid51_Out0(2);
   Compressor_23_3_Freq300_uid32_uid51: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid51_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid51_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid51_Out0_copy52);
   Compressor_23_3_Freq300_uid32_bh7_uid51_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid51_Out0_copy52; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid55_In0 <= "" & bh7_w34_0 & bh7_w34_1 & bh7_w34_2 & bh7_w34_3;
   Compressor_14_3_Freq300_uid54_bh7_uid55_In1 <= "" & bh7_w35_0;
   bh7_w34_5 <= Compressor_14_3_Freq300_uid54_bh7_uid55_Out0(0);
   bh7_w35_4 <= Compressor_14_3_Freq300_uid54_bh7_uid55_Out0(1);
   bh7_w36_4 <= Compressor_14_3_Freq300_uid54_bh7_uid55_Out0(2);
   Compressor_14_3_Freq300_uid54_uid55: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid55_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid55_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid55_Out0_copy56);
   Compressor_14_3_Freq300_uid54_bh7_uid55_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid55_Out0_copy56; -- output copy to hold a pipeline register if needed


   Compressor_3_2_Freq300_uid40_bh7_uid57_In0 <= "" & bh7_w35_1 & bh7_w35_2 & bh7_w35_3;
   bh7_w35_5 <= Compressor_3_2_Freq300_uid40_bh7_uid57_Out0(0);
   bh7_w36_5 <= Compressor_3_2_Freq300_uid40_bh7_uid57_Out0(1);
   Compressor_3_2_Freq300_uid40_uid57: Compressor_3_2_Freq300_uid40
      port map ( X0 => Compressor_3_2_Freq300_uid40_bh7_uid57_In0,
                 R => Compressor_3_2_Freq300_uid40_bh7_uid57_Out0_copy58);
   Compressor_3_2_Freq300_uid40_bh7_uid57_Out0 <= Compressor_3_2_Freq300_uid40_bh7_uid57_Out0_copy58; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid59_In0 <= "" & bh7_w36_0 & bh7_w36_1 & bh7_w36_2 & bh7_w36_3;
   Compressor_14_3_Freq300_uid54_bh7_uid59_In1 <= "" & bh7_w37_0;
   bh7_w36_6 <= Compressor_14_3_Freq300_uid54_bh7_uid59_Out0(0);
   bh7_w37_4 <= Compressor_14_3_Freq300_uid54_bh7_uid59_Out0(1);
   bh7_w38_4 <= Compressor_14_3_Freq300_uid54_bh7_uid59_Out0(2);
   Compressor_14_3_Freq300_uid54_uid59: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid59_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid59_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid59_Out0_copy60);
   Compressor_14_3_Freq300_uid54_bh7_uid59_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid59_Out0_copy60; -- output copy to hold a pipeline register if needed


   Compressor_3_2_Freq300_uid40_bh7_uid61_In0 <= "" & bh7_w37_1 & bh7_w37_2 & bh7_w37_3;
   bh7_w37_5 <= Compressor_3_2_Freq300_uid40_bh7_uid61_Out0(0);
   bh7_w38_5 <= Compressor_3_2_Freq300_uid40_bh7_uid61_Out0(1);
   Compressor_3_2_Freq300_uid40_uid61: Compressor_3_2_Freq300_uid40
      port map ( X0 => Compressor_3_2_Freq300_uid40_bh7_uid61_In0,
                 R => Compressor_3_2_Freq300_uid40_bh7_uid61_Out0_copy62);
   Compressor_3_2_Freq300_uid40_bh7_uid61_Out0 <= Compressor_3_2_Freq300_uid40_bh7_uid61_Out0_copy62; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid63_In0 <= "" & bh7_w38_0 & bh7_w38_1 & bh7_w38_2 & bh7_w38_3;
   Compressor_14_3_Freq300_uid54_bh7_uid63_In1 <= "" & bh7_w39_0;
   bh7_w38_6 <= Compressor_14_3_Freq300_uid54_bh7_uid63_Out0(0);
   bh7_w39_4 <= Compressor_14_3_Freq300_uid54_bh7_uid63_Out0(1);
   bh7_w40_4 <= Compressor_14_3_Freq300_uid54_bh7_uid63_Out0(2);
   Compressor_14_3_Freq300_uid54_uid63: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid63_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid63_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid63_Out0_copy64);
   Compressor_14_3_Freq300_uid54_bh7_uid63_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid63_Out0_copy64; -- output copy to hold a pipeline register if needed


   Compressor_3_2_Freq300_uid40_bh7_uid65_In0 <= "" & bh7_w39_1 & bh7_w39_2 & bh7_w39_3;
   bh7_w39_5 <= Compressor_3_2_Freq300_uid40_bh7_uid65_Out0(0);
   bh7_w40_5 <= Compressor_3_2_Freq300_uid40_bh7_uid65_Out0(1);
   Compressor_3_2_Freq300_uid40_uid65: Compressor_3_2_Freq300_uid40
      port map ( X0 => Compressor_3_2_Freq300_uid40_bh7_uid65_In0,
                 R => Compressor_3_2_Freq300_uid40_bh7_uid65_Out0_copy66);
   Compressor_3_2_Freq300_uid40_bh7_uid65_Out0 <= Compressor_3_2_Freq300_uid40_bh7_uid65_Out0_copy66; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid67_In0 <= "" & bh7_w40_0 & bh7_w40_1 & bh7_w40_2 & bh7_w40_3;
   Compressor_14_3_Freq300_uid54_bh7_uid67_In1 <= "" & bh7_w41_0;
   bh7_w40_6 <= Compressor_14_3_Freq300_uid54_bh7_uid67_Out0(0);
   bh7_w41_4 <= Compressor_14_3_Freq300_uid54_bh7_uid67_Out0(1);
   bh7_w42_4 <= Compressor_14_3_Freq300_uid54_bh7_uid67_Out0(2);
   Compressor_14_3_Freq300_uid54_uid67: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid67_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid67_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid67_Out0_copy68);
   Compressor_14_3_Freq300_uid54_bh7_uid67_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid67_Out0_copy68; -- output copy to hold a pipeline register if needed


   Compressor_3_2_Freq300_uid40_bh7_uid69_In0 <= "" & bh7_w41_1 & bh7_w41_2 & bh7_w41_3;
   bh7_w41_5 <= Compressor_3_2_Freq300_uid40_bh7_uid69_Out0(0);
   bh7_w42_5 <= Compressor_3_2_Freq300_uid40_bh7_uid69_Out0(1);
   Compressor_3_2_Freq300_uid40_uid69: Compressor_3_2_Freq300_uid40
      port map ( X0 => Compressor_3_2_Freq300_uid40_bh7_uid69_In0,
                 R => Compressor_3_2_Freq300_uid40_bh7_uid69_Out0_copy70);
   Compressor_3_2_Freq300_uid40_bh7_uid69_Out0 <= Compressor_3_2_Freq300_uid40_bh7_uid69_Out0_copy70; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid71_In0 <= "" & bh7_w42_0 & bh7_w42_1 & bh7_w42_2 & bh7_w42_3;
   Compressor_14_3_Freq300_uid54_bh7_uid71_In1 <= "" & bh7_w43_0;
   bh7_w42_6 <= Compressor_14_3_Freq300_uid54_bh7_uid71_Out0(0);
   bh7_w43_4 <= Compressor_14_3_Freq300_uid54_bh7_uid71_Out0(1);
   bh7_w44_4 <= Compressor_14_3_Freq300_uid54_bh7_uid71_Out0(2);
   Compressor_14_3_Freq300_uid54_uid71: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid71_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid71_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid71_Out0_copy72);
   Compressor_14_3_Freq300_uid54_bh7_uid71_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid71_Out0_copy72; -- output copy to hold a pipeline register if needed


   Compressor_3_2_Freq300_uid40_bh7_uid73_In0 <= "" & bh7_w43_1 & bh7_w43_2 & bh7_w43_3;
   bh7_w43_5 <= Compressor_3_2_Freq300_uid40_bh7_uid73_Out0(0);
   bh7_w44_5 <= Compressor_3_2_Freq300_uid40_bh7_uid73_Out0(1);
   Compressor_3_2_Freq300_uid40_uid73: Compressor_3_2_Freq300_uid40
      port map ( X0 => Compressor_3_2_Freq300_uid40_bh7_uid73_In0,
                 R => Compressor_3_2_Freq300_uid40_bh7_uid73_Out0_copy74);
   Compressor_3_2_Freq300_uid40_bh7_uid73_Out0 <= Compressor_3_2_Freq300_uid40_bh7_uid73_Out0_copy74; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid75_In0 <= "" & bh7_w44_0 & bh7_w44_1 & bh7_w44_2 & bh7_w44_3;
   Compressor_14_3_Freq300_uid54_bh7_uid75_In1 <= "" & bh7_w45_0;
   bh7_w44_6 <= Compressor_14_3_Freq300_uid54_bh7_uid75_Out0(0);
   bh7_w45_4 <= Compressor_14_3_Freq300_uid54_bh7_uid75_Out0(1);
   bh7_w46_4 <= Compressor_14_3_Freq300_uid54_bh7_uid75_Out0(2);
   Compressor_14_3_Freq300_uid54_uid75: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid75_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid75_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid75_Out0_copy76);
   Compressor_14_3_Freq300_uid54_bh7_uid75_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid75_Out0_copy76; -- output copy to hold a pipeline register if needed


   Compressor_3_2_Freq300_uid40_bh7_uid77_In0 <= "" & bh7_w45_1 & bh7_w45_2 & bh7_w45_3;
   bh7_w45_5 <= Compressor_3_2_Freq300_uid40_bh7_uid77_Out0(0);
   bh7_w46_5 <= Compressor_3_2_Freq300_uid40_bh7_uid77_Out0(1);
   Compressor_3_2_Freq300_uid40_uid77: Compressor_3_2_Freq300_uid40
      port map ( X0 => Compressor_3_2_Freq300_uid40_bh7_uid77_In0,
                 R => Compressor_3_2_Freq300_uid40_bh7_uid77_Out0_copy78);
   Compressor_3_2_Freq300_uid40_bh7_uid77_Out0 <= Compressor_3_2_Freq300_uid40_bh7_uid77_Out0_copy78; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid79_In0 <= "" & bh7_w46_0 & bh7_w46_1 & bh7_w46_2 & bh7_w46_3;
   Compressor_14_3_Freq300_uid54_bh7_uid79_In1 <= "" & bh7_w47_0;
   bh7_w46_6 <= Compressor_14_3_Freq300_uid54_bh7_uid79_Out0(0);
   bh7_w47_4 <= Compressor_14_3_Freq300_uid54_bh7_uid79_Out0(1);
   bh7_w48_5 <= Compressor_14_3_Freq300_uid54_bh7_uid79_Out0(2);
   Compressor_14_3_Freq300_uid54_uid79: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid79_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid79_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid79_Out0_copy80);
   Compressor_14_3_Freq300_uid54_bh7_uid79_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid79_Out0_copy80; -- output copy to hold a pipeline register if needed


   Compressor_3_2_Freq300_uid40_bh7_uid81_In0 <= "" & bh7_w47_1 & bh7_w47_2 & bh7_w47_3;
   bh7_w47_5 <= Compressor_3_2_Freq300_uid40_bh7_uid81_Out0(0);
   bh7_w48_6 <= Compressor_3_2_Freq300_uid40_bh7_uid81_Out0(1);
   Compressor_3_2_Freq300_uid40_uid81: Compressor_3_2_Freq300_uid40
      port map ( X0 => Compressor_3_2_Freq300_uid40_bh7_uid81_In0,
                 R => Compressor_3_2_Freq300_uid40_bh7_uid81_Out0_copy82);
   Compressor_3_2_Freq300_uid40_bh7_uid81_Out0 <= Compressor_3_2_Freq300_uid40_bh7_uid81_Out0_copy82; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid83_In0 <= "" & bh7_w48_0 & bh7_w48_1 & bh7_w48_2 & bh7_w48_3;
   Compressor_14_3_Freq300_uid54_bh7_uid83_In1 <= "" & bh7_w49_0;
   bh7_w48_7 <= Compressor_14_3_Freq300_uid54_bh7_uid83_Out0(0);
   bh7_w49_5 <= Compressor_14_3_Freq300_uid54_bh7_uid83_Out0(1);
   bh7_w50_5 <= Compressor_14_3_Freq300_uid54_bh7_uid83_Out0(2);
   Compressor_14_3_Freq300_uid54_uid83: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid83_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid83_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid83_Out0_copy84);
   Compressor_14_3_Freq300_uid54_bh7_uid83_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid83_Out0_copy84; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid85_In0 <= "" & bh7_w49_1 & bh7_w49_2 & bh7_w49_3 & bh7_w49_4;
   Compressor_14_3_Freq300_uid54_bh7_uid85_In1 <= "" & bh7_w50_0;
   bh7_w49_6 <= Compressor_14_3_Freq300_uid54_bh7_uid85_Out0(0);
   bh7_w50_6 <= Compressor_14_3_Freq300_uid54_bh7_uid85_Out0(1);
   bh7_w51_6 <= Compressor_14_3_Freq300_uid54_bh7_uid85_Out0(2);
   Compressor_14_3_Freq300_uid54_uid85: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid85_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid85_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid85_Out0_copy86);
   Compressor_14_3_Freq300_uid54_bh7_uid85_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid85_Out0_copy86; -- output copy to hold a pipeline register if needed


   Compressor_3_2_Freq300_uid40_bh7_uid87_In0 <= "" & bh7_w50_1 & bh7_w50_2 & bh7_w50_3;
   bh7_w50_7 <= Compressor_3_2_Freq300_uid40_bh7_uid87_Out0(0);
   bh7_w51_7 <= Compressor_3_2_Freq300_uid40_bh7_uid87_Out0(1);
   Compressor_3_2_Freq300_uid40_uid87: Compressor_3_2_Freq300_uid40
      port map ( X0 => Compressor_3_2_Freq300_uid40_bh7_uid87_In0,
                 R => Compressor_3_2_Freq300_uid40_bh7_uid87_Out0_copy88);
   Compressor_3_2_Freq300_uid40_bh7_uid87_Out0 <= Compressor_3_2_Freq300_uid40_bh7_uid87_Out0_copy88; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid91_In0 <= "" & bh7_w51_0 & bh7_w51_1 & bh7_w51_2 & bh7_w51_3 & bh7_w51_4 & bh7_w51_5;
   bh7_w51_8 <= Compressor_6_3_Freq300_uid90_bh7_uid91_Out0(0);
   bh7_w52_6 <= Compressor_6_3_Freq300_uid90_bh7_uid91_Out0(1);
   bh7_w53_6 <= Compressor_6_3_Freq300_uid90_bh7_uid91_Out0(2);
   Compressor_6_3_Freq300_uid90_uid91: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid91_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid91_Out0_copy92);
   Compressor_6_3_Freq300_uid90_bh7_uid91_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid91_Out0_copy92; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid93_In0 <= "" & bh7_w52_0 & bh7_w52_1 & bh7_w52_2 & bh7_w52_3 & bh7_w52_4 & bh7_w52_5;
   bh7_w52_7 <= Compressor_6_3_Freq300_uid90_bh7_uid93_Out0(0);
   bh7_w53_7 <= Compressor_6_3_Freq300_uid90_bh7_uid93_Out0(1);
   bh7_w54_6 <= Compressor_6_3_Freq300_uid90_bh7_uid93_Out0(2);
   Compressor_6_3_Freq300_uid90_uid93: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid93_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid93_Out0_copy94);
   Compressor_6_3_Freq300_uid90_bh7_uid93_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid93_Out0_copy94; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid95_In0 <= "" & bh7_w53_0 & bh7_w53_1 & bh7_w53_2 & bh7_w53_3 & bh7_w53_4 & bh7_w53_5;
   bh7_w53_8 <= Compressor_6_3_Freq300_uid90_bh7_uid95_Out0(0);
   bh7_w54_7 <= Compressor_6_3_Freq300_uid90_bh7_uid95_Out0(1);
   bh7_w55_6 <= Compressor_6_3_Freq300_uid90_bh7_uid95_Out0(2);
   Compressor_6_3_Freq300_uid90_uid95: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid95_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid95_Out0_copy96);
   Compressor_6_3_Freq300_uid90_bh7_uid95_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid95_Out0_copy96; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid97_In0 <= "" & bh7_w54_0 & bh7_w54_1 & bh7_w54_2 & bh7_w54_3 & bh7_w54_4 & bh7_w54_5;
   bh7_w54_8 <= Compressor_6_3_Freq300_uid90_bh7_uid97_Out0(0);
   bh7_w55_7 <= Compressor_6_3_Freq300_uid90_bh7_uid97_Out0(1);
   bh7_w56_6 <= Compressor_6_3_Freq300_uid90_bh7_uid97_Out0(2);
   Compressor_6_3_Freq300_uid90_uid97: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid97_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid97_Out0_copy98);
   Compressor_6_3_Freq300_uid90_bh7_uid97_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid97_Out0_copy98; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid99_In0 <= "" & bh7_w55_0 & bh7_w55_1 & bh7_w55_2 & bh7_w55_3 & bh7_w55_4 & bh7_w55_5;
   bh7_w55_8 <= Compressor_6_3_Freq300_uid90_bh7_uid99_Out0(0);
   bh7_w56_7 <= Compressor_6_3_Freq300_uid90_bh7_uid99_Out0(1);
   bh7_w57_6 <= Compressor_6_3_Freq300_uid90_bh7_uid99_Out0(2);
   Compressor_6_3_Freq300_uid90_uid99: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid99_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid99_Out0_copy100);
   Compressor_6_3_Freq300_uid90_bh7_uid99_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid99_Out0_copy100; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid101_In0 <= "" & bh7_w56_0 & bh7_w56_1 & bh7_w56_2 & bh7_w56_3 & bh7_w56_4 & bh7_w56_5;
   bh7_w56_8 <= Compressor_6_3_Freq300_uid90_bh7_uid101_Out0(0);
   bh7_w57_7 <= Compressor_6_3_Freq300_uid90_bh7_uid101_Out0(1);
   bh7_w58_6 <= Compressor_6_3_Freq300_uid90_bh7_uid101_Out0(2);
   Compressor_6_3_Freq300_uid90_uid101: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid101_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid101_Out0_copy102);
   Compressor_6_3_Freq300_uid90_bh7_uid101_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid101_Out0_copy102; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid103_In0 <= "" & bh7_w57_0 & bh7_w57_1 & bh7_w57_2 & bh7_w57_3 & bh7_w57_4 & bh7_w57_5;
   bh7_w57_8 <= Compressor_6_3_Freq300_uid90_bh7_uid103_Out0(0);
   bh7_w58_7 <= Compressor_6_3_Freq300_uid90_bh7_uid103_Out0(1);
   bh7_w59_6 <= Compressor_6_3_Freq300_uid90_bh7_uid103_Out0(2);
   Compressor_6_3_Freq300_uid90_uid103: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid103_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid103_Out0_copy104);
   Compressor_6_3_Freq300_uid90_bh7_uid103_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid103_Out0_copy104; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid105_In0 <= "" & bh7_w58_0 & bh7_w58_1 & bh7_w58_2 & bh7_w58_3 & bh7_w58_4 & bh7_w58_5;
   bh7_w58_8 <= Compressor_6_3_Freq300_uid90_bh7_uid105_Out0(0);
   bh7_w59_7 <= Compressor_6_3_Freq300_uid90_bh7_uid105_Out0(1);
   bh7_w60_6 <= Compressor_6_3_Freq300_uid90_bh7_uid105_Out0(2);
   Compressor_6_3_Freq300_uid90_uid105: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid105_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid105_Out0_copy106);
   Compressor_6_3_Freq300_uid90_bh7_uid105_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid105_Out0_copy106; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid107_In0 <= "" & bh7_w59_0 & bh7_w59_1 & bh7_w59_2 & bh7_w59_3 & bh7_w59_4 & bh7_w59_5;
   bh7_w59_8 <= Compressor_6_3_Freq300_uid90_bh7_uid107_Out0(0);
   bh7_w60_7 <= Compressor_6_3_Freq300_uid90_bh7_uid107_Out0(1);
   bh7_w61_6 <= Compressor_6_3_Freq300_uid90_bh7_uid107_Out0(2);
   Compressor_6_3_Freq300_uid90_uid107: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid107_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid107_Out0_copy108);
   Compressor_6_3_Freq300_uid90_bh7_uid107_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid107_Out0_copy108; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid109_In0 <= "" & bh7_w60_0 & bh7_w60_1 & bh7_w60_2 & bh7_w60_3 & bh7_w60_4 & bh7_w60_5;
   bh7_w60_8 <= Compressor_6_3_Freq300_uid90_bh7_uid109_Out0(0);
   bh7_w61_7 <= Compressor_6_3_Freq300_uid90_bh7_uid109_Out0(1);
   bh7_w62_6 <= Compressor_6_3_Freq300_uid90_bh7_uid109_Out0(2);
   Compressor_6_3_Freq300_uid90_uid109: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid109_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid109_Out0_copy110);
   Compressor_6_3_Freq300_uid90_bh7_uid109_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid109_Out0_copy110; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid111_In0 <= "" & bh7_w61_0 & bh7_w61_1 & bh7_w61_2 & bh7_w61_3 & bh7_w61_4 & bh7_w61_5;
   bh7_w61_8 <= Compressor_6_3_Freq300_uid90_bh7_uid111_Out0(0);
   bh7_w62_7 <= Compressor_6_3_Freq300_uid90_bh7_uid111_Out0(1);
   bh7_w63_6 <= Compressor_6_3_Freq300_uid90_bh7_uid111_Out0(2);
   Compressor_6_3_Freq300_uid90_uid111: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid111_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid111_Out0_copy112);
   Compressor_6_3_Freq300_uid90_bh7_uid111_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid111_Out0_copy112; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid113_In0 <= "" & bh7_w62_0 & bh7_w62_1 & bh7_w62_2 & bh7_w62_3 & bh7_w62_4 & bh7_w62_5;
   bh7_w62_8 <= Compressor_6_3_Freq300_uid90_bh7_uid113_Out0(0);
   bh7_w63_7 <= Compressor_6_3_Freq300_uid90_bh7_uid113_Out0(1);
   bh7_w64_6 <= Compressor_6_3_Freq300_uid90_bh7_uid113_Out0(2);
   Compressor_6_3_Freq300_uid90_uid113: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid113_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid113_Out0_copy114);
   Compressor_6_3_Freq300_uid90_bh7_uid113_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid113_Out0_copy114; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid115_In0 <= "" & bh7_w63_0 & bh7_w63_1 & bh7_w63_2 & bh7_w63_3 & bh7_w63_4 & bh7_w63_5;
   bh7_w63_8 <= Compressor_6_3_Freq300_uid90_bh7_uid115_Out0(0);
   bh7_w64_7 <= Compressor_6_3_Freq300_uid90_bh7_uid115_Out0(1);
   bh7_w65_6 <= Compressor_6_3_Freq300_uid90_bh7_uid115_Out0(2);
   Compressor_6_3_Freq300_uid90_uid115: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid115_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid115_Out0_copy116);
   Compressor_6_3_Freq300_uid90_bh7_uid115_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid115_Out0_copy116; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid117_In0 <= "" & bh7_w64_0 & bh7_w64_1 & bh7_w64_2 & bh7_w64_3 & bh7_w64_4 & bh7_w64_5;
   bh7_w64_8 <= Compressor_6_3_Freq300_uid90_bh7_uid117_Out0(0);
   bh7_w65_7 <= Compressor_6_3_Freq300_uid90_bh7_uid117_Out0(1);
   bh7_w66_6 <= Compressor_6_3_Freq300_uid90_bh7_uid117_Out0(2);
   Compressor_6_3_Freq300_uid90_uid117: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid117_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid117_Out0_copy118);
   Compressor_6_3_Freq300_uid90_bh7_uid117_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid117_Out0_copy118; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid119_In0 <= "" & bh7_w65_0 & bh7_w65_1 & bh7_w65_2 & bh7_w65_3 & bh7_w65_4 & bh7_w65_5;
   bh7_w65_8 <= Compressor_6_3_Freq300_uid90_bh7_uid119_Out0(0);
   bh7_w66_7 <= Compressor_6_3_Freq300_uid90_bh7_uid119_Out0(1);
   bh7_w67_6 <= Compressor_6_3_Freq300_uid90_bh7_uid119_Out0(2);
   Compressor_6_3_Freq300_uid90_uid119: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid119_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid119_Out0_copy120);
   Compressor_6_3_Freq300_uid90_bh7_uid119_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid119_Out0_copy120; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid121_In0 <= "" & bh7_w66_0 & bh7_w66_1 & bh7_w66_2 & bh7_w66_3 & bh7_w66_4 & bh7_w66_5;
   bh7_w66_8 <= Compressor_6_3_Freq300_uid90_bh7_uid121_Out0(0);
   bh7_w67_7 <= Compressor_6_3_Freq300_uid90_bh7_uid121_Out0(1);
   bh7_w68_6 <= Compressor_6_3_Freq300_uid90_bh7_uid121_Out0(2);
   Compressor_6_3_Freq300_uid90_uid121: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid121_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid121_Out0_copy122);
   Compressor_6_3_Freq300_uid90_bh7_uid121_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid121_Out0_copy122; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid123_In0 <= "" & bh7_w67_0 & bh7_w67_1 & bh7_w67_2 & bh7_w67_3 & bh7_w67_4 & bh7_w67_5;
   bh7_w67_8 <= Compressor_6_3_Freq300_uid90_bh7_uid123_Out0(0);
   bh7_w68_7 <= Compressor_6_3_Freq300_uid90_bh7_uid123_Out0(1);
   bh7_w69_6 <= Compressor_6_3_Freq300_uid90_bh7_uid123_Out0(2);
   Compressor_6_3_Freq300_uid90_uid123: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid123_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid123_Out0_copy124);
   Compressor_6_3_Freq300_uid90_bh7_uid123_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid123_Out0_copy124; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid125_In0 <= "" & bh7_w68_0 & bh7_w68_1 & bh7_w68_2 & bh7_w68_3 & bh7_w68_4 & bh7_w68_5;
   bh7_w68_8 <= Compressor_6_3_Freq300_uid90_bh7_uid125_Out0(0);
   bh7_w69_7 <= Compressor_6_3_Freq300_uid90_bh7_uid125_Out0(1);
   bh7_w70_6 <= Compressor_6_3_Freq300_uid90_bh7_uid125_Out0(2);
   Compressor_6_3_Freq300_uid90_uid125: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid125_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid125_Out0_copy126);
   Compressor_6_3_Freq300_uid90_bh7_uid125_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid125_Out0_copy126; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid127_In0 <= "" & bh7_w69_0 & bh7_w69_1 & bh7_w69_2 & bh7_w69_3 & bh7_w69_4 & bh7_w69_5;
   bh7_w69_8 <= Compressor_6_3_Freq300_uid90_bh7_uid127_Out0(0);
   bh7_w70_7 <= Compressor_6_3_Freq300_uid90_bh7_uid127_Out0(1);
   bh7_w71_6 <= Compressor_6_3_Freq300_uid90_bh7_uid127_Out0(2);
   Compressor_6_3_Freq300_uid90_uid127: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid127_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid127_Out0_copy128);
   Compressor_6_3_Freq300_uid90_bh7_uid127_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid127_Out0_copy128; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid129_In0 <= "" & bh7_w70_0 & bh7_w70_1 & bh7_w70_2 & bh7_w70_3 & bh7_w70_4 & bh7_w70_5;
   bh7_w70_8 <= Compressor_6_3_Freq300_uid90_bh7_uid129_Out0(0);
   bh7_w71_7 <= Compressor_6_3_Freq300_uid90_bh7_uid129_Out0(1);
   bh7_w72_6 <= Compressor_6_3_Freq300_uid90_bh7_uid129_Out0(2);
   Compressor_6_3_Freq300_uid90_uid129: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid129_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid129_Out0_copy130);
   Compressor_6_3_Freq300_uid90_bh7_uid129_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid129_Out0_copy130; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid131_In0 <= "" & bh7_w71_0 & bh7_w71_1 & bh7_w71_2 & bh7_w71_3 & bh7_w71_4 & bh7_w71_5;
   bh7_w71_8 <= Compressor_6_3_Freq300_uid90_bh7_uid131_Out0(0);
   bh7_w72_7 <= Compressor_6_3_Freq300_uid90_bh7_uid131_Out0(1);
   bh7_w73_6 <= Compressor_6_3_Freq300_uid90_bh7_uid131_Out0(2);
   Compressor_6_3_Freq300_uid90_uid131: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid131_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid131_Out0_copy132);
   Compressor_6_3_Freq300_uid90_bh7_uid131_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid131_Out0_copy132; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid133_In0 <= "" & bh7_w72_0 & bh7_w72_1 & bh7_w72_2 & bh7_w72_3 & bh7_w72_4 & bh7_w72_5;
   bh7_w72_8 <= Compressor_6_3_Freq300_uid90_bh7_uid133_Out0(0);
   bh7_w73_7 <= Compressor_6_3_Freq300_uid90_bh7_uid133_Out0(1);
   bh7_w74_6 <= Compressor_6_3_Freq300_uid90_bh7_uid133_Out0(2);
   Compressor_6_3_Freq300_uid90_uid133: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid133_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid133_Out0_copy134);
   Compressor_6_3_Freq300_uid90_bh7_uid133_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid133_Out0_copy134; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid135_In0 <= "" & bh7_w73_0 & bh7_w73_1 & bh7_w73_2 & bh7_w73_3 & bh7_w73_4 & bh7_w73_5;
   bh7_w73_8 <= Compressor_6_3_Freq300_uid90_bh7_uid135_Out0(0);
   bh7_w74_7 <= Compressor_6_3_Freq300_uid90_bh7_uid135_Out0(1);
   bh7_w75_6 <= Compressor_6_3_Freq300_uid90_bh7_uid135_Out0(2);
   Compressor_6_3_Freq300_uid90_uid135: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid135_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid135_Out0_copy136);
   Compressor_6_3_Freq300_uid90_bh7_uid135_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid135_Out0_copy136; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid137_In0 <= "" & bh7_w74_0 & bh7_w74_1 & bh7_w74_2 & bh7_w74_3 & bh7_w74_4 & bh7_w74_5;
   bh7_w74_8 <= Compressor_6_3_Freq300_uid90_bh7_uid137_Out0(0);
   bh7_w75_7 <= Compressor_6_3_Freq300_uid90_bh7_uid137_Out0(1);
   bh7_w76_6 <= Compressor_6_3_Freq300_uid90_bh7_uid137_Out0(2);
   Compressor_6_3_Freq300_uid90_uid137: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid137_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid137_Out0_copy138);
   Compressor_6_3_Freq300_uid90_bh7_uid137_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid137_Out0_copy138; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid139_In0 <= "" & bh7_w75_0 & bh7_w75_1 & bh7_w75_2 & bh7_w75_3 & bh7_w75_4 & bh7_w75_5;
   bh7_w75_8 <= Compressor_6_3_Freq300_uid90_bh7_uid139_Out0(0);
   bh7_w76_7 <= Compressor_6_3_Freq300_uid90_bh7_uid139_Out0(1);
   bh7_w77_6 <= Compressor_6_3_Freq300_uid90_bh7_uid139_Out0(2);
   Compressor_6_3_Freq300_uid90_uid139: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid139_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid139_Out0_copy140);
   Compressor_6_3_Freq300_uid90_bh7_uid139_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid139_Out0_copy140; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid141_In0 <= "" & bh7_w76_0 & bh7_w76_1 & bh7_w76_2 & bh7_w76_3 & bh7_w76_4 & bh7_w76_5;
   bh7_w76_8 <= Compressor_6_3_Freq300_uid90_bh7_uid141_Out0(0);
   bh7_w77_7 <= Compressor_6_3_Freq300_uid90_bh7_uid141_Out0(1);
   bh7_w78_6 <= Compressor_6_3_Freq300_uid90_bh7_uid141_Out0(2);
   Compressor_6_3_Freq300_uid90_uid141: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid141_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid141_Out0_copy142);
   Compressor_6_3_Freq300_uid90_bh7_uid141_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid141_Out0_copy142; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid143_In0 <= "" & bh7_w77_0 & bh7_w77_1 & bh7_w77_2 & bh7_w77_3 & bh7_w77_4 & bh7_w77_5;
   bh7_w77_8 <= Compressor_6_3_Freq300_uid90_bh7_uid143_Out0(0);
   bh7_w78_7 <= Compressor_6_3_Freq300_uid90_bh7_uid143_Out0(1);
   bh7_w79_6 <= Compressor_6_3_Freq300_uid90_bh7_uid143_Out0(2);
   Compressor_6_3_Freq300_uid90_uid143: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid143_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid143_Out0_copy144);
   Compressor_6_3_Freq300_uid90_bh7_uid143_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid143_Out0_copy144; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid145_In0 <= "" & bh7_w78_0 & bh7_w78_1 & bh7_w78_2 & bh7_w78_3 & bh7_w78_4 & bh7_w78_5;
   bh7_w78_8 <= Compressor_6_3_Freq300_uid90_bh7_uid145_Out0(0);
   bh7_w79_7 <= Compressor_6_3_Freq300_uid90_bh7_uid145_Out0(1);
   bh7_w80_6 <= Compressor_6_3_Freq300_uid90_bh7_uid145_Out0(2);
   Compressor_6_3_Freq300_uid90_uid145: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid145_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid145_Out0_copy146);
   Compressor_6_3_Freq300_uid90_bh7_uid145_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid145_Out0_copy146; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid147_In0 <= "" & bh7_w79_0 & bh7_w79_1 & bh7_w79_2 & bh7_w79_3 & bh7_w79_4 & bh7_w79_5;
   bh7_w79_8 <= Compressor_6_3_Freq300_uid90_bh7_uid147_Out0(0);
   bh7_w80_7 <= Compressor_6_3_Freq300_uid90_bh7_uid147_Out0(1);
   bh7_w81_5 <= Compressor_6_3_Freq300_uid90_bh7_uid147_Out0(2);
   Compressor_6_3_Freq300_uid90_uid147: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid147_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid147_Out0_copy148);
   Compressor_6_3_Freq300_uid90_bh7_uid147_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid147_Out0_copy148; -- output copy to hold a pipeline register if needed


   Compressor_6_3_Freq300_uid90_bh7_uid149_In0 <= "" & bh7_w80_0 & bh7_w80_1 & bh7_w80_2 & bh7_w80_3 & bh7_w80_4 & bh7_w80_5;
   bh7_w80_8 <= Compressor_6_3_Freq300_uid90_bh7_uid149_Out0(0);
   bh7_w81_6 <= Compressor_6_3_Freq300_uid90_bh7_uid149_Out0(1);
   bh7_w82_4 <= Compressor_6_3_Freq300_uid90_bh7_uid149_Out0(2);
   Compressor_6_3_Freq300_uid90_uid149: Compressor_6_3_Freq300_uid90
      port map ( X0 => Compressor_6_3_Freq300_uid90_bh7_uid149_In0,
                 R => Compressor_6_3_Freq300_uid90_bh7_uid149_Out0_copy150);
   Compressor_6_3_Freq300_uid90_bh7_uid149_Out0 <= Compressor_6_3_Freq300_uid90_bh7_uid149_Out0_copy150; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid151_In0 <= "" & bh7_w81_0 & bh7_w81_1 & bh7_w81_2 & bh7_w81_3;
   Compressor_14_3_Freq300_uid54_bh7_uid151_In1 <= "" & bh7_w82_0;
   bh7_w81_7 <= Compressor_14_3_Freq300_uid54_bh7_uid151_Out0(0);
   bh7_w82_5 <= Compressor_14_3_Freq300_uid54_bh7_uid151_Out0(1);
   bh7_w83_4 <= Compressor_14_3_Freq300_uid54_bh7_uid151_Out0(2);
   Compressor_14_3_Freq300_uid54_uid151: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid151_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid151_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid151_Out0_copy152);
   Compressor_14_3_Freq300_uid54_bh7_uid151_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid151_Out0_copy152; -- output copy to hold a pipeline register if needed


   Compressor_3_2_Freq300_uid40_bh7_uid153_In0 <= "" & bh7_w82_1 & bh7_w82_2 & bh7_w82_3;
   bh7_w82_6 <= Compressor_3_2_Freq300_uid40_bh7_uid153_Out0(0);
   bh7_w83_5 <= Compressor_3_2_Freq300_uid40_bh7_uid153_Out0(1);
   Compressor_3_2_Freq300_uid40_uid153: Compressor_3_2_Freq300_uid40
      port map ( X0 => Compressor_3_2_Freq300_uid40_bh7_uid153_In0,
                 R => Compressor_3_2_Freq300_uid40_bh7_uid153_Out0_copy154);
   Compressor_3_2_Freq300_uid40_bh7_uid153_Out0 <= Compressor_3_2_Freq300_uid40_bh7_uid153_Out0_copy154; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid155_In0 <= "" & bh7_w83_0 & bh7_w83_1 & bh7_w83_2 & bh7_w83_3;
   Compressor_14_3_Freq300_uid54_bh7_uid155_In1 <= "" & bh7_w84_0;
   bh7_w83_6 <= Compressor_14_3_Freq300_uid54_bh7_uid155_Out0(0);
   bh7_w84_4 <= Compressor_14_3_Freq300_uid54_bh7_uid155_Out0(1);
   bh7_w85_4 <= Compressor_14_3_Freq300_uid54_bh7_uid155_Out0(2);
   Compressor_14_3_Freq300_uid54_uid155: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid155_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid155_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid155_Out0_copy156);
   Compressor_14_3_Freq300_uid54_bh7_uid155_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid155_Out0_copy156; -- output copy to hold a pipeline register if needed


   Compressor_3_2_Freq300_uid40_bh7_uid157_In0 <= "" & bh7_w84_1 & bh7_w84_2 & bh7_w84_3;
   bh7_w84_5 <= Compressor_3_2_Freq300_uid40_bh7_uid157_Out0(0);
   bh7_w85_5 <= Compressor_3_2_Freq300_uid40_bh7_uid157_Out0(1);
   Compressor_3_2_Freq300_uid40_uid157: Compressor_3_2_Freq300_uid40
      port map ( X0 => Compressor_3_2_Freq300_uid40_bh7_uid157_In0,
                 R => Compressor_3_2_Freq300_uid40_bh7_uid157_Out0_copy158);
   Compressor_3_2_Freq300_uid40_bh7_uid157_Out0 <= Compressor_3_2_Freq300_uid40_bh7_uid157_Out0_copy158; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid159_In0 <= "" & bh7_w85_0 & bh7_w85_1 & bh7_w85_2 & bh7_w85_3;
   Compressor_14_3_Freq300_uid54_bh7_uid159_In1 <= "" & bh7_w86_0;
   bh7_w85_6 <= Compressor_14_3_Freq300_uid54_bh7_uid159_Out0(0);
   bh7_w86_4 <= Compressor_14_3_Freq300_uid54_bh7_uid159_Out0(1);
   bh7_w87_4 <= Compressor_14_3_Freq300_uid54_bh7_uid159_Out0(2);
   Compressor_14_3_Freq300_uid54_uid159: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid159_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid159_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid159_Out0_copy160);
   Compressor_14_3_Freq300_uid54_bh7_uid159_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid159_Out0_copy160; -- output copy to hold a pipeline register if needed


   Compressor_3_2_Freq300_uid40_bh7_uid161_In0 <= "" & bh7_w86_1 & bh7_w86_2 & bh7_w86_3;
   bh7_w86_5 <= Compressor_3_2_Freq300_uid40_bh7_uid161_Out0(0);
   bh7_w87_5 <= Compressor_3_2_Freq300_uid40_bh7_uid161_Out0(1);
   Compressor_3_2_Freq300_uid40_uid161: Compressor_3_2_Freq300_uid40
      port map ( X0 => Compressor_3_2_Freq300_uid40_bh7_uid161_In0,
                 R => Compressor_3_2_Freq300_uid40_bh7_uid161_Out0_copy162);
   Compressor_3_2_Freq300_uid40_bh7_uid161_Out0 <= Compressor_3_2_Freq300_uid40_bh7_uid161_Out0_copy162; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid163_In0 <= "" & bh7_w87_0 & bh7_w87_1 & bh7_w87_2 & bh7_w87_3;
   Compressor_14_3_Freq300_uid54_bh7_uid163_In1 <= "" & "0";
   bh7_w87_6 <= Compressor_14_3_Freq300_uid54_bh7_uid163_Out0(0);
   bh7_w88_3 <= Compressor_14_3_Freq300_uid54_bh7_uid163_Out0(1);
   bh7_w89_4 <= Compressor_14_3_Freq300_uid54_bh7_uid163_Out0(2);
   Compressor_14_3_Freq300_uid54_uid163: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid163_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid163_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid163_Out0_copy164);
   Compressor_14_3_Freq300_uid54_bh7_uid163_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid163_Out0_copy164; -- output copy to hold a pipeline register if needed


   Compressor_3_2_Freq300_uid40_bh7_uid165_In0 <= "" & bh7_w88_0 & bh7_w88_1 & bh7_w88_2;
   bh7_w88_4 <= Compressor_3_2_Freq300_uid40_bh7_uid165_Out0(0);
   bh7_w89_5 <= Compressor_3_2_Freq300_uid40_bh7_uid165_Out0(1);
   Compressor_3_2_Freq300_uid40_uid165: Compressor_3_2_Freq300_uid40
      port map ( X0 => Compressor_3_2_Freq300_uid40_bh7_uid165_In0,
                 R => Compressor_3_2_Freq300_uid40_bh7_uid165_Out0_copy166);
   Compressor_3_2_Freq300_uid40_bh7_uid165_Out0 <= Compressor_3_2_Freq300_uid40_bh7_uid165_Out0_copy166; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid167_In0 <= "" & bh7_w89_0 & bh7_w89_1 & bh7_w89_2 & bh7_w89_3;
   Compressor_14_3_Freq300_uid54_bh7_uid167_In1 <= "" & bh7_w90_0;
   bh7_w89_6 <= Compressor_14_3_Freq300_uid54_bh7_uid167_Out0(0);
   bh7_w90_4 <= Compressor_14_3_Freq300_uid54_bh7_uid167_Out0(1);
   bh7_w91_4 <= Compressor_14_3_Freq300_uid54_bh7_uid167_Out0(2);
   Compressor_14_3_Freq300_uid54_uid167: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid167_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid167_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid167_Out0_copy168);
   Compressor_14_3_Freq300_uid54_bh7_uid167_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid167_Out0_copy168; -- output copy to hold a pipeline register if needed


   Compressor_3_2_Freq300_uid40_bh7_uid169_In0 <= "" & bh7_w90_1 & bh7_w90_2 & bh7_w90_3;
   bh7_w90_5 <= Compressor_3_2_Freq300_uid40_bh7_uid169_Out0(0);
   bh7_w91_5 <= Compressor_3_2_Freq300_uid40_bh7_uid169_Out0(1);
   Compressor_3_2_Freq300_uid40_uid169: Compressor_3_2_Freq300_uid40
      port map ( X0 => Compressor_3_2_Freq300_uid40_bh7_uid169_In0,
                 R => Compressor_3_2_Freq300_uid40_bh7_uid169_Out0_copy170);
   Compressor_3_2_Freq300_uid40_bh7_uid169_Out0 <= Compressor_3_2_Freq300_uid40_bh7_uid169_Out0_copy170; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid171_In0 <= "" & bh7_w91_0 & bh7_w91_1 & bh7_w91_2 & bh7_w91_3;
   Compressor_14_3_Freq300_uid54_bh7_uid171_In1 <= "" & bh7_w92_0;
   bh7_w91_6 <= Compressor_14_3_Freq300_uid54_bh7_uid171_Out0(0);
   bh7_w92_4 <= Compressor_14_3_Freq300_uid54_bh7_uid171_Out0(1);
   bh7_w93_4 <= Compressor_14_3_Freq300_uid54_bh7_uid171_Out0(2);
   Compressor_14_3_Freq300_uid54_uid171: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid171_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid171_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid171_Out0_copy172);
   Compressor_14_3_Freq300_uid54_bh7_uid171_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid171_Out0_copy172; -- output copy to hold a pipeline register if needed


   Compressor_3_2_Freq300_uid40_bh7_uid173_In0 <= "" & bh7_w92_1 & bh7_w92_2 & bh7_w92_3;
   bh7_w92_5 <= Compressor_3_2_Freq300_uid40_bh7_uid173_Out0(0);
   bh7_w93_5 <= Compressor_3_2_Freq300_uid40_bh7_uid173_Out0(1);
   Compressor_3_2_Freq300_uid40_uid173: Compressor_3_2_Freq300_uid40
      port map ( X0 => Compressor_3_2_Freq300_uid40_bh7_uid173_In0,
                 R => Compressor_3_2_Freq300_uid40_bh7_uid173_Out0_copy174);
   Compressor_3_2_Freq300_uid40_bh7_uid173_Out0 <= Compressor_3_2_Freq300_uid40_bh7_uid173_Out0_copy174; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid175_In0 <= "" & bh7_w93_0 & bh7_w93_1 & bh7_w93_2 & bh7_w93_3;
   Compressor_14_3_Freq300_uid54_bh7_uid175_In1 <= "" & bh7_w94_0;
   bh7_w93_6 <= Compressor_14_3_Freq300_uid54_bh7_uid175_Out0(0);
   bh7_w94_4 <= Compressor_14_3_Freq300_uid54_bh7_uid175_Out0(1);
   bh7_w95_4 <= Compressor_14_3_Freq300_uid54_bh7_uid175_Out0(2);
   Compressor_14_3_Freq300_uid54_uid175: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid175_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid175_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid175_Out0_copy176);
   Compressor_14_3_Freq300_uid54_bh7_uid175_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid175_Out0_copy176; -- output copy to hold a pipeline register if needed


   Compressor_3_2_Freq300_uid40_bh7_uid177_In0 <= "" & bh7_w94_1 & bh7_w94_2 & bh7_w94_3;
   bh7_w94_5 <= Compressor_3_2_Freq300_uid40_bh7_uid177_Out0(0);
   bh7_w95_5 <= Compressor_3_2_Freq300_uid40_bh7_uid177_Out0(1);
   Compressor_3_2_Freq300_uid40_uid177: Compressor_3_2_Freq300_uid40
      port map ( X0 => Compressor_3_2_Freq300_uid40_bh7_uid177_In0,
                 R => Compressor_3_2_Freq300_uid40_bh7_uid177_Out0_copy178);
   Compressor_3_2_Freq300_uid40_bh7_uid177_Out0 <= Compressor_3_2_Freq300_uid40_bh7_uid177_Out0_copy178; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid179_In0 <= "" & bh7_w95_0 & bh7_w95_1 & bh7_w95_2 & bh7_w95_3;
   Compressor_14_3_Freq300_uid54_bh7_uid179_In1 <= "" & bh7_w96_0;
   bh7_w95_6 <= Compressor_14_3_Freq300_uid54_bh7_uid179_Out0(0);
   bh7_w96_4 <= Compressor_14_3_Freq300_uid54_bh7_uid179_Out0(1);
   bh7_w97_4 <= Compressor_14_3_Freq300_uid54_bh7_uid179_Out0(2);
   Compressor_14_3_Freq300_uid54_uid179: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid179_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid179_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid179_Out0_copy180);
   Compressor_14_3_Freq300_uid54_bh7_uid179_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid179_Out0_copy180; -- output copy to hold a pipeline register if needed


   Compressor_3_2_Freq300_uid40_bh7_uid181_In0 <= "" & bh7_w96_1 & bh7_w96_2 & bh7_w96_3;
   bh7_w96_5 <= Compressor_3_2_Freq300_uid40_bh7_uid181_Out0(0);
   bh7_w97_5 <= Compressor_3_2_Freq300_uid40_bh7_uid181_Out0(1);
   Compressor_3_2_Freq300_uid40_uid181: Compressor_3_2_Freq300_uid40
      port map ( X0 => Compressor_3_2_Freq300_uid40_bh7_uid181_In0,
                 R => Compressor_3_2_Freq300_uid40_bh7_uid181_Out0_copy182);
   Compressor_3_2_Freq300_uid40_bh7_uid181_Out0 <= Compressor_3_2_Freq300_uid40_bh7_uid181_Out0_copy182; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid183_In0 <= "" & bh7_w97_0 & bh7_w97_1 & bh7_w97_2 & bh7_w97_3;
   Compressor_14_3_Freq300_uid54_bh7_uid183_In1 <= "" & bh7_w98_0;
   bh7_w97_6 <= Compressor_14_3_Freq300_uid54_bh7_uid183_Out0(0);
   bh7_w98_4 <= Compressor_14_3_Freq300_uid54_bh7_uid183_Out0(1);
   bh7_w99_3 <= Compressor_14_3_Freq300_uid54_bh7_uid183_Out0(2);
   Compressor_14_3_Freq300_uid54_uid183: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid183_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid183_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid183_Out0_copy184);
   Compressor_14_3_Freq300_uid54_bh7_uid183_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid183_Out0_copy184; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid185_In0 <= "" & bh7_w98_1 & bh7_w98_2 & bh7_w98_3;
   Compressor_23_3_Freq300_uid32_bh7_uid185_In1 <= "" & bh7_w99_0 & bh7_w99_1;
   bh7_w98_5 <= Compressor_23_3_Freq300_uid32_bh7_uid185_Out0(0);
   bh7_w99_4 <= Compressor_23_3_Freq300_uid32_bh7_uid185_Out0(1);
   bh7_w100_3 <= Compressor_23_3_Freq300_uid32_bh7_uid185_Out0(2);
   Compressor_23_3_Freq300_uid32_uid185: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid185_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid185_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid185_Out0_copy186);
   Compressor_23_3_Freq300_uid32_bh7_uid185_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid185_Out0_copy186; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid187_In0 <= "" & bh7_w100_0 & bh7_w100_1 & bh7_w100_2;
   Compressor_23_3_Freq300_uid32_bh7_uid187_In1 <= "" & bh7_w101_0 & bh7_w101_1;
   bh7_w100_4 <= Compressor_23_3_Freq300_uid32_bh7_uid187_Out0(0);
   bh7_w101_3 <= Compressor_23_3_Freq300_uid32_bh7_uid187_Out0(1);
   bh7_w102_3 <= Compressor_23_3_Freq300_uid32_bh7_uid187_Out0(2);
   Compressor_23_3_Freq300_uid32_uid187: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid187_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid187_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid187_Out0_copy188);
   Compressor_23_3_Freq300_uid32_bh7_uid187_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid187_Out0_copy188; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid189_In0 <= "" & bh7_w102_0 & bh7_w102_1 & bh7_w102_2;
   Compressor_23_3_Freq300_uid32_bh7_uid189_In1 <= "" & bh7_w103_0 & bh7_w103_1;
   bh7_w102_4 <= Compressor_23_3_Freq300_uid32_bh7_uid189_Out0(0);
   bh7_w103_3 <= Compressor_23_3_Freq300_uid32_bh7_uid189_Out0(1);
   bh7_w104_3 <= Compressor_23_3_Freq300_uid32_bh7_uid189_Out0(2);
   Compressor_23_3_Freq300_uid32_uid189: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid189_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid189_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid189_Out0_copy190);
   Compressor_23_3_Freq300_uid32_bh7_uid189_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid189_Out0_copy190; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid191_In0 <= "" & bh7_w104_0 & bh7_w104_1 & bh7_w104_2;
   Compressor_23_3_Freq300_uid32_bh7_uid191_In1 <= "" & bh7_w105_0 & bh7_w105_1;
   bh7_w104_4 <= Compressor_23_3_Freq300_uid32_bh7_uid191_Out0(0);
   bh7_w105_2 <= Compressor_23_3_Freq300_uid32_bh7_uid191_Out0(1);
   bh7_w106_2 <= Compressor_23_3_Freq300_uid32_bh7_uid191_Out0(2);
   Compressor_23_3_Freq300_uid32_uid191: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid191_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid191_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid191_Out0_copy192);
   Compressor_23_3_Freq300_uid32_bh7_uid191_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid191_Out0_copy192; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid193_In0 <= "" & bh7_w106_0 & bh7_w106_1 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid193_In1 <= "" & bh7_w107_0 & bh7_w107_1;
   bh7_w106_3 <= Compressor_23_3_Freq300_uid32_bh7_uid193_Out0(0);
   bh7_w107_2 <= Compressor_23_3_Freq300_uid32_bh7_uid193_Out0(1);
   bh7_w108_2 <= Compressor_23_3_Freq300_uid32_bh7_uid193_Out0(2);
   Compressor_23_3_Freq300_uid32_uid193: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid193_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid193_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid193_Out0_copy194);
   Compressor_23_3_Freq300_uid32_bh7_uid193_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid193_Out0_copy194; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid195_In0 <= "" & bh7_w108_0 & bh7_w108_1 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid195_In1 <= "" & bh7_w109_0 & bh7_w109_1;
   bh7_w108_3 <= Compressor_23_3_Freq300_uid32_bh7_uid195_Out0(0);
   bh7_w109_2 <= Compressor_23_3_Freq300_uid32_bh7_uid195_Out0(1);
   bh7_w110_2 <= Compressor_23_3_Freq300_uid32_bh7_uid195_Out0(2);
   Compressor_23_3_Freq300_uid32_uid195: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid195_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid195_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid195_Out0_copy196);
   Compressor_23_3_Freq300_uid32_bh7_uid195_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid195_Out0_copy196; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid197_In0 <= "" & bh7_w110_0 & bh7_w110_1 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid197_In1 <= "" & bh7_w111_0 & bh7_w111_1;
   bh7_w110_3 <= Compressor_23_3_Freq300_uid32_bh7_uid197_Out0(0);
   bh7_w111_2 <= Compressor_23_3_Freq300_uid32_bh7_uid197_Out0(1);
   bh7_w112_1 <= Compressor_23_3_Freq300_uid32_bh7_uid197_Out0(2);
   Compressor_23_3_Freq300_uid32_uid197: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid197_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid197_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid197_Out0_copy198);
   Compressor_23_3_Freq300_uid32_bh7_uid197_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid197_Out0_copy198; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid199_In0 <= "" & bh7_w19_3 & bh7_w19_2 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid199_In1 <= "" & bh7_w20_2;
   bh7_w19_4 <= Compressor_14_3_Freq300_uid54_bh7_uid199_Out0(0);
   bh7_w20_3 <= Compressor_14_3_Freq300_uid54_bh7_uid199_Out0(1);
   bh7_w21_4 <= Compressor_14_3_Freq300_uid54_bh7_uid199_Out0(2);
   Compressor_14_3_Freq300_uid54_uid199: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid199_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid199_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid199_Out0_copy200);
   Compressor_14_3_Freq300_uid54_bh7_uid199_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid199_Out0_copy200; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid201_In0 <= "" & bh7_w21_3 & bh7_w21_2 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid201_In1 <= "" & bh7_w22_2;
   bh7_w21_5 <= Compressor_14_3_Freq300_uid54_bh7_uid201_Out0(0);
   bh7_w22_3 <= Compressor_14_3_Freq300_uid54_bh7_uid201_Out0(1);
   bh7_w23_4 <= Compressor_14_3_Freq300_uid54_bh7_uid201_Out0(2);
   Compressor_14_3_Freq300_uid54_uid201: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid201_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid201_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid201_Out0_copy202);
   Compressor_14_3_Freq300_uid54_bh7_uid201_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid201_Out0_copy202; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid203_In0 <= "" & bh7_w23_3 & bh7_w23_2 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid203_In1 <= "" & bh7_w24_4 & bh7_w24_3;
   bh7_w23_5 <= Compressor_23_3_Freq300_uid32_bh7_uid203_Out0(0);
   bh7_w24_5 <= Compressor_23_3_Freq300_uid32_bh7_uid203_Out0(1);
   bh7_w25_4 <= Compressor_23_3_Freq300_uid32_bh7_uid203_Out0(2);
   Compressor_23_3_Freq300_uid32_uid203: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid203_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid203_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid203_Out0_copy204);
   Compressor_23_3_Freq300_uid32_bh7_uid203_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid203_Out0_copy204; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid205_In0 <= "" & bh7_w25_2 & bh7_w25_3 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid205_In1 <= "" & bh7_w26_4 & bh7_w26_3;
   bh7_w25_5 <= Compressor_23_3_Freq300_uid32_bh7_uid205_Out0(0);
   bh7_w26_5 <= Compressor_23_3_Freq300_uid32_bh7_uid205_Out0(1);
   bh7_w27_4 <= Compressor_23_3_Freq300_uid32_bh7_uid205_Out0(2);
   Compressor_23_3_Freq300_uid32_uid205: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid205_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid205_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid205_Out0_copy206);
   Compressor_23_3_Freq300_uid32_bh7_uid205_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid205_Out0_copy206; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid207_In0 <= "" & bh7_w27_2 & bh7_w27_3 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid207_In1 <= "" & bh7_w28_4 & bh7_w28_3;
   bh7_w27_5 <= Compressor_23_3_Freq300_uid32_bh7_uid207_Out0(0);
   bh7_w28_5 <= Compressor_23_3_Freq300_uid32_bh7_uid207_Out0(1);
   bh7_w29_4 <= Compressor_23_3_Freq300_uid32_bh7_uid207_Out0(2);
   Compressor_23_3_Freq300_uid32_uid207: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid207_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid207_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid207_Out0_copy208);
   Compressor_23_3_Freq300_uid32_bh7_uid207_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid207_Out0_copy208; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid209_In0 <= "" & bh7_w29_2 & bh7_w29_3 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid209_In1 <= "" & bh7_w30_4 & bh7_w30_3;
   bh7_w29_5 <= Compressor_23_3_Freq300_uid32_bh7_uid209_Out0(0);
   bh7_w30_5 <= Compressor_23_3_Freq300_uid32_bh7_uid209_Out0(1);
   bh7_w31_4 <= Compressor_23_3_Freq300_uid32_bh7_uid209_Out0(2);
   Compressor_23_3_Freq300_uid32_uid209: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid209_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid209_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid209_Out0_copy210);
   Compressor_23_3_Freq300_uid32_bh7_uid209_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid209_Out0_copy210; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid211_In0 <= "" & bh7_w31_2 & bh7_w31_3 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid211_In1 <= "" & bh7_w32_4 & bh7_w32_3;
   bh7_w31_5 <= Compressor_23_3_Freq300_uid32_bh7_uid211_Out0(0);
   bh7_w32_5 <= Compressor_23_3_Freq300_uid32_bh7_uid211_Out0(1);
   bh7_w33_4 <= Compressor_23_3_Freq300_uid32_bh7_uid211_Out0(2);
   Compressor_23_3_Freq300_uid32_uid211: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid211_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid211_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid211_Out0_copy212);
   Compressor_23_3_Freq300_uid32_bh7_uid211_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid211_Out0_copy212; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid213_In0 <= "" & bh7_w33_2 & bh7_w33_3 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid213_In1 <= "" & bh7_w34_5 & bh7_w34_4;
   bh7_w33_5 <= Compressor_23_3_Freq300_uid32_bh7_uid213_Out0(0);
   bh7_w34_6 <= Compressor_23_3_Freq300_uid32_bh7_uid213_Out0(1);
   bh7_w35_6 <= Compressor_23_3_Freq300_uid32_bh7_uid213_Out0(2);
   Compressor_23_3_Freq300_uid32_uid213: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid213_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid213_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid213_Out0_copy214);
   Compressor_23_3_Freq300_uid32_bh7_uid213_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid213_Out0_copy214; -- output copy to hold a pipeline register if needed


   Compressor_3_2_Freq300_uid40_bh7_uid215_In0 <= "" & bh7_w35_5 & bh7_w35_4 & "0";
   bh7_w35_7 <= Compressor_3_2_Freq300_uid40_bh7_uid215_Out0(0);
   bh7_w36_7 <= Compressor_3_2_Freq300_uid40_bh7_uid215_Out0(1);
   Compressor_3_2_Freq300_uid40_uid215: Compressor_3_2_Freq300_uid40
      port map ( X0 => Compressor_3_2_Freq300_uid40_bh7_uid215_In0,
                 R => Compressor_3_2_Freq300_uid40_bh7_uid215_Out0_copy216);
   Compressor_3_2_Freq300_uid40_bh7_uid215_Out0 <= Compressor_3_2_Freq300_uid40_bh7_uid215_Out0_copy216; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid217_In0 <= "" & bh7_w36_6 & bh7_w36_5 & bh7_w36_4;
   Compressor_23_3_Freq300_uid32_bh7_uid217_In1 <= "" & bh7_w37_5 & bh7_w37_4;
   bh7_w36_8 <= Compressor_23_3_Freq300_uid32_bh7_uid217_Out0(0);
   bh7_w37_6 <= Compressor_23_3_Freq300_uid32_bh7_uid217_Out0(1);
   bh7_w38_7 <= Compressor_23_3_Freq300_uid32_bh7_uid217_Out0(2);
   Compressor_23_3_Freq300_uid32_uid217: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid217_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid217_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid217_Out0_copy218);
   Compressor_23_3_Freq300_uid32_bh7_uid217_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid217_Out0_copy218; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid219_In0 <= "" & bh7_w38_6 & bh7_w38_5 & bh7_w38_4;
   Compressor_23_3_Freq300_uid32_bh7_uid219_In1 <= "" & bh7_w39_5 & bh7_w39_4;
   bh7_w38_8 <= Compressor_23_3_Freq300_uid32_bh7_uid219_Out0(0);
   bh7_w39_6 <= Compressor_23_3_Freq300_uid32_bh7_uid219_Out0(1);
   bh7_w40_7 <= Compressor_23_3_Freq300_uid32_bh7_uid219_Out0(2);
   Compressor_23_3_Freq300_uid32_uid219: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid219_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid219_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid219_Out0_copy220);
   Compressor_23_3_Freq300_uid32_bh7_uid219_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid219_Out0_copy220; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid221_In0 <= "" & bh7_w40_6 & bh7_w40_5 & bh7_w40_4;
   Compressor_23_3_Freq300_uid32_bh7_uid221_In1 <= "" & bh7_w41_5 & bh7_w41_4;
   bh7_w40_8 <= Compressor_23_3_Freq300_uid32_bh7_uid221_Out0(0);
   bh7_w41_6 <= Compressor_23_3_Freq300_uid32_bh7_uid221_Out0(1);
   bh7_w42_7 <= Compressor_23_3_Freq300_uid32_bh7_uid221_Out0(2);
   Compressor_23_3_Freq300_uid32_uid221: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid221_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid221_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid221_Out0_copy222);
   Compressor_23_3_Freq300_uid32_bh7_uid221_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid221_Out0_copy222; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid223_In0 <= "" & bh7_w42_6 & bh7_w42_5 & bh7_w42_4;
   Compressor_23_3_Freq300_uid32_bh7_uid223_In1 <= "" & bh7_w43_5 & bh7_w43_4;
   bh7_w42_8 <= Compressor_23_3_Freq300_uid32_bh7_uid223_Out0(0);
   bh7_w43_6 <= Compressor_23_3_Freq300_uid32_bh7_uid223_Out0(1);
   bh7_w44_7 <= Compressor_23_3_Freq300_uid32_bh7_uid223_Out0(2);
   Compressor_23_3_Freq300_uid32_uid223: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid223_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid223_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid223_Out0_copy224);
   Compressor_23_3_Freq300_uid32_bh7_uid223_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid223_Out0_copy224; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid225_In0 <= "" & bh7_w44_6 & bh7_w44_5 & bh7_w44_4;
   Compressor_23_3_Freq300_uid32_bh7_uid225_In1 <= "" & bh7_w45_5 & bh7_w45_4;
   bh7_w44_8 <= Compressor_23_3_Freq300_uid32_bh7_uid225_Out0(0);
   bh7_w45_6 <= Compressor_23_3_Freq300_uid32_bh7_uid225_Out0(1);
   bh7_w46_7 <= Compressor_23_3_Freq300_uid32_bh7_uid225_Out0(2);
   Compressor_23_3_Freq300_uid32_uid225: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid225_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid225_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid225_Out0_copy226);
   Compressor_23_3_Freq300_uid32_bh7_uid225_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid225_Out0_copy226; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid227_In0 <= "" & bh7_w46_6 & bh7_w46_5 & bh7_w46_4;
   Compressor_23_3_Freq300_uid32_bh7_uid227_In1 <= "" & bh7_w47_5 & bh7_w47_4;
   bh7_w46_8 <= Compressor_23_3_Freq300_uid32_bh7_uid227_Out0(0);
   bh7_w47_6 <= Compressor_23_3_Freq300_uid32_bh7_uid227_Out0(1);
   bh7_w48_8 <= Compressor_23_3_Freq300_uid32_bh7_uid227_Out0(2);
   Compressor_23_3_Freq300_uid32_uid227: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid227_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid227_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid227_Out0_copy228);
   Compressor_23_3_Freq300_uid32_bh7_uid227_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid227_Out0_copy228; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid229_In0 <= "" & bh7_w48_4 & bh7_w48_7 & bh7_w48_6 & bh7_w48_5;
   Compressor_14_3_Freq300_uid54_bh7_uid229_In1 <= "" & bh7_w49_6;
   bh7_w48_9 <= Compressor_14_3_Freq300_uid54_bh7_uid229_Out0(0);
   bh7_w49_7 <= Compressor_14_3_Freq300_uid54_bh7_uid229_Out0(1);
   bh7_w50_8 <= Compressor_14_3_Freq300_uid54_bh7_uid229_Out0(2);
   Compressor_14_3_Freq300_uid54_uid229: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid229_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid229_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid229_Out0_copy230);
   Compressor_14_3_Freq300_uid54_bh7_uid229_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid229_Out0_copy230; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid231_In0 <= "" & bh7_w50_4 & bh7_w50_7 & bh7_w50_6 & bh7_w50_5;
   Compressor_14_3_Freq300_uid54_bh7_uid231_In1 <= "" & "0";
   bh7_w50_9 <= Compressor_14_3_Freq300_uid54_bh7_uid231_Out0(0);
   bh7_w51_9 <= Compressor_14_3_Freq300_uid54_bh7_uid231_Out0(1);
   bh7_w52_8 <= Compressor_14_3_Freq300_uid54_bh7_uid231_Out0(2);
   Compressor_14_3_Freq300_uid54_uid231: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid231_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid231_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid231_Out0_copy232);
   Compressor_14_3_Freq300_uid54_bh7_uid231_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid231_Out0_copy232; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid233_In0 <= "" & bh7_w51_8 & bh7_w51_7 & bh7_w51_6;
   Compressor_23_3_Freq300_uid32_bh7_uid233_In1 <= "" & bh7_w52_7 & bh7_w52_6;
   bh7_w51_10 <= Compressor_23_3_Freq300_uid32_bh7_uid233_Out0(0);
   bh7_w52_9 <= Compressor_23_3_Freq300_uid32_bh7_uid233_Out0(1);
   bh7_w53_9 <= Compressor_23_3_Freq300_uid32_bh7_uid233_Out0(2);
   Compressor_23_3_Freq300_uid32_uid233: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid233_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid233_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid233_Out0_copy234);
   Compressor_23_3_Freq300_uid32_bh7_uid233_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid233_Out0_copy234; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid235_In0 <= "" & bh7_w53_8 & bh7_w53_7 & bh7_w53_6;
   Compressor_23_3_Freq300_uid32_bh7_uid235_In1 <= "" & bh7_w54_8 & bh7_w54_7;
   bh7_w53_10 <= Compressor_23_3_Freq300_uid32_bh7_uid235_Out0(0);
   bh7_w54_9 <= Compressor_23_3_Freq300_uid32_bh7_uid235_Out0(1);
   bh7_w55_9 <= Compressor_23_3_Freq300_uid32_bh7_uid235_Out0(2);
   Compressor_23_3_Freq300_uid32_uid235: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid235_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid235_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid235_Out0_copy236);
   Compressor_23_3_Freq300_uid32_bh7_uid235_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid235_Out0_copy236; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid237_In0 <= "" & bh7_w55_8 & bh7_w55_7 & bh7_w55_6;
   Compressor_23_3_Freq300_uid32_bh7_uid237_In1 <= "" & bh7_w56_8 & bh7_w56_7;
   bh7_w55_10 <= Compressor_23_3_Freq300_uid32_bh7_uid237_Out0(0);
   bh7_w56_9 <= Compressor_23_3_Freq300_uid32_bh7_uid237_Out0(1);
   bh7_w57_9 <= Compressor_23_3_Freq300_uid32_bh7_uid237_Out0(2);
   Compressor_23_3_Freq300_uid32_uid237: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid237_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid237_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid237_Out0_copy238);
   Compressor_23_3_Freq300_uid32_bh7_uid237_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid237_Out0_copy238; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid239_In0 <= "" & bh7_w57_8 & bh7_w57_7 & bh7_w57_6;
   Compressor_23_3_Freq300_uid32_bh7_uid239_In1 <= "" & bh7_w58_8 & bh7_w58_7;
   bh7_w57_10 <= Compressor_23_3_Freq300_uid32_bh7_uid239_Out0(0);
   bh7_w58_9 <= Compressor_23_3_Freq300_uid32_bh7_uid239_Out0(1);
   bh7_w59_9 <= Compressor_23_3_Freq300_uid32_bh7_uid239_Out0(2);
   Compressor_23_3_Freq300_uid32_uid239: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid239_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid239_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid239_Out0_copy240);
   Compressor_23_3_Freq300_uid32_bh7_uid239_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid239_Out0_copy240; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid241_In0 <= "" & bh7_w59_8 & bh7_w59_7 & bh7_w59_6;
   Compressor_23_3_Freq300_uid32_bh7_uid241_In1 <= "" & bh7_w60_8 & bh7_w60_7;
   bh7_w59_10 <= Compressor_23_3_Freq300_uid32_bh7_uid241_Out0(0);
   bh7_w60_9 <= Compressor_23_3_Freq300_uid32_bh7_uid241_Out0(1);
   bh7_w61_9 <= Compressor_23_3_Freq300_uid32_bh7_uid241_Out0(2);
   Compressor_23_3_Freq300_uid32_uid241: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid241_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid241_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid241_Out0_copy242);
   Compressor_23_3_Freq300_uid32_bh7_uid241_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid241_Out0_copy242; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid243_In0 <= "" & bh7_w61_8 & bh7_w61_7 & bh7_w61_6;
   Compressor_23_3_Freq300_uid32_bh7_uid243_In1 <= "" & bh7_w62_8 & bh7_w62_7;
   bh7_w61_10 <= Compressor_23_3_Freq300_uid32_bh7_uid243_Out0(0);
   bh7_w62_9 <= Compressor_23_3_Freq300_uid32_bh7_uid243_Out0(1);
   bh7_w63_9 <= Compressor_23_3_Freq300_uid32_bh7_uid243_Out0(2);
   Compressor_23_3_Freq300_uid32_uid243: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid243_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid243_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid243_Out0_copy244);
   Compressor_23_3_Freq300_uid32_bh7_uid243_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid243_Out0_copy244; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid245_In0 <= "" & bh7_w63_8 & bh7_w63_7 & bh7_w63_6;
   Compressor_23_3_Freq300_uid32_bh7_uid245_In1 <= "" & bh7_w64_8 & bh7_w64_7;
   bh7_w63_10 <= Compressor_23_3_Freq300_uid32_bh7_uid245_Out0(0);
   bh7_w64_9 <= Compressor_23_3_Freq300_uid32_bh7_uid245_Out0(1);
   bh7_w65_9 <= Compressor_23_3_Freq300_uid32_bh7_uid245_Out0(2);
   Compressor_23_3_Freq300_uid32_uid245: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid245_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid245_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid245_Out0_copy246);
   Compressor_23_3_Freq300_uid32_bh7_uid245_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid245_Out0_copy246; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid247_In0 <= "" & bh7_w65_8 & bh7_w65_7 & bh7_w65_6;
   Compressor_23_3_Freq300_uid32_bh7_uid247_In1 <= "" & bh7_w66_8 & bh7_w66_7;
   bh7_w65_10 <= Compressor_23_3_Freq300_uid32_bh7_uid247_Out0(0);
   bh7_w66_9 <= Compressor_23_3_Freq300_uid32_bh7_uid247_Out0(1);
   bh7_w67_9 <= Compressor_23_3_Freq300_uid32_bh7_uid247_Out0(2);
   Compressor_23_3_Freq300_uid32_uid247: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid247_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid247_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid247_Out0_copy248);
   Compressor_23_3_Freq300_uid32_bh7_uid247_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid247_Out0_copy248; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid249_In0 <= "" & bh7_w67_8 & bh7_w67_7 & bh7_w67_6;
   Compressor_23_3_Freq300_uid32_bh7_uid249_In1 <= "" & bh7_w68_8 & bh7_w68_7;
   bh7_w67_10 <= Compressor_23_3_Freq300_uid32_bh7_uid249_Out0(0);
   bh7_w68_9 <= Compressor_23_3_Freq300_uid32_bh7_uid249_Out0(1);
   bh7_w69_9 <= Compressor_23_3_Freq300_uid32_bh7_uid249_Out0(2);
   Compressor_23_3_Freq300_uid32_uid249: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid249_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid249_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid249_Out0_copy250);
   Compressor_23_3_Freq300_uid32_bh7_uid249_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid249_Out0_copy250; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid251_In0 <= "" & bh7_w69_8 & bh7_w69_7 & bh7_w69_6;
   Compressor_23_3_Freq300_uid32_bh7_uid251_In1 <= "" & bh7_w70_8 & bh7_w70_7;
   bh7_w69_10 <= Compressor_23_3_Freq300_uid32_bh7_uid251_Out0(0);
   bh7_w70_9 <= Compressor_23_3_Freq300_uid32_bh7_uid251_Out0(1);
   bh7_w71_9 <= Compressor_23_3_Freq300_uid32_bh7_uid251_Out0(2);
   Compressor_23_3_Freq300_uid32_uid251: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid251_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid251_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid251_Out0_copy252);
   Compressor_23_3_Freq300_uid32_bh7_uid251_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid251_Out0_copy252; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid253_In0 <= "" & bh7_w71_8 & bh7_w71_7 & bh7_w71_6;
   Compressor_23_3_Freq300_uid32_bh7_uid253_In1 <= "" & bh7_w72_8 & bh7_w72_7;
   bh7_w71_10 <= Compressor_23_3_Freq300_uid32_bh7_uid253_Out0(0);
   bh7_w72_9 <= Compressor_23_3_Freq300_uid32_bh7_uid253_Out0(1);
   bh7_w73_9 <= Compressor_23_3_Freq300_uid32_bh7_uid253_Out0(2);
   Compressor_23_3_Freq300_uid32_uid253: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid253_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid253_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid253_Out0_copy254);
   Compressor_23_3_Freq300_uid32_bh7_uid253_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid253_Out0_copy254; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid255_In0 <= "" & bh7_w73_8 & bh7_w73_7 & bh7_w73_6;
   Compressor_23_3_Freq300_uid32_bh7_uid255_In1 <= "" & bh7_w74_8 & bh7_w74_7;
   bh7_w73_10 <= Compressor_23_3_Freq300_uid32_bh7_uid255_Out0(0);
   bh7_w74_9 <= Compressor_23_3_Freq300_uid32_bh7_uid255_Out0(1);
   bh7_w75_9 <= Compressor_23_3_Freq300_uid32_bh7_uid255_Out0(2);
   Compressor_23_3_Freq300_uid32_uid255: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid255_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid255_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid255_Out0_copy256);
   Compressor_23_3_Freq300_uid32_bh7_uid255_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid255_Out0_copy256; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid257_In0 <= "" & bh7_w75_8 & bh7_w75_7 & bh7_w75_6;
   Compressor_23_3_Freq300_uid32_bh7_uid257_In1 <= "" & bh7_w76_8 & bh7_w76_7;
   bh7_w75_10 <= Compressor_23_3_Freq300_uid32_bh7_uid257_Out0(0);
   bh7_w76_9 <= Compressor_23_3_Freq300_uid32_bh7_uid257_Out0(1);
   bh7_w77_9 <= Compressor_23_3_Freq300_uid32_bh7_uid257_Out0(2);
   Compressor_23_3_Freq300_uid32_uid257: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid257_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid257_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid257_Out0_copy258);
   Compressor_23_3_Freq300_uid32_bh7_uid257_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid257_Out0_copy258; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid259_In0 <= "" & bh7_w77_8 & bh7_w77_7 & bh7_w77_6;
   Compressor_23_3_Freq300_uid32_bh7_uid259_In1 <= "" & bh7_w78_8 & bh7_w78_7;
   bh7_w77_10 <= Compressor_23_3_Freq300_uid32_bh7_uid259_Out0(0);
   bh7_w78_9 <= Compressor_23_3_Freq300_uid32_bh7_uid259_Out0(1);
   bh7_w79_9 <= Compressor_23_3_Freq300_uid32_bh7_uid259_Out0(2);
   Compressor_23_3_Freq300_uid32_uid259: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid259_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid259_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid259_Out0_copy260);
   Compressor_23_3_Freq300_uid32_bh7_uid259_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid259_Out0_copy260; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid261_In0 <= "" & bh7_w79_8 & bh7_w79_7 & bh7_w79_6;
   Compressor_23_3_Freq300_uid32_bh7_uid261_In1 <= "" & bh7_w80_8 & bh7_w80_7;
   bh7_w79_10 <= Compressor_23_3_Freq300_uid32_bh7_uid261_Out0(0);
   bh7_w80_9 <= Compressor_23_3_Freq300_uid32_bh7_uid261_Out0(1);
   bh7_w81_8 <= Compressor_23_3_Freq300_uid32_bh7_uid261_Out0(2);
   Compressor_23_3_Freq300_uid32_uid261: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid261_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid261_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid261_Out0_copy262);
   Compressor_23_3_Freq300_uid32_bh7_uid261_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid261_Out0_copy262; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid263_In0 <= "" & bh7_w81_4 & bh7_w81_7 & bh7_w81_6 & bh7_w81_5;
   Compressor_14_3_Freq300_uid54_bh7_uid263_In1 <= "" & "0";
   bh7_w81_9 <= Compressor_14_3_Freq300_uid54_bh7_uid263_Out0(0);
   bh7_w82_7 <= Compressor_14_3_Freq300_uid54_bh7_uid263_Out0(1);
   bh7_w83_7 <= Compressor_14_3_Freq300_uid54_bh7_uid263_Out0(2);
   Compressor_14_3_Freq300_uid54_uid263: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid263_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid263_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid263_Out0_copy264);
   Compressor_14_3_Freq300_uid54_bh7_uid263_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid263_Out0_copy264; -- output copy to hold a pipeline register if needed


   Compressor_3_2_Freq300_uid40_bh7_uid265_In0 <= "" & bh7_w82_6 & bh7_w82_5 & bh7_w82_4;
   bh7_w82_8 <= Compressor_3_2_Freq300_uid40_bh7_uid265_Out0(0);
   bh7_w83_8 <= Compressor_3_2_Freq300_uid40_bh7_uid265_Out0(1);
   Compressor_3_2_Freq300_uid40_uid265: Compressor_3_2_Freq300_uid40
      port map ( X0 => Compressor_3_2_Freq300_uid40_bh7_uid265_In0,
                 R => Compressor_3_2_Freq300_uid40_bh7_uid265_Out0_copy266);
   Compressor_3_2_Freq300_uid40_bh7_uid265_Out0 <= Compressor_3_2_Freq300_uid40_bh7_uid265_Out0_copy266; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid267_In0 <= "" & bh7_w83_6 & bh7_w83_5 & bh7_w83_4;
   Compressor_23_3_Freq300_uid32_bh7_uid267_In1 <= "" & bh7_w84_5 & bh7_w84_4;
   bh7_w83_9 <= Compressor_23_3_Freq300_uid32_bh7_uid267_Out0(0);
   bh7_w84_6 <= Compressor_23_3_Freq300_uid32_bh7_uid267_Out0(1);
   bh7_w85_7 <= Compressor_23_3_Freq300_uid32_bh7_uid267_Out0(2);
   Compressor_23_3_Freq300_uid32_uid267: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid267_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid267_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid267_Out0_copy268);
   Compressor_23_3_Freq300_uid32_bh7_uid267_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid267_Out0_copy268; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid269_In0 <= "" & bh7_w85_6 & bh7_w85_5 & bh7_w85_4;
   Compressor_23_3_Freq300_uid32_bh7_uid269_In1 <= "" & bh7_w86_5 & bh7_w86_4;
   bh7_w85_8 <= Compressor_23_3_Freq300_uid32_bh7_uid269_Out0(0);
   bh7_w86_6 <= Compressor_23_3_Freq300_uid32_bh7_uid269_Out0(1);
   bh7_w87_7 <= Compressor_23_3_Freq300_uid32_bh7_uid269_Out0(2);
   Compressor_23_3_Freq300_uid32_uid269: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid269_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid269_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid269_Out0_copy270);
   Compressor_23_3_Freq300_uid32_bh7_uid269_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid269_Out0_copy270; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid271_In0 <= "" & bh7_w87_6 & bh7_w87_5 & bh7_w87_4;
   Compressor_23_3_Freq300_uid32_bh7_uid271_In1 <= "" & bh7_w88_3 & bh7_w88_4;
   bh7_w87_8 <= Compressor_23_3_Freq300_uid32_bh7_uid271_Out0(0);
   bh7_w88_5 <= Compressor_23_3_Freq300_uid32_bh7_uid271_Out0(1);
   bh7_w89_7 <= Compressor_23_3_Freq300_uid32_bh7_uid271_Out0(2);
   Compressor_23_3_Freq300_uid32_uid271: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid271_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid271_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid271_Out0_copy272);
   Compressor_23_3_Freq300_uid32_bh7_uid271_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid271_Out0_copy272; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid273_In0 <= "" & bh7_w89_4 & bh7_w89_6 & bh7_w89_5;
   Compressor_23_3_Freq300_uid32_bh7_uid273_In1 <= "" & bh7_w90_5 & bh7_w90_4;
   bh7_w89_8 <= Compressor_23_3_Freq300_uid32_bh7_uid273_Out0(0);
   bh7_w90_6 <= Compressor_23_3_Freq300_uid32_bh7_uid273_Out0(1);
   bh7_w91_7 <= Compressor_23_3_Freq300_uid32_bh7_uid273_Out0(2);
   Compressor_23_3_Freq300_uid32_uid273: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid273_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid273_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid273_Out0_copy274);
   Compressor_23_3_Freq300_uid32_bh7_uid273_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid273_Out0_copy274; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid275_In0 <= "" & bh7_w91_6 & bh7_w91_5 & bh7_w91_4;
   Compressor_23_3_Freq300_uid32_bh7_uid275_In1 <= "" & bh7_w92_5 & bh7_w92_4;
   bh7_w91_8 <= Compressor_23_3_Freq300_uid32_bh7_uid275_Out0(0);
   bh7_w92_6 <= Compressor_23_3_Freq300_uid32_bh7_uid275_Out0(1);
   bh7_w93_7 <= Compressor_23_3_Freq300_uid32_bh7_uid275_Out0(2);
   Compressor_23_3_Freq300_uid32_uid275: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid275_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid275_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid275_Out0_copy276);
   Compressor_23_3_Freq300_uid32_bh7_uid275_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid275_Out0_copy276; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid277_In0 <= "" & bh7_w93_6 & bh7_w93_5 & bh7_w93_4;
   Compressor_23_3_Freq300_uid32_bh7_uid277_In1 <= "" & bh7_w94_5 & bh7_w94_4;
   bh7_w93_8 <= Compressor_23_3_Freq300_uid32_bh7_uid277_Out0(0);
   bh7_w94_6 <= Compressor_23_3_Freq300_uid32_bh7_uid277_Out0(1);
   bh7_w95_7 <= Compressor_23_3_Freq300_uid32_bh7_uid277_Out0(2);
   Compressor_23_3_Freq300_uid32_uid277: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid277_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid277_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid277_Out0_copy278);
   Compressor_23_3_Freq300_uid32_bh7_uid277_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid277_Out0_copy278; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid279_In0 <= "" & bh7_w95_6 & bh7_w95_5 & bh7_w95_4;
   Compressor_23_3_Freq300_uid32_bh7_uid279_In1 <= "" & bh7_w96_5 & bh7_w96_4;
   bh7_w95_8 <= Compressor_23_3_Freq300_uid32_bh7_uid279_Out0(0);
   bh7_w96_6 <= Compressor_23_3_Freq300_uid32_bh7_uid279_Out0(1);
   bh7_w97_7 <= Compressor_23_3_Freq300_uid32_bh7_uid279_Out0(2);
   Compressor_23_3_Freq300_uid32_uid279: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid279_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid279_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid279_Out0_copy280);
   Compressor_23_3_Freq300_uid32_bh7_uid279_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid279_Out0_copy280; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid281_In0 <= "" & bh7_w97_6 & bh7_w97_5 & bh7_w97_4;
   Compressor_23_3_Freq300_uid32_bh7_uid281_In1 <= "" & bh7_w98_5 & bh7_w98_4;
   bh7_w97_8 <= Compressor_23_3_Freq300_uid32_bh7_uid281_Out0(0);
   bh7_w98_6 <= Compressor_23_3_Freq300_uid32_bh7_uid281_Out0(1);
   bh7_w99_5 <= Compressor_23_3_Freq300_uid32_bh7_uid281_Out0(2);
   Compressor_23_3_Freq300_uid32_uid281: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid281_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid281_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid281_Out0_copy282);
   Compressor_23_3_Freq300_uid32_bh7_uid281_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid281_Out0_copy282; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid283_In0 <= "" & bh7_w99_2 & bh7_w99_4 & bh7_w99_3;
   Compressor_23_3_Freq300_uid32_bh7_uid283_In1 <= "" & bh7_w100_4 & bh7_w100_3;
   bh7_w99_6 <= Compressor_23_3_Freq300_uid32_bh7_uid283_Out0(0);
   bh7_w100_5 <= Compressor_23_3_Freq300_uid32_bh7_uid283_Out0(1);
   bh7_w101_4 <= Compressor_23_3_Freq300_uid32_bh7_uid283_Out0(2);
   Compressor_23_3_Freq300_uid32_uid283: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid283_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid283_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid283_Out0_copy284);
   Compressor_23_3_Freq300_uid32_bh7_uid283_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid283_Out0_copy284; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid285_In0 <= "" & bh7_w101_2 & bh7_w101_3 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid285_In1 <= "" & bh7_w102_4 & bh7_w102_3;
   bh7_w101_5 <= Compressor_23_3_Freq300_uid32_bh7_uid285_Out0(0);
   bh7_w102_5 <= Compressor_23_3_Freq300_uid32_bh7_uid285_Out0(1);
   bh7_w103_4 <= Compressor_23_3_Freq300_uid32_bh7_uid285_Out0(2);
   Compressor_23_3_Freq300_uid32_uid285: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid285_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid285_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid285_Out0_copy286);
   Compressor_23_3_Freq300_uid32_bh7_uid285_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid285_Out0_copy286; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid287_In0 <= "" & bh7_w103_2 & bh7_w103_3 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid287_In1 <= "" & bh7_w104_4 & bh7_w104_3;
   bh7_w103_5 <= Compressor_23_3_Freq300_uid32_bh7_uid287_Out0(0);
   bh7_w104_5 <= Compressor_23_3_Freq300_uid32_bh7_uid287_Out0(1);
   bh7_w105_3 <= Compressor_23_3_Freq300_uid32_bh7_uid287_Out0(2);
   Compressor_23_3_Freq300_uid32_uid287: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid287_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid287_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid287_Out0_copy288);
   Compressor_23_3_Freq300_uid32_bh7_uid287_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid287_Out0_copy288; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid289_In0 <= "" & bh7_w106_3 & bh7_w106_2 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid289_In1 <= "" & bh7_w107_2;
   bh7_w106_4 <= Compressor_14_3_Freq300_uid54_bh7_uid289_Out0(0);
   bh7_w107_3 <= Compressor_14_3_Freq300_uid54_bh7_uid289_Out0(1);
   bh7_w108_4 <= Compressor_14_3_Freq300_uid54_bh7_uid289_Out0(2);
   Compressor_14_3_Freq300_uid54_uid289: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid289_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid289_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid289_Out0_copy290);
   Compressor_14_3_Freq300_uid54_bh7_uid289_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid289_Out0_copy290; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid291_In0 <= "" & bh7_w108_3 & bh7_w108_2 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid291_In1 <= "" & bh7_w109_2;
   bh7_w108_5 <= Compressor_14_3_Freq300_uid54_bh7_uid291_Out0(0);
   bh7_w109_3 <= Compressor_14_3_Freq300_uid54_bh7_uid291_Out0(1);
   bh7_w110_4 <= Compressor_14_3_Freq300_uid54_bh7_uid291_Out0(2);
   Compressor_14_3_Freq300_uid54_uid291: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid291_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid291_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid291_Out0_copy292);
   Compressor_14_3_Freq300_uid54_bh7_uid291_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid291_Out0_copy292; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid293_In0 <= "" & bh7_w110_3 & bh7_w110_2 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid293_In1 <= "" & bh7_w111_2;
   bh7_w110_5 <= Compressor_14_3_Freq300_uid54_bh7_uid293_Out0(0);
   bh7_w111_3 <= Compressor_14_3_Freq300_uid54_bh7_uid293_Out0(1);
   bh7_w112_2 <= Compressor_14_3_Freq300_uid54_bh7_uid293_Out0(2);
   Compressor_14_3_Freq300_uid54_uid293: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid293_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid293_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid293_Out0_copy294);
   Compressor_14_3_Freq300_uid54_bh7_uid293_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid293_Out0_copy294; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid295_In0 <= "" & bh7_w112_0 & bh7_w112_1 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid295_In1 <= "" & bh7_w113_0;
   bh7_w112_3 <= Compressor_14_3_Freq300_uid54_bh7_uid295_Out0(0);
   bh7_w113_1 <= Compressor_14_3_Freq300_uid54_bh7_uid295_Out0(1);
   bh7_w114_1 <= Compressor_14_3_Freq300_uid54_bh7_uid295_Out0(2);
   Compressor_14_3_Freq300_uid54_uid295: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid295_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid295_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid295_Out0_copy296);
   Compressor_14_3_Freq300_uid54_bh7_uid295_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid295_Out0_copy296; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid297_In0 <= "" & bh7_w21_5 & bh7_w21_4 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid297_In1 <= "" & bh7_w22_3;
   bh7_w21_6 <= Compressor_14_3_Freq300_uid54_bh7_uid297_Out0(0);
   bh7_w22_4 <= Compressor_14_3_Freq300_uid54_bh7_uid297_Out0(1);
   bh7_w23_6 <= Compressor_14_3_Freq300_uid54_bh7_uid297_Out0(2);
   Compressor_14_3_Freq300_uid54_uid297: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid297_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid297_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid297_Out0_copy298);
   Compressor_14_3_Freq300_uid54_bh7_uid297_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid297_Out0_copy298; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid299_In0 <= "" & bh7_w23_5 & bh7_w23_4 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid299_In1 <= "" & bh7_w24_5;
   bh7_w23_7 <= Compressor_14_3_Freq300_uid54_bh7_uid299_Out0(0);
   bh7_w24_6 <= Compressor_14_3_Freq300_uid54_bh7_uid299_Out0(1);
   bh7_w25_6 <= Compressor_14_3_Freq300_uid54_bh7_uid299_Out0(2);
   Compressor_14_3_Freq300_uid54_uid299: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid299_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid299_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid299_Out0_copy300);
   Compressor_14_3_Freq300_uid54_bh7_uid299_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid299_Out0_copy300; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid301_In0 <= "" & bh7_w25_5 & bh7_w25_4 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid301_In1 <= "" & bh7_w26_5;
   bh7_w25_7 <= Compressor_14_3_Freq300_uid54_bh7_uid301_Out0(0);
   bh7_w26_6 <= Compressor_14_3_Freq300_uid54_bh7_uid301_Out0(1);
   bh7_w27_6 <= Compressor_14_3_Freq300_uid54_bh7_uid301_Out0(2);
   Compressor_14_3_Freq300_uid54_uid301: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid301_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid301_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid301_Out0_copy302);
   Compressor_14_3_Freq300_uid54_bh7_uid301_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid301_Out0_copy302; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid303_In0 <= "" & bh7_w27_5 & bh7_w27_4 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid303_In1 <= "" & bh7_w28_5;
   bh7_w27_7 <= Compressor_14_3_Freq300_uid54_bh7_uid303_Out0(0);
   bh7_w28_6 <= Compressor_14_3_Freq300_uid54_bh7_uid303_Out0(1);
   bh7_w29_6 <= Compressor_14_3_Freq300_uid54_bh7_uid303_Out0(2);
   Compressor_14_3_Freq300_uid54_uid303: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid303_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid303_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid303_Out0_copy304);
   Compressor_14_3_Freq300_uid54_bh7_uid303_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid303_Out0_copy304; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid305_In0 <= "" & bh7_w29_5 & bh7_w29_4 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid305_In1 <= "" & bh7_w30_5;
   bh7_w29_7 <= Compressor_14_3_Freq300_uid54_bh7_uid305_Out0(0);
   bh7_w30_6 <= Compressor_14_3_Freq300_uid54_bh7_uid305_Out0(1);
   bh7_w31_6 <= Compressor_14_3_Freq300_uid54_bh7_uid305_Out0(2);
   Compressor_14_3_Freq300_uid54_uid305: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid305_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid305_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid305_Out0_copy306);
   Compressor_14_3_Freq300_uid54_bh7_uid305_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid305_Out0_copy306; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid307_In0 <= "" & bh7_w31_5 & bh7_w31_4 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid307_In1 <= "" & bh7_w32_5;
   bh7_w31_7 <= Compressor_14_3_Freq300_uid54_bh7_uid307_Out0(0);
   bh7_w32_6 <= Compressor_14_3_Freq300_uid54_bh7_uid307_Out0(1);
   bh7_w33_6 <= Compressor_14_3_Freq300_uid54_bh7_uid307_Out0(2);
   Compressor_14_3_Freq300_uid54_uid307: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid307_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid307_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid307_Out0_copy308);
   Compressor_14_3_Freq300_uid54_bh7_uid307_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid307_Out0_copy308; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid309_In0 <= "" & bh7_w33_5 & bh7_w33_4 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid309_In1 <= "" & bh7_w34_6;
   bh7_w33_7 <= Compressor_14_3_Freq300_uid54_bh7_uid309_Out0(0);
   bh7_w34_7 <= Compressor_14_3_Freq300_uid54_bh7_uid309_Out0(1);
   bh7_w35_8 <= Compressor_14_3_Freq300_uid54_bh7_uid309_Out0(2);
   Compressor_14_3_Freq300_uid54_uid309: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid309_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid309_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid309_Out0_copy310);
   Compressor_14_3_Freq300_uid54_bh7_uid309_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid309_Out0_copy310; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid311_In0 <= "" & bh7_w35_7 & bh7_w35_6 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid311_In1 <= "" & bh7_w36_8 & bh7_w36_7;
   bh7_w35_9 <= Compressor_23_3_Freq300_uid32_bh7_uid311_Out0(0);
   bh7_w36_9 <= Compressor_23_3_Freq300_uid32_bh7_uid311_Out0(1);
   bh7_w37_7 <= Compressor_23_3_Freq300_uid32_bh7_uid311_Out0(2);
   Compressor_23_3_Freq300_uid32_uid311: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid311_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid311_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid311_Out0_copy312);
   Compressor_23_3_Freq300_uid32_bh7_uid311_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid311_Out0_copy312; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid313_In0 <= "" & bh7_w38_8 & bh7_w38_7 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid313_In1 <= "" & bh7_w39_6;
   bh7_w38_9 <= Compressor_14_3_Freq300_uid54_bh7_uid313_Out0(0);
   bh7_w39_7 <= Compressor_14_3_Freq300_uid54_bh7_uid313_Out0(1);
   bh7_w40_9 <= Compressor_14_3_Freq300_uid54_bh7_uid313_Out0(2);
   Compressor_14_3_Freq300_uid54_uid313: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid313_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid313_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid313_Out0_copy314);
   Compressor_14_3_Freq300_uid54_bh7_uid313_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid313_Out0_copy314; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid315_In0 <= "" & bh7_w40_8 & bh7_w40_7 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid315_In1 <= "" & bh7_w41_6;
   bh7_w40_10 <= Compressor_14_3_Freq300_uid54_bh7_uid315_Out0(0);
   bh7_w41_7 <= Compressor_14_3_Freq300_uid54_bh7_uid315_Out0(1);
   bh7_w42_9 <= Compressor_14_3_Freq300_uid54_bh7_uid315_Out0(2);
   Compressor_14_3_Freq300_uid54_uid315: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid315_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid315_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid315_Out0_copy316);
   Compressor_14_3_Freq300_uid54_bh7_uid315_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid315_Out0_copy316; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid317_In0 <= "" & bh7_w42_8 & bh7_w42_7 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid317_In1 <= "" & bh7_w43_6;
   bh7_w42_10 <= Compressor_14_3_Freq300_uid54_bh7_uid317_Out0(0);
   bh7_w43_7 <= Compressor_14_3_Freq300_uid54_bh7_uid317_Out0(1);
   bh7_w44_9 <= Compressor_14_3_Freq300_uid54_bh7_uid317_Out0(2);
   Compressor_14_3_Freq300_uid54_uid317: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid317_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid317_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid317_Out0_copy318);
   Compressor_14_3_Freq300_uid54_bh7_uid317_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid317_Out0_copy318; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid319_In0 <= "" & bh7_w44_8 & bh7_w44_7 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid319_In1 <= "" & bh7_w45_6;
   bh7_w44_10 <= Compressor_14_3_Freq300_uid54_bh7_uid319_Out0(0);
   bh7_w45_7 <= Compressor_14_3_Freq300_uid54_bh7_uid319_Out0(1);
   bh7_w46_9 <= Compressor_14_3_Freq300_uid54_bh7_uid319_Out0(2);
   Compressor_14_3_Freq300_uid54_uid319: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid319_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid319_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid319_Out0_copy320);
   Compressor_14_3_Freq300_uid54_bh7_uid319_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid319_Out0_copy320; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid321_In0 <= "" & bh7_w46_8 & bh7_w46_7 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid321_In1 <= "" & bh7_w47_6;
   bh7_w46_10 <= Compressor_14_3_Freq300_uid54_bh7_uid321_Out0(0);
   bh7_w47_7 <= Compressor_14_3_Freq300_uid54_bh7_uid321_Out0(1);
   bh7_w48_10 <= Compressor_14_3_Freq300_uid54_bh7_uid321_Out0(2);
   Compressor_14_3_Freq300_uid54_uid321: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid321_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid321_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid321_Out0_copy322);
   Compressor_14_3_Freq300_uid54_bh7_uid321_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid321_Out0_copy322; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid323_In0 <= "" & bh7_w48_9 & bh7_w48_8 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid323_In1 <= "" & bh7_w49_7 & bh7_w49_5;
   bh7_w48_11 <= Compressor_23_3_Freq300_uid32_bh7_uid323_Out0(0);
   bh7_w49_8 <= Compressor_23_3_Freq300_uid32_bh7_uid323_Out0(1);
   bh7_w50_10 <= Compressor_23_3_Freq300_uid32_bh7_uid323_Out0(2);
   Compressor_23_3_Freq300_uid32_uid323: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid323_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid323_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid323_Out0_copy324);
   Compressor_23_3_Freq300_uid32_bh7_uid323_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid323_Out0_copy324; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid325_In0 <= "" & bh7_w50_9 & bh7_w50_8 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid325_In1 <= "" & bh7_w51_9 & bh7_w51_10;
   bh7_w50_11 <= Compressor_23_3_Freq300_uid32_bh7_uid325_Out0(0);
   bh7_w51_11 <= Compressor_23_3_Freq300_uid32_bh7_uid325_Out0(1);
   bh7_w52_10 <= Compressor_23_3_Freq300_uid32_bh7_uid325_Out0(2);
   Compressor_23_3_Freq300_uid32_uid325: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid325_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid325_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid325_Out0_copy326);
   Compressor_23_3_Freq300_uid32_bh7_uid325_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid325_Out0_copy326; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid327_In0 <= "" & bh7_w52_8 & bh7_w52_9 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid327_In1 <= "" & bh7_w53_10 & bh7_w53_9;
   bh7_w52_11 <= Compressor_23_3_Freq300_uid32_bh7_uid327_Out0(0);
   bh7_w53_11 <= Compressor_23_3_Freq300_uid32_bh7_uid327_Out0(1);
   bh7_w54_10 <= Compressor_23_3_Freq300_uid32_bh7_uid327_Out0(2);
   Compressor_23_3_Freq300_uid32_uid327: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid327_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid327_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid327_Out0_copy328);
   Compressor_23_3_Freq300_uid32_bh7_uid327_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid327_Out0_copy328; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid329_In0 <= "" & bh7_w54_9 & bh7_w54_6 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid329_In1 <= "" & bh7_w55_10 & bh7_w55_9;
   bh7_w54_11 <= Compressor_23_3_Freq300_uid32_bh7_uid329_Out0(0);
   bh7_w55_11 <= Compressor_23_3_Freq300_uid32_bh7_uid329_Out0(1);
   bh7_w56_10 <= Compressor_23_3_Freq300_uid32_bh7_uid329_Out0(2);
   Compressor_23_3_Freq300_uid32_uid329: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid329_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid329_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid329_Out0_copy330);
   Compressor_23_3_Freq300_uid32_bh7_uid329_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid329_Out0_copy330; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid331_In0 <= "" & bh7_w56_9 & bh7_w56_6 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid331_In1 <= "" & bh7_w57_10 & bh7_w57_9;
   bh7_w56_11 <= Compressor_23_3_Freq300_uid32_bh7_uid331_Out0(0);
   bh7_w57_11 <= Compressor_23_3_Freq300_uid32_bh7_uid331_Out0(1);
   bh7_w58_10 <= Compressor_23_3_Freq300_uid32_bh7_uid331_Out0(2);
   Compressor_23_3_Freq300_uid32_uid331: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid331_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid331_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid331_Out0_copy332);
   Compressor_23_3_Freq300_uid32_bh7_uid331_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid331_Out0_copy332; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid333_In0 <= "" & bh7_w58_9 & bh7_w58_6 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid333_In1 <= "" & bh7_w59_10 & bh7_w59_9;
   bh7_w58_11 <= Compressor_23_3_Freq300_uid32_bh7_uid333_Out0(0);
   bh7_w59_11 <= Compressor_23_3_Freq300_uid32_bh7_uid333_Out0(1);
   bh7_w60_10 <= Compressor_23_3_Freq300_uid32_bh7_uid333_Out0(2);
   Compressor_23_3_Freq300_uid32_uid333: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid333_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid333_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid333_Out0_copy334);
   Compressor_23_3_Freq300_uid32_bh7_uid333_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid333_Out0_copy334; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid335_In0 <= "" & bh7_w60_9 & bh7_w60_6 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid335_In1 <= "" & bh7_w61_10 & bh7_w61_9;
   bh7_w60_11 <= Compressor_23_3_Freq300_uid32_bh7_uid335_Out0(0);
   bh7_w61_11 <= Compressor_23_3_Freq300_uid32_bh7_uid335_Out0(1);
   bh7_w62_10 <= Compressor_23_3_Freq300_uid32_bh7_uid335_Out0(2);
   Compressor_23_3_Freq300_uid32_uid335: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid335_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid335_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid335_Out0_copy336);
   Compressor_23_3_Freq300_uid32_bh7_uid335_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid335_Out0_copy336; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid337_In0 <= "" & bh7_w62_9 & bh7_w62_6 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid337_In1 <= "" & bh7_w63_10 & bh7_w63_9;
   bh7_w62_11 <= Compressor_23_3_Freq300_uid32_bh7_uid337_Out0(0);
   bh7_w63_11 <= Compressor_23_3_Freq300_uid32_bh7_uid337_Out0(1);
   bh7_w64_10 <= Compressor_23_3_Freq300_uid32_bh7_uid337_Out0(2);
   Compressor_23_3_Freq300_uid32_uid337: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid337_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid337_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid337_Out0_copy338);
   Compressor_23_3_Freq300_uid32_bh7_uid337_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid337_Out0_copy338; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid339_In0 <= "" & bh7_w64_9 & bh7_w64_6 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid339_In1 <= "" & bh7_w65_10 & bh7_w65_9;
   bh7_w64_11 <= Compressor_23_3_Freq300_uid32_bh7_uid339_Out0(0);
   bh7_w65_11 <= Compressor_23_3_Freq300_uid32_bh7_uid339_Out0(1);
   bh7_w66_10 <= Compressor_23_3_Freq300_uid32_bh7_uid339_Out0(2);
   Compressor_23_3_Freq300_uid32_uid339: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid339_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid339_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid339_Out0_copy340);
   Compressor_23_3_Freq300_uid32_bh7_uid339_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid339_Out0_copy340; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid341_In0 <= "" & bh7_w66_9 & bh7_w66_6 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid341_In1 <= "" & bh7_w67_10 & bh7_w67_9;
   bh7_w66_11 <= Compressor_23_3_Freq300_uid32_bh7_uid341_Out0(0);
   bh7_w67_11 <= Compressor_23_3_Freq300_uid32_bh7_uid341_Out0(1);
   bh7_w68_10 <= Compressor_23_3_Freq300_uid32_bh7_uid341_Out0(2);
   Compressor_23_3_Freq300_uid32_uid341: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid341_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid341_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid341_Out0_copy342);
   Compressor_23_3_Freq300_uid32_bh7_uid341_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid341_Out0_copy342; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid343_In0 <= "" & bh7_w68_9 & bh7_w68_6 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid343_In1 <= "" & bh7_w69_10 & bh7_w69_9;
   bh7_w68_11 <= Compressor_23_3_Freq300_uid32_bh7_uid343_Out0(0);
   bh7_w69_11 <= Compressor_23_3_Freq300_uid32_bh7_uid343_Out0(1);
   bh7_w70_10 <= Compressor_23_3_Freq300_uid32_bh7_uid343_Out0(2);
   Compressor_23_3_Freq300_uid32_uid343: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid343_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid343_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid343_Out0_copy344);
   Compressor_23_3_Freq300_uid32_bh7_uid343_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid343_Out0_copy344; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid345_In0 <= "" & bh7_w70_9 & bh7_w70_6 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid345_In1 <= "" & bh7_w71_10 & bh7_w71_9;
   bh7_w70_11 <= Compressor_23_3_Freq300_uid32_bh7_uid345_Out0(0);
   bh7_w71_11 <= Compressor_23_3_Freq300_uid32_bh7_uid345_Out0(1);
   bh7_w72_10 <= Compressor_23_3_Freq300_uid32_bh7_uid345_Out0(2);
   Compressor_23_3_Freq300_uid32_uid345: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid345_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid345_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid345_Out0_copy346);
   Compressor_23_3_Freq300_uid32_bh7_uid345_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid345_Out0_copy346; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid347_In0 <= "" & bh7_w72_9 & bh7_w72_6 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid347_In1 <= "" & bh7_w73_10 & bh7_w73_9;
   bh7_w72_11 <= Compressor_23_3_Freq300_uid32_bh7_uid347_Out0(0);
   bh7_w73_11 <= Compressor_23_3_Freq300_uid32_bh7_uid347_Out0(1);
   bh7_w74_10 <= Compressor_23_3_Freq300_uid32_bh7_uid347_Out0(2);
   Compressor_23_3_Freq300_uid32_uid347: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid347_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid347_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid347_Out0_copy348);
   Compressor_23_3_Freq300_uid32_bh7_uid347_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid347_Out0_copy348; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid349_In0 <= "" & bh7_w74_9 & bh7_w74_6 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid349_In1 <= "" & bh7_w75_10 & bh7_w75_9;
   bh7_w74_11 <= Compressor_23_3_Freq300_uid32_bh7_uid349_Out0(0);
   bh7_w75_11 <= Compressor_23_3_Freq300_uid32_bh7_uid349_Out0(1);
   bh7_w76_10 <= Compressor_23_3_Freq300_uid32_bh7_uid349_Out0(2);
   Compressor_23_3_Freq300_uid32_uid349: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid349_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid349_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid349_Out0_copy350);
   Compressor_23_3_Freq300_uid32_bh7_uid349_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid349_Out0_copy350; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid351_In0 <= "" & bh7_w76_9 & bh7_w76_6 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid351_In1 <= "" & bh7_w77_10 & bh7_w77_9;
   bh7_w76_11 <= Compressor_23_3_Freq300_uid32_bh7_uid351_Out0(0);
   bh7_w77_11 <= Compressor_23_3_Freq300_uid32_bh7_uid351_Out0(1);
   bh7_w78_10 <= Compressor_23_3_Freq300_uid32_bh7_uid351_Out0(2);
   Compressor_23_3_Freq300_uid32_uid351: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid351_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid351_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid351_Out0_copy352);
   Compressor_23_3_Freq300_uid32_bh7_uid351_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid351_Out0_copy352; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid353_In0 <= "" & bh7_w78_9 & bh7_w78_6 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid353_In1 <= "" & bh7_w79_10 & bh7_w79_9;
   bh7_w78_11 <= Compressor_23_3_Freq300_uid32_bh7_uid353_Out0(0);
   bh7_w79_11 <= Compressor_23_3_Freq300_uid32_bh7_uid353_Out0(1);
   bh7_w80_10 <= Compressor_23_3_Freq300_uid32_bh7_uid353_Out0(2);
   Compressor_23_3_Freq300_uid32_uid353: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid353_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid353_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid353_Out0_copy354);
   Compressor_23_3_Freq300_uid32_bh7_uid353_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid353_Out0_copy354; -- output copy to hold a pipeline register if needed


   Compressor_23_3_Freq300_uid32_bh7_uid355_In0 <= "" & bh7_w80_9 & bh7_w80_6 & "0";
   Compressor_23_3_Freq300_uid32_bh7_uid355_In1 <= "" & bh7_w81_9 & bh7_w81_8;
   bh7_w80_11 <= Compressor_23_3_Freq300_uid32_bh7_uid355_Out0(0);
   bh7_w81_10 <= Compressor_23_3_Freq300_uid32_bh7_uid355_Out0(1);
   bh7_w82_9 <= Compressor_23_3_Freq300_uid32_bh7_uid355_Out0(2);
   Compressor_23_3_Freq300_uid32_uid355: Compressor_23_3_Freq300_uid32
      port map ( X0 => Compressor_23_3_Freq300_uid32_bh7_uid355_In0,
                 X1 => Compressor_23_3_Freq300_uid32_bh7_uid355_In1,
                 R => Compressor_23_3_Freq300_uid32_bh7_uid355_Out0_copy356);
   Compressor_23_3_Freq300_uid32_bh7_uid355_Out0 <= Compressor_23_3_Freq300_uid32_bh7_uid355_Out0_copy356; -- output copy to hold a pipeline register if needed


   Compressor_3_2_Freq300_uid40_bh7_uid357_In0 <= "" & bh7_w82_7 & bh7_w82_8 & "0";
   bh7_w82_10 <= Compressor_3_2_Freq300_uid40_bh7_uid357_Out0(0);
   bh7_w83_10 <= Compressor_3_2_Freq300_uid40_bh7_uid357_Out0(1);
   Compressor_3_2_Freq300_uid40_uid357: Compressor_3_2_Freq300_uid40
      port map ( X0 => Compressor_3_2_Freq300_uid40_bh7_uid357_In0,
                 R => Compressor_3_2_Freq300_uid40_bh7_uid357_Out0_copy358);
   Compressor_3_2_Freq300_uid40_bh7_uid357_Out0 <= Compressor_3_2_Freq300_uid40_bh7_uid357_Out0_copy358; -- output copy to hold a pipeline register if needed


   Compressor_3_2_Freq300_uid40_bh7_uid359_In0 <= "" & bh7_w83_7 & bh7_w83_9 & bh7_w83_8;
   bh7_w83_11 <= Compressor_3_2_Freq300_uid40_bh7_uid359_Out0(0);
   bh7_w84_7 <= Compressor_3_2_Freq300_uid40_bh7_uid359_Out0(1);
   Compressor_3_2_Freq300_uid40_uid359: Compressor_3_2_Freq300_uid40
      port map ( X0 => Compressor_3_2_Freq300_uid40_bh7_uid359_In0,
                 R => Compressor_3_2_Freq300_uid40_bh7_uid359_Out0_copy360);
   Compressor_3_2_Freq300_uid40_bh7_uid359_Out0 <= Compressor_3_2_Freq300_uid40_bh7_uid359_Out0_copy360; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid361_In0 <= "" & bh7_w85_8 & bh7_w85_7 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid361_In1 <= "" & bh7_w86_6;
   bh7_w85_9 <= Compressor_14_3_Freq300_uid54_bh7_uid361_Out0(0);
   bh7_w86_7 <= Compressor_14_3_Freq300_uid54_bh7_uid361_Out0(1);
   bh7_w87_9 <= Compressor_14_3_Freq300_uid54_bh7_uid361_Out0(2);
   Compressor_14_3_Freq300_uid54_uid361: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid361_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid361_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid361_Out0_copy362);
   Compressor_14_3_Freq300_uid54_bh7_uid361_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid361_Out0_copy362; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid363_In0 <= "" & bh7_w87_8 & bh7_w87_7 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid363_In1 <= "" & bh7_w88_5;
   bh7_w87_10 <= Compressor_14_3_Freq300_uid54_bh7_uid363_Out0(0);
   bh7_w88_6 <= Compressor_14_3_Freq300_uid54_bh7_uid363_Out0(1);
   bh7_w89_9 <= Compressor_14_3_Freq300_uid54_bh7_uid363_Out0(2);
   Compressor_14_3_Freq300_uid54_uid363: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid363_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid363_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid363_Out0_copy364);
   Compressor_14_3_Freq300_uid54_bh7_uid363_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid363_Out0_copy364; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid365_In0 <= "" & bh7_w89_7 & bh7_w89_8 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid365_In1 <= "" & bh7_w90_6;
   bh7_w89_10 <= Compressor_14_3_Freq300_uid54_bh7_uid365_Out0(0);
   bh7_w90_7 <= Compressor_14_3_Freq300_uid54_bh7_uid365_Out0(1);
   bh7_w91_9 <= Compressor_14_3_Freq300_uid54_bh7_uid365_Out0(2);
   Compressor_14_3_Freq300_uid54_uid365: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid365_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid365_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid365_Out0_copy366);
   Compressor_14_3_Freq300_uid54_bh7_uid365_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid365_Out0_copy366; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid367_In0 <= "" & bh7_w91_7 & bh7_w91_8 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid367_In1 <= "" & bh7_w92_6;
   bh7_w91_10 <= Compressor_14_3_Freq300_uid54_bh7_uid367_Out0(0);
   bh7_w92_7 <= Compressor_14_3_Freq300_uid54_bh7_uid367_Out0(1);
   bh7_w93_9 <= Compressor_14_3_Freq300_uid54_bh7_uid367_Out0(2);
   Compressor_14_3_Freq300_uid54_uid367: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid367_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid367_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid367_Out0_copy368);
   Compressor_14_3_Freq300_uid54_bh7_uid367_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid367_Out0_copy368; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid369_In0 <= "" & bh7_w93_8 & bh7_w93_7 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid369_In1 <= "" & bh7_w94_6;
   bh7_w93_10 <= Compressor_14_3_Freq300_uid54_bh7_uid369_Out0(0);
   bh7_w94_7 <= Compressor_14_3_Freq300_uid54_bh7_uid369_Out0(1);
   bh7_w95_9 <= Compressor_14_3_Freq300_uid54_bh7_uid369_Out0(2);
   Compressor_14_3_Freq300_uid54_uid369: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid369_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid369_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid369_Out0_copy370);
   Compressor_14_3_Freq300_uid54_bh7_uid369_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid369_Out0_copy370; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid371_In0 <= "" & bh7_w95_8 & bh7_w95_7 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid371_In1 <= "" & bh7_w96_6;
   bh7_w95_10 <= Compressor_14_3_Freq300_uid54_bh7_uid371_Out0(0);
   bh7_w96_7 <= Compressor_14_3_Freq300_uid54_bh7_uid371_Out0(1);
   bh7_w97_9 <= Compressor_14_3_Freq300_uid54_bh7_uid371_Out0(2);
   Compressor_14_3_Freq300_uid54_uid371: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid371_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid371_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid371_Out0_copy372);
   Compressor_14_3_Freq300_uid54_bh7_uid371_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid371_Out0_copy372; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid373_In0 <= "" & bh7_w97_8 & bh7_w97_7 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid373_In1 <= "" & bh7_w98_6;
   bh7_w97_10 <= Compressor_14_3_Freq300_uid54_bh7_uid373_Out0(0);
   bh7_w98_7 <= Compressor_14_3_Freq300_uid54_bh7_uid373_Out0(1);
   bh7_w99_7 <= Compressor_14_3_Freq300_uid54_bh7_uid373_Out0(2);
   Compressor_14_3_Freq300_uid54_uid373: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid373_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid373_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid373_Out0_copy374);
   Compressor_14_3_Freq300_uid54_bh7_uid373_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid373_Out0_copy374; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid375_In0 <= "" & bh7_w99_6 & bh7_w99_5 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid375_In1 <= "" & bh7_w100_5;
   bh7_w99_8 <= Compressor_14_3_Freq300_uid54_bh7_uid375_Out0(0);
   bh7_w100_6 <= Compressor_14_3_Freq300_uid54_bh7_uid375_Out0(1);
   bh7_w101_6 <= Compressor_14_3_Freq300_uid54_bh7_uid375_Out0(2);
   Compressor_14_3_Freq300_uid54_uid375: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid375_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid375_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid375_Out0_copy376);
   Compressor_14_3_Freq300_uid54_bh7_uid375_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid375_Out0_copy376; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid377_In0 <= "" & bh7_w101_5 & bh7_w101_4 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid377_In1 <= "" & bh7_w102_5;
   bh7_w101_7 <= Compressor_14_3_Freq300_uid54_bh7_uid377_Out0(0);
   bh7_w102_6 <= Compressor_14_3_Freq300_uid54_bh7_uid377_Out0(1);
   bh7_w103_6 <= Compressor_14_3_Freq300_uid54_bh7_uid377_Out0(2);
   Compressor_14_3_Freq300_uid54_uid377: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid377_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid377_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid377_Out0_copy378);
   Compressor_14_3_Freq300_uid54_bh7_uid377_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid377_Out0_copy378; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid379_In0 <= "" & bh7_w103_5 & bh7_w103_4 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid379_In1 <= "" & bh7_w104_5;
   bh7_w103_7 <= Compressor_14_3_Freq300_uid54_bh7_uid379_Out0(0);
   bh7_w104_6 <= Compressor_14_3_Freq300_uid54_bh7_uid379_Out0(1);
   bh7_w105_4 <= Compressor_14_3_Freq300_uid54_bh7_uid379_Out0(2);
   Compressor_14_3_Freq300_uid54_uid379: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid379_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid379_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid379_Out0_copy380);
   Compressor_14_3_Freq300_uid54_bh7_uid379_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid379_Out0_copy380; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid381_In0 <= "" & bh7_w105_3 & bh7_w105_2 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid381_In1 <= "" & bh7_w106_4;
   bh7_w105_5 <= Compressor_14_3_Freq300_uid54_bh7_uid381_Out0(0);
   bh7_w106_5 <= Compressor_14_3_Freq300_uid54_bh7_uid381_Out0(1);
   bh7_w107_4 <= Compressor_14_3_Freq300_uid54_bh7_uid381_Out0(2);
   Compressor_14_3_Freq300_uid54_uid381: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid381_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid381_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid381_Out0_copy382);
   Compressor_14_3_Freq300_uid54_bh7_uid381_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid381_Out0_copy382; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid383_In0 <= "" & bh7_w108_5 & bh7_w108_4 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid383_In1 <= "" & bh7_w109_3;
   bh7_w108_6 <= Compressor_14_3_Freq300_uid54_bh7_uid383_Out0(0);
   bh7_w109_4 <= Compressor_14_3_Freq300_uid54_bh7_uid383_Out0(1);
   bh7_w110_6 <= Compressor_14_3_Freq300_uid54_bh7_uid383_Out0(2);
   Compressor_14_3_Freq300_uid54_uid383: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid383_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid383_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid383_Out0_copy384);
   Compressor_14_3_Freq300_uid54_bh7_uid383_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid383_Out0_copy384; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid385_In0 <= "" & bh7_w110_5 & bh7_w110_4 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid385_In1 <= "" & bh7_w111_3;
   bh7_w110_7 <= Compressor_14_3_Freq300_uid54_bh7_uid385_Out0(0);
   bh7_w111_4 <= Compressor_14_3_Freq300_uid54_bh7_uid385_Out0(1);
   bh7_w112_4 <= Compressor_14_3_Freq300_uid54_bh7_uid385_Out0(2);
   Compressor_14_3_Freq300_uid54_uid385: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid385_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid385_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid385_Out0_copy386);
   Compressor_14_3_Freq300_uid54_bh7_uid385_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid385_Out0_copy386; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid387_In0 <= "" & bh7_w112_3 & bh7_w112_2 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid387_In1 <= "" & bh7_w113_1;
   bh7_w112_5 <= Compressor_14_3_Freq300_uid54_bh7_uid387_Out0(0);
   bh7_w113_2 <= Compressor_14_3_Freq300_uid54_bh7_uid387_Out0(1);
   bh7_w114_2 <= Compressor_14_3_Freq300_uid54_bh7_uid387_Out0(2);
   Compressor_14_3_Freq300_uid54_uid387: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid387_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid387_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid387_Out0_copy388);
   Compressor_14_3_Freq300_uid54_bh7_uid387_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid387_Out0_copy388; -- output copy to hold a pipeline register if needed


   Compressor_14_3_Freq300_uid54_bh7_uid389_In0 <= "" & bh7_w114_0 & bh7_w114_1 & "0" & "0";
   Compressor_14_3_Freq300_uid54_bh7_uid389_In1 <= "" & bh7_w115_0;
   bh7_w114_3 <= Compressor_14_3_Freq300_uid54_bh7_uid389_Out0(0);
   bh7_w115_1 <= Compressor_14_3_Freq300_uid54_bh7_uid389_Out0(1);
   bh7_w116_1 <= Compressor_14_3_Freq300_uid54_bh7_uid389_Out0(2);
   Compressor_14_3_Freq300_uid54_uid389: Compressor_14_3_Freq300_uid54
      port map ( X0 => Compressor_14_3_Freq300_uid54_bh7_uid389_In0,
                 X1 => Compressor_14_3_Freq300_uid54_bh7_uid389_In1,
                 R => Compressor_14_3_Freq300_uid54_bh7_uid389_Out0_copy390);
   Compressor_14_3_Freq300_uid54_bh7_uid389_Out0 <= Compressor_14_3_Freq300_uid54_bh7_uid389_Out0_copy390; -- output copy to hold a pipeline register if needed

   tmp_bitheapResult_bh7_22 <= bh7_w22_4 & bh7_w21_6 & bh7_w20_3 & bh7_w19_4 & bh7_w18_2 & bh7_w17_2 & bh7_w16_0 & bh7_w15_0 & bh7_w14_0 & bh7_w13_0 & bh7_w12_0 & bh7_w11_0 & bh7_w10_0 & bh7_w9_0 & bh7_w8_0 & bh7_w7_0 & bh7_w6_0 & bh7_w5_0 & bh7_w4_0 & bh7_w3_0 & bh7_w2_0 & bh7_w1_0 & bh7_w0_0;

   bitheapFinalAdd_bh7_In0 <= "0" & bh7_w127_0 & bh7_w126_0 & bh7_w125_0 & bh7_w124_0 & bh7_w123_0 & bh7_w122_0 & bh7_w121_0 & bh7_w120_0 & bh7_w119_0 & bh7_w118_0 & bh7_w117_0 & bh7_w116_0 & bh7_w115_1 & bh7_w114_3 & bh7_w113_2 & bh7_w112_5 & bh7_w111_4 & bh7_w110_7 & bh7_w109_4 & bh7_w108_6 & bh7_w107_4 & bh7_w106_5 & bh7_w105_5 & bh7_w104_6 & bh7_w103_7 & bh7_w102_6 & bh7_w101_7 & bh7_w100_6 & bh7_w99_8 & bh7_w98_7 & bh7_w97_10 & bh7_w96_7 & bh7_w95_10 & bh7_w94_7 & bh7_w93_9 & bh7_w92_7 & bh7_w91_9 & bh7_w90_7 & bh7_w89_9 & bh7_w88_6 & bh7_w87_10 & bh7_w86_7 & bh7_w85_9 & bh7_w84_7 & bh7_w83_10 & bh7_w82_9 & bh7_w81_10 & bh7_w80_11 & bh7_w79_11 & bh7_w78_11 & bh7_w77_11 & bh7_w76_11 & bh7_w75_11 & bh7_w74_11 & bh7_w73_11 & bh7_w72_11 & bh7_w71_11 & bh7_w70_11 & bh7_w69_11 & bh7_w68_11 & bh7_w67_11 & bh7_w66_11 & bh7_w65_11 & bh7_w64_11 & bh7_w63_11 & bh7_w62_11 & bh7_w61_11 & bh7_w60_11 & bh7_w59_11 & bh7_w58_11 & bh7_w57_11 & bh7_w56_11 & bh7_w55_11 & bh7_w54_10 & bh7_w53_11 & bh7_w52_10 & bh7_w51_11 & bh7_w50_11 & bh7_w49_8 & bh7_w48_11 & bh7_w47_7 & bh7_w46_10 & bh7_w45_7 & bh7_w44_10 & bh7_w43_7 & bh7_w42_10 & bh7_w41_7 & bh7_w40_10 & bh7_w39_7 & bh7_w38_9 & bh7_w37_7 & bh7_w36_9 & bh7_w35_9 & bh7_w34_7 & bh7_w33_7 & bh7_w32_6 & bh7_w31_7 & bh7_w30_6 & bh7_w29_7 & bh7_w28_6 & bh7_w27_7 & bh7_w26_6 & bh7_w25_7 & bh7_w24_6 & bh7_w23_7;
   bitheapFinalAdd_bh7_In1 <= "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & bh7_w116_1 & "0" & bh7_w114_2 & "0" & bh7_w112_4 & "0" & bh7_w110_6 & "0" & "0" & bh7_w107_3 & "0" & bh7_w105_4 & "0" & bh7_w103_6 & "0" & bh7_w101_6 & "0" & bh7_w99_7 & "0" & bh7_w97_9 & "0" & bh7_w95_9 & "0" & bh7_w93_10 & "0" & bh7_w91_10 & "0" & bh7_w89_10 & "0" & bh7_w87_9 & "0" & "0" & bh7_w84_6 & bh7_w83_11 & bh7_w82_10 & "0" & bh7_w80_10 & "0" & bh7_w78_10 & "0" & bh7_w76_10 & "0" & bh7_w74_10 & "0" & bh7_w72_10 & "0" & bh7_w70_10 & "0" & bh7_w68_10 & "0" & bh7_w66_10 & "0" & bh7_w64_10 & "0" & bh7_w62_10 & "0" & bh7_w60_10 & "0" & bh7_w58_10 & "0" & bh7_w56_10 & "0" & bh7_w54_11 & "0" & bh7_w52_11 & "0" & bh7_w50_10 & "0" & bh7_w48_10 & "0" & bh7_w46_9 & "0" & bh7_w44_9 & "0" & bh7_w42_9 & "0" & bh7_w40_9 & "0" & "0" & bh7_w37_6 & "0" & bh7_w35_8 & "0" & bh7_w33_6 & "0" & bh7_w31_6 & "0" & bh7_w29_6 & "0" & bh7_w27_6 & "0" & bh7_w25_6 & "0" & bh7_w23_6;
   bitheapFinalAdd_bh7_Cin <= '0';

   bitheapFinalAdd_bh7: IntAdder_106_Freq300_uid392
      port map ( clk  => clk,
                 Cin => bitheapFinalAdd_bh7_Cin,
                 X => bitheapFinalAdd_bh7_In0,
                 Y => bitheapFinalAdd_bh7_In1,
                 R => bitheapFinalAdd_bh7_Out);
   bitheapResult_bh7 <= bitheapFinalAdd_bh7_Out(104 downto 0) & tmp_bitheapResult_bh7_22_d1;
   R <= bitheapResult_bh7(127 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                         IntAdder_80_Freq300_uid395
-- VHDL generated for Kintex7 @ 300MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2016)
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles
-- Clock period (ns): 3.33333
-- Target frequency (MHz): 300
-- Input signals: X Y Cin
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_80_Freq300_uid395 is
    port (clk : in std_logic;
          X : in  std_logic_vector(79 downto 0);
          Y : in  std_logic_vector(79 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(79 downto 0)   );
end entity;

architecture arch of IntAdder_80_Freq300_uid395 is
signal Cin_0, Cin_0_d1 :  std_logic;
signal X_0, X_0_d1 :  std_logic_vector(39 downto 0);
signal Y_0, Y_0_d1, Y_0_d2 :  std_logic_vector(39 downto 0);
signal S_0 :  std_logic_vector(39 downto 0);
signal R_0 :  std_logic_vector(38 downto 0);
signal Cin_1 :  std_logic;
signal X_1, X_1_d1 :  std_logic_vector(41 downto 0);
signal Y_1, Y_1_d1, Y_1_d2 :  std_logic_vector(41 downto 0);
signal S_1 :  std_logic_vector(41 downto 0);
signal R_1 :  std_logic_vector(40 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            Cin_0_d1 <=  Cin_0;
            X_0_d1 <=  X_0;
            Y_0_d1 <=  Y_0;
            Y_0_d2 <=  Y_0_d1;
            X_1_d1 <=  X_1;
            Y_1_d1 <=  Y_1;
            Y_1_d2 <=  Y_1_d1;
         end if;
      end process;
   Cin_0 <= Cin;
   X_0 <= '0' & X(38 downto 0);
   Y_0 <= '0' & Y(38 downto 0);
   S_0 <= X_0_d1 + Y_0_d2 + Cin_0_d1;
   R_0 <= S_0(38 downto 0);
   Cin_1 <= S_0(39);
   X_1 <= '0' & X(79 downto 39);
   Y_1 <= '0' & Y(79 downto 39);
   S_1 <= X_1_d1 + Y_1_d2 + Cin_1;
   R_1 <= S_1(40 downto 0);
   R <= R_1 & R_0 ;
end architecture;

--------------------------------------------------------------------------------
--                       FPMult_15_63_uid2_Freq300_uid3
-- VHDL generated for Kintex7 @ 300MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin 2008-2021
--------------------------------------------------------------------------------
-- Pipeline depth: 2 cycles
-- Clock period (ns): 3.33333
-- Target frequency (MHz): 300
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity FPMult_15_63_uid2_Freq300_uid3 is
    port (clk : in std_logic;
          X : in  std_logic_vector(15+63+2 downto 0);
          Y : in  std_logic_vector(15+63+2 downto 0);
          R : out  std_logic_vector(15+63+2 downto 0)   );
end entity;

architecture arch of FPMult_15_63_uid2_Freq300_uid3 is
   component IntMultiplier_Freq300_uid5 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(63 downto 0);
             Y : in  std_logic_vector(63 downto 0);
             R : out  std_logic_vector(127 downto 0)   );
   end component;

   component IntAdder_80_Freq300_uid395 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(79 downto 0);
             Y : in  std_logic_vector(79 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(79 downto 0)   );
   end component;

signal sign, sign_d1, sign_d2 :  std_logic;
signal expX :  std_logic_vector(14 downto 0);
signal expY :  std_logic_vector(14 downto 0);
signal expSumPreSub :  std_logic_vector(16 downto 0);
signal bias :  std_logic_vector(16 downto 0);
signal expSum, expSum_d1 :  std_logic_vector(16 downto 0);
signal sigX :  std_logic_vector(63 downto 0);
signal sigY :  std_logic_vector(63 downto 0);
signal sigProd :  std_logic_vector(127 downto 0);
signal excSel :  std_logic_vector(3 downto 0);
signal exc, exc_d1, exc_d2 :  std_logic_vector(1 downto 0);
signal norm :  std_logic;
signal expPostNorm :  std_logic_vector(16 downto 0);
signal sigProdExt :  std_logic_vector(127 downto 0);
signal expSig :  std_logic_vector(79 downto 0);
signal sticky :  std_logic;
signal guard :  std_logic;
signal round :  std_logic;
signal expSigPostRound :  std_logic_vector(79 downto 0);
signal excPostNorm :  std_logic_vector(1 downto 0);
signal finalExc :  std_logic_vector(1 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            sign_d1 <=  sign;
            sign_d2 <=  sign_d1;
            expSum_d1 <=  expSum;
            exc_d1 <=  exc;
            exc_d2 <=  exc_d1;
         end if;
      end process;
   sign <= X(78) xor Y(78);
   expX <= X(77 downto 63);
   expY <= Y(77 downto 63);
   expSumPreSub <= ("00" & expX) + ("00" & expY);
   bias <= CONV_STD_LOGIC_VECTOR(16383,17);
   expSum <= expSumPreSub - bias;
   sigX <= "1" & X(62 downto 0);
   sigY <= "1" & Y(62 downto 0);
   SignificandMultiplication: IntMultiplier_Freq300_uid5
      port map ( clk  => clk,
                 X => sigX,
                 Y => sigY,
                 R => sigProd);
   excSel <= X(80 downto 79) & Y(80 downto 79);
   with excSel  select  
   exc <= "00" when  "0000" | "0001" | "0100", 
          "01" when "0101",
          "10" when "0110" | "1001" | "1010" ,
          "11" when others;
   norm <= sigProd(127);
   -- exponent update
   expPostNorm <= expSum_d1 + ("0000000000000000" & norm);
   -- significand normalization shift
   sigProdExt <= sigProd(126 downto 0) & "0" when norm='1' else
                         sigProd(125 downto 0) & "00";
   expSig <= expPostNorm & sigProdExt(127 downto 65);
   sticky <= sigProdExt(64);
   guard <= '0' when sigProdExt(63 downto 0)="0000000000000000000000000000000000000000000000000000000000000000" else '1';
   round <= sticky and ( (guard and not(sigProdExt(65))) or (sigProdExt(65) ))  ;
   RoundingAdder: IntAdder_80_Freq300_uid395
      port map ( clk  => clk,
                 Cin => round,
                 X => expSig,
                 Y => "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
                 R => expSigPostRound);
   with expSigPostRound(79 downto 78)  select 
   excPostNorm <=  "01"  when  "00",
                               "10"             when "01", 
                               "00"             when "11"|"10",
                               "11"             when others;
   with exc_d2  select  
   finalExc <= exc_d2 when  "11"|"10"|"00",
                       excPostNorm when others; 
   R <= finalExc & sign_d2 & expSigPostRound(77 downto 0);
end architecture;

