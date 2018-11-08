library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity RS_unit_arithemtic is
	Port ( 
		Clk : in  STD_LOGIC;
		RF_Vj : in  STD_LOGIC_VECTOR (31 downto 0);
		RF_Vk : in  STD_LOGIC_VECTOR (31 downto 0);
		RF_Qj : in  STD_LOGIC_VECTOR (4 downto 0);
		RF_Qk : in  STD_LOGIC_VECTOR (4 downto 0);
		CDB:in std_logic_vector(37 downto 0);
		Fop : in  STD_LOGIC_VECTOR (1 downto 0);
		issue_ready : in  STD_LOGIC;
		ready_FU : in  STD_LOGIC;
		available : out  STD_LOGIC;
		Vj_out:out std_logic_vector(31 downto 0);
		Vk_out:out std_logic_vector(31 downto 0);
		Fop_out:out std_logic_vector(1 downto 0);
		tagRF: out  STD_LOGIC_VECTOR (4 downto 0);
		tagFU:out std_logic_vector(4 downto 0));
end RS_unit_arithemtic;

architecture Behavioral of RS_unit_arithemtic is

component RS_reg_line
	port(
		RF_Vj : in  STD_LOGIC_VECTOR (31 downto 0);
		RF_Vk : in  STD_LOGIC_VECTOR (31 downto 0);
		RF_Qj : in  STD_LOGIC_VECTOR (4 downto 0);
		RF_Qk : in  STD_LOGIC_VECTOR (4 downto 0);
		CDB_V : in  STD_LOGIC_VECTOR (31 downto 0);
		CDB_Q : in  STD_LOGIC_VECTOR (4 downto 0);
		CDB_valid : in  STD_LOGIC;
		Vj_out : out  STD_LOGIC_VECTOR (31 downto 0);
		Vk_out : out  STD_LOGIC_VECTOR (31 downto 0);
		control_enable : in  STD_LOGIC;
		busy_out : out  STD_LOGIC;
		ready_for_exec : out  STD_LOGIC;
		busy_enable : in  STD_LOGIC;
		Clk : in  STD_LOGIC;
		Fop_in : in  STD_LOGIC_VECTOR (1 downto 0);
		Fop_out : out  STD_LOGIC_VECTOR (1 downto 0)); 
END COMPONENT;

-- gia ta value
COMPONENT mux4to1_32Bit
PORT(
 A : IN  std_logic_vector(31 downto 0);
 B : IN  std_logic_vector(31 downto 0);
 C : IN  std_logic_vector(31 downto 0);
 D : IN  std_logic_vector(31 downto 0);
 sel : IN  std_logic_vector(1 downto 0);
 output : OUT  std_logic_vector(31 downto 0));
END COMPONENT;
	 
-- gia ta fop
COMPONENT mux
port
(in0,in1,sel: in std_logic;
 output : out std_logic);
END COMPONENT;

component RS_arithmetic_control
port(
		Clk : in  STD_LOGIC;
		IssueRs : in  STD_LOGIC;
		available : out  STD_LOGIC;
		tagRF : out  STD_LOGIC_VECTOR (4 downto 0);
		tagFU : out  STD_LOGIC_VECTOR (4 downto 0);
		RS_line_select : out  STD_LOGIC_VECTOR (1 downto 0);
		readyFU : in  STD_LOGIC;
		control_enable : out  STD_LOGIC_VECTOR (2 downto 0);
		busy_enable : out  STD_LOGIC_VECTOR (2 downto 0);
		ready_for_exec : in  STD_LOGIC_VECTOR (2 downto 0);
		busy_line : in  STD_LOGIC_VECTOR (2 downto 0));
end component;

type array3_32 is array (0 to 2) of std_logic_vector(31 downto 0);
signal Vk_out_line, Vj_out_line : array3_32;

type array3_2 is array (0 to 2) of std_logic_vector(1 downto 0);
signal Fop_out_line : array3_2;

signal control_enable, ready_for_exec, busy_enable, busy_out : std_logic_vector(2 downto 0);
signal line_select : std_logic_vector(1 downto 0);
begin

GEN : for i in 0 to 2 generate
		RS_reg_lines : RS_reg_line
		port map (
			RF_Vj => RF_Vj,
			RF_Vk => RF_Vk,
			RF_Qj => RF_Qj,
			RF_Qk => RF_Qk,
			CDB_V => CDB(31 downto 0),
			CDB_Q => CDB(36 downto 32),
			CDB_valid => CDB(37),
			Vj_out => Vj_out_line(i),
			Vk_out => Vk_out_line(i),
			control_enable => control_enable(i),
			busy_out => busy_out(i),
			ready_for_exec => ready_for_exec(i),
			busy_enable => busy_enable(i),
			Clk => Clk,
			Fop_in => Fop,
			Fop_out => Fop_out_line(i));
end generate GEN;

Vj_mux : mux4to1_32Bit
port map(
	A => Vj_out_line(0),
	B => Vj_out_line(1),
	C => Vj_out_line(2),
	D => "00000000000000000000000000000000",
	sel => line_select,-- bgainei apo control ------------------
	output => Vj_out);
	
Vk_mux : mux4to1_32Bit
port map(
	A => Vk_out_line(0),
	B => Vk_out_line(1),
	C => Vk_out_line(2),
	D => "00000000000000000000000000000000",
	sel => line_select,-- bgainei apo control ------------------
	output => Vk_out);

-- fu mux
Fop_out <= 
	Fop_out_line(0) when line_select = "00" else 
	Fop_out_line(1) when line_select = "01" else
	Fop_out_line(2) when line_select = "10" else
	"00";
	
-- control
control : RS_arithmetic_control
port map(
	Clk => Clk,
	IssueRs => issue_ready,
	available => available,
	tagRF => tagRF,
	tagFU => tagFU,
	RS_line_select => line_select,
	readyFU => ready_FU,
	control_enable => control_enable,
	busy_enable => busy_enable,
	ready_for_exec => ready_for_exec,
	busy_line => busy_out);
	
end Behavioral;

