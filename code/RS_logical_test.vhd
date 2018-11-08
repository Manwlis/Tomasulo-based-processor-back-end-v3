
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY RS_logical_test IS
END RS_logical_test;
 
ARCHITECTURE behavior OF RS_logical_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RS_unit_logical
    PORT(
         Clk : IN  std_logic;
         RF_Vj : IN  std_logic_vector(31 downto 0);
         RF_Vk : IN  std_logic_vector(31 downto 0);
         RF_Qj : IN  std_logic_vector(4 downto 0);
         RF_Qk : IN  std_logic_vector(4 downto 0);
         CDB : IN  std_logic_vector(37 downto 0);
         Fop : IN  std_logic_vector(1 downto 0);
         issue_ready : IN  std_logic;
         ready_FU : IN  std_logic;
         available : OUT  std_logic;
         Vj_out : OUT  std_logic_vector(31 downto 0);
         Vk_out : OUT  std_logic_vector(31 downto 0);
         Fop_out : OUT  std_logic_vector(1 downto 0);
         tagRF : OUT  std_logic_vector(4 downto 0);
         tagFU : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal RF_Vj : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_Vk : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_Qj : std_logic_vector(4 downto 0) := (others => '0');
   signal RF_Qk : std_logic_vector(4 downto 0) := (others => '0');
   signal CDB : std_logic_vector(37 downto 0) := (others => '0');
   signal Fop : std_logic_vector(1 downto 0) := (others => '0');
   signal issue_ready : std_logic := '0';
   signal ready_FU : std_logic := '0';

 	--Outputs
   signal available : std_logic;
   signal Vj_out : std_logic_vector(31 downto 0);
   signal Vk_out : std_logic_vector(31 downto 0);
   signal Fop_out : std_logic_vector(1 downto 0);
   signal tagRF : std_logic_vector(4 downto 0);
   signal tagFU : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RS_unit_logical PORT MAP (
          Clk => Clk,
          RF_Vj => RF_Vj,
          RF_Vk => RF_Vk,
          RF_Qj => RF_Qj,
          RF_Qk => RF_Qk,
          CDB => CDB,
          Fop => Fop,
          issue_ready => issue_ready,
          ready_FU => ready_FU,
          available => available,
          Vj_out => Vj_out,
          Vk_out => Vk_out,
          Fop_out => Fop_out,
          tagRF => tagRF,
          tagFU => tagFU
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
	  --xwris issue dn ginete save
         RF_Vj <="00000000000000000000000000000001";
         RF_Vk <="00000000000000000000000000000011";
         RF_Qj <="00001";
         RF_Qk <="00011";
         CDB <="00000000000000000000000000000000000000";
         Fop<="00";
         issue_ready <='0';
         ready_FU<='1';
		--me issue ginete save
      wait for Clk_period;
			RF_Vj <="00000000000000000000000000000001";
         RF_Vk <="00000000000000000000000000000011";
         RF_Qj <="00001";
         RF_Qk <="00011";
         CDB <="00000000000000000000000000000000000000";
         Fop<="00";
         issue_ready <='1';
      -- fernoume times apo cdb
		wait for Clk_period*3;
			issue_ready <='0';
         CDB <="10000100000000000000000000000000000011";			 
		wait for Clk_period;
			issue_ready <='0';
         CDB <="10001100000000000000000000000000000111";
		--stelnoume gia exodo
		wait for Clk_period;
			issue_ready <='1';
		   RF_Qj <="00000";
         RF_Qk <="00000";
         CDB <="00001100000000000000000000000000000111";
			
		wait for Clk_period*5;
			ready_FU<='0';
      wait;
   end process;

END;
