LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY reorder_buffer_test IS
END reorder_buffer_test;
 
ARCHITECTURE behavior OF reorder_buffer_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reorder_buffer
    PORT(
         Clk : IN  std_logic;
         cdb_value : IN  std_logic_vector(31 downto 0);
         cdb_Q : IN  std_logic_vector(4 downto 0);
         cdb_valid : IN  std_logic;
         available : OUT  std_logic;
         instr_valid : IN  std_logic;
         Fu_type : IN  std_logic_vector(1 downto 0);
         Ri : IN  std_logic_vector(4 downto 0);
         tag_issue : OUT  std_logic_vector(4 downto 0);
         Rj : IN  std_logic_vector(4 downto 0);
         Rk : IN  std_logic_vector(4 downto 0);
         Qj : OUT  std_logic_vector(4 downto 0);
         Qk : OUT  std_logic_vector(4 downto 0);
         forward_data_j : OUT  std_logic_vector(31 downto 0);
         forward_data_k : OUT  std_logic_vector(31 downto 0);
         forward_control_j : OUT  std_logic;
         forward_control_k : OUT  std_logic;
         commit_reg : OUT  std_logic_vector(4 downto 0);
         commit_data : OUT  std_logic_vector(31 downto 0);
         V_commit : OUT  std_logic;
         PC_entolhs : IN  std_logic_vector(31 downto 0);
         PC_exception : OUT  std_logic_vector(31 downto 0);
         exception_valid : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal cdb_value : std_logic_vector(31 downto 0) := (others => '0');
   signal cdb_Q : std_logic_vector(4 downto 0) := (others => '0');
   signal cdb_valid : std_logic := '0';
   signal instr_valid : std_logic := '0';
   signal Fu_type : std_logic_vector(1 downto 0) := (others => '0');
   signal Ri : std_logic_vector(4 downto 0) := (others => '0');
   signal Rj : std_logic_vector(4 downto 0) := (others => '0');
   signal Rk : std_logic_vector(4 downto 0) := (others => '0');
   signal PC_entolhs : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal available : std_logic;
   signal tag_issue : std_logic_vector(4 downto 0);
   signal Qj : std_logic_vector(4 downto 0);
   signal Qk : std_logic_vector(4 downto 0);
   signal forward_data_j : std_logic_vector(31 downto 0);
   signal forward_data_k : std_logic_vector(31 downto 0);
   signal forward_control_j : std_logic;
   signal forward_control_k : std_logic;
   signal commit_reg : std_logic_vector(4 downto 0);
   signal commit_data : std_logic_vector(31 downto 0);
   signal V_commit : std_logic;
   signal PC_exception : std_logic_vector(31 downto 0);
   signal exception_valid : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reorder_buffer PORT MAP (
          Clk => Clk,
          cdb_value => cdb_value,
          cdb_Q => cdb_Q,
          cdb_valid => cdb_valid,
          available => available,
          instr_valid => instr_valid,
          Fu_type => Fu_type,
          Ri => Ri,
          tag_issue => tag_issue,
          Rj => Rj,
          Rk => Rk,
          Qj => Qj,
          Qk => Qk,
          forward_data_j => forward_data_j,
          forward_data_k => forward_data_k,
          forward_control_j => forward_control_j,
          forward_control_k => forward_control_k,
          commit_reg => commit_reg,
          commit_data => commit_data,
          V_commit => V_commit,
          PC_entolhs => PC_entolhs,
          PC_exception => PC_exception,
          exception_valid => exception_valid
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
  	
	 wait for Clk_period/2;
	 
		cdb_value <= "00000000000000000000000000000000";
		cdb_Q <= "00001";
		cdb_valid <= '0';
		-- issue 8 fores
		instr_valid <= '1';
		Fu_type <= "00";
		Ri <= "00000";
		Rj <= "00001";
		Rk <= "00010";
		wait for Clk_period;
		Ri <= "10000";
      wait for Clk_period *2;
		PC_entolhs <= "11111111111111111111111111111111";
		Ri <= "11111";
		wait for Clk_period ;
		PC_entolhs <= "00000000000000000000000000000000";
		Ri <= "10000";
      wait for Clk_period *3;
		Ri <= "10011";
		-- arxizoun ta wb
      wait for Clk_period;
		instr_valid <= '0';
		cdb_valid <= '1';
		cdb_value <= "00000000000000000000000000000001";
		cdb_Q <= "01000";	
		-- forwards. Rj den einai etoimo, Rk einai.
		Rj <= "00000";
		Rk <= "10011";
		wait for Clk_period;
		cdb_value <= "00000000000000000000000000000000";
		cdb_Q <= "00111";	
		wait for Clk_period;
		cdb_Q <= "00110";	
		wait for Clk_period;
		cdb_Q <= "00101";	
		wait for Clk_period;
		cdb_Q <= "00100";	
		wait for Clk_period;
		cdb_Q <= "00011";
		wait for Clk_period;
		cdb_Q <= "00010";
		wait for Clk_period;
		cdb_Q <= "00001";
		
      wait;
   end process;

END;
