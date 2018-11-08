----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:39:41 10/23/2018 
-- Design Name: 
-- Module Name:    CDBunit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CDBunit is
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
end CDBunit;

architecture Behavioral of CDBunit is

COMPONENT mux4to1_32Bit
	PORT(
		A : IN  std_logic_vector(31 downto 0);
		B : IN  std_logic_vector(31 downto 0);
		C : IN  std_logic_vector(31 downto 0);
		D : IN  std_logic_vector(31 downto 0);
		sel : IN  std_logic_vector(1 downto 0);
		output : OUT  std_logic_vector(31 downto 0));
END COMPONENT;

COMPONENT mux4to1_5bit
	Port ( 
		sel : in  STD_LOGIC_VECTOR (1 downto 0);
		A : in  STD_LOGIC_VECTOR (4 downto 0);
		B : in  STD_LOGIC_VECTOR (4 downto 0);
		C : in  STD_LOGIC_VECTOR (4 downto 0);
		D : in  STD_LOGIC_VECTOR (4 downto 0);
		output : out  STD_LOGIC_VECTOR (4 downto 0));
end COMPONENT;

COMPONENT CDB_control
	Port ( request : in  STD_LOGIC_VECTOR (2 downto 0);
		grant : out  STD_LOGIC_VECTOR (2 downto 0);
		CDBvalid : out  STD_LOGIC;
		sel : out  STD_LOGIC_VECTOR (1 downto 0);
		Clk : in STD_LOGIC);
end COMPONENT;

COMPONENT Reg1BitR
	port(
		Clk,WrEn,Din,Reset : in std_logic;
		Dout : out std_logic);
END COMPONENT;

COMPONENT Reg4BitR
	port(
		Clk,WrEn,Reset : in std_logic;
		Din : in  STD_LOGIC_VECTOR (3 downto 0);
		Dout : out std_logic_VECTOR (3 downto 0)); 
END COMPONENT;

COMPONENT Reg2BitR
	port(
		Clk,WrEn,Reset : in std_logic;
		Din : in  STD_LOGIC_VECTOR (1 downto 0);
		Dout : out std_logic_VECTOR (1 downto 0)); 
END COMPONENT;

signal control_valid : STD_LOGIC;
signal sel_before_reg, sel : STD_LOGIC_VECTOR (1 downto 0);
begin

value_mux : mux4to1_32Bit
port map(
 A => Value1,
 B => Value2,
 C => Value3,
 D => "00000000000000000000000000000000",
 sel => sel,
 output => CDBout(31 downto 0));

Q_mux : mux4to1_5bit
port map(
 A => Q1,
 B => Q2,
 C => Q3,
 D => "00000",
 sel => sel,
 output => CDBout(36 downto 32));

CDB_control0 : CDB_control
port map( 
 request => request,
 grant => grant,
 CDBvalid => control_valid,
 sel => sel_before_reg,
 Clk => Clk);

valid_reg : Reg1BitR
port map(
 Clk => Clk,
 WrEn => '1',
 Reset => '0',
 Din => control_valid,
 Dout => CDBout(37));

sel_reg : Reg2BitR
port map(
 Clk => Clk,
 WrEn => '1',
 Reset => '0',
 Din => sel_before_reg,
 Dout => sel);

end Behavioral;

