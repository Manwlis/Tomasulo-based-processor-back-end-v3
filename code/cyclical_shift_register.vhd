library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cyclical_shift_register is
	Port ( 
		Clk : in  STD_LOGIC;
		reset : in  STD_LOGIC;
		enable : in  STD_LOGIC;
		output : out  STD_LOGIC_VECTOR (7 downto 0)
	);
end cyclical_shift_register;


architecture Behavioral of cyclical_shift_register is

	signal value : STD_LOGIC_VECTOR (7 downto 0) := "00000001";

begin

	output <= value;

	csr : process(Clk)
	begin
		if rising_edge(Clk) then
			-- reset gia ta exception
			if reset = '1' then
				value <= "00000001";
			-- proxwraei
			elsif enable = '1' then
				value <= value(6 downto 0) & value(7);
			end if;
		end if;
	end process;

end Behavioral;

