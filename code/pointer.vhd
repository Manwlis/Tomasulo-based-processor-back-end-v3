library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity pointer is
    Port ( j_flags : in  STD_LOGIC_VECTOR (7 downto 0);
           head_encoded : in  STD_LOGIC_VECTOR (2 downto 0);
           forward_sel_j : out  STD_LOGIC_VECTOR (2 downto 0);
           forward_control_j : out  STD_LOGIC);
end pointer;

architecture Behavioral of pointer is

begin


-- process forward j
forward_j_process : process(j_flags, head_encoded)
variable pointer : integer range 0 to 7 := 0;
begin
	
	-- an den iparxei ston reorder buffer
	forward_sel_j <= "000"; 
	forward_control_j <= '0';
	
	pointer := to_integer(unsigned(head_encoded));
	
	for I in 0 to 7 loop
		
		-- Na paei sthn epomenh 8esh. An bghke ektos wriwn na paei sthn allh meria tou vector.
		if pointer = 7 then
			pointer := 0;
		else
			pointer := pointer + 1;
		end if;
		
		-- Brhke mia grammh pou exei katallhla dedomena.
		if j_flags(pointer) = '1' then
		
			-- Dialegei ta dedomena ths gia diavasma.
			forward_sel_j <= std_logic_vector(to_unsigned(pointer,3));
			forward_control_j <= '1';
			
			-- Mas endiaferei mono h prwth pou 8a brei, giati koitame apo thn pio prosfath entolh pros thn pio palia.
			exit;
			
		end if;
	end loop;
	
end process;

end Behavioral;

