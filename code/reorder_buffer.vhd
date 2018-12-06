library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reorder_buffer is
	Port ( 
		Clk : in  STD_LOGIC;
		-- cdb (gia write back)
		CDB_value : in  STD_LOGIC_VECTOR (31 downto 0);
		CDB_Q : in  STD_LOGIC_VECTOR (4 downto 0);
		CDB_valid : in  STD_LOGIC;
		-- issue
		instr_valid : in  STD_LOGIC; -- hr8e entolh
		available : out  STD_LOGIC; -- iparxei 8esh gia entolh
		Fu_type : in  STD_LOGIC_VECTOR (1 downto 0);
		Ri : in  STD_LOGIC_VECTOR (4 downto 0);
		Rj : in  STD_LOGIC_VECTOR (4 downto 0);
		Rk : in  STD_LOGIC_VECTOR (4 downto 0);
		-- diavasma kataxoritwn kai forward (kata to issue)
		Qj : out  STD_LOGIC_VECTOR (4 downto 0); -- apo pio line na perimenei ta dedomena an xreiazetai
		Qk : out  STD_LOGIC_VECTOR (4 downto 0); -- apo pio line na perimenei ta dedomena an xreiazetai
		forward_data_j : out  STD_LOGIC_VECTOR (31 downto 0); -- pros V unit
		forward_data_k : out  STD_LOGIC_VECTOR (31 downto 0); -- pros V unit
		forward_control_j : out STD_LOGIC; -- pros V unit
		forward_control_k : out STD_LOGIC; -- pros V unit
		-- commit (pros V unit)
		commit_reg : out  STD_LOGIC_VECTOR (31 downto 0); -- kataxwrhths gia commit
		commit_data : out  STD_LOGIC_VECTOR (31 downto 0); -- dedomena gia commit
		V_commit : out  STD_LOGIC -- commit flag
	);
end reorder_buffer;

architecture Behavioral of reorder_buffer is

begin


end Behavioral;

