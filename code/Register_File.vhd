library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- to rf apoteleite apo duo modules.
-- Ena gia tous V regs kai thn logikh tous kai ena gia tous Q blocks kai thn logikh tous.

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
		Clk : in  STD_LOGIC;
		PC_entolhs : in  STD_LOGIC_VECTOR (31 downto 0)
	);
end Register_File;

architecture Behavioral of Register_File is

COMPONENT V_block
	port(
		Rj : in  STD_LOGIC_VECTOR (4 downto 0);
		Rk : in  STD_LOGIC_VECTOR (4 downto 0);
		Vj : out  STD_LOGIC_VECTOR (31 downto 0);
		Vk : out  STD_LOGIC_VECTOR (31 downto 0);
		V_WrEn : in  STD_LOGIC_VECTOR (31 downto 0);
		Clk : in  STD_LOGIC);
END COMPONENT;

signal Value_WrEn : STD_LOGIC_VECTOR (31 downto 0);
begin

V_unit : V_block
	port map(
		Rj => Rj,
		Rk => Rk,
		Vj => Vj,
		Vk => Vk,
		V_WrEn => Value_WrEn,
		Clk => Clk);
		
end Behavioral;

