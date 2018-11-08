library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FU_logical is
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
end FU_logical;

architecture Behavioral of FU_logical is

COMPONENT logical_unit is
	port(
		Vin1 : in  STD_LOGIC_VECTOR (31 downto 0);
		Vin2 : in  STD_LOGIC_VECTOR (31 downto 0);
		op : in  STD_LOGIC_VECTOR (1 downto 0);
		Vout : out  STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

COMPONENT FU_logical_control is
	port(
		grant : in  STD_LOGIC;
		request : out  STD_LOGIC;
		stage1_enable : out  STD_LOGIC;
		ready : out  STD_LOGIC;
		tag : in  STD_LOGIC_VECTOR (4 downto 0));
end COMPONENT;

COMPONENT Reg2BitR
	port(
		Clk,WrEn,Reset : in std_logic;
		Din : in  STD_LOGIC_VECTOR (1 downto 0);
		Dout : out std_logic_VECTOR (1 downto 0)); 
END COMPONENT;

COMPONENT Reg5BitR
	port(
		Clk,WrEn,Reset : in std_logic;
		Din : in  STD_LOGIC_VECTOR (4 downto 0);
		Dout : out std_logic_VECTOR (4 downto 0)); 
END COMPONENT;

COMPONENT Reg32BitR
	port(
		Clk,WrEn,Reset : in std_logic;
		Din : in  STD_LOGIC_VECTOR (31 downto 0);
		Dout : out std_logic_VECTOR (31 downto 0)); 
END COMPONENT;

signal execution_module_in1, execution_module_in2 ,execution_module_out : STD_LOGIC_VECTOR (31 downto 0);
signal op_to_exec : STD_LOGIC_VECTOR (1 downto 0);
signal tag_to_q : STD_LOGIC_VECTOR (4 downto 0);
signal stage1_enable : STD_LOGIC;

begin

-- kataxwrhtes eisodou
Value_in1_reg : Reg32BitR
port map(
	Clk => Clk,
	WrEn => stage1_enable,
	Reset => '0',
	Din => value_in1,
	Dout => execution_module_in1);
	
Value_in2_reg : Reg32BitR
port map(
	Clk => Clk,
	WrEn => stage1_enable,
	Reset => '0',
	Din => value_in2,
	Dout => execution_module_in2);

op_reg : Reg2BitR
port map(
	Clk => Clk,
	WrEn => stage1_enable,
	Reset => '0',
	Din => op,
	Dout => op_to_exec);
	
tag_reg : Reg5BitR
port map(
	Clk => Clk,
	WrEn => stage1_enable,
	Reset => '0',
	Din => tag,
	Dout => tag_to_q);

-- module pou kanei tis prakseis
execution_module : logical_unit
port map(
	Vin1 => execution_module_in1,
	Vin2 => execution_module_in2,
	op => op_to_exec,
	Vout => execution_module_out);

-- kataxwrhtes eksodou
Result_reg : Reg32BitR
port map(
	Clk => Clk,
	WrEn => '1',
	Reset => '0',
	Din => execution_module_out,
	Dout => value_out);
	
q_reg : Reg5BitR
port map(
	Clk => Clk,
	WrEn => '1',
	Reset => '0',
	Din => tag_to_q,
	Dout => Q);

-- control
control : FU_logical_control
port map( 
	grant => grant,
	request => request,
	stage1_enable => stage1_enable,
	ready => ready,
	tag => tag_to_q);
	
end Behavioral;

