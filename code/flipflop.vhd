library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity flipflop is
    Port ( CLK : in  STD_LOGIC;
           d : in  STD_LOGIC;
           q : out  STD_LOGIC := '0';
           RST : in  STD_LOGIC);
end flipflop;

architecture Behavioral of flipflop is

begin  

PROCESS(RST,CLK)
    BEGIN 
	   IF (RST='1') THEN q <= '0';
		elsif (rising_edge(CLK)) THEN q <= d;
		END IF;
END PROCESS;

end Behavioral;

