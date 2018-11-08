library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FU_arithmetic is
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
end FU_arithmetic;

architecture Behavioral of FU_arithmetic is

COMPONENT arithmetic_unit is
	port(
		Vin1 : in  STD_LOGIC_VECTOR (31 downto 0);
		Vin2 : in  STD_LOGIC_VECTOR (31 downto 0);
		op : in  STD_LOGIC_VECTOR (1 downto 0);
		Vout : out  STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

COMPONENT FU_arithmetic_control is
	port(
		grant : in  STD_LOGIC;
		request : out  STD_LOGIC;
		stage1_enable : out  STD_LOGIC;
		stage2_enable: out  STD_LOGIC;
		ready : out  STD_LOGIC;
		tag_start : in  STD_LOGIC_VECTOR (4 downto 0);
		tag_mid : in  STD_LOGIC_VECTOR (4 downto 0));
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

signal execution_module_in1, execution_module_in2 ,execution_module_out, result_mid_out : STD_LOGIC_VECTOR (31 downto 0);
signal op_to_exec : STD_LOGIC_VECTOR (1 downto 0);
signal tag_to_q, q_mid_out : STD_LOGIC_VECTOR (4 downto 0);
signal stage1_enable, stage2_enable : STD_LOGIC;

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
execution_module : arithmetic_unit
port map(
	Vin1 => execution_module_in1,
	Vin2 => execution_module_in2,
	op => op_to_exec,
	Vout => execution_module_out);
	
--endiamesoi kataxwrhtes
Result_mid_reg : Reg32BitR
port map(
	Clk => Clk,
	WrEn => stage2_enable,
	Reset => '0',
	Din => execution_module_out,
	Dout => result_mid_out);
	
q_mid_reg : Reg5BitR
port map(
	Clk => Clk,
	WrEn => stage2_enable,
	Reset => '0',
	Din => tag_to_q,
	Dout => q_mid_out);	

-- kataxwrhtes eksodou
Result_reg : Reg32BitR
port map(
	Clk => Clk,
	WrEn => '1',
	Reset => '0',
	Din => result_mid_out,
	Dout => value_out);
	
q_reg : Reg5BitR
port map(
	Clk => Clk,
	WrEn => '1',
	Reset => '0',
	Din => q_mid_out,
	Dout => Q);

-- control
control : FU_arithmetic_control
port map( 
	grant => grant,
	request => request,
	stage1_enable => stage1_enable,
	stage2_enable => stage2_enable,
	ready => ready,
	tag_start => tag_to_q,
	tag_mid => q_mid_out);
	
end Behavioral;

