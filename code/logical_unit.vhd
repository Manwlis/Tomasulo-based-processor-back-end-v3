library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity logical_unit is
    Port ( Vin1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Vin2 : in  STD_LOGIC_VECTOR (31 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           Vout : out  STD_LOGIC_VECTOR (31 downto 0));
end logical_unit;

architecture Behavioral of logical_unit is

begin

	Vout <= 
		Vin1 and Vin2 when op = "01" else
		Vin1 or Vin2 when op = "00" else
		not Vin1 when op = "10" else
		"00000000000000000000000000000000" ;

end Behavioral;

