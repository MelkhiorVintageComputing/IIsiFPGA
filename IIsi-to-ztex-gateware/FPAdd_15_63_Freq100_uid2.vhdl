--------------------------------------------------------------------------------
--                RightShifterSticky64_by_max_66_Freq100_uid4
-- VHDL generated for Kintex7 @ 100MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca (2008-2011), Florent de Dinechin (2008-2019)
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles
-- Clock period (ns): 10
-- Target frequency (MHz): 100
-- Input signals: X S
-- Output signals: R Sticky

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity RightShifterSticky64_by_max_66_Freq100_uid4 is
    port (clk : in std_logic;
          X : in  std_logic_vector(63 downto 0);
          S : in  std_logic_vector(6 downto 0);
          R : out  std_logic_vector(65 downto 0);
          Sticky : out  std_logic   );
end entity;

architecture arch of RightShifterSticky64_by_max_66_Freq100_uid4 is
signal ps, ps_d1 :  std_logic_vector(6 downto 0);
signal Xpadded :  std_logic_vector(65 downto 0);
signal level7 :  std_logic_vector(65 downto 0);
signal stk6 :  std_logic;
signal level6 :  std_logic_vector(65 downto 0);
signal stk5 :  std_logic;
signal level5 :  std_logic_vector(65 downto 0);
signal stk4 :  std_logic;
signal level4 :  std_logic_vector(65 downto 0);
signal stk3 :  std_logic;
signal level3 :  std_logic_vector(65 downto 0);
signal stk2, stk2_d1 :  std_logic;
signal level2, level2_d1 :  std_logic_vector(65 downto 0);
signal stk1 :  std_logic;
signal level1, level1_d1 :  std_logic_vector(65 downto 0);
signal stk0 :  std_logic;
signal level0 :  std_logic_vector(65 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            ps_d1 <=  ps;
            stk2_d1 <=  stk2;
            level2_d1 <=  level2;
            level1_d1 <=  level1;
         end if;
      end process;
   ps<= S;
   Xpadded <= X&(1 downto 0 => '0');
   level7<= Xpadded;
   stk6 <= '1' when (level7(63 downto 0)/="0000000000000000000000000000000000000000000000000000000000000000" and ps(6)='1')   else '0';
   level6 <=  level7 when  ps(6)='0'    else (63 downto 0 => '0') & level7(65 downto 64);
   stk5 <= '1' when (level6(31 downto 0)/="00000000000000000000000000000000" and ps(5)='1') or stk6 ='1'   else '0';
   level5 <=  level6 when  ps(5)='0'    else (31 downto 0 => '0') & level6(65 downto 32);
   stk4 <= '1' when (level5(15 downto 0)/="0000000000000000" and ps(4)='1') or stk5 ='1'   else '0';
   level4 <=  level5 when  ps(4)='0'    else (15 downto 0 => '0') & level5(65 downto 16);
   stk3 <= '1' when (level4(7 downto 0)/="00000000" and ps(3)='1') or stk4 ='1'   else '0';
   level3 <=  level4 when  ps(3)='0'    else (7 downto 0 => '0') & level4(65 downto 8);
   stk2 <= '1' when (level3(3 downto 0)/="0000" and ps(2)='1') or stk3 ='1'   else '0';
   level2 <=  level3 when  ps(2)='0'    else (3 downto 0 => '0') & level3(65 downto 4);
   stk1 <= '1' when (level2_d1(1 downto 0)/="00" and ps_d1(1)='1') or stk2_d1 ='1'   else '0';
   level1 <=  level2 when  ps(1)='0'    else (1 downto 0 => '0') & level2(65 downto 2);
   stk0 <= '1' when (level1_d1(0 downto 0)/="0" and ps_d1(0)='1') or stk1 ='1'   else '0';
   level0 <=  level1 when  ps(0)='0'    else (0 downto 0 => '0') & level1(65 downto 1);
   R <= level0;
   Sticky <= stk0;
end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_67_Freq100_uid6
-- VHDL generated for Kintex7 @ 100MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2016)
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles
-- Clock period (ns): 10
-- Target frequency (MHz): 100
-- Input signals: X Y Cin
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_67_Freq100_uid6 is
    port (clk : in std_logic;
          X : in  std_logic_vector(66 downto 0);
          Y : in  std_logic_vector(66 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(66 downto 0)   );
end entity;

architecture arch of IntAdder_67_Freq100_uid6 is
signal Rtmp :  std_logic_vector(66 downto 0);
signal X_d1 :  std_logic_vector(66 downto 0);
signal Y_d1 :  std_logic_vector(66 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            X_d1 <=  X;
            Y_d1 <=  Y;
         end if;
      end process;
   Rtmp <= X_d1 + Y_d1 + Cin;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                     Normalizer_Z_68_68_68_Freq100_uid8
-- VHDL generated for Kintex7 @ 100MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, (2007-2020)
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles
-- Clock period (ns): 10
-- Target frequency (MHz): 100
-- Input signals: X
-- Output signals: Count R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Normalizer_Z_68_68_68_Freq100_uid8 is
    port (clk : in std_logic;
          X : in  std_logic_vector(67 downto 0);
          Count : out  std_logic_vector(6 downto 0);
          R : out  std_logic_vector(67 downto 0)   );
end entity;

architecture arch of Normalizer_Z_68_68_68_Freq100_uid8 is
signal level7 :  std_logic_vector(67 downto 0);
signal count6, count6_d1 :  std_logic;
signal level6 :  std_logic_vector(67 downto 0);
signal count5, count5_d1 :  std_logic;
signal level5 :  std_logic_vector(67 downto 0);
signal count4, count4_d1 :  std_logic;
signal level4 :  std_logic_vector(67 downto 0);
signal count3, count3_d1 :  std_logic;
signal level3 :  std_logic_vector(67 downto 0);
signal count2, count2_d1 :  std_logic;
signal level2, level2_d1 :  std_logic_vector(67 downto 0);
signal count1 :  std_logic;
signal level1 :  std_logic_vector(67 downto 0);
signal count0 :  std_logic;
signal level0 :  std_logic_vector(67 downto 0);
signal sCount :  std_logic_vector(6 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            count6_d1 <=  count6;
            count5_d1 <=  count5;
            count4_d1 <=  count4;
            count3_d1 <=  count3;
            count2_d1 <=  count2;
            level2_d1 <=  level2;
         end if;
      end process;
   level7 <= X ;
   count6<= '1' when level7(67 downto 4) = (67 downto 4=>'0') else '0';
   level6<= level7(67 downto 0) when count6='0' else level7(3 downto 0) & (63 downto 0 => '0');

   count5<= '1' when level6(67 downto 36) = (67 downto 36=>'0') else '0';
   level5<= level6(67 downto 0) when count5='0' else level6(35 downto 0) & (31 downto 0 => '0');

   count4<= '1' when level5(67 downto 52) = (67 downto 52=>'0') else '0';
   level4<= level5(67 downto 0) when count4='0' else level5(51 downto 0) & (15 downto 0 => '0');

   count3<= '1' when level4(67 downto 60) = (67 downto 60=>'0') else '0';
   level3<= level4(67 downto 0) when count3='0' else level4(59 downto 0) & (7 downto 0 => '0');

   count2<= '1' when level3(67 downto 64) = (67 downto 64=>'0') else '0';
   level2<= level3(67 downto 0) when count2='0' else level3(63 downto 0) & (3 downto 0 => '0');

   count1<= '1' when level2_d1(67 downto 66) = (67 downto 66=>'0') else '0';
   level1<= level2_d1(67 downto 0) when count1='0' else level2_d1(65 downto 0) & (1 downto 0 => '0');

   count0<= '1' when level1(67 downto 67) = (67 downto 67=>'0') else '0';
   level0<= level1(67 downto 0) when count0='0' else level1(66 downto 0) & (0 downto 0 => '0');

   R <= level0;
   sCount <= count6_d1 & count5_d1 & count4_d1 & count3_d1 & count2_d1 & count1 & count0;
   Count <= sCount;
end architecture;

--------------------------------------------------------------------------------
--                         IntAdder_81_Freq100_uid11
-- VHDL generated for Kintex7 @ 100MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2016)
--------------------------------------------------------------------------------
-- Pipeline depth: 2 cycles
-- Clock period (ns): 10
-- Target frequency (MHz): 100
-- Input signals: X Y Cin
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_81_Freq100_uid11 is
    port (clk : in std_logic;
          X : in  std_logic_vector(80 downto 0);
          Y : in  std_logic_vector(80 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(80 downto 0)   );
end entity;

architecture arch of IntAdder_81_Freq100_uid11 is
signal Rtmp :  std_logic_vector(80 downto 0);
signal Y_d1, Y_d2 :  std_logic_vector(80 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            Y_d1 <=  Y;
            Y_d2 <=  Y_d1;
         end if;
      end process;
   Rtmp <= X + Y_d2 + Cin;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                          FPAdd_15_63_Freq100_uid2
-- VHDL generated for Kintex7 @ 100MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2010-2017)
--------------------------------------------------------------------------------
-- Pipeline depth: 2 cycles
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

entity FPAdd_15_63_Freq100_uid2 is
    port (clk : in std_logic;
          X : in  std_logic_vector(15+63+2 downto 0);
          Y : in  std_logic_vector(15+63+2 downto 0);
          R : out  std_logic_vector(15+63+2 downto 0)   );
end entity;

architecture arch of FPAdd_15_63_Freq100_uid2 is
   component RightShifterSticky64_by_max_66_Freq100_uid4 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(63 downto 0);
             S : in  std_logic_vector(6 downto 0);
             R : out  std_logic_vector(65 downto 0);
             Sticky : out  std_logic   );
   end component;

   component IntAdder_67_Freq100_uid6 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(66 downto 0);
             Y : in  std_logic_vector(66 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(66 downto 0)   );
   end component;

   component Normalizer_Z_68_68_68_Freq100_uid8 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(67 downto 0);
             Count : out  std_logic_vector(6 downto 0);
             R : out  std_logic_vector(67 downto 0)   );
   end component;

   component IntAdder_81_Freq100_uid11 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(80 downto 0);
             Y : in  std_logic_vector(80 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(80 downto 0)   );
   end component;

signal excExpFracX :  std_logic_vector(79 downto 0);
signal excExpFracY :  std_logic_vector(79 downto 0);
signal swap :  std_logic;
signal eXmeY :  std_logic_vector(14 downto 0);
signal eYmeX :  std_logic_vector(14 downto 0);
signal expDiff :  std_logic_vector(14 downto 0);
signal newX :  std_logic_vector(80 downto 0);
signal newY :  std_logic_vector(80 downto 0);
signal expX :  std_logic_vector(14 downto 0);
signal excX :  std_logic_vector(1 downto 0);
signal excY :  std_logic_vector(1 downto 0);
signal signX :  std_logic;
signal signY :  std_logic;
signal EffSub, EffSub_d1, EffSub_d2 :  std_logic;
signal sXsYExnXY :  std_logic_vector(5 downto 0);
signal sdExnXY :  std_logic_vector(3 downto 0);
signal fracY :  std_logic_vector(63 downto 0);
signal excRt, excRt_d1, excRt_d2 :  std_logic_vector(1 downto 0);
signal signR, signR_d1, signR_d2 :  std_logic;
signal shiftedOut :  std_logic;
signal shiftVal :  std_logic_vector(6 downto 0);
signal shiftedFracY :  std_logic_vector(65 downto 0);
signal sticky :  std_logic;
signal fracYpad :  std_logic_vector(66 downto 0);
signal EffSubVector :  std_logic_vector(66 downto 0);
signal fracYpadXorOp :  std_logic_vector(66 downto 0);
signal fracXpad :  std_logic_vector(66 downto 0);
signal cInSigAdd :  std_logic;
signal fracAddResult :  std_logic_vector(66 downto 0);
signal fracSticky :  std_logic_vector(67 downto 0);
signal nZerosNew :  std_logic_vector(6 downto 0);
signal shiftedFrac :  std_logic_vector(67 downto 0);
signal extendedExpInc, extendedExpInc_d1, extendedExpInc_d2 :  std_logic_vector(15 downto 0);
signal updatedExp :  std_logic_vector(16 downto 0);
signal eqdiffsign :  std_logic;
signal expFrac :  std_logic_vector(80 downto 0);
signal stk :  std_logic;
signal rnd :  std_logic;
signal lsb :  std_logic;
signal needToRound :  std_logic;
signal RoundedExpFrac :  std_logic_vector(80 downto 0);
signal upExc :  std_logic_vector(1 downto 0);
signal fracR :  std_logic_vector(62 downto 0);
signal expR :  std_logic_vector(14 downto 0);
signal exExpExc :  std_logic_vector(3 downto 0);
signal excRt2 :  std_logic_vector(1 downto 0);
signal excR :  std_logic_vector(1 downto 0);
signal signR2 :  std_logic;
signal computedR :  std_logic_vector(80 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            EffSub_d1 <=  EffSub;
            EffSub_d2 <=  EffSub_d1;
            excRt_d1 <=  excRt;
            excRt_d2 <=  excRt_d1;
            signR_d1 <=  signR;
            signR_d2 <=  signR_d1;
            extendedExpInc_d1 <=  extendedExpInc;
            extendedExpInc_d2 <=  extendedExpInc_d1;
         end if;
      end process;
   excExpFracX <= X(80 downto 79) & X(77 downto 0);
   excExpFracY <= Y(80 downto 79) & Y(77 downto 0);
   swap <= '1' when excExpFracX < excExpFracY else '0';
   -- exponent difference
   eXmeY <= (X(77 downto 63)) - (Y(77 downto 63));
   eYmeX <= (Y(77 downto 63)) - (X(77 downto 63));
   expDiff <= eXmeY when swap = '0' else eYmeX;
   -- input swap so that |X|>|Y|
   newX <= X when swap = '0' else Y;
   newY <= Y when swap = '0' else X;
   -- now we decompose the inputs into their sign, exponent, fraction
   expX<= newX(77 downto 63);
   excX<= newX(80 downto 79);
   excY<= newY(80 downto 79);
   signX<= newX(78);
   signY<= newY(78);
   EffSub <= signX xor signY;
   sXsYExnXY <= signX & signY & excX & excY;
   sdExnXY <= excX & excY;
   fracY <= "0000000000000000000000000000000000000000000000000000000000000000" when excY="00" else ('1' & newY(62 downto 0));
   -- Exception management logic
   with sXsYExnXY  select  
   excRt <= "00" when "000000"|"010000"|"100000"|"110000",
      "01" when "000101"|"010101"|"100101"|"110101"|"000100"|"010100"|"100100"|"110100"|"000001"|"010001"|"100001"|"110001",
      "10" when "111010"|"001010"|"001000"|"011000"|"101000"|"111000"|"000010"|"010010"|"100010"|"110010"|"001001"|"011001"|"101001"|"111001"|"000110"|"010110"|"100110"|"110110", 
      "11" when others;
   signR<= '0' when (sXsYExnXY="100000" or sXsYExnXY="010000") else signX;
   shiftedOut <= '1' when (expDiff > 65) else '0';
   shiftVal <= expDiff(6 downto 0) when shiftedOut='0' else CONV_STD_LOGIC_VECTOR(66,7);
   RightShifterComponent: RightShifterSticky64_by_max_66_Freq100_uid4
      port map ( clk  => clk,
                 S => shiftVal,
                 X => fracY,
                 R => shiftedFracY,
                 Sticky => sticky);
   fracYpad <= "0" & shiftedFracY;
   EffSubVector <= (66 downto 0 => EffSub);
   fracYpadXorOp <= fracYpad xor EffSubVector;
   fracXpad <= "01" & (newX(62 downto 0)) & "00";
   cInSigAdd <= EffSub_d1 and not sticky; -- if we subtract and the sticky was one, some of the negated sticky bits would have absorbed this carry 
   fracAdder: IntAdder_67_Freq100_uid6
      port map ( clk  => clk,
                 Cin => cInSigAdd,
                 X => fracXpad,
                 Y => fracYpadXorOp,
                 R => fracAddResult);
   fracSticky<= fracAddResult & sticky; 
   LZCAndShifter: Normalizer_Z_68_68_68_Freq100_uid8
      port map ( clk  => clk,
                 X => fracSticky,
                 Count => nZerosNew,
                 R => shiftedFrac);
   extendedExpInc<= ("0" & expX) + '1';
   updatedExp <= ("0" &extendedExpInc_d2) - ("0000000000" & nZerosNew);
   eqdiffsign <= '1' when nZerosNew="1111111" else '0';
   expFrac<= updatedExp & shiftedFrac(66 downto 3);
   stk<= shiftedFrac(2) or shiftedFrac(1) or shiftedFrac(0);
   rnd<= shiftedFrac(3);
   lsb<= shiftedFrac(4);
   needToRound<= '1' when (rnd='1' and stk='1') or (rnd='1' and stk='0' and lsb='1')
  else '0';
   roundingAdder: IntAdder_81_Freq100_uid11
      port map ( clk  => clk,
                 Cin => needToRound,
                 X => expFrac,
                 Y => "000000000000000000000000000000000000000000000000000000000000000000000000000000000",
                 R => RoundedExpFrac);
   -- possible update to exception bits
   upExc <= RoundedExpFrac(80 downto 79);
   fracR <= RoundedExpFrac(63 downto 1);
   expR <= RoundedExpFrac(78 downto 64);
   exExpExc <= upExc & excRt_d2;
   with exExpExc  select  
   excRt2<= "00" when "0000"|"0100"|"1000"|"1100"|"1001"|"1101",
      "01" when "0001",
      "10" when "0010"|"0110"|"1010"|"1110"|"0101",
      "11" when others;
   excR <= "00" when (eqdiffsign='1' and EffSub_d2='1'  and not(excRt_d2="11")) else excRt2;
   signR2 <= '0' when (eqdiffsign='1' and EffSub_d2='1') else signR_d2;
   computedR <= excR & signR2 & expR & fracR;
   R <= computedR;
end architecture;

