
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux is
    Port ( demuxin : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           demuxout0 : out  STD_LOGIC;
           demuxout1 : out  STD_LOGIC);
end demux;

architecture Behavioral of demux is

begin

demuxout0 <= demuxin AND (NOT sel);
demuxout1 <= demuxin AND sel;

end Behavioral;

