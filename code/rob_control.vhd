library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

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
		delete : out  STD_LOGIC_VECTOR (7 downto 0); -- pros buffers
		V_commit : out  STD_LOGIC; -- pros V unit
		commit_sel : out  STD_LOGIC_VECTOR (2 downto 0); -- pros commit muxes
		-- exception
		exception_status : in  STD_LOGIC_VECTOR (7 downto 0);
		exception_control : out  STD_LOGIC_VECTOR (7 downto 0);
		exception_sel : out  STD_LOGIC_VECTOR (2 downto 0);
		exception_valid : out  STD_LOGIC
	);
end rob_control;

architecture Behavioral of rob_control is

-- shmata gia ton pio palio xronika
signal head : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
signal head_rotate_control : STD_LOGIC;

-- shmata gia thn prwth eleu8erh 8esh
signal free : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
signal free_rotate_control : STD_LOGIC;

signal ready_for_commit, delete_commit, delete_exception : STD_LOGIC_VECTOR (7 downto 0);

begin

available <= 
	'0' when valid = "11111111" else-- na mpei forward apo commit
	'1';

-- mia entolh diagrafetai eite apo commit h exception
delete <= delete_commit OR delete_exception;


-- process gia thn eisagwgh entolhs
issue_process : process(instr_valid)
begin
		
	-- hr8e entolh. An einai gematos o buffer den 8a mpei sto if giati to instr_valid ftiaxnetai apo to available sto issue
	if instr_valid = '1' then
		-- grapsimo grammhs anebazontas to issue tou prwtou eleu8erou
		issue <= free;
		-- proxwraei ton pointer ths eleu8erhs 8eshs
		free_rotate_control <= '1';
		
	-- den hr8e egkurh entolh
	else
		issue <= "00000000";
		free_rotate_control <= '0';
	end if;
end process;

-- flag pou deixnei oti o head einai etoimos gia commit
-- ginetai 1 an sth 8esh i opou head(i) = 1 isxuei done(i) = 1 kai valid = '1'
ready_for_commit <=
	(head(0) and done(0) and valid(0)) or
	(head(1) and done(1) and valid(1)) or
	(head(2) and done(2) and valid(2)) or
	(head(3) and done(3) and valid(3)) or
	(head(4) and done(4) and valid(4)) or
	(head(5) and done(5) and valid(5)) or
	(head(6) and done(6) and valid(6)) or
	(head(7) and done(7) and valid(7));

-- commit process
commit_process : process(ready_for_commit)
begin
	
	-- an einai etoimos kai egkuros o head
	if ready_for_commit = '1' ----------------------
		delete_commit <= head;
		V_commit <= '1';
		commit_sel <= "head";
		
	-- o head den einai etoimos h egkuros
	else
		delete_commit <= "00000000";
		V_commit <= '0';
		commit_sel <= "000";	
	end if;
end process;

-- process forward j


-- process forward k


-- process exception






-- mnhmh gia tous pointers

-- process gia ton head pointer. Leitourgei san kuklikos left shift registor
head_pointer : process(Clk)
begin
--	if exception = '1' then
--		head = head_apo_exception;
--	
--	els
	if rising_edge(Clk) then
		-- den proxwraei
		if head_rotate_control = '0' then
			head <= head;
		-- epwmenh 8esh
		else
			head <= head(6 downto 0) & head(7);
		end if;
	end if;
end process;

-- process gia thn prwth elu9erh 8esh. Leitourgei san kuklikos left shift registor
free_pointer : process(Clk)
begin
	if rising_edge(Clk) then
		-- den proxwraei
		if free_rotate_control = '0' then
			free <= free;
		-- epwmenh 8esh
		else
			 free<= free(6 downto 0) & free(7);
		end if;
	end if;
end process;

end Behavioral;

