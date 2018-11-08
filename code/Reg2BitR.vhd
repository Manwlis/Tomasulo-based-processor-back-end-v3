library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg2BitR is
	Port ( Clk : in  STD_LOGIC;
		WrEn : in  STD_LOGIC;
		Reset : in  STD_LOGIC;
		Din : in  STD_LOGIC_VECTOR (1 downto 0);
		Dout : out  STD_LOGIC_VECTOR (1 downto 0));
end Reg2BitR;

architecture Behavioral of Reg2BitR is

COMPONENT Reg1BitR
	port(
		Clk,WrEn,Din,Reset : in std_logic;
		Dout : out std_logic);
END COMPONENT;

begin

Reg1BitR1:Reg1BitR
port map(
	Clk => Clk,
	WrEn => WrEn,
	Din => Din(1),
	Reset => Reset,
	Dout => Dout(1));
  
Reg1BitR0:Reg1BitR
port map(
	Clk => Clk,
	WrEn => WrEn,
	Reset => Reset,
	Din => Din(0),
	Dout => Dout(0));

end Behavioral;

