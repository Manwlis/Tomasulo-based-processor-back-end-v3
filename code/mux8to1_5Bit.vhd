library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8to1_5Bit is
	Port (
		in0 : in  STD_LOGIC_VECTOR (4 downto 0);
		in1 : in  STD_LOGIC_VECTOR (4 downto 0);
		in2 : in  STD_LOGIC_VECTOR (4 downto 0);
		in3 : in  STD_LOGIC_VECTOR (4 downto 0);
		in4 : in  STD_LOGIC_VECTOR (4 downto 0);
		in5 : in  STD_LOGIC_VECTOR (4 downto 0);
		in6 : in  STD_LOGIC_VECTOR (4 downto 0);
		in7 : in  STD_LOGIC_VECTOR (4 downto 0);
		sel : in  STD_LOGIC_VECTOR (2 downto 0);
		output : out  STD_LOGIC_VECTOR (4 downto 0));
end mux8to1_5Bit;

architecture Behavioral of mux8to1_5Bit is

COMPONENT mux4to1_5Bit
PORT(
 A : IN  std_logic_vector(4 downto 0);
 B : IN  std_logic_vector(4 downto 0);
 C : IN  std_logic_vector(4 downto 0);
 D : IN  std_logic_vector(4 downto 0);
 sel : IN  std_logic_vector(1 downto 0);
 output : OUT  std_logic_vector(4 downto 0));
END COMPONENT;
	 
COMPONENT mux5Bit
port
(sel : in  STD_LOGIC;
 A : in  STD_LOGIC_VECTOR (4 downto 0);
 B : in  STD_LOGIC_VECTOR (4 downto 0);
 Outt : out  STD_LOGIC_VECTOR (4 downto 0));
END COMPONENT;

signal mux0out,mux1out : std_logic_vector(4 downto 0);

begin

mux4to1_5Bit0 : mux4to1_5Bit
port map(
 A => in0,
 B => in1,
 C => in2,
 D => in3,
 sel => sel(1 downto 0),
 output => mux0out);
 
 
mux4to1_5Bit1 : mux4to1_5Bit
port map(
 A => in4,
 B => in5,
 C => in6,
 D => in7,
 sel => sel(1 downto 0),
 output => mux1out);
 
mux5Bit0 :mux5Bit
port map(
 A => mux0out,
 B => mux1out,
 sel => sel(2),
 Outt => output);

end Behavioral;