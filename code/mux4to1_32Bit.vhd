library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4to1_32Bit is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
			  C : in  STD_LOGIC_VECTOR (31 downto 0);
			  D : in  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           output : out STD_LOGIC_VECTOR (31 downto 0));
end mux4to1_32Bit;

architecture Behavioral of mux4to1_32Bit is

COMPONENT mux32Bit
port
(sel : in  STD_LOGIC;
 A : in  STD_LOGIC_VECTOR (31 downto 0);
 B : in  STD_LOGIC_VECTOR (31 downto 0);
 Outt : out  STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

Signal mux0out,mux1out : std_logic_vector(31 downto 0);

begin

mux32Bit0:mux32Bit
port map (
 A => A,
 B =>B,
 sel => sel(0),
 Outt => mux0out);

mux32Bit1:mux32Bit
port map (
 A => C,
 B => D,
 sel => sel(0),
 Outt => mux1out);

mux32Bit2:mux32Bit
port map (
 A => mux0out,
 B =>mux1out,
 sel => sel(1),
 Outt => output);

end Behavioral;

