--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:01:43 12/08/2018
-- Design Name:   
-- Module Name:   C:/arxitektonikh1/HRY415-project-3/code/buffer_line_test.vhd
-- Project Name:  arxitektonikh1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: buffer_line
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
 
ENTITY buffer_line_test IS
END buffer_line_test;
 
ARCHITECTURE behavior OF buffer_line_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT buffer_line
    PORT(
         Clk : IN  std_logic;
         cdb_valid : IN  std_logic;
         cdb_Q : IN  std_logic_vector(4 downto 0);
         cdb_V : IN  std_logic_vector(31 downto 0);
         Ri_in : IN  std_logic_vector(4 downto 0);
         Fu_type_in : IN  std_logic_vector(1 downto 0);
         Exception_in : IN  std_logic;
         Exception_out : OUT  std_logic;
         Fu_type_out : OUT  std_logic_vector(1 downto 0);
         valid_out : OUT  std_logic;
         done_out : OUT  std_logic;
         commit : IN  std_logic;
         issue : IN  std_logic;
         tag : IN  std_logic_vector(4 downto 0);
         Rj : IN  std_logic_vector(4 downto 0);
         Rk : IN  std_logic_vector(4 downto 0);
         j_equal : OUT  std_logic;
         k_equal : OUT  std_logic;
         Ri_out : OUT  std_logic_vector(4 downto 0);
         V_out : OUT  std_logic_vector(31 downto 0);
         PC_entolhs : IN  std_logic_vector(31 downto 0);
         PC_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal cdb_valid : std_logic := '0';
   signal cdb_Q : std_logic_vector(4 downto 0) := (others => '0');
   signal cdb_V : std_logic_vector(31 downto 0) := (others => '0');
   signal Ri_in : std_logic_vector(4 downto 0) := (others => '0');
   signal Fu_type_in : std_logic_vector(1 downto 0) := (others => '0');
   signal Exception_in : std_logic := '0';
   signal commit : std_logic := '0';
   signal issue : std_logic := '0';
   signal tag : std_logic_vector(4 downto 0) := (others => '0');
   signal Rj : std_logic_vector(4 downto 0) := (others => '0');
   signal Rk : std_logic_vector(4 downto 0) := (others => '0');
   signal PC_entolhs : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Exception_out : std_logic;
   signal Fu_type_out : std_logic_vector(1 downto 0);
   signal valid_out : std_logic;
   signal done_out : std_logic;
   signal j_equal : std_logic;
   signal k_equal : std_logic;
   signal Ri_out : std_logic_vector(4 downto 0);
   signal V_out : std_logic_vector(31 downto 0);
   signal PC_out : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: buffer_line PORT MAP (
          Clk => Clk,
          cdb_valid => cdb_valid,
          cdb_Q => cdb_Q,
          cdb_V => cdb_V,
          Ri_in => Ri_in,
          Fu_type_in => Fu_type_in,
          Exception_in => Exception_in,
          Exception_out => Exception_out,
          Fu_type_out => Fu_type_out,
          valid_out => valid_out,
          done_out => done_out,
          commit => commit,
          issue => issue,
          tag => tag,
          Rj => Rj,
          Rk => Rk,
          j_equal => j_equal,
          k_equal => k_equal,
          Ri_out => Ri_out,
          V_out => V_out,
          PC_entolhs => PC_entolhs,
          PC_out => PC_out
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
		
		-- issue entolhs
		
		-- cdb
		cdb_valid <= '0';
		cdb_Q <= "00000";
		cdb_V <= "00000000000000000000000000000000";
		-- issue
		Ri_in <= "00001";
		Fu_type_in <= "00";
		-- exception
		Exception_in <= '0';
		PC_entolhs <= "00000000000000000000000000000001";
		-- apo control
		commit <= '0';
		issue <= '1';
		
		tag <= "00100";
		
      wait for Clk_period;
		
		-- erxontai ta apotelesmata apo cdb
		issue <= '0';
		
		cdb_valid <= '1';
		cdb_Q <= "00100";
		cdb_V <= "00000000000000000000000000000011";
		
      wait for Clk_period;
		cdb_valid <= '0';
		
		-- exception
		Exception_in <= '1';
		wait for Clk_period;
		
		-- tou leei to control na kanei commit
		Exception_in <= '0';
		commit <= '1';
		
      wait for Clk_period;
		commit <= '0';
		issue <= '1';
		PC_entolhs <= "00000000000000000000000000000101";

      wait;
   end process;

END;
