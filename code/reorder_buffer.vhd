library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity reorder_buffer is
	Port ( 
		Clk : in  STD_LOGIC;
		-- cdb (gia write back)
		cdb_value : in  STD_LOGIC_VECTOR (31 downto 0);
		cdb_Q : in  STD_LOGIC_VECTOR (4 downto 0);
		cdb_valid : in  STD_LOGIC;
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
		commit_reg : out  STD_LOGIC_VECTOR (4 downto 0); -- kataxwrhths gia commit
		commit_data : out  STD_LOGIC_VECTOR (31 downto 0); -- dedomena gia commit
		V_commit : out  STD_LOGIC; -- commit flag
		-- exception
		PC_entolhs : in  STD_LOGIC_VECTOR (31 downto 0);
		PC_exception : out STD_LOGIC_VECTOR (31 downto 0);
		exception_valid : out STD_LOGIC
	);
end reorder_buffer;

architecture Behavioral of reorder_buffer is

component buffer_line
	Port ( 
		Clk : in  STD_LOGIC;
		cdb_valid : in  STD_LOGIC;
		cdb_Q : in  STD_LOGIC_VECTOR (4 downto 0);
		cdb_V : in  STD_LOGIC_VECTOR (31 downto 0);
		Ri_in : in  STD_LOGIC_VECTOR (4 downto 0);
		Fu_type_in : in  STD_LOGIC_VECTOR (1 downto 0);
		Exception_in : in  STD_LOGIC;
		Exception_out : out  STD_LOGIC;
		Fu_type_out : out  STD_LOGIC_VECTOR (1 downto 0);
		valid_out : out  STD_LOGIC;
		done_out : out  STD_LOGIC;
		delete : in  STD_LOGIC;
		issue : in  STD_LOGIC;
		tag : in  STD_LOGIC_VECTOR (4 downto 0);
		Rj : in  STD_LOGIC_VECTOR (4 downto 0);
		Rk : in  STD_LOGIC_VECTOR (4 downto 0);
		j_equal : out  STD_LOGIC;
		k_equal : out  STD_LOGIC;
		Ri_out : out  STD_LOGIC_VECTOR (4 downto 0);
		V_out : out  STD_LOGIC_VECTOR (31 downto 0);
		PC_entolhs : in  STD_LOGIC_VECTOR (31 downto 0);
		PC_out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component rob_control
	Port ( 
		Clk : in  STD_LOGIC;
		valid : in  STD_LOGIC_VECTOR (7 downto 0);
		done : in  STD_LOGIC_VECTOR (7 downto 0);
		fop : in  STD_LOGIC_VECTOR (15 downto 0);
		available : out  STD_LOGIC;
		instr_valid : in  STD_LOGIC;
		issue : out  STD_LOGIC_VECTOR (7 downto 0);
		Rj : in  STD_LOGIC_VECTOR (4 downto 0);
		Rk : in  STD_LOGIC_VECTOR (4 downto 0);
		j_flags : in  STD_LOGIC_VECTOR (7 downto 0);
		k_flags : in  STD_LOGIC_VECTOR (7 downto 0);
		forward_control_j : out  STD_LOGIC;
		forward_control_k : out  STD_LOGIC;
		forward_sel_j : out  STD_LOGIC_VECTOR (2 downto 0);
		forward_sel_k : out  STD_LOGIC_VECTOR (2 downto 0);
		delete : out  STD_LOGIC_VECTOR (7 downto 0);
		V_commit : out  STD_LOGIC;
		commit_sel : out  STD_LOGIC_VECTOR (2 downto 0);
		exception_status : in  STD_LOGIC_VECTOR (7 downto 0);
		exception_control : out  STD_LOGIC_VECTOR (7 downto 0);
		exception_sel : out  STD_LOGIC_VECTOR (2 downto 0);
		exception_valid : out  STD_LOGIC
	);
end component;

-- shmata apo lines se control
signal valid, done, j_flags, k_flags , exception_status : STD_LOGIC_VECTOR (7 downto 0);
signal Fu_type_out : STD_LOGIC_VECTOR (15 downto 0);
-- shmata apo control se lines
signal delete, issue, exception_control : STD_LOGIC_VECTOR (7 downto 0);


type array8_5 is array (0 to 7) of std_logic_vector(4 downto 0);
signal Ri_out, tag : array8_5;

type array8_32 is array (0 to 7) of std_logic_vector(31 downto 0);
signal V_out, PC_out : array8_32;

signal commit_sel, forward_sel_j, forward_sel_k, exception_sel : std_logic_vector(2 downto 0);

begin

gen : for i in 0 to 7 generate

	tag(i) <= std_logic_vector(to_unsigned(i, 5));
	
	buffer_line : buffer_line
	port map(
		Clk => Clk,
		cdb_valid => cdb_valid,
		cdb_Q => cdb_Q,
		cdb_V => cdb_value,
		Ri_in => Ri,
		Fu_type_in => Fu_type,
		Exception_in => exception_control(i),
		Exception_out => exception_status(i),
		Fu_type_out => Fu_type_out((2*i+1) downto (2*i)),
		valid_out => valid(i),
		done_out => done(i),
		delete => delete(i),
		issue => issue(i),
		tag => tag(i),
		Rj => Rj,
		Rk => Rk,
		j_equal => j_flags(i),
		k_equal => k_flags(i),
		Ri_out => Ri_out(i),
		V_out => V_out(i),
		PC_entolhs => PC_entolhs,
		PC_out => PC_out(i)
	);

end generate gen;

rob_control0 : rob_control
port map(
	Clk => Clk,
	valid => valid,
	done => done,
	fop => Fu_type_out,
	available => available,
	instr_valid => instr_valid,
	issue => issue,
	Rj => Rj,
	Rk => Rk,
	j_flags => j_flags,
	k_flags => k_flags,
	forward_control_j => forward_control_j,
	forward_control_k => forward_control_k,
	forward_sel_j => forward_sel_j,
	forward_sel_k => forward_sel_k,
	delete => delete,
	V_commit => V_commit,
	commit_sel => commit_sel,
	exception_status => exception_status,
	exception_control => exception_control,
	exception_sel => exception_sel,
	exception_valid => exception_valid
);

-- commit muxes
commit_reg <= 
	Ri_out(0) when commit_sel = "000" else
	Ri_out(1) when commit_sel = "001" else
	Ri_out(2) when commit_sel = "010" else
	Ri_out(3) when commit_sel = "011" else
	Ri_out(4) when commit_sel = "100" else
	Ri_out(5) when commit_sel = "101" else
	Ri_out(6) when commit_sel = "110" else
	Ri_out(7) when commit_sel = "111";
	
commit_data <= 
	V_out(0) when commit_sel = "000" else
	V_out(1) when commit_sel = "001" else
	V_out(2) when commit_sel = "010" else
	V_out(3) when commit_sel = "011" else
	V_out(4) when commit_sel = "100" else
	V_out(5) when commit_sel = "101" else
	V_out(6) when commit_sel = "110" else
	V_out(7) when commit_sel = "111";

-- j forward muxes
forward_data_j <=
	V_out(0) when forward_sel_j = "000" else
	V_out(1) when forward_sel_j = "001" else
	V_out(2) when forward_sel_j = "010" else
	V_out(3) when forward_sel_j = "011" else
	V_out(4) when forward_sel_j = "100" else
	V_out(5) when forward_sel_j = "101" else
	V_out(6) when forward_sel_j = "110" else
	V_out(7) when forward_sel_j = "111";

Qj <=
	tag(0) when forward_sel_j = "000" and done(0) = '0' else
	tag(1) when forward_sel_j = "001" and done(1) = '0' else
	tag(2) when forward_sel_j = "010" and done(2) = '0' else
	tag(3) when forward_sel_j = "011" and done(3) = '0' else
	tag(4) when forward_sel_j = "100" and done(4) = '0' else
	tag(5) when forward_sel_j = "101" and done(5) = '0' else
	tag(6) when forward_sel_j = "110" and done(6) = '0' else
	tag(7) when forward_sel_j = "111" and done(7) = '0' else
	"00000";

-- k forward muxes
forward_data_k <=
	V_out(0) when forward_sel_k = "000" else
	V_out(1) when forward_sel_k = "001" else
	V_out(2) when forward_sel_k = "010" else
	V_out(3) when forward_sel_k = "011" else
	V_out(4) when forward_sel_k = "100" else
	V_out(5) when forward_sel_k = "101" else
	V_out(6) when forward_sel_k = "110" else
	V_out(7) when forward_sel_k = "111";

Qk <=
	tag(0) when forward_sel_k = "000" and done(0) = '0' else
	tag(1) when forward_sel_k = "001" and done(1) = '0' else
	tag(2) when forward_sel_k = "010" and done(2) = '0' else
	tag(3) when forward_sel_k = "011" and done(3) = '0' else
	tag(4) when forward_sel_k = "100" and done(4) = '0' else
	tag(5) when forward_sel_k = "101" and done(5) = '0' else
	tag(6) when forward_sel_k = "110" and done(6) = '0' else
	tag(7) when forward_sel_k = "111" and done(7) = '0' else
	"00000";

-- pc exception mux
PC_exception <=
	PC_out(0) when exception_sel = "000" else
	PC_out(1) when exception_sel = "001" else
	PC_out(2) when exception_sel = "010" else
	PC_out(3) when exception_sel = "011" else
	PC_out(4) when exception_sel = "100" else
	PC_out(5) when exception_sel = "101" else
	PC_out(6) when exception_sel = "110" else
	PC_out(7) when exception_sel = "111";
	
end Behavioral;