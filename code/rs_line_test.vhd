--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:34:24 10/28/2018
-- Design Name:   
-- Module Name:   C:/arxitektonikh1/rs_line_test.vhd
-- Project Name:  arxitektonikh1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RS_reg_line
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY rs_line_test IS
END rs_line_test;
 
ARCHITECTURE behavior OF rs_line_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RS_reg_line
    PORT(
         RF_Vj : IN  std_logic_vector(31 downto 0);
         RF_Vk : IN  std_logic_vector(31 downto 0);
         RF_Qj : IN  std_logic_vector(4 downto 0);
         RF_Qk : IN  std_logic_vector(4 downto 0);
         CDB_V : IN  std_logic_vector(31 downto 0);
         CDB_Q : IN  std_logic_vector(4 downto 0);
         CDB_valid : IN  std_logic;
         Vj_out : OUT  std_logic_vector(31 downto 0);
         Vk_out : OUT  std_logic_vector(31 downto 0);
         control_enable : IN  std_logic;
         busy_out : OUT  std_logic;
			ready_for_exec : OUT  std_logic;
         busy_enable : IN  std_logic;
         Clk : IN  std_logic;
         Fop_in : IN  std_logic_vector(1 downto 0);
         Fop_out : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RF_Vj : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_Vk : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_Qj : std_logic_vector(4 downto 0) := (others => '0');
   signal RF_Qk : std_logic_vector(4 downto 0) := (others => '0');
   signal CDB_V : std_logic_vector(31 downto 0) := (others => '0');
   signal CDB_Q : std_logic_vector(4 downto 0) := (others => '0');
   signal CDB_valid : std_logic := '0';
   signal control_enable : std_logic := '0';
   signal busy_enable : std_logic := '0';
   signal Clk : std_logic := '0';
   signal Fop_in : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal Vj_out : std_logic_vector(31 downto 0);
   signal Vk_out : std_logic_vector(31 downto 0);
   signal busy_out : std_logic;
   signal ready_for_exec : std_logic;
   signal Fop_out : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RS_reg_line PORT MAP (
          RF_Vj => RF_Vj,
          RF_Vk => RF_Vk,
          RF_Qj => RF_Qj,
          RF_Qk => RF_Qk,
          CDB_V => CDB_V,
          CDB_Q => CDB_Q,
          CDB_valid => CDB_valid,
          Vj_out => Vj_out,
          Vk_out => Vk_out,
          control_enable => control_enable,
          busy_out => busy_out,
          busy_enable => busy_enable,
          Clk => Clk,
          Fop_in => Fop_in,
			 ready_for_exec => ready_for_exec,
          Fop_out => Fop_out
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
		
		RF_Vj <= "00000000000000000000000000000001";
		RF_Vk <= "00000000000000000000000000000011";
		RF_Qj <= "00001";
		RF_Qk <= "00001";
		control_enable <= '1';
		busy_enable <= '1';
		Fop_in <= "11";
      wait for Clk_period;
		
		CDB_V <= "10000000000000000000000000000111";
		CDB_Q <= "00001";
		CDB_valid <= '1';
		control_enable <= '0';
		busy_enable <= '0';
      wait for Clk_period;
		
		busy_enable <= '1';
      wait for Clk_period;

      -- insert stimulus here 

      wait;
   end process;

END;
