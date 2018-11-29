library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- top module. Sundeei tis ipomerou monades. Den exei idiaiterh logikh.

entity Back_end is
	port(
		issue : in  STD_LOGIC;
		Clk : in  STD_LOGIC;
		FU_type : in  STD_LOGIC_VECTOR (1 downto 0);
		IF_Fop : in  STD_LOGIC_VECTOR (1 downto 0);
		IF_Ri : in  STD_LOGIC_VECTOR (4 downto 0);
		IF_Rj : in  STD_LOGIC_VECTOR (4 downto 0);
		IF_Rk : in  STD_LOGIC_VECTOR (4 downto 0);
		accepted : out  STD_LOGIC
		);
end Back_end;

architecture Behavioral of Back_end is

-- Issue_unit -----------------------------------------------------------------------------
component Issue_unit
	port(
		issue : in  STD_LOGIC;
		FU_type : in  STD_LOGIC_VECTOR (1 downto 0);
		IF_Fop : in  STD_LOGIC_VECTOR (1 downto 0);
		IF_Ri : in  STD_LOGIC_VECTOR (4 downto 0);
		IF_Rj : in  STD_LOGIC_VECTOR (4 downto 0);
		IF_Rk : in  STD_LOGIC_VECTOR (4 downto 0);
		accepted : out  STD_LOGIC;
		available : in  STD_LOGIC_VECTOR (2 downto 0);
		issueRS : out  STD_LOGIC_VECTOR (2 downto 0);
		Instr_valid : out  STD_LOGIC;
		Fop : out  STD_LOGIC_VECTOR (1 downto 0);
		Ri : out  STD_LOGIC_VECTOR (4 downto 0);
		Rj : out  STD_LOGIC_VECTOR (4 downto 0);
		Rk : out  STD_LOGIC_VECTOR (4 downto 0);
		tag1 : in  STD_LOGIC_VECTOR (4 downto 0);
		tag2 : in  STD_LOGIC_VECTOR (4 downto 0);
		tag3 : in  STD_LOGIC_VECTOR (4 downto 0);
		tagRF : out STD_LOGIC_VECTOR (4 downto 0));
end component;
	
signal available, issueRS : STD_LOGIC_VECTOR (2 downto 0) := "000";
signal Instr_valid :STD_LOGIC;
signal Fop : STD_LOGIC_VECTOR (1 downto 0);
signal Ri, Rj, Rk, tag_logical, tag_arithmetic, tagRF : STD_LOGIC_VECTOR (4 downto 0);
signal tag0 : STD_LOGIC_VECTOR (4 downto 0) := "00000";

-- RS_unit_arithemtic -----------------------------------------------------------------------------
component RS_unit_arithemtic
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
end component;

signal ready_FU_arithmetic : STD_LOGIC;
signal Vj_out_arithmetic, Vk_out_arithmetic : std_logic_vector(31 downto 0);
signal Fop_out_arithmetic : std_logic_vector(1 downto 0);
signal tagFU_arithmetic : std_logic_vector(4 downto 0);

-- RS_unit_logical -----------------------------------------------------------------------------
component RS_unit_logical
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
end component;

signal ready_FU_logical : STD_LOGIC;
signal Vj_out_logical, Vk_out_logical : std_logic_vector(31 downto 0);
signal Fop_out_logical : std_logic_vector(1 downto 0);
signal tagFU_logical : std_logic_vector(4 downto 0);
-- Register_File -----------------------------------------------------------------------------
component Register_File
	Port(
		Instr_valid : in  STD_LOGIC;
		tag : in  STD_LOGIC_VECTOR (4 downto 0);
		Ri : in  STD_LOGIC_VECTOR (4 downto 0);
		Rj : in  STD_LOGIC_VECTOR (4 downto 0);
		Rk : in  STD_LOGIC_VECTOR (4 downto 0);
		CDB : in  STD_LOGIC_VECTOR (37 downto 0);
		Vj : out  STD_LOGIC_VECTOR (31 downto 0);
		Vk : out  STD_LOGIC_VECTOR (31 downto 0);
		Qj : out  STD_LOGIC_VECTOR (4 downto 0);
		Qk : out  STD_LOGIC_VECTOR (4 downto 0);
		Clk : in  STD_LOGIC);
end component;

signal Vj, Vk : STD_LOGIC_VECTOR (31 downto 0);
signal Qj, Qk : STD_LOGIC_VECTOR (4 downto 0);


