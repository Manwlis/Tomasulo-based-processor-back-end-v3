library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux2to4 is
    Port ( s : in  STD_LOGIC_VECTOR (1 downto 0);
	        input : in STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end demux2to4;

architecture Behavioral of demux2to4 is


COMPONENT demux
port
(demuxin,sel :in std_logic;
  demuxout0,demuxout1 : out std_logic);
END COMPONENT;

signal demuxin0,demuxin1 : std_logic;

begin

demux2 : demux
PORT MAP (
   demuxin => input,
   sel => s(1),
   demuxout0 => demuxin0,
   demuxout1 => demuxin1);

demux0 : demux
PORT MAP (
   demuxin => demuxin0,
   sel => s(0),
   demuxout0 => output(0),
   demuxout1 => output(1));
	
demux1 : demux
PORT MAP (
   demuxin => demuxin1,
   sel => s(0),
   demuxout0 => output(2),
   demuxout1 => output(3));
	
end Behavioral;

