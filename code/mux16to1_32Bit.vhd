library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux16to1_32Bit is
     port ( in0 : in  STD_LOGIC_VECTOR (31 downto 0);
           in1 : in  STD_LOGIC_VECTOR (31 downto 0);
           in2 : in  STD_LOGIC_VECTOR (31 downto 0);
           in3 : in  STD_LOGIC_VECTOR (31 downto 0);
           in4 : in  STD_LOGIC_VECTOR (31 downto 0);
           in5 : in  STD_LOGIC_VECTOR (31 downto 0);
           in6 : in  STD_LOGIC_VECTOR (31 downto 0);
           in7 : in  STD_LOGIC_VECTOR (31 downto 0);
			  in8 : in  STD_LOGIC_VECTOR (31 downto 0);
           in9 : in  STD_LOGIC_VECTOR (31 downto 0);
           in10 : in  STD_LOGIC_VECTOR (31 downto 0);
           in11 : in  STD_LOGIC_VECTOR (31 downto 0);
           in12 : in  STD_LOGIC_VECTOR (31 downto 0);
           in13 : in  STD_LOGIC_VECTOR (31 downto 0);
           in14 : in  STD_LOGIC_VECTOR (31 downto 0);
           in15 : in  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end mux16to1_32Bit;

architecture Behavioral of mux16to1_32Bit is

COMPONENT mux32Bit
port
(sel : in  STD_LOGIC;
 A : in  STD_LOGIC_VECTOR (31 downto 0);
 B : in  STD_LOGIC_VECTOR (31 downto 0);
 Outt : out  STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;


COMPONENT mux8to1_32Bit
PORT(
 in0 : IN  std_logic_vector(31 downto 0);
 in1 : IN  std_logic_vector(31 downto 0);
 in2 : IN  std_logic_vector(31 downto 0);
 in3 : IN  std_logic_vector(31 downto 0);
 in4 : IN  std_logic_vector(31 downto 0);
 in5 : IN  std_logic_vector(31 downto 0);
 in6 : IN  std_logic_vector(31 downto 0);
 in7 : IN  std_logic_vector(31 downto 0);
 sel : IN  std_logic_vector(2 downto 0);
 output : OUT  std_logic_vector(31 downto 0));
END COMPONENT;

signal mux0out,mux1out : std_logic_vector(31 downto 0);

begin

mux8to1_32Bit0 : mux8to1_32Bit
port map (
 in0 => in0,
 in1 => in1,
 in2 => in2,
 in3 => in3,
 in4 => in4,
 in5 => in5,
 in6 => in6,
 in7 => in7,
 sel => sel(2 downto 0),
 output => mux0out);


mux8to1_32Bit1 : mux8to1_32Bit
port map (
 in0 => in8,
 in1 => in9,
 in2 => in10,
 in3 => in11,
 in4 => in12,
 in5 => in13,
 in6 => in14,
 in7 => in15,
 sel => sel(2 downto 0),
 output => mux1out);


mux32Bit0 :mux32Bit
port map(
 A => mux0out,
 B => mux1out,
 sel => sel(3),
 Outt => output);


end Behavioral;

