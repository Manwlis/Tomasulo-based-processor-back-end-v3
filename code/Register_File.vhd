library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- to rf apoteleite apo duo modules.
-- Ena gia tous V regs kai thn logikh tous kai ena gia tous Q blocks kai thn logikh tous.

entity Register_File is
	Port(
		Clk : in  STD_LOGIC;
		Instr_valid : in  STD_LOGIC;
		available : out  STD_LOGIC;
		Fu_type : in  STD_LOGIC_VECTOR (1 downto 0);
		PC_entolhs : in  STD_LOGIC_VECTOR (31 downto 0);
		Ri : in  STD_LOGIC_VECTOR (4 downto 0);
		Rj : in  STD_LOGIC_VECTOR (4 downto 0);
		Rk : in  STD_LOGIC_VECTOR (4 downto 0);
		CDB : in  STD_LOGIC_VECTOR (37 downto 0);
		Vj : out  STD_LOGIC_VECTOR (31 downto 0);
		Vk : out  STD_LOGIC_VECTOR (31 downto 0);
		Qj : out  STD_LOGIC_VECTOR (4 downto 0);
		Qk : out  STD_LOGIC_VECTOR (4 downto 0);
		tag : out  STD_LOGIC_VECTOR (4 downto 0);
		PC_exception : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end Register_File;

architecture Behavioral of Register_File is

COMPONENT V_block
	port( 
		commit : in  STD_LOGIC;
		commit_reg : in  STD_LOGIC_VECTOR (4 downto 0);
		commit_data : in  STD_LOGIC_VECTOR (31 downto 0);
		Rj : in  STD_LOGIC_VECTOR (4 downto 0);
		Rk : in  STD_LOGIC_VECTOR (4 downto 0);
		forward_data_j : in  STD_LOGIC_VECTOR (31 downto 0);
		forward_data_k : in  STD_LOGIC_VECTOR (31 downto 0);
		forward_control_j : in  STD_LOGIC;
		forward_control_k : in  STD_LOGIC;
		Vj : out  STD_LOGIC_VECTOR (31 downto 0);
		Vk : out  STD_LOGIC_VECTOR (31 downto 0);
		Clk : in  STD_LOGIC
	);
END COMPONENT;

COMPONENT reorder_buffer
	Port ( 
		Clk : in  STD_LOGIC;
		-- cdb (gia write back)
		cdb_value : in  STD_LOGIC_VECTOR (31 downto 0);
		cdb_Q : in  STD_LOGIC_VECTOR (4 downto 0);
		cdb_valid : in  STD_LOGIC;
		-- issue
		available : out  STD_LOGIC; -- Flag gia dia8esimo xwro.
		instr_valid : in  STD_LOGIC; -- Hr8e entolh.
		Fu_type : in  STD_LOGIC_VECTOR (1 downto 0); -- Tupos entolhs.
		Ri : in  STD_LOGIC_VECTOR (4 downto 0); -- Kataxwrhths proorismou.
		tag_issue : out STD_LOGIC_VECTOR (4 downto 0); -- pou apo8ikeuthke h entolh.
		-- diavasma kataxoritwn kai forward (kata to issue)
		Rj : in  STD_LOGIC_VECTOR (4 downto 0); -- Kataxwrhths phghs 1.
		Rk : in  STD_LOGIC_VECTOR (4 downto 0); -- Kataxwrhths phghs 1.
		Qj : out  STD_LOGIC_VECTOR (4 downto 0); -- Pio line na perimenei ta dedomena j.
		Qk : out  STD_LOGIC_VECTOR (4 downto 0); -- Pio line na perimenei ta dedomena k.
		forward_data_j : out  STD_LOGIC_VECTOR (31 downto 0); -- Dedomena gia Rj.
		forward_data_k : out  STD_LOGIC_VECTOR (31 downto 0); -- Dedomena gia Rk.
		forward_control_j : out STD_LOGIC; -- Pros V unit. Idopoiei oti stelnontai swsta dedomena gia to diavasma tou Rj.
		forward_control_k : out STD_LOGIC; -- Pros V unit. Idopoiei oti stelnontai swsta dedomena gia to diavasma tou Rk.
		-- commit (pros V unit)
		commit_reg : out  STD_LOGIC_VECTOR (4 downto 0); -- Kataxwrhths gia commit.
		commit_data : out  STD_LOGIC_VECTOR (31 downto 0); -- Dedomena gia commit.
		V_commit : out  STD_LOGIC; -- Pros V unit. Elenxei to enable tou kataxwrhth proorismou.
		-- exception
		PC_entolhs : in  STD_LOGIC_VECTOR (31 downto 0); -- Program counter ths entolhs pou ginetai issue.
		PC_exception : out STD_LOGIC_VECTOR (31 downto 0) -- Program counter ths entolhs pou kanei exception.
	);
end COMPONENT;

signal commit, forward_control_j, forward_control_k : STD_LOGIC;
signal commit_reg : STD_LOGIC_VECTOR (4 downto 0);
signal commit_data, forward_data_j, forward_data_k : STD_LOGIC_VECTOR (31 downto 0);
begin

V_unit : V_block
port map(
	commit => commit,
	commit_reg => commit_reg,
	commit_data => commit_data,
	Rj => Rj,
	Rk => Rk,
	forward_data_j => forward_data_j,
	forward_data_k => forward_data_k,
	forward_control_j => forward_control_j,
	forward_control_k => forward_control_k,
	Vj => Vj,
	Vk => Vk,
	Clk => Clk
);
		
Rob : reorder_buffer
port map(
	Clk => Clk,
	cdb_value => CDB(31 downto 0),
	cdb_Q => CDB(36 downto 32),
	cdb_valid => CDB(37),
	available => available,
	instr_valid => Instr_valid,
	Fu_type => Fu_type,
	Ri => Ri,
	tag_issue => tag,
	Rj => Rj,
	Rk => Rk,
	Qj => Qj,
	Qk => Qk,
	forward_data_j => forward_data_j,
	forward_data_k => forward_data_k,
	forward_control_j => forward_control_j,
	forward_control_k => forward_control_k,
	commit_reg => commit_reg,
	commit_data => commit_data,
	V_commit => commit,
	PC_entolhs => PC_entolhs,
	PC_exception => PC_exception
);
end Behavioral;

