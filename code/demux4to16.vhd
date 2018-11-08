
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux4to16 is
    Port ( s : in  STD_LOGIC_VECTOR (3 downto 0);
           input : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (15 downto 0));
end demux4to16;

architecture Behavioral of demux4to16 is


COMPONENT demux
port
(demuxin,sel :in std_logic;
  demuxout0,demuxout1 : out std_logic);
END COMPONENT;

component demux3to8
Port 
(s : in  STD_LOGIC_VECTOR (2 downto 0);
 input : in STD_LOGIC;
 output : out  STD_LOGIC_VECTOR (7 downto 0));
end component ;

signal demuxin0,demuxin1 : std_logic;

begin

demux0 : demux
PORT MAP (
   demuxin => input,
   sel => s(3),
   demuxout0 => demuxin0,
   demuxout1 => demuxin1);
	
demux3to8_0 : demux3to8  
PORT MAP (
   s => s(2 downto 0),
   input => demuxin0,
   output => output(7 downto 0));
	
demux3to8_1 : demux3to8  
PORT MAP (
   s => s(2 downto 0),
   input => demuxin1,
   output => output(15 downto 8));

end Behavioral;

