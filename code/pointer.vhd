library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity pointer is
    Port ( j_flags : in  STD_LOGIC_VECTOR (7 downto 0);
           commit_sel_sig : in  STD_LOGIC_VECTOR (2 downto 0);
           forward_sel_j : out  STD_LOGIC_VECTOR (2 downto 0);
           forward_control_j : out  STD_LOGIC);
end pointer;

architecture Behavioral of pointer is

begin

-- process forward j
forward_j_process : process(j_flags, commit_sel_sig)
variable pointer : integer;
begin
	
	-- an den iparxei ston reorder buffer
	forward_sel_j <= "000"; 
	forward_control_j <= '0';
	
	pointer := to_integer(unsigned(commit_sel_sig));
	
	for I in 0 to 7 loop
		
		pointer := pointer + 1;
		if pointer = 8 then
			pointer := 0;
		end if;
		
		if j_flags(pointer) = '1' then
			forward_sel_j <= std_logic_vector(to_unsigned(pointer,3));
			forward_control_j <= '1';
			exit;
		end if;
		
	end loop;
end process;

end Behavioral;