-- CDBunit -----------------------------------------------------------------------------
component CDBunit
	Port ( 
		Clk : in STD_LOGIC;
		CDBout : out  STD_LOGIC_VECTOR (37 downto 0);
		grant : out  STD_LOGIC_VECTOR (2 downto 0);
		request : in  STD_LOGIC_VECTOR (2 downto 0);
		Q1 : in  STD_LOGIC_VECTOR (4 downto 0);
		Q2 : in  STD_LOGIC_VECTOR (4 downto 0);
		Q3 : in  STD_LOGIC_VECTOR (4 downto 0);
		Value1 : in  STD_LOGIC_VECTOR (31 downto 0);
		Value2 : in  STD_LOGIC_VECTOR (31 downto 0);
		Value3 : in  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal CDB : STD_LOGIC_VECTOR (37 downto 0);
signal grant, request : STD_LOGIC_VECTOR (2 downto 0) := "000";
signal Q_logical, Q_arithmetic, Q0 : STD_LOGIC_VECTOR (4 downto 0);
signal value_logical, value_arithmetic, Value0 : STD_LOGIC_VECTOR (31 downto 0);

-- FU_arithmetic -----------------------------------------------------------------------------
component FU_arithmetic 
	Port ( 
		tag : in  STD_LOGIC_VECTOR (4 downto 0);
		op : in  STD_LOGIC_VECTOR (1 downto 0);
		value_in1 : in  STD_LOGIC_VECTOR (31 downto 0);
		value_in2 : in  STD_LOGIC_VECTOR (31 downto 0);
		ready : out  STD_LOGIC;
		value_out : out  STD_LOGIC_VECTOR (31 downto 0);
		Q : out  STD_LOGIC_VECTOR (4 downto 0);
		request : out  STD_LOGIC;
		grant : in  STD_LOGIC;
		Clk : in  STD_LOGIC);
end component;


-- FU_logical -----------------------------------------------------------------------------
component FU_logical
	Port ( 
		tag : in  STD_LOGIC_VECTOR (4 downto 0);
		op : in  STD_LOGIC_VECTOR (1 downto 0);
		value_in1 : in  STD_LOGIC_VECTOR (31 downto 0);
		value_in2 : in  STD_LOGIC_VECTOR (31 downto 0);
		ready : out  STD_LOGIC;
		value_out : out  STD_LOGIC_VECTOR (31 downto 0);
		Q : out  STD_LOGIC_VECTOR (4 downto 0);
		request : out  STD_LOGIC;
		grant : in  STD_LOGIC;
		Clk : in  STD_LOGIC);
end component;

begin

Issue_unit_module : Issue_unit
	port map(
		issue => issue,
		FU_type => FU_type,
		IF_Fop => IF_Fop,
		IF_Ri => IF_Ri,
		IF_Rj => IF_Rj,
		IF_Rk => IF_Rk,
		accepted => accepted,
		available => available,
		issueRS => issueRS,
		Instr_valid => Instr_valid,
		Fop => Fop,
		Ri => Ri,
		Rj => Rj, 
		Rk => Rk,
		tag1 => tag_logical,
		tag2 => tag_arithmetic,
		tag3 => tag0,
		tagRF => tagRF);

 Register_File_module : Register_File
	Port map(
		Instr_valid => Instr_valid,
		tag => tagRF,
		Ri => Ri,
		Rj => Rj,
		Rk => Rk,
		CDB => CDB,
		Vj => Vj,
		Vk => Vk,
		Qj => Qj,
		Qk => Qk,
		Clk => Clk);
		
-- arithemtic---------------------------------------------
RS_unit_arithemtic_module : RS_unit_arithemtic
	Port map( 
		Clk => Clk,
		RF_Vj => Vj,
		RF_Vk => Vk,
		RF_Qj => Qj,
		RF_Qk => Qk,
		CDB => CDB,
		Fop => Fop,
		issue_ready => issueRS(1),
		ready_FU => ready_FU_arithmetic,
		available => available(1),
		Vj_out => Vj_out_arithmetic,
		Vk_out => Vk_out_arithmetic,
		Fop_out => Fop_out_arithmetic,
		tagRF => tag_arithmetic,
		tagFU => tagFU_arithmetic);
		
FU_arithmetic_module : FU_arithmetic
	Port map( 
		tag => tagFU_arithmetic,
		op => Fop_out_arithmetic,
		value_in1 => Vj_out_arithmetic,
		value_in2 => Vk_out_arithmetic,
		ready => ready_FU_arithmetic,
		value_out => value_arithmetic,
		Q => Q_arithmetic,
		request => request(1),
		grant => grant(1),
		Clk => Clk);

-- logical ------------------------------------------------------
RS_unit_logical_module : RS_unit_logical
	Port map( 
		Clk => Clk,
		RF_Vj => Vj,
		RF_Vk => Vk,
		RF_Qj => Qj,
		RF_Qk => Qk,
		CDB => CDB,
		Fop => Fop,
		issue_ready => issueRS(2),
		ready_FU => ready_FU_logical,
		available => available(2),
		Vj_out => Vj_out_logical,
		Vk_out => Vk_out_logical,
		Fop_out => Fop_out_logical,
		tagRF => tag_logical,
		tagFU => tagFU_logical);
		
FU_logical_module : FU_logical
	Port map( 
		tag => tagFU_logical,
		op => Fop_out_logical,
		value_in1 => Vj_out_logical,
		value_in2 => Vk_out_logical,
		ready => ready_FU_logical,
		value_out => value_logical,
		Q => Q_logical,
		request => request(2),
		grant => grant(2),
		Clk => Clk);

-- CDB -----------------------------------------------------------
CDBunit_module : CDBunit
	Port map( 
		Clk => Clk,
		CDBout => CDB,
		grant => grant,
		request => request,
		Q1 => Q_logical,
		Q2 => Q_arithmetic,
		Q3 => Q0,
		Value1 => value_logical,
		Value2 => value_arithmetic,
		Value3 => Value0);

end Behavioral;