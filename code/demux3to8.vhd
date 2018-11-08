library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux3to8 is
    Port ( s : in  STD_LOGIC_VECTOR (2 downto 0);
           input : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (7 downto 0));
end demux3to8;

architecture Behavioral of demux3to8 is


component demux2to4 
Port 
(s : in  STD_LOGIC_VECTOR (1 downto 0);
 input : in STD_LOGIC;
 output : out  STD_LOGIC_VECTOR (3 downto 0));
end component ;

COMPONENT demux
port
(demuxin,sel :in std_logic;
  demuxout0,demuxout1 : out std_logic);
END COMPONENT;

signal demuxin0,demuxin1 : std_logic;


begin

demux0 : demux
PORT MAP (
   demuxin => input,
   sel => s(2),
   demuxout0 => demuxin0,
   demuxout1 => demuxin1);
	
demux2to4_0 : demux2to4  
PORT MAP (
   s => s(1 downto 0),
   input => demuxin0,
   output => output(3 downto 0));
		
demux2to4_1 : demux2to4  
PORT MAP (
   s => s(1 downto 0),
   input => demuxin1,
   output => output(7 downto 4));
	
end Behavioral;

