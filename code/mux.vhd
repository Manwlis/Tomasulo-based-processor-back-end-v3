library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux is
    Port ( in0 : in  STD_LOGIC;
           in1 : in  STD_LOGIC;
			  sel : in  STD_LOGIC;
           output : out  STD_LOGIC);
end mux;

architecture Behavioral of mux is

begin
--to in1 pernaei me sel 1
output <= (in1 AND sel) OR (in0 AND (NOT sel));

end Behavioral;
