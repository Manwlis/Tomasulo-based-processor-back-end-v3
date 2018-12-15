library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity rob_control is
	Port ( 
		Clk : in  STD_LOGIC; -- Roloi.
		-- buffer lines' status
		valid : in  STD_LOGIC_VECTOR (7 downto 0); -- buffers me egkures entoles
		done : in  STD_LOGIC_VECTOR (7 downto 0); -- buffers me oloklhromenes entoles
		fop : in  STD_LOGIC_VECTOR (15 downto 0); -- tupos twn entolwn
		-- issue
		available : out  STD_LOGIC; -- Flag gia dia8esimo xwro.
		instr_valid : in  STD_LOGIC; -- Hr8e entolh.
		issue : out  STD_LOGIC_VECTOR (7 downto 0); -- Deixnei poia grammh na parei thn entolh.
		-- diavasma kataxwrhtwn (forward)	
		j_flags : in  STD_LOGIC_VECTOR (7 downto 0); -- Deixnei poioi buffers exoun swsta dedomena gia to diavasma tou Rj.
		k_flags : in  STD_LOGIC_VECTOR (7 downto 0); -- Deixnei poioi buffers exoun swsta dedomena gia to diavasma tou Rk.
		forward_control_j : out  STD_LOGIC; -- Pros V unit. Idopoiei oti stelnontai swsta dedomena gia to diavasma tou Rj.
		forward_control_k : out  STD_LOGIC; -- Pros V unit. Idopoiei oti stelnontai swsta dedomena gia to diavasma tou Rk.
		forward_sel_j : out  STD_LOGIC_VECTOR (2 downto 0); -- Select gia tag kai V_fw muxes.
		forward_sel_k : out  STD_LOGIC_VECTOR (2 downto 0); -- Select gia tag kai V_fw muxes.
		-- commit
		delete : out  STD_LOGIC_VECTOR (7 downto 0); -- Deixnei poies grammes na diagrapsoun tis entoles tous.
		V_commit : out  STD_LOGIC; -- Pros V unit. Elenxei to enable tou kataxwrhth proorismou.
		commit_sel : out  STD_LOGIC_VECTOR (2 downto 0); -- Select twn commit muxes.
		-- exception
		exception_status : in  STD_LOGIC_VECTOR (7 downto 0); -- Deixnei poioi buffers exoun exception.
		exception_sel : out  STD_LOGIC_VECTOR (2 downto 0); -- Select twn exception muxes.
		exception_valid : out  STD_LOGIC -- Eidopiei oti egine exception.
	);
end rob_control;

architecture Behavioral of rob_control is

component cyclical_shift_register
	Port ( 
		Clk : in  STD_LOGIC;
		reset : in  STD_LOGIC;
		enable : in  STD_LOGIC;
		output : out  STD_LOGIC_VECTOR (7 downto 0)
	);
end component;

-- shmata gia thn xronika pio palia 8esh
signal head : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
signal head_rotate_control : STD_LOGIC;

-- shmata gia thn prwth eleu8erh 8esh
signal free : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
signal free_rotate_control : STD_LOGIC;

-- shmata commit kai exception
signal ready_for_commit: STD_LOGIC;
signal head_encoded : STD_LOGIC_VECTOR(2 downto 0);
signal delete_commit: STD_LOGIC_VECTOR (7 downto 0);

-- shmata exception
signal head_exception, head_reset, free_reset : STD_LOGIC;

begin

-- An oles oi 8eseis exoun egkures entoles kai den diagrafetai kapia twra, den iparxei dia8esimos xwros.
-- An ginei exception skwtonetai kai thn entolh pou erxetai twra.
available <= 
	'0' when (valid = "11111111" AND delete_commit = "00000000") OR delete_commit = "11111111" else
	'1';


-----------------------
-------- issue --------
-----------------------

-- process gia thn eisagwgh entolhs
issue_process : process(instr_valid, free)
begin
		
	-- hr8e entolh. An einai gematos o buffer den 8a mpei sto if giati to instr_valid ftiaxnetai apo to available sto issue.
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


-------------------------------------
-------- commit & exceptions --------
-------------------------------------

-- Flag pou deixnei oti o head einai etoimos gia commit.
-- Ginetai 1 an sth 8esh i opou head(i) = 1 isxuei done(i) = 1 kai valid = '1'.
ready_for_commit <=
	(head(0) and done(0) and valid(0)) or
	(head(1) and done(1) and valid(1)) or
	(head(2) and done(2) and valid(2)) or
	(head(3) and done(3) and valid(3)) or
	(head(4) and done(4) and valid(4)) or
	(head(5) and done(5) and valid(5)) or
	(head(6) and done(6) and valid(6)) or
	(head(7) and done(7) and valid(7));

-- Flag pou deixnei an o head exei ecxeption.
head_exception <=
	(head(0) and exception_status(0) and valid(0)) or
	(head(1) and exception_status(1) and valid(1)) or
	(head(2) and exception_status(2) and valid(2)) or
	(head(3) and exception_status(3) and valid(3)) or
	(head(4) and exception_status(4) and valid(4)) or
	(head(5) and exception_status(5) and valid(5)) or
	(head(6) and exception_status(6) and valid(6)) or
	(head(7) and exception_status(7) and valid(7));

