----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:18:38 05/04/2017 
-- Design Name: 
-- Module Name:    mux2to1_2bit - Behavioral 
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

entity mux2to1_2bit is
    Port ( A : in  STD_LOGIC_VECTOR (1 downto 0);
           B : in  STD_LOGIC_VECTOR (1 downto 0);
           sel : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (1 downto 0));
end mux2to1_2bit;

architecture Behavioral of mux2to1_2bit is


COMPONENT mux
port
(in0,in1,sel: in std_logic;
 output : out std_logic);
END COMPONENT;

begin

mux1:mux
port map(
   in0 => A(1),
	in1 => B(1),
	sel => sel,
	output => output(1));
	
mux0:mux
port map(
   in0 => A(0),
	in1 => B(0),
	sel => sel,
	output => output(0));

end Behavioral;

