----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:46:11 10/23/2018 
-- Design Name: 
-- Module Name:    mux4to1_5bit - Behavioral 
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

entity mux4to1_5bit is
    Port ( sel : in  STD_LOGIC_VECTOR (1 downto 0);
           A : in  STD_LOGIC_VECTOR (4 downto 0);
           B : in  STD_LOGIC_VECTOR (4 downto 0);
           C : in  STD_LOGIC_VECTOR (4 downto 0);
           D : in  STD_LOGIC_VECTOR (4 downto 0);
           output : out  STD_LOGIC_VECTOR (4 downto 0));
end mux4to1_5bit;

architecture Behavioral of mux4to1_5bit is

COMPONENT mux5Bit
port
(sel : in  STD_LOGIC;
 A : in  STD_LOGIC_VECTOR (4 downto 0);
 B : in  STD_LOGIC_VECTOR (4 downto 0);
 Outt : out  STD_LOGIC_VECTOR (4 downto 0));
END COMPONENT;

Signal mux0out,mux1out : std_logic_vector(4 downto 0);

begin

mux5Bit0:mux5Bit
port map (
 A => A,
 B => B,
 sel => sel(0),
 Outt => mux0out);

mux5Bit1:mux5Bit
port map (
 A => C,
 B => D,
 sel => sel(0),
 Outt => mux1out);

mux5Bit2:mux5Bit
port map (
 A => mux0out,
 B => mux1out,
 sel => sel(1),
 Outt => output);
end Behavioral;

