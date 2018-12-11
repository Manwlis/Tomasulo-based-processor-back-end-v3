
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Issue_unit_test IS
END Issue_unit_test;
 
ARCHITECTURE behavior OF Issue_unit_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Issue_unit
    PORT(
         issue : IN  std_logic;
         FU_type : IN  std_logic_vector(1 downto 0);
         IF_Fop : IN  std_logic_vector(1 downto 0);
         IF_Ri : IN  std_logic_vector(4 downto 0);
         IF_Rj : IN  std_logic_vector(4 downto 0);
         IF_Rk : IN  std_logic_vector(4 downto 0);
         accepted : OUT  std_logic;
         available : IN  std_logic_vector(2 downto 0);
         issueRS : OUT  std_logic_vector(2 downto 0);
         Instr_valid : OUT  std_logic;
         Fop : OUT  std_logic_vector(1 downto 0);
         Ri : OUT  std_logic_vector(4 downto 0);
         Rj : OUT  std_logic_vector(4 downto 0);
         Rk : OUT  std_logic_vector(4 downto 0);
         PC_in : IN  std_logic_vector(31 downto 0);
         PC_entolhs : OUT  std_logic_vector(31 downto 0);
         available_rob : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal issue : std_logic := '0';
   signal FU_type : std_logic_vector(1 downto 0) := (others => '0');
   signal IF_Fop : std_logic_vector(1 downto 0) := (others => '0');
   signal IF_Ri : std_logic_vector(4 downto 0) := (others => '0');
   signal IF_Rj : std_logic_vector(4 downto 0) := (others => '0');
   signal IF_Rk : std_logic_vector(4 downto 0) := (others => '0');
   signal available : std_logic_vector(2 downto 0) := (others => '0');
   signal PC_in : std_logic_vector(31 downto 0) := (others => '0');
   signal available_rob : std_logic := '0';

 	--Outputs
   signal accepted : std_logic;
   signal issueRS : std_logic_vector(2 downto 0);
   signal Instr_valid : std_logic;
   signal Fop : std_logic_vector(1 downto 0);
   signal Ri : std_logic_vector(4 downto 0);
   signal Rj : std_logic_vector(4 downto 0);
   signal Rk : std_logic_vector(4 downto 0);
   signal PC_entolhs : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Issue_unit PORT MAP (
          issue => issue,
          FU_type => FU_type,
          IF_Fop => IF_Fop,
          IF_Ri => IF_Ri,
          IF_Rj => IF_Rj,
          IF_Rk => IF_Rk,
          accepted => accepted,
          available => available,
          issueRS => issueRS,
          Instr_valid => Instr_valid,
          Fop => Fop,
          Ri => Ri,
          Rj => Rj,
          Rk => Rk,
          PC_in => PC_in,
          PC_entolhs => PC_entolhs,
          available_rob => available_rob
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
	
		-- oxi availble autos pou zitaei
		issue <= '1';
		FU_type <= "00";
		IF_Fop <= "00";
		IF_Ri <= "00000";
		IF_Rj <= "00000";
		IF_Rk <= "00000";
		available <= "011";
		available_rob <= '1';
      wait for 100ns;

		-- availble autos pou zitaei
		issue <= '1';
		FU_type <= "00";
		IF_Fop <= "00";
		IF_Ri <= "10000";
		IF_Rj <= "11000";
		IF_Rk <= "11100";
		available <="111";
      wait for 100ns;

		-- ena issue ana kuklo
		issue <= '1';
		FU_type <= "01";
		available <= "111";
      wait for 100ns;
		
		issue <= '1';
		FU_type <= "10";
		available <= "111";
      wait for 100ns;
		
		-- issue = 0
		issue <= '0';
		FU_type <= "01";
		IF_Fop <= "00";
		available <= "111";
      wait for 100ns;
		
		-- rob kollumenos
		issue <= '1';
		FU_type <= "11";
		IF_Fop <= "11";
		IF_Ri <= "00000";
		IF_Rj <= "00000";
		IF_Rk <= "00000";
		available <= "011";
		available_rob <= '0';
		
      wait for 100ns;
      wait;
   end process;

END;
