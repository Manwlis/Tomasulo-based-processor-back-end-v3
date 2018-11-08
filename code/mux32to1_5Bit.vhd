library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux32to1_5Bit is
	Port ( in0 : in  STD_LOGIC_VECTOR (4 downto 0);
		in1 : in  STD_LOGIC_VECTOR (4 downto 0);
		in2 : in  STD_LOGIC_VECTOR (4 downto 0);
		in3 : in  STD_LOGIC_VECTOR (4 downto 0);
		in4 : in  STD_LOGIC_VECTOR (4 downto 0);
		in5 : in  STD_LOGIC_VECTOR (4 downto 0);
		in6 : in  STD_LOGIC_VECTOR (4 downto 0);
		in7 : in  STD_LOGIC_VECTOR (4 downto 0);
		in8 : in  STD_LOGIC_VECTOR (4 downto 0);
		in9 : in  STD_LOGIC_VECTOR (4 downto 0);
		in10 : in  STD_LOGIC_VECTOR (4 downto 0);
		in11 : in  STD_LOGIC_VECTOR (4 downto 0);
		in12 : in  STD_LOGIC_VECTOR (4 downto 0);
		in13 : in  STD_LOGIC_VECTOR (4 downto 0);
		in14 : in  STD_LOGIC_VECTOR (4 downto 0);
		in15 : in  STD_LOGIC_VECTOR (4 downto 0);
		in16 : in  STD_LOGIC_VECTOR (4 downto 0);
		in17 : in  STD_LOGIC_VECTOR (4 downto 0);
		in18 : in  STD_LOGIC_VECTOR (4 downto 0);
		in19 : in  STD_LOGIC_VECTOR (4 downto 0);
		in20 : in  STD_LOGIC_VECTOR (4 downto 0);
		in21 : in  STD_LOGIC_VECTOR (4 downto 0);
		in22 : in  STD_LOGIC_VECTOR (4 downto 0);
		in23 : in  STD_LOGIC_VECTOR (4 downto 0);
		in24 : in  STD_LOGIC_VECTOR (4 downto 0);
		in25 : in  STD_LOGIC_VECTOR (4 downto 0);
		in26 : in  STD_LOGIC_VECTOR (4 downto 0);
		in27 : in  STD_LOGIC_VECTOR (4 downto 0);
		in28 : in  STD_LOGIC_VECTOR (4 downto 0);
		in29 : in  STD_LOGIC_VECTOR (4 downto 0);
		in30 : in  STD_LOGIC_VECTOR (4 downto 0);
		in31 : in  STD_LOGIC_VECTOR (4 downto 0);
		sel : in  STD_LOGIC_VECTOR (4 downto 0);
		output : out  STD_LOGIC_VECTOR (4 downto 0));
end mux32to1_5Bit;

architecture Structural of mux32to1_5Bit is

COMPONENT mux5Bit
	port(
		sel : in  STD_LOGIC;
		A : in  STD_LOGIC_VECTOR (4 downto 0);
		B : in  STD_LOGIC_VECTOR (4 downto 0);
		Outt : out  STD_LOGIC_VECTOR (4 downto 0));
END COMPONENT;


COMPONENT mux16to1_5Bit
	PORT(
		in0 : IN  std_logic_vector(4 downto 0);
		in1 : IN  std_logic_vector(4 downto 0);
		in2 : IN  std_logic_vector(4 downto 0);
		in3 : IN  std_logic_vector(4 downto 0);
		in4 : IN  std_logic_vector(4 downto 0);
		in5 : IN  std_logic_vector(4 downto 0);
		in6 : IN  std_logic_vector(4 downto 0);
		in7 : IN  std_logic_vector(4 downto 0);
		in8 : IN  std_logic_vector(4 downto 0);
		in9 : IN  std_logic_vector(4 downto 0);
		in10 : IN  std_logic_vector(4 downto 0);
		in11 : IN  std_logic_vector(4 downto 0);
		in12 : IN  std_logic_vector(4 downto 0);
		in13 : IN  std_logic_vector(4 downto 0);
		in14 : IN  std_logic_vector(4 downto 0);
		in15 : IN  std_logic_vector(4 downto 0);
		sel : IN  std_logic_vector(3 downto 0);
		output : OUT  std_logic_vector(4 downto 0));
END COMPONENT;

signal mux0out,mux1out : std_logic_vector(4 downto 0);

begin

mux16to1_5Bit0 : mux16to1_5Bit
port map (
	in0 => in0,
	in1 => in1,
	in2 => in2,
	in3 => in3,
	in4 => in4,
	in5 => in5,
	in6 => in6,
	in7 => in7,
	in8 => in8,
	in9 => in9,
	in10 => in10,
	in11 => in11,
	in12 => in12,
	in13 => in13,
	in14 => in14,
	in15 => in15,
	sel => sel(3 downto 0),
	output => mux0out);

mux16to1_5Bit1 : mux16to1_5Bit
port map (
	in0 => in16,
	in1 => in17,
	in2 => in18,
	in3 => in19,
	in4 => in20,
	in5 => in21,
	in6 => in22,
	in7 => in23,
	in8 => in24,
	in9 => in25,
	in10 => in26,
	in11 => in27,
	in12 => in28,
	in13 => in29,
	in14 => in30,
	in15 => in31,
	sel => sel(3 downto 0),
	output => mux1out);

mux5Bit0 :mux5Bit
port map (
	A => mux0out,
	B => mux1out,
	sel => sel(4),
	Outt => output);
 
end Structural;

