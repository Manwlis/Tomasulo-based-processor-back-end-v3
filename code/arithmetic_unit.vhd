library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.std_logic_unsigned.all;

entity arithmetic_unit is
    Port ( Vin1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Vin2 : in  STD_LOGIC_VECTOR (31 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           Vout : out  STD_LOGIC_VECTOR (31 downto 0));
end arithmetic_unit;

architecture Behavioral of arithmetic_unit is

begin

Vout <= 
		Vin1 + Vin2 when op = "00" else
		Vin1 - Vin2 when op = "01" else
		Vin1(30 downto 0) & '0' when op = "10" else
		"00000000000000000000000000000000" ;

end Behavioral;

