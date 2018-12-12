--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:48:44 12/11/2018
-- Design Name:   
-- Module Name:   C:/arxitektonikh1/HRY415-project-3/code/pointer_test.vhd
-- Project Name:  arxitektonikh1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pointer
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
 
ENTITY pointer_test IS
END pointer_test;
 
ARCHITECTURE behavior OF pointer_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pointer
    PORT(
         j_flags : IN  std_logic_vector(7 downto 0);
         head_encoded : IN  std_logic_vector(2 downto 0);
         forward_sel_j : OUT  std_logic_vector(2 downto 0);
         forward_control_j : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal j_flags : std_logic_vector(7 downto 0) := (others => '0');
   signal head_encoded : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal forward_sel_j : std_logic_vector(2 downto 0);
   signal forward_control_j : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pointer PORT MAP (
          j_flags => j_flags,
          head_encoded => head_encoded,
          forward_sel_j => forward_sel_j,
          forward_control_j => forward_control_j
        );



   -- Stimulus process
   stim_proc: process
   begin		
	
		j_flags <= "11111111";
		head_encoded <= "010";
		wait for 100 ns;	

		j_flags <= "11110111";
		head_encoded <= "010";
		wait for 100 ns;	

		j_flags <= "11100111";
		head_encoded <= "010";
		wait for 100 ns;	

		j_flags <= "11000111";
		head_encoded <= "010";
		wait for 100 ns;	

		j_flags <= "10000111";
		head_encoded <= "010";
		wait for 100 ns;	

		j_flags <= "00000111";
		head_encoded <= "010";
		wait for 100 ns;	
		
		j_flags <= "00000110";
		head_encoded <= "010";
		wait for 100 ns;	
		
		j_flags <= "00000100";
		head_encoded <= "010";
		wait for 100 ns;	
		
		j_flags <= "00000000";
		head_encoded <= "010";
		wait for 100 ns;	
      -- insert stimulus here 

      wait;
   end process;

END;
