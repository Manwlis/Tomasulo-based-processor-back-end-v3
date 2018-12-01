library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity buffer_line is
	Port ( 
		-- cdb
		cdb_valid : in  STD_LOGIC;
		cdb_Q : in  STD_LOGIC_VECTOR (4 downto 0);
		cdb_V : in  STD_LOGIC_VECTOR (31 downto 0);
		-- issue
		Ri_in : in  STD_LOGIC_VECTOR (4 downto 0);
		Fu_type_in : in  STD_LOGIC_VECTOR (1 downto 0);
		-- exception
		Exception_in : in  STD_LOGIC;
		Exception_out : out  STD_LOGIC;
		-- pros control
		Ri_out : out  STD_LOGIC_VECTOR (4 downto 0);
		Fu_type_out : out  STD_LOGIC_VECTOR (1 downto 0);
		valid_out : out  STD_LOGIC;
		done_out : out  STD_LOGIC;
		-- apo control
		commit : in  STD_LOGIC;
		issue : in  STD_LOGIC;
		tag : in  STD_LOGIC;
		-- eksodos
		V_out : out  STD_LOGIC_VECTOR (31 downto 0));
end buffer_line;

architecture Behavioral of buffer_line is

-- gia fu_type
COMPONENT Reg2BitR
	port(
		Clk,WrEn,Reset : in std_logic;
		Din : in  STD_LOGIC_VECTOR (1 downto 0);
		Dout : out std_logic_VECTOR (1 downto 0)); 
END COMPONENT;

-- gia tag
COMPONENT Reg5BitR
	port(
		Clk,WrEn,Reset : in std_logic;
		Din : in  STD_LOGIC_VECTOR (4 downto 0);
		Dout : out std_logic_VECTOR (4 downto 0)); 
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

-- gia valid kai done kai ecxeption
COMPONENT Reg1BitR
port
(Clk,WrEn,Din,Reset : in std_logic;
 Dout : out std_logic);
END COMPONENT;

signal valid, done, comparator : std_logic;
begin

-- valid
valid_reg : Reg1BitR
port map(
	Clk => Clk,
	WrEn => (commit or issue),
	Din => issue,
	Reset => '0',
	Dout => valid);

valid_out <= valid;

-- done
done_reg : Reg1BitR
port map(
	Clk => Clk,
	WrEn => (comparator or (not issue)),
	Din => comparator,
	Reset => '0',
	Dout => done);

done_out <= done;

-- Ri
Ri_reg : Reg5BitR
port map(
	Clk => Clk,
	WrEn => issue,
	Din => Ri_in,
	Reset => '0',
	Dout => Ri_out);
	
-- value	
Value_reg : Reg32BitR
port map(
	Clk => Clk,
	WrEn => comparator,
	Din => CDB_V,
	Reset => '0',
	Dout => value);	
	
-- forward apo cdb
V_out <= 
	CDB_V when comparator = '1'
	else value;

-- Fu_type
Fu_type0 : Reg1BitR
port map(
	Clk => Clk,
	WrEn => issue,
	Din => Fu_type_in(0),
	Reset => '0',
	Dout => Fu_type_out(0));

Fu_type1 : Reg1BitR
port map(
	Clk => Clk,
	WrEn => issue,
	Din => Fu_type_in(1),
	Reset => '0',
	Dout => Fu_type_out(1));
	
-- exception
exception_reg : Reg1BitR
port map(
	Clk => Clk,
	WrEn => '1',
	Din => Exception_in,
	Reset => '0',
	Dout => Exception_out);
	
-- comparator
-- deixnei pote hr8e to apotelesma pou perimene o buffer
comparator <=
	'1' when cdb_valid = '1' and cdb_Q = tag and valid = '1' and done = '0'
	else '0';
end Behavioral;