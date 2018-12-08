library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Issue_unit is
    Port ( issue : in  STD_LOGIC;
           FU_type : in  STD_LOGIC_VECTOR (1 downto 0);
           IF_Fop : in  STD_LOGIC_VECTOR (1 downto 0);
           IF_Ri : in  STD_LOGIC_VECTOR (4 downto 0);
           IF_Rj : in  STD_LOGIC_VECTOR (4 downto 0);
           IF_Rk : in  STD_LOGIC_VECTOR (4 downto 0);
           accepted : out  STD_LOGIC;
           available : in  STD_LOGIC_VECTOR (2 downto 0);
           issueRS : out  STD_LOGIC_VECTOR (2 downto 0);
			  Instr_valid : out  STD_LOGIC;
           Fop : out  STD_LOGIC_VECTOR (1 downto 0);
           Ri : out  STD_LOGIC_VECTOR (4 downto 0);
           Rj : out  STD_LOGIC_VECTOR (4 downto 0);
           Rk : out  STD_LOGIC_VECTOR (4 downto 0);
				PC_in : in  STD_LOGIC_VECTOR (31 downto 0);
				PC_entolhs : out  STD_LOGIC_VECTOR (31 downto 0);
				available_rob : in  STD_LOGIC);
end Issue_unit;

architecture Behavioral of Issue_unit is

begin

	-- ta shmata pou pernan kateu8eian
	Fop <= IF_Fop;
	Ri <= IF_Ri;
	Rj <= IF_Rj;
	Rk <= IF_Rk;
	PC_entolhs <= PC_in;
	
	process(issue, available, FU_type, tag1, tag2, tag3)
	begin
		-- epilogh katallhlou RS kai elenxos domikwn kindinwn
		if issue = '1' then
			-- den exei xwro o rob
			if available_rob = '0' then
				accepted <= '0';
				Instr_valid <= '0';
				issueRS <= "000";
			-- logikh entolh
			elsif available(2) = '1' and FU_type = "00" then
				accepted <= '1';
				Instr_valid <= '1';
				issueRS <= "100";
			-- ari8mitikh entolh
			elsif available(1) = '1' and FU_type = "01" then
				accepted <= '1';
				Instr_valid <= '1';
				issueRS <= "010";
			-- alles prakseis
			elsif available(0) = '1' and FU_type(1) = '1' then
				accepted <= '1';
				Instr_valid <= '1';
				issueRS <= "001";
			-- den einai to katallhlo RS available
			else
				accepted <= '0';
				Instr_valid <= '0';
				issueRS <= "000";
			end if;
		-- den hr8e entolh
		else
			accepted <= '0';
			Instr_valid <= '0';
			issueRS <= "000";	
		end if;
	end process;
	
end Behavioral;

