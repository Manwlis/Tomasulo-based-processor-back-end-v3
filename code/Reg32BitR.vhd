library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg32BitR is
    Port ( Clk : in  STD_LOGIC;
           WrEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end Reg32BitR;

architecture Structural of Reg32BitR is

COMPONENT Reg4BitR
port
(Clk,WrEn,Reset : in std_logic;
 Din : in  STD_LOGIC_VECTOR (3 downto 0);
 Dout : out std_logic_VECTOR (3 downto 0)); 
END COMPONENT;

begin

Reg4BitR7:Reg4BitR
port map(
  Clk => Clk,
  WrEn => WrEn,
	Reset => Reset,
  Din => Din(31 downto 28),
  Dout => Dout(31 downto 28));
  
Reg4BitR6:Reg4BitR
port map(
  Clk => Clk,
  WrEn => WrEn,
	Reset => Reset,
  Din => Din(27 downto 24),
  Dout => Dout(27 downto 24));
  
Reg4BitR5:Reg4BitR
port map(
  Clk => Clk,
  WrEn => WrEn,
	Reset => Reset,
  Din => Din(23 downto 20),
  Dout => Dout(23 downto 20));
  
Reg4BitR4:Reg4BitR
port map(
  Clk => Clk,
  WrEn => WrEn,
	Reset => Reset,
  Din => Din(19 downto 16),
  Dout => Dout(19 downto 16));
  
Reg4BitR3:Reg4BitR
port map(
  Clk => Clk,
  WrEn => WrEn,
	Reset => Reset,
  Din => Din(15 downto 12),
  Dout => Dout(15 downto 12));
  
Reg4BitR2:Reg4BitR
port map(
  Clk => Clk,
  WrEn => WrEn,
	Reset => Reset,
  Din => Din(11 downto 8),
  Dout => Dout(11 downto 8));
  
Reg4BitR1:Reg4BitR
port map(
  Clk => Clk,
  WrEn => WrEn,
	Reset => Reset,
  Din => Din(7 downto 4),
  Dout => Dout(7 downto 4));
  
Reg4BitR0:Reg4BitR
port map(
  Clk => Clk,
	Reset => Reset,
  WrEn => WrEn,
  Din => Din(3 downto 0),
  Dout => Dout(3 downto 0));
  
end Structural;