--------------------------------------------------------------------------------
--                     Fix2FP_0_31_S_15_63_F100_uid2zeroD
--                          (IntAdder_32_f100_uid4)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Fix2FP_0_31_S_15_63_F100_uid2zeroD is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(31 downto 0);
          Y : in  std_logic_vector(31 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(31 downto 0)   );
end entity;

architecture arch of Fix2FP_0_31_S_15_63_F100_uid2zeroD is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Classical
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--                     Fix2FP_0_31_S_15_63_F100_uid2_LZCS
--               (LZOCShifter_31_to_64_counting_32_F100_uid12)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Fix2FP_0_31_S_15_63_F100_uid2_LZCS is
   port ( clk, rst : in std_logic;
          I : in  std_logic_vector(30 downto 0);
          OZb : in  std_logic;
          Count : out  std_logic_vector(4 downto 0);
          O : out  std_logic_vector(63 downto 0)   );
end entity;

architecture arch of Fix2FP_0_31_S_15_63_F100_uid2_LZCS is
signal level5 :  std_logic_vector(30 downto 0);
signal sozb :  std_logic;
signal count4 :  std_logic;
signal level4 :  std_logic_vector(30 downto 0);
signal count3 :  std_logic;
signal level3 :  std_logic_vector(30 downto 0);
signal count2 :  std_logic;
signal level2 :  std_logic_vector(30 downto 0);
signal count1 :  std_logic;
signal level1 :  std_logic_vector(30 downto 0);
signal count0 :  std_logic;
signal level0 :  std_logic_vector(30 downto 0);
signal sCount :  std_logic_vector(4 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   level5 <= I ;
   sozb<= OZb;
   count4<= '1' when level5(30 downto 15) = (30 downto 15=>sozb) else '0';
   level4<= level5(30 downto 0) when count4='0' else level5(14 downto 0) & (15 downto 0 => '0');

   count3<= '1' when level4(30 downto 23) = (30 downto 23=>sozb) else '0';
   level3<= level4(30 downto 0) when count3='0' else level4(22 downto 0) & (7 downto 0 => '0');

   count2<= '1' when level3(30 downto 27) = (30 downto 27=>sozb) else '0';
   level2<= level3(30 downto 0) when count2='0' else level3(26 downto 0) & (3 downto 0 => '0');

   count1<= '1' when level2(30 downto 29) = (30 downto 29=>sozb) else '0';
   level1<= level2(30 downto 0) when count1='0' else level2(28 downto 0) & (1 downto 0 => '0');

   count0<= '1' when level1(30 downto 30) = (30 downto 30=>sozb) else '0';
   level0<= level1(30 downto 0) when count0='0' else level1(29 downto 0) & (0 downto 0 => '0');

   O <= level0&(32 downto 0 => '0');
   sCount <= count4 & count3 & count2 & count1 & count0;
   Count <= sCount;
end architecture;

--------------------------------------------------------------------------------
--               Fix2FP_0_31_S_15_63_F100_uid2_fractionConvert
--                          (IntAdder_65_f100_uid16)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Fix2FP_0_31_S_15_63_F100_uid2_fractionConvert is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(64 downto 0);
          Y : in  std_logic_vector(64 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(64 downto 0)   );
end entity;

architecture arch of Fix2FP_0_31_S_15_63_F100_uid2_fractionConvert is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Classical
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--              Fix2FP_0_31_S_15_63_F100_uid2exponentConversion
--                          (IntAdder_15_f100_uid24)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Fix2FP_0_31_S_15_63_F100_uid2exponentConversion is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(14 downto 0);
          Y : in  std_logic_vector(14 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(14 downto 0)   );
end entity;

architecture arch of Fix2FP_0_31_S_15_63_F100_uid2exponentConversion is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Classical
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--                 Fix2FP_0_31_S_15_63_F100_uid2exponentFinal
--                          (IntAdder_16_f100_uid32)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Fix2FP_0_31_S_15_63_F100_uid2exponentFinal is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(15 downto 0);
          Y : in  std_logic_vector(15 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(15 downto 0)   );
end entity;

architecture arch of Fix2FP_0_31_S_15_63_F100_uid2exponentFinal is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Classical
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--                  Fix2FP_0_31_S_15_63_F100_uid2expCorrect
--                          (IntAdder_16_f100_uid40)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Fix2FP_0_31_S_15_63_F100_uid2expCorrect is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(15 downto 0);
          Y : in  std_logic_vector(15 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(15 downto 0)   );
end entity;

architecture arch of Fix2FP_0_31_S_15_63_F100_uid2expCorrect is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Classical
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--                       Fix2FP_0_31_S_15_63_F100_uid2
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Radu Tudoran, Bogdan Pasca (2009)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Fix2FP_0_31_S_15_63_F100_uid2 is
   port ( clk, rst : in std_logic;
          I : in  std_logic_vector(31 downto 0);
          O : out  std_logic_vector(15+63+2 downto 0)   );
end entity;

architecture arch of Fix2FP_0_31_S_15_63_F100_uid2 is
   component Fix2FP_0_31_S_15_63_F100_uid2zeroD is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(31 downto 0);
             Y : in  std_logic_vector(31 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(31 downto 0)   );
   end component;

   component Fix2FP_0_31_S_15_63_F100_uid2_LZCS is
      port ( clk, rst : in std_logic;
             I : in  std_logic_vector(30 downto 0);
             OZb : in  std_logic;
             Count : out  std_logic_vector(4 downto 0);
             O : out  std_logic_vector(63 downto 0)   );
   end component;

   component Fix2FP_0_31_S_15_63_F100_uid2_fractionConvert is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(64 downto 0);
             Y : in  std_logic_vector(64 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(64 downto 0)   );
   end component;

   component Fix2FP_0_31_S_15_63_F100_uid2exponentConversion is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(14 downto 0);
             Y : in  std_logic_vector(14 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(14 downto 0)   );
   end component;

   component Fix2FP_0_31_S_15_63_F100_uid2exponentFinal is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(15 downto 0);
             Y : in  std_logic_vector(15 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(15 downto 0)   );
   end component;

   component Fix2FP_0_31_S_15_63_F100_uid2expCorrect is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(15 downto 0);
             Y : in  std_logic_vector(15 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(15 downto 0)   );
   end component;

signal input :  std_logic_vector(31 downto 0);
signal signSignal :  std_logic;
signal passedInput :  std_logic_vector(31 downto 0);
signal input2LZOC :  std_logic_vector(30 downto 0);
signal minusOne4ZD :  std_logic_vector(31 downto 0);
signal zeroDS :  std_logic_vector(31 downto 0);
signal zeroInput :  std_logic;
signal temporalExponent :  std_logic_vector(4 downto 0);
signal temporalFraction :  std_logic_vector(63 downto 0);
signal tfr :  std_logic_vector(63 downto 0);
signal sign2vector :  std_logic_vector(63 downto 0);
signal tempConvert :  std_logic_vector(63 downto 0);
signal tempPaddingAddSign :  std_logic_vector(63 downto 0);
signal tempAddSign :  std_logic_vector(64 downto 0);
signal tempConvert0 :  std_logic_vector(64 downto 0);
signal tempFractionResult :  std_logic_vector(64 downto 0);
signal correctingExponent :  std_logic;
signal convertedFraction :  std_logic_vector(62 downto 0);
signal MSB2Signal :  std_logic_vector(14 downto 0);
signal zeroPadding4Exponent :  std_logic_vector(9 downto 0);
signal valueExponent :  std_logic_vector(14 downto 0);
signal partialConvertedExponent :  std_logic_vector(14 downto 0);
signal biassOfOnes :  std_logic_vector(13 downto 0);
signal biassSignal :  std_logic_vector(14 downto 0);
signal biassSignalBit :  std_logic_vector(15 downto 0);
signal zeroBitExponent :  std_logic;
signal partialConvertedExponentBit :  std_logic_vector(15 downto 0);
signal sign4OU :  std_logic;
signal convertedExponentBit :  std_logic_vector(15 downto 0);
signal OUflowSignal1 :  std_logic_vector(1 downto 0);
signal underflowSignal :  std_logic;
signal overflowSignal1 :  std_logic;
signal zeroInput4Exponent :  std_logic_vector(15 downto 0);
signal possibleConvertedExponent2 :  std_logic_vector(14 downto 0);
signal possibleConvertedExponent20 :  std_logic_vector(15 downto 0);
signal sign4OU2 :  std_logic;
signal finalConvertedExponent :  std_logic_vector(15 downto 0);
signal convertedExponent :  std_logic_vector(14 downto 0);
signal overflowSignal2 :  std_logic;
signal overflowSignal :  std_logic;
signal MSBSelection :  std_logic;
signal LSBSelection :  std_logic;
signal Selection :  std_logic_vector(1 downto 0);
signal specialBits :  std_logic_vector(1 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   input <= I;
   signSignal<=input(31);
   passedInput<=input(31 downto 0);
   input2LZOC<=passedInput(30 downto 0);
   minusOne4ZD<=CONV_STD_LOGIC_VECTOR(-1,32);
   zeroD: Fix2FP_0_31_S_15_63_F100_uid2zeroD  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => '0',
                 R => zeroDS,
                 X => passedInput,
                 Y => minusOne4ZD);
   ---------------- cycle 0----------------
   zeroInput<= zeroDS(31) and not (signSignal);
   ---------------- cycle 0----------------
   LZOC_component: Fix2FP_0_31_S_15_63_F100_uid2_LZCS  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Count => temporalExponent,
                 I => input2LZOC,
                 O => temporalFraction,
                 OZb => signSignal);
   ---------------- cycle 0----------------
   tfr<= temporalFraction(63 downto 0);
   sign2vector<=(others=>signSignal);
   tempConvert<=sign2vector xor tfr;
   tempPaddingAddSign<=(others=>'0');
   tempAddSign<=tempPaddingAddSign & signSignal;
   tempConvert0<= '0' & tempConvert;
   fractionConverter: Fix2FP_0_31_S_15_63_F100_uid2_fractionConvert  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => '0',
                 R => tempFractionResult,
                 X => tempConvert0,
                 Y => tempAddSign);
   correctingExponent<=tempFractionResult(64);
   convertedFraction<=tempFractionResult(62 downto 0);
   ---------------- cycle 0----------------
   MSB2Signal<= CONV_STD_LOGIC_VECTOR(30,15);
   zeroPadding4Exponent<= CONV_STD_LOGIC_VECTOR(0,10);
   valueExponent<= not(zeroPadding4Exponent & temporalExponent);
   exponentConversion: Fix2FP_0_31_S_15_63_F100_uid2exponentConversion  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => '1',
                 R => partialConvertedExponent,
                 X => MSB2Signal,
                 Y => valueExponent);
   biassOfOnes<=CONV_STD_LOGIC_VECTOR(32767,14);
   biassSignal<='0' & biassOfOnes;
   biassSignalBit<='0' & biassSignal;
   zeroBitExponent<='0';
   partialConvertedExponentBit<= '0' & partialConvertedExponent;
   sign4OU<= partialConvertedExponent(14);
   exponentFinal: Fix2FP_0_31_S_15_63_F100_uid2exponentFinal  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => '0',
                 R => convertedExponentBit,
                 X => partialConvertedExponentBit,
                 Y => biassSignalBit);
   OUflowSignal1<= convertedExponentBit(15 downto 14);
   underflowSignal<= '1' when (sign4OU='1' and OUflowSignal1="01" ) else '0';
   overflowSignal1<= '1' when (sign4OU='0' and OUflowSignal1="10" ) else '0';
   zeroInput4Exponent<=(others=>'0');
   possibleConvertedExponent2<= convertedExponentBit(14 downto 0);
   possibleConvertedExponent20<= '0' & possibleConvertedExponent2;
   sign4OU2<= possibleConvertedExponent2(14);
   expCorrect: Fix2FP_0_31_S_15_63_F100_uid2expCorrect  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => correctingExponent,
                 R => finalConvertedExponent,
                 X => possibleConvertedExponent20,
                 Y => zeroInput4Exponent);
   convertedExponent<= finalConvertedExponent(14 downto 0);
   overflowSignal2<= '1' when (sign4OU2='0' and finalConvertedExponent(15 downto 14) = "10" ) else '0' ;
   overflowSignal<= overflowSignal2 or overflowSignal1;
   MSBSelection<= overflowSignal;
   LSBSelection<= not(underflowSignal or zeroInput);
   Selection<= MSBSelection & LSBSelection when zeroInput='0' else "00";
   specialBits <= Selection;
   O<= specialBits & signSignal & convertedExponent & convertedFraction;
end architecture;

