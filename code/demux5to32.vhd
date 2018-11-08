
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux5to32 is
	Port ( 
		sel : in  STD_LOGIC_VECTOR (4 downto 0);
		input : in  STD_LOGIC;
		output : out  STD_LOGIC_VECTOR (31 downto 0));
end demux5to32;

architecture Structural of demux5to32 is



COMPONENT demux
port
(demuxin,sel :in std_logic;
  demuxout0,demuxout1 : out std_logic);
END COMPONENT;

component demux4to16
Port 
(s : in  STD_LOGIC_VECTOR (3 downto 0);
 input : in STD_LOGIC;
 output : out  STD_LOGIC_VECTOR (15 downto 0));
end component ;

signal demuxin0,demuxin1 : std_logic;


begin

demux0 : demux
PORT MAP (
   demuxin => input,
   sel => sel(4),
   demuxout0 => demuxin0,
   demuxout1 => demuxin1);
	
demux4to16_0 : demux4to16  
PORT MAP (
   s => sel(3 downto 0),
   input => demuxin0,
   output => output(15 downto 0));
	
demux4to16_1 : demux4to16  
PORT MAP (
   s => sel(3 downto 0),
   input => demuxin1,
   output => output(31 downto 16));		

end Structural;

