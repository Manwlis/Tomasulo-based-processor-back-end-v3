----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:53:23 02/11/2017 
-- Design Name: 
-- Module Name:    mux32Bit - Behavioral 
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

entity mux5Bit is
    Port ( sel : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (4 downto 0);
           B : in  STD_LOGIC_VECTOR (4 downto 0);
           Outt : out  STD_LOGIC_VECTOR (4 downto 0));
end mux5Bit;

architecture Behavioral of mux5Bit is

COMPONENT mux
port
(in0,in1,sel: in std_logic;
 output : out std_logic);
END COMPONENT;

begin

mux4:mux
port map(
   in0 => A(4),
	in1 => B(4),
	sel => sel,
	output => Outt(4));
	
mux3:mux
port map(
   in0 => A(3),
	in1 => B(3),
	sel => sel,
	output => Outt(3));
	
mux2:mux
port map(
   in0 => A(2),
	in1 => B(2),
	sel => sel,
	output => Outt(2));
	
mux1:mux
port map(
   in0 => A(1),
	in1 => B(1),
	sel => sel,
	output => Outt(1));
	
mux0:mux
port map(
   in0 => A(0),
	in1 => B(0),
	sel => sel,
	output => Outt(0));

end Behavioral;

