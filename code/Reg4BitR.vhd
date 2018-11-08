----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:21:34 02/11/2017 
-- Design Name: 
-- Module Name:    Reg4BitR - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Reg4BitR is
    Port ( Clk : in  STD_LOGIC;
           WrEn : in  STD_LOGIC;
			  Reset : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (3 downto 0);
           Dout : out  STD_LOGIC_VECTOR (3 downto 0));
end Reg4BitR;

architecture Behavioral of Reg4BitR is

COMPONENT Reg1BitR
port
(Clk,WrEn,Din,Reset : in std_logic;
 Dout : out std_logic);
END COMPONENT;

begin

Reg1BitR3:Reg1BitR
port map(
  Clk => Clk,
  WrEn => WrEn,
	Reset => Reset,
  Din => Din(3),
  Dout => Dout(3));
  
Reg1BitR2:Reg1BitR
port map(
  Clk => Clk,
  WrEn => WrEn,
	Reset => Reset,
  Din => Din(2),
  Dout => Dout(2));
  
Reg1BitR1:Reg1BitR
port map(
  Clk => Clk,
  WrEn => WrEn,
  Din => Din(1),
	Reset => Reset,
  Dout => Dout(1));
  
Reg1BitR0:Reg1BitR
port map(
  Clk => Clk,
  WrEn => WrEn,
	Reset => Reset,
  Din => Din(0),
  Dout => Dout(0));

end Behavioral;