-- Encode sto head, gia na xrhsimopoih8ei sta commit kai exception muxes ws select.
head_encoded <= 
	"000" when head(0) = '1' else
	"001" when head(1) = '1' else
	"010" when head(2) = '1' else
	"011" when head(3) = '1' else
	"100" when head(4) = '1' else
	"101" when head(5) = '1' else
	"110" when head(6) = '1' else
	"111" when head(7) = '1' else
	"000";

commit_sel <= head_encoded;
exception_sel <= head_encoded;

-- Commit kai exception process.
commit_exception_process : process(ready_for_commit, head_exception, head)
begin

	-- Exception sto head. Exei proteraiothta apo to commit.
	if head_exception = '1' then
		exception_valid <= '1';
		V_commit <= '0';
		head_rotate_control <= '0';
		
		-- Afou ginetai exception ston head (h palioterh entolh) kai diagrafontai oles oi epomenes, 8a diagraftoun oles.
		delete_commit <= "11111111";
		-- Reset tous pointers giati diagrafthkan oles oi entoles kai 8a deixnoun la8os dedomena
		head_reset <= '1';
		free_reset <= '1';
		
	-- An einai etoimos kai egkuros o head kanei commit.
	elsif ready_for_commit = '1' then
		head_rotate_control <= '1'; -- Prwxoraei o head.
		delete_commit <= head;
		
		-- Oi entoles store den prepei na epireazoun tous kataxwrhtes.
		if fop(((2*to_integer(unsigned(head_encoded))+1)) downto (2*to_integer(unsigned(head_encoded)))) = "11" then
			V_commit <= '0';
		-- Oi alles prepei.
		else
			V_commit <= '1';
		end if;
		
		-- gia ta open latces
		exception_valid <= '0';
		head_reset <= '0';
		free_reset <= '0';
	 
	-- O head den einai etoimos h egkuros. Den exei exception.
	else
		head_rotate_control <= '0'; -- Den prwxoraei o head.
		delete_commit <= "00000000";
		V_commit <= '0';
		exception_valid <= '0';
		head_reset <= '0';
		free_reset <= '0';
	end if;
	
end process;

delete <= delete_commit;


------------------------
-- diavasma dedomenwn --
------------------------

-- process forward j
forward_j_process : process(j_flags, head_encoded)
variable pointer : integer range 0 to 7 := 0;
begin
	
	-- an den iparxei ston reorder buffer
	forward_sel_j <= "000"; 
	forward_control_j <= '0';
	
	pointer := to_integer(unsigned(head_encoded));
	
	for I in 0 to 7 loop
		
		-- Na paei sthn epomenh 8esh. An bghke ektos wriwn na paei sthn allh meria tou vector.
		if pointer = 0 then
			pointer := 7;
		else
			pointer := pointer - 1;
		end if;
		
		-- Brhke mia grammh pou exei katallhla dedomena.
		if j_flags(pointer) = '1' then
		
			-- Dialegei ta dedomena ths gia diavasma.
			forward_sel_j <= std_logic_vector(to_unsigned(pointer,3));
			forward_control_j <= '1';
			
			-- Mas endiaferei mono h prwth pou 8a brei, giati koitame apo thn pio prosfath entolh pros thn pio palia.
			exit;
			
		end if;
	end loop;
	
end process;

-- process forward k
forward_k_process : process(k_flags, head_encoded)
variable pointer : integer range 0 to 7 := 0;
begin
	
	-- an den iparxei ston reorder buffer
	forward_sel_k <= "000"; 
	forward_control_k <= '0';
	
	pointer := to_integer(unsigned(head_encoded));
	
	for I in 0 to 7 loop
		
		-- Na paei sthn epomenh 8esh. An bghke ektos wriwn na paei sthn allh meria tou vector.
		if pointer = 0 then
			pointer := 7;
		else
			pointer := pointer - 1;
		end if;
		
		-- Brhke mia grammh pou exei katallhla dedomena.
		if k_flags(pointer) = '1' then
		
			-- Dialegei ta dedomena ths gia diavasma.
			forward_sel_k <= std_logic_vector(to_unsigned(pointer,3));
			forward_control_k <= '1';
			
			-- Mas endiaferei mono h prwth pou 8a brei, giati koitame apo thn pio prosfath entolh pros thn pio palia.
			exit;
			
		end if;
	end loop;
	
end process;


-----------------------------
-- mnhmh gia tous pointers --
-----------------------------

head_pointer : cyclical_shift_register
port map( 
	Clk => Clk,
	reset => head_reset,
	enable => head_rotate_control,
	output => head
);

free_pointer : cyclical_shift_register
port map( 
	Clk => Clk,
	reset => free_reset,
	enable => free_rotate_control,
	output => free
);

end Behavioral;