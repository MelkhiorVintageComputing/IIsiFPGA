--------------------------------------------------------------------------------
--                       IntComparator_78_111_comb_uid4
-- VHDL generated for Kintex7 @ 0MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin (2021)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): inf
-- Target frequency (MHz): 0
-- Input signals: X Y
-- Output signals: XltY XeqY XgtY

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntComparator_78_111_comb_uid4 is
    port (X : in  std_logic_vector(77 downto 0);
          Y : in  std_logic_vector(77 downto 0);
          XltY : out  std_logic;
          XeqY : out  std_logic;
          XgtY : out  std_logic   );
end entity;

architecture arch of IntComparator_78_111_comb_uid4 is
signal XltYi :  std_logic;
signal XeqYi :  std_logic;
signal XgtYi :  std_logic;
begin
   XltYi <= '1' when X<Y else '0';
   XeqYi <= '1' when X=Y else '0';
   XgtYi <= not (XeqYi or XltYi);
   XltY <= XltYi;
   XeqY <= XeqYi;
   XgtY <= XgtYi;
end architecture;

--------------------------------------------------------------------------------
--                        FPComparator_15_63_comb_uid2
-- VHDL generated for Kintex7 @ 0MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin (2021)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): inf
-- Target frequency (MHz): 0
-- Input signals: X Y
-- Output signals: unordered XltY XeqY XgtY XleY XgeY

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity FPComparator_15_63_comb_uid2 is
    port (X : in  std_logic_vector(15+63+2 downto 0);
          Y : in  std_logic_vector(15+63+2 downto 0);
          unordered : out  std_logic;
          XltY : out  std_logic;
          XeqY : out  std_logic;
          XgtY : out  std_logic;
          XleY : out  std_logic;
          XgeY : out  std_logic   );
end entity;

architecture arch of FPComparator_15_63_comb_uid2 is
   component IntComparator_78_111_comb_uid4 is
      port ( X : in  std_logic_vector(77 downto 0);
             Y : in  std_logic_vector(77 downto 0);
             XltY : out  std_logic;
             XeqY : out  std_logic;
             XgtY : out  std_logic   );
   end component;

signal excX :  std_logic_vector(1 downto 0);
signal excY :  std_logic_vector(1 downto 0);
signal signX :  std_logic;
signal signY :  std_logic;
signal ExpFracX :  std_logic_vector(77 downto 0);
signal ExpFracY :  std_logic_vector(77 downto 0);
signal isZeroX :  std_logic;
signal isZeroY :  std_logic;
signal isNormalX :  std_logic;
signal isNormalY :  std_logic;
signal isInfX :  std_logic;
signal isInfY :  std_logic;
signal isNaNX :  std_logic;
signal isNaNY :  std_logic;
signal negativeX :  std_logic;
signal positiveX :  std_logic;
signal negativeY :  std_logic;
signal positiveY :  std_logic;
signal ExpFracXeqExpFracY :  std_logic;
signal ExpFracXltExpFracY :  std_logic;
signal ExpFracXgtExpFracY :  std_logic;
signal sameSign :  std_logic;
signal XeqYNum :  std_logic;
signal XltYNum :  std_logic;
signal XgtYNum :  std_logic;
signal unorderedR :  std_logic;
signal XltYR :  std_logic;
signal XeqYR :  std_logic;
signal XgtYR :  std_logic;
signal XleYR :  std_logic;
signal XgeYR :  std_logic;
begin
   excX <= X(80 downto 79);
   excY <= Y(80 downto 79);
   signX <= X(78);
   signY <= Y(78);
   ExpFracX <= X(77 downto 0);
   ExpFracY <= Y(77 downto 0);
   -- Comparing (as integers) excX & ExpFracX with excY & ExpFracY would almost work 
   --  since indeed inf>normal>0	
   -- However we wouldn't capture infinity equality in cases when the infinities have different ExpFracs (who knows)...	 
   -- Besides, expliciting the isXXX bits will help factoring code with a comparator for IEEE format (some day)
   isZeroX <= '1' when excX="00" else '0' ;
   isZeroY <= '1' when excY="00" else '0' ;
   isNormalX <= '1' when excX="01" else '0' ;
   isNormalY <= '1' when excY="01" else '0' ;
   isInfX <= '1' when excX="10" else '0' ;
   isInfY <= '1' when excY="10" else '0' ;
   isNaNX <= '1' when excX="11" else '0' ;
   isNaNY <= '1' when excY="11" else '0' ;
   -- Just for readability of the formulae below
   negativeX <= signX ;
   positiveX <= not signX ;
   negativeY <= signY ;
   positiveY <= not signY ;
   -- expfrac comparisons 
   ExpFracCmp: IntComparator_78_111_comb_uid4
      port map ( X => ExpFracX,
                 Y => ExpFracY,
                 XeqY => ExpFracXeqExpFracY,
                 XgtY => ExpFracXgtExpFracY,
                 XltY => ExpFracXltExpFracY);
   -- -- and now the logic
   sameSign <= not (signX xor signY) ;
   XeqYNum <= 
         (isZeroX and isZeroY) -- explicitely stated by IEEE 754
      or (isInfX and isInfY and sameSign)  -- bizarre but also explicitely stated by IEEE 754
      or (isNormalX and isNormalY and sameSign and ExpFracXeqExpFracY)   ;
   XltYNum <=     -- case enumeration on Y
         ( (not (isInfX and positiveX)) and (isInfY  and positiveY)) 
      or ((negativeX or isZeroX) and (isNormalY and positiveY)) 
      or ((negativeX and not isZeroX) and isZeroY) 
      or (isNormalX and isNormalY and positiveX and positiveY and ExpFracXltExpFracY)
      or (isNormalX and isNormalY and negativeX and negativeY and ExpFracXgtExpFracY)
      or ((isInfX and negativeX) and (not (isInfY and negativeY)))    ;
   XgtYNum <=     -- case enumeration on X
         ( (not (isInfY and positiveY)) and (isInfX  and positiveX)) 
      or ((negativeY or isZeroY) and (isNormalX and positiveX)) 
      or ((negativeY and not isZeroY) and isZeroX) 
      or (isNormalX and isNormalY and positiveY and positiveX and ExpFracXgtExpFracY)
      or (isNormalX and isNormalY and negativeY and negativeX and ExpFracXltExpFracY)
      or ((isInfY and negativeY) and (not (isInfX and negativeX)))    ;
   unorderedR <=  isNaNX or isNaNY;
   XltYR <= XltYNum and not unorderedR;
   XeqYR <= XeqYNum and not unorderedR;
   XgtYR <= XgtYNum and not unorderedR;
   XleYR <= (XeqYNum or XltYNum)	 and not unorderedR;
   XgeYR <= (XeqYNum or XgtYNum)	 and not unorderedR;
   unordered <= unorderedR;
   XltY <= XltYR;
   XeqY <= XeqYR;
   XgtY <= XgtYR;
   XleY <= XleYR;
   XgeY <= XgeYR;
end architecture;

