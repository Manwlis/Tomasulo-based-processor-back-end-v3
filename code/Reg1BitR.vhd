----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:13:31 02/11/2017 
-- Design Name: 
-- Module Name:    Reg1Bit - Behavioral 
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

entity Reg1BitR is
    Port ( Clk : in  STD_LOGIC;
           WrEn : in  STD_LOGIC;
           Din : in  STD_LOGIC;
			  Reset : in STD_LOGIC;
           Dout : out  STD_LOGIC:= '0');
end Reg1BitR;

architecture Behavioral of Reg1BitR is

COMPONENT flipflop
port
(CLK,RST,d: in std_logic;
 q : out std_logic);
END COMPONENT;

COMPONENT mux
port
(in0,in1,sel: in std_logic;
 output : out std_logic);
END COMPONENT;

signal muxOut,flipflopOut  : std_logic := '0';

begin

mux0:mux
port map(
   in0 => flipflopOut,
	in1 => Din,
	sel => WrEn,
	output => muxOut);
	
flipflop0: flipflop
port map (
   CLK =>Clk,
	RST => Reset,
	d=>muxOut,
	q=>flipflopOut);
	
Dout <= flipflopOut;
end Behavioral;

