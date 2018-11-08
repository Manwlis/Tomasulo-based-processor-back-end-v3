--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:53:14 10/27/2018
-- Design Name:   
-- Module Name:   C:/arxitektonikh1/Issue_unit_test.vhd
-- Project Name:  arxitektonikh1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Issue_unit
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
         tag1 : IN  std_logic_vector(4 downto 0);
         tag2 : IN  std_logic_vector(4 downto 0);
         tag3 : IN  std_logic_vector(4 downto 0);
         tagRF : OUT  std_logic_vector(4 downto 0)
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
   signal tag1 : std_logic_vector(4 downto 0) := (others => '0');
   signal tag2 : std_logic_vector(4 downto 0) := (others => '0');
   signal tag3 : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal accepted : std_logic;
   signal issueRS : std_logic_vector(2 downto 0);
   signal Instr_valid : std_logic;
   signal Fop : std_logic_vector(1 downto 0);
   signal Ri : std_logic_vector(4 downto 0);
   signal Rj : std_logic_vector(4 downto 0);
   signal Rk : std_logic_vector(4 downto 0);
   signal tagRF : std_logic_vector(4 downto 0);
	signal clock : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period : time := 50 ns;
 
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
          tag1 => tag1,
          tag2 => tag2,
          tag3 => tag3,
          tagRF => tagRF
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for clock_period/2;
		-- oxi availble autos pou zitaei
		issue <= '1';
		FU_type <= "00";
		IF_Fop <= "00";
		IF_Ri <= "00000";
		IF_Rj <= "00000";
		IF_Rk <= "00000";
		available <="011";
		tag1 <= "00001";
		tag2 <= "00010";
		tag3 <= "00011";
      wait for clock_period;

		-- availble autos pou zitaei
		issue <= '1';
		FU_type <= "00";
		IF_Fop <= "00";
		IF_Ri <= "10000";
		IF_Rj <= "11000";
		IF_Rk <= "11100";
		available <="111";
      wait for clock_period;

		-- ena issue ana kuklo
		issue <= '1';
		FU_type <= "01";
		available <= "111";
      wait for clock_period;
		
		issue <= '1';
		FU_type <= "10";
		available <= "111";
      wait for clock_period;
		
		-- issue = 0
		issue <= '0';
		FU_type <= "01";
		IF_Fop <= "00";
		available <= "111";
      wait for clock_period;
		
		-- deadlock
		issue <= '1';
		FU_type <= "11";
		IF_Fop <= "11";
		IF_Ri <= "00000";
		IF_Rj <= "00000";
		IF_Rk <= "00000";
		available <= "011";
		
		tag1 <= "10000";
		tag2 <= "10000";
		tag3 <= "10000";
      wait for clock_period;
      wait;
   end process;

END;
