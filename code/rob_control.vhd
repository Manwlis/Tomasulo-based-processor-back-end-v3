library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rob_control is
	Port ( 
		Clk : in  STD_LOGIC;
		-- buffer lines' status
		valid : in  STD_LOGIC_VECTOR (7 downto 0); -- buffers me egkures entoles
		done : in  STD_LOGIC_VECTOR (7 downto 0); -- buffers me oloklhromenes entoles
		fop : in  STD_LOGIC_VECTOR (15 downto 0); -- tupos twn entolwn
		-- issue
		available : out  STD_LOGIC; -- iparxei 8esh gia entolh
		instr_valid : in  STD_LOGIC; -- hr8e entolh
		issue : out  STD_LOGIC_VECTOR (7 downto 0); -- pros buffers
		-- diavasma kataxwrhtwn (forward)	
		Rj : in  STD_LOGIC_VECTOR (4 downto 0);
		Rk : in  STD_LOGIC_VECTOR (4 downto 0);
		j_flags : in  STD_LOGIC_VECTOR (7 downto 0); -- apo buffers
		k_flags : in  STD_LOGIC_VECTOR (7 downto 0); -- apo buffers
		forward_control_j : out  STD_LOGIC; -- pros V unit
		forward_control_k : out  STD_LOGIC; -- pros V unit
		forward_sel_j : out  STD_LOGIC_VECTOR (2 downto 0); -- pros tag kai V_fw muxes
		forward_sel_k : out  STD_LOGIC_VECTOR (2 downto 0); -- pros tag kai V_fw muxes
		-- commit
		commit : out  STD_LOGIC_VECTOR (7 downto 0); -- pros buffers
		V_commit : out  STD_LOGIC; -- pros V unit
		commit_sel : out  STD_LOGIC_VECTOR (2 downto 0); -- pros commit muxes
		-- exception
		exception_status : in  STD_LOGIC_VECTOR (7 downto 0);
		exception_control : out  STD_LOGIC_VECTOR (7 downto 0)
	);
end rob_control;

architecture Behavioral of rob_control is

begin


end Behavioral;

