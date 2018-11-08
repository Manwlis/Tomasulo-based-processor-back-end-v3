LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test_RF IS
END test_RF;
 
ARCHITECTURE behavior OF test_RF IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Register_File
    PORT(
         Instr_valid : IN  std_logic;
         tag : IN  std_logic_vector(4 downto 0);
         Ri : IN  std_logic_vector(4 downto 0);
         Rj : IN  std_logic_vector(4 downto 0);
         Rk : IN  std_logic_vector(4 downto 0);
         CDB : IN  std_logic_vector(37 downto 0);
         Vj : OUT  std_logic_vector(31 downto 0);
         Vk : OUT  std_logic_vector(31 downto 0);
         Qj : OUT  std_logic_vector(4 downto 0);
         Qk : OUT  std_logic_vector(4 downto 0);
         Clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Instr_valid : std_logic := '0';
   signal tag : std_logic_vector(4 downto 0) := (others => '0');
   signal Ri : std_logic_vector(4 downto 0) := (others => '0');
   signal Rj : std_logic_vector(4 downto 0) := (others => '0');
   signal Rk : std_logic_vector(4 downto 0) := (others => '0');
   signal CDB : std_logic_vector(37 downto 0) := (others => '0');
   signal Clk : std_logic := '0';

 	--Outputs
   signal Vj : std_logic_vector(31 downto 0);
   signal Vk : std_logic_vector(31 downto 0);
   signal Qj : std_logic_vector(4 downto 0);
   signal Qk : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_File PORT MAP (
          Instr_valid => Instr_valid,
          tag => tag,
          Ri => Ri,
          Rj => Rj,
          Rk => Rk,
          CDB => CDB,
          Vj => Vj,
          Vk => Vk,
          Qj => Qj,
          Qk => Qk,
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
	
	-- perimenei o ri to tag 3
	Ri <= "00000";
	Rj <= "00001";
	Rk <= "00010";
	tag <= "00011";
	Instr_valid <= '1';
	CDB<="00001100000000000000000000000000000011";
   wait for Clk_period;
	
	-- erxetai to tag 3 kai to diavazw kateu8eian, ginetai to forward
	Ri <= "10000";
	Rj <= "00000";
	Rk <= "00010";
	tag <= "00011";
	Instr_valid <= '1';
	CDB<="10001100000000000000000000000000000011";
   wait for Clk_period;
	
	-- akurh entolh den ekteleite
	Ri <= "00001";
	Rj <= "00001";
	Rk <= "00000";
	tag <= "00011";
	Instr_valid <= '0';
	CDB<="00001100000000000000000000000000001111";
   wait for Clk_period;
	
	-- perimenei apotelesmata o 10000
	Ri <= "10000";
	Rj <= "00001";
	Rk <= "00000";
	tag <= "00011";
	Instr_valid <= '1';
	CDB<="00101100000000000000000000000000001111";
	
	-- erxontai ta apotelesmta kai ginetai renaming panw ston idio. Proteraiothta dinetai sth kainourgia entolh
   wait for Clk_period;
	Ri <= "10000";
	Rj <= "10000";
	Rk <= "00000";
	tag <= "01111";
	Instr_valid <= '1';
	CDB<="10001100000000000000000000000000111111";
   wait for Clk_period;

      -- insert stimulus here 


      wait;
   end process;

END;
