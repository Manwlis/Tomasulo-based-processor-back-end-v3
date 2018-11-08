library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg5BitR is
	Port ( Clk : in  STD_LOGIC;
		WrEn : in  STD_LOGIC;
		Reset : in  STD_LOGIC;
		Din : in  STD_LOGIC_VECTOR (4 downto 0);
		Dout : out  STD_LOGIC_VECTOR (4 downto 0):="00000");
end Reg5BitR;

architecture Behavioral of Reg5BitR is

COMPONENT Reg1BitR
	port(
		Clk,WrEn,Din,Reset : in std_logic;
		Dout : out std_logic);
END COMPONENT;

begin

Reg1BitR4:Reg1BitR
port map(
	Clk => Clk,
	WrEn => WrEn,
	Din => Din(4),
	Reset => Reset,
	Dout => Dout(4));
  
Reg1BitR3:Reg1BitR
port map(
	Clk => Clk,
	WrEn => WrEn,
	Reset => Reset,
	Din => Din(3),
	Dout => Dout(3));

Reg1BitR2:Reg1BitR
port map(
	Clk => Clk,
	WrEn => WrEn,
	Din => Din(2),
	Reset => Reset,
	Dout => Dout(2));
  
Reg1BitR1:Reg1BitR
port map(
	Clk => Clk,
	WrEn => WrEn,
	Reset => Reset,
	Din => Din(1),
	Dout => Dout(1));
  
Reg1BitR0:Reg1BitR
port map(
	Clk => Clk,
	WrEn => WrEn,
	Reset => Reset,
	Din => Din(0),
	Dout => Dout(0));

end Behavioral;

