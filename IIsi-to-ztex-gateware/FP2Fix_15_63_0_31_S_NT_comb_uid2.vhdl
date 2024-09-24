--------------------------------------------------------------------------------
--            FP2Fix_15_63_0_31_S_NT_F100_uid2Exponent_difference
--                          (IntAdder_15_f100_uid4)
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

entity FP2Fix_15_63_0_31_S_NT_F100_uid2Exponent_difference is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(14 downto 0);
          Y : in  std_logic_vector(14 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(14 downto 0)   );
end entity;

architecture arch of FP2Fix_15_63_0_31_S_NT_F100_uid2Exponent_difference is
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
--                    LeftShifter_64_by_max_34_F100_uid12
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2011)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity LeftShifter_64_by_max_34_F100_uid12 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(63 downto 0);
          S : in  std_logic_vector(5 downto 0);
          R : out  std_logic_vector(97 downto 0)   );
end entity;

architecture arch of LeftShifter_64_by_max_34_F100_uid12 is
signal level0 :  std_logic_vector(63 downto 0);
signal ps :  std_logic_vector(5 downto 0);
signal level1 :  std_logic_vector(64 downto 0);
signal level2 :  std_logic_vector(66 downto 0);
signal level3 :  std_logic_vector(70 downto 0);
signal level4 :  std_logic_vector(78 downto 0);
signal level5 :  std_logic_vector(94 downto 0);
signal level6 :  std_logic_vector(126 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   level0<= X;
   ps<= S;
   level1<= level0 & (0 downto 0 => '0') when ps(0)= '1' else     (0 downto 0 => '0') & level0;
   level2<= level1 & (1 downto 0 => '0') when ps(1)= '1' else     (1 downto 0 => '0') & level1;
   level3<= level2 & (3 downto 0 => '0') when ps(2)= '1' else     (3 downto 0 => '0') & level2;
   level4<= level3 & (7 downto 0 => '0') when ps(3)= '1' else     (7 downto 0 => '0') & level3;
   level5<= level4 & (15 downto 0 => '0') when ps(4)= '1' else     (15 downto 0 => '0') & level4;
   level6<= level5 & (31 downto 0 => '0') when ps(5)= '1' else     (31 downto 0 => '0') & level5;
   R <= level6(97 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                  FP2Fix_15_63_0_31_S_NT_F100_uid2MantSum
--                          (IntAdder_33_f100_uid16)
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

entity FP2Fix_15_63_0_31_S_NT_F100_uid2MantSum is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(32 downto 0);
          Y : in  std_logic_vector(32 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(32 downto 0)   );
end entity;

architecture arch of FP2Fix_15_63_0_31_S_NT_F100_uid2MantSum is
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
--                      FP2Fix_15_63_0_31_S_NT_F100_uid2
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Fabrizio Ferrandi (2012)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity FP2Fix_15_63_0_31_S_NT_F100_uid2 is
   port ( clk, rst : in std_logic;
          I : in  std_logic_vector(15+63+2 downto 0);
          O : out  std_logic_vector(31 downto 0)   );
end entity;

architecture arch of FP2Fix_15_63_0_31_S_NT_F100_uid2 is
   component FP2Fix_15_63_0_31_S_NT_F100_uid2Exponent_difference is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(14 downto 0);
             Y : in  std_logic_vector(14 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(14 downto 0)   );
   end component;

   component LeftShifter_64_by_max_34_F100_uid12 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(63 downto 0);
             S : in  std_logic_vector(5 downto 0);
             R : out  std_logic_vector(97 downto 0)   );
   end component;

   component FP2Fix_15_63_0_31_S_NT_F100_uid2MantSum is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(32 downto 0);
             Y : in  std_logic_vector(32 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(32 downto 0)   );
   end component;

signal eA0 :  std_logic_vector(14 downto 0);
signal fA0 :  std_logic_vector(63 downto 0);
signal bias :  std_logic_vector(14 downto 0);
signal eA1 :  std_logic_vector(14 downto 0);
signal shiftedby :  std_logic_vector(5 downto 0);
signal fA1 :  std_logic_vector(97 downto 0);
signal fA2a :  std_logic_vector(32 downto 0);
signal notallzero :  std_logic;
signal round :  std_logic;
signal fA2b :  std_logic_vector(32 downto 0);
signal fA3 :  std_logic_vector(32 downto 0);
signal fA3b :  std_logic_vector(32 downto 0);
signal fA4 :  std_logic_vector(31 downto 0);
signal overFl0 :  std_logic;
signal overFl1 :  std_logic;
signal eTest :  std_logic;
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   eA0 <= I(77 downto 63);
   fA0 <= "1" & I(62 downto 0);
   bias <= not conv_std_logic_vector(16382, 15);
   Exponent_difference: FP2Fix_15_63_0_31_S_NT_F100_uid2Exponent_difference  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => '1',
                 R => eA1,
                 X => bias,
                 Y => eA0);
   ---------------- cycle 0----------------
   shiftedby <= eA1(5 downto 0) when eA1(14) = '0' else (5 downto 0 => '0');
   FXP_shifter: LeftShifter_64_by_max_34_F100_uid12  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => fA1,
                 S => shiftedby,
                 X => fA0);
   fA2a<= '0' & fA1(95 downto 64);
   notallzero <= '0' when fA1(62 downto 0) = (62 downto 0 => '0') else '1';
   round <= (fA1(63) and I(78)) or (fA1(63) and notallzero and not I(78));
   fA2b<= '0' & (31 downto 1 => '0') & round;
   MantSum: FP2Fix_15_63_0_31_S_NT_F100_uid2MantSum  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => '0',
                 R => fA3,
                 X => fA2a,
                 Y => fA2b);
   ---------------- cycle 0----------------
   fA3b<= -signed(fA3);
   fA4<= fA3(31 downto 0) when I(78) = '0' else fA3b(31 downto 0);
   overFl0<= '1' when I(77 downto 63) > conv_std_logic_vector(16414,15) else I(80);
   overFl1 <= fA3(32);
   eTest <= (overFl0 or overFl1);
   O <= fA4 when eTest = '0' else
      I(78) & (30 downto 0 => not I(78));
end architecture;

