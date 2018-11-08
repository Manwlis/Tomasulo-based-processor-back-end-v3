library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_File is
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
end Register_File;

architecture Behavioral of Register_File is

COMPONENT Q_block
	port(
		Clk : in std_logic;
		Ri : in  STD_LOGIC_VECTOR (4 downto 0);
		Rj : in  STD_LOGIC_VECTOR (4 downto 0);
		Rk : in  STD_LOGIC_VECTOR (4 downto 0);
		tag : in  STD_LOGIC_VECTOR (4 downto 0);
		Instr_valid : in  STD_LOGIC;
		CDB_Q : in  STD_LOGIC_VECTOR (4 downto 0);
		CDB_valid : in  STD_LOGIC;
		Qj : out  STD_LOGIC_VECTOR (4 downto 0);
		Qk : out  STD_LOGIC_VECTOR (4 downto 0);
		Value_WrEn : out  STD_LOGIC_VECTOR (31 downto 0)); 
END COMPONENT;

COMPONENT V_block
	port(
		CDB_value : in  STD_LOGIC_VECTOR (31 downto 0);
		Rj : in  STD_LOGIC_VECTOR (4 downto 0);
		Rk : in  STD_LOGIC_VECTOR (4 downto 0);
		Vj : out  STD_LOGIC_VECTOR (31 downto 0);
		Vk : out  STD_LOGIC_VECTOR (31 downto 0);
		V_WrEn : in  STD_LOGIC_VECTOR (31 downto 0);
		Clk : in  STD_LOGIC);
END COMPONENT;

signal Value_WrEn : STD_LOGIC_VECTOR (31 downto 0);
begin

Q_unit : Q_block
	port map(
		Clk => Clk,
		Ri => Ri,
		Rj => Rj,
		Rk => Rk,
		tag => tag,
		Instr_valid => Instr_valid,
		CDB_Q => CDB(36 downto 32),
		CDB_valid => CDB(37),
		Qj => Qj,
		Qk => Qk,
		Value_WrEn => Value_WrEn);
		
V_unit : V_block
	port map(
		CDB_value => CDB(31 downto 0),
		Rj => Rj,
		Rk => Rk,
		Vj => Vj,
		Vk => Vk,
		V_WrEn => Value_WrEn,
		Clk => Clk);
		
end Behavioral;

