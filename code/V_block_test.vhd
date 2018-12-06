LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY V_block_test IS
END V_block_test;
 
ARCHITECTURE behavior OF V_block_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT V_block
    PORT(
         commit : IN  std_logic;
         commit_reg : IN  std_logic_vector(4 downto 0);
         commit_data : IN  std_logic_vector(31 downto 0);
         Rj : IN  std_logic_vector(4 downto 0);
         Rk : IN  std_logic_vector(4 downto 0);
         forward_data_j : IN  std_logic_vector(31 downto 0);
         forward_data_k : IN  std_logic_vector(31 downto 0);
         forward_control_j : IN  std_logic;
         forward_control_k : IN  std_logic;
         Vj : OUT  std_logic_vector(31 downto 0);
         Vk : OUT  std_logic_vector(31 downto 0);
         Clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal commit : std_logic := '0';
   signal commit_reg : std_logic_vector(4 downto 0) := (others => '0');
   signal commit_data : std_logic_vector(31 downto 0) := (others => '0');
   signal Rj : std_logic_vector(4 downto 0) := (others => '0');
   signal Rk : std_logic_vector(4 downto 0) := (others => '0');
   signal forward_data_j : std_logic_vector(31 downto 0) := (others => '0');
   signal forward_data_k : std_logic_vector(31 downto 0) := (others => '0');
   signal forward_control_j : std_logic := '0';
   signal forward_control_k : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal Vj : std_logic_vector(31 downto 0);
   signal Vk : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: V_block PORT MAP (
          commit => commit,
          commit_reg => commit_reg,
          commit_data => commit_data,
          Rj => Rj,
          Rk => Rk,
          forward_data_j => forward_data_j,
          forward_data_k => forward_data_k,
          forward_control_j => forward_control_j,
          forward_control_k => forward_control_k,
          Vj => Vj,
          Vk => Vk,
          Clk => Clk
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
		-- commit
	  commit <= '1';
	  commit_reg <= "00001";
	  commit_data <= "00000000000000000000000000000001";
	  -- diavasma kataxwrhtwn
	  Rj <= "00010";
	  Rk <= "00011";
	  forward_data_j <= "00000000000000000000000000000010";
	  forward_data_k <= "00000000000000000000000000000001";
	  forward_control_j <= '1';
	  forward_control_k <= '0';

      wait for Clk_period;
		commit <= '0';
		
	  Rj <= "00001";
	  forward_control_j <= '0';

      wait;
		
   end process;

END;
