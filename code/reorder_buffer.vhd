library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reorder_buffer is
	Port ( 
		-- cdb (write back)
		CDB_value : in  STD_LOGIC_VECTOR (31 downto 0);
		CDB_Q : in  STD_LOGIC_VECTOR (4 downto 0);
		CDB_valid : in  STD_LOGIC;
		-- issue
		Instr_valid : in  STD_LOGIC;
		F_type : in  STD_LOGIC_VECTOR (1 downto 0);
		Ri : in  STD_LOGIC_VECTOR (4 downto 0);
		Rj : in  STD_LOGIC_VECTOR (4 downto 0);
		Rk : in  STD_LOGIC_VECTOR (4 downto 0);
		-- diavasma kataxoritwn (kata to issue)
		Qj : out  STD_LOGIC_VECTOR (4 downto 0);
		Qk : out  STD_LOGIC_VECTOR (4 downto 0);
		Vj_forward : out  STD_LOGIC_VECTOR (4 downto 0);
		Vk_forward : out  STD_LOGIC_VECTOR (4 downto 0);
		-- commit
		Vreg_enables : out  STD_LOGIC_VECTOR (31 downto 0);
		Vreg_in : out  STD_LOGIC_VECTOR (31 downto 0));
end reorder_buffer;

architecture Behavioral of reorder_buffer is

begin


end Behavioral;

