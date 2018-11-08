library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FU_logical_control is
    Port ( grant : in  STD_LOGIC;
           request : out  STD_LOGIC;
           stage1_enable : out  STD_LOGIC;
           ready : out  STD_LOGIC;
           tag : in  STD_LOGIC_VECTOR (4 downto 0));
end FU_logical_control;

architecture Behavioral of FU_logical_control is

begin

	process (tag, grant)
	begin
		if not(tag = "00000") then
			request <= '1';
			if grant = '1' then
				stage1_enable <= '1';
				ready <= '1';
			elsif grant = '0' then
				stage1_enable <= '0';
				ready <= '0';
			end if;
		else
			stage1_enable <= '1';
			ready <= '1';
			request <= '0';
		end if;
	end process;

end Behavioral;

