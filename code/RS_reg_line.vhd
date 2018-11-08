library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RS_reg_line is
    Port ( RF_Vj : in  STD_LOGIC_VECTOR (31 downto 0);
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
end RS_reg_line;

architecture Behavioral of RS_reg_line is

-- gia fop
COMPONENT Reg2BitR
	port(
		Clk,WrEn,Reset : in std_logic;
		Din : in  STD_LOGIC_VECTOR (1 downto 0);
		Dout : out std_logic_VECTOR (1 downto 0)); 
END COMPONENT;

-- gia Q
COMPONENT Reg5BitR
	port(
		Clk,WrEn,Reset : in std_logic;
		Din : in  STD_LOGIC_VECTOR (4 downto 0);
		Dout : out std_logic_VECTOR (4 downto 0)); 
END COMPONENT;

COMPONENT mux5Bit
	port(
		sel : in  STD_LOGIC;
		A : in  STD_LOGIC_VECTOR (4 downto 0);
		B : in  STD_LOGIC_VECTOR (4 downto 0);
		Outt : out  STD_LOGIC_VECTOR (4 downto 0));
END COMPONENT;

-- gia value
COMPONENT Reg32BitR
	port(
		Clk,WrEn,Reset : in std_logic;
		Din : in  STD_LOGIC_VECTOR (31 downto 0);
		Dout : out std_logic_VECTOR (31 downto 0)); 
END COMPONENT;
	
COMPONENT mux32Bit
port
(sel : in  STD_LOGIC;
 A : in  STD_LOGIC_VECTOR (31 downto 0);
 B : in  STD_LOGIC_VECTOR (31 downto 0);
 Outt : out  STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

-- gia busy kai fop
COMPONENT Reg1BitR
port
(Clk,WrEn,Din,Reset : in std_logic;
 Dout : out std_logic);
END COMPONENT;

COMPONENT mux
port
(in0,in1,sel: in std_logic;
 output : out std_logic);
END COMPONENT;

signal busy_in, busy_reg_out, comparator_j, comparator_k : std_logic;
signal Vj_WrEn, Vk_WrEn : std_logic;
signal Vj_in, Vk_in, Vj_reg_out, Vk_reg_out : std_logic_vector(31 downto 0);
signal Qj_in, Qk_in, Qj, Qk : std_logic_vector(4 downto 0);
signal Fop_out_reg : std_logic_vector(1 downto 0);

begin

-- busy
busy_mux : mux
port map(
   in0 => '0',
	in1 => '1',
	sel => control_enable,
	output => busy_in);
	
busy_reg : Reg1BitR
port map(
	Clk => Clk,
	WrEn => busy_enable,
	Din => busy_in,
	Reset => '0',
	Dout => busy_reg_out);
	
busy_out <= busy_reg_out;

-- value j
Vj_mux : mux32Bit
port map(
	sel => comparator_j,
	A => RF_Vj,
	B => CDB_V,
	Outt => Vj_in);

Vj_WrEn <= control_enable or comparator_j;
Vj_reg : Reg32BitR
port map(
	Clk => Clk,
	WrEn => Vj_WrEn,
	Din => Vj_in,
	Reset => '0',
	Dout => Vj_reg_out);

-- forward tou cdb
Vj_out <= Vj_reg_out when comparator_j = '0'
	else Vj_in;
	
-- value k
Vk_mux : mux32Bit
port map(
	sel => comparator_k,
	A => RF_Vk,
	B => CDB_V,
	Outt => Vk_in);
	
Vk_WrEn <= control_enable or comparator_k;
Vk_reg : Reg32BitR
port map(
	Clk => Clk,
	WrEn => Vk_WrEn,
	Din => Vk_in,
	Reset => '0',
	Dout => Vk_reg_out);

-- forward tou cdb
Vk_out <= Vk_reg_out when comparator_k = '0'
	else Vk_in;
	
-- q j
Qj_mux : mux5Bit
port map(
	sel => comparator_j,
	A => RF_Qj,
	B => "00000",
	Outt => Qj_in);
	
Qj_reg : Reg5BitR
port map(
	Clk => Clk,
	WrEn => Vj_WrEn,
	Din => Qj_in,
	Reset => '0',
	Dout => Qj);
	
-- q k
Qk_mux : mux5Bit
port map(
	sel => comparator_k,
	A => RF_Qk,
	B => "00000",
	Outt => Qk_in);
	
Qk_reg : Reg5BitR
port map(
	Clk => Clk,
	WrEn => Vk_WrEn,
	Din => Qk_in,
	Reset => '0',
	Dout => Qk);
	
-- fop

fop_reg0 : Reg1BitR
port map(
	Clk => Clk,
	WrEn => control_enable,
	Din => Fop_in(0),
	Reset => '0',
	Dout => Fop_out_reg(0));

fop_reg1 : Reg1BitR
port map(
	Clk => Clk,
	WrEn => control_enable,
	Din => Fop_in(1),
	Reset => '0',
	Dout => Fop_out_reg(1));	
	
-- comparators
comparator_j <= '1' when CDB_valid = '1' and busy_reg_out = '1' and Qj = CDB_Q
	else '0';
	
comparator_k <= '1' when CDB_valid = '1' and busy_reg_out = '1' and Qk = CDB_Q
	else '0';
	
Fop_out <= Fop_out_reg;
	
ready_for_exec <= '1' 
	when busy_reg_out = '1' and (
		(Qj = "00000" and Qk = "00000") or 
		(Qj = "00000" and comparator_k = '1') or 
		(comparator_j = '1' and Qk = "00000") or 
		(comparator_j = '1' and comparator_k = '1') or
		--- not kai shift na mhn perimenoun Qk
		(Fop_out_reg(1) = '1' and Fop_out_reg(0) = '0' and Qj = "00000") or
		(Fop_out_reg(1) = '1' and Fop_out_reg(0) = '0' and comparator_j = '1')		
	)
	else '0';
end Behavioral;

