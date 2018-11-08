--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:07:30 10/26/2018
-- Design Name:   
-- Module Name:   C:/arxitektonikh1/mdl_test.vhd
-- Project Name:  arxitektonikh1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mdl
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
 
ENTITY mdl_test IS
END mdl_test;
 
ARCHITECTURE behavior OF mdl_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mdl
    PORT(
         a_i : IN  std_logic_vector(31 downto 0);
         b_i : IN  std_logic_vector(31 downto 0);
         c_i : IN  std_logic_vector(31 downto 0);
         sel_out : IN  std_logic_vector (0 to 1);
         z_o : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a_i : std_logic_vector(31 downto 0) := (others => '0');
   signal b_i : std_logic_vector(31 downto 0) := (others => '0');
   signal c_i : std_logic_vector(31 downto 0) := (others => '0');
   signal sel_out : std_logic_vector (0 to 1);

 	--Outputs
   signal z_o : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mdl PORT MAP (
          a_i => a_i,
          b_i => b_i,
          c_i => c_i,
          sel_out => sel_out,
          z_o => z_o
        );


   -- Stimulus process
   stim_proc: process
   begin		

		a_i <= "00000000000000000000000000000000";
		b_i <= "00000000000000000000000000000001";
		c_i <= "00000000000000000000000000000010";
		sel_out <= "10";

      wait for 10 ns;
		
		
		a_i <= "00000000000000000000000000000000";
		b_i <= "00000000000000000000000000000001";
		c_i <= "00000000000000000000000000000010";
		sel_out <= "00";

      wait for 10 ns;
		
		a_i <= "00000000000000000000000000000000";
		b_i <= "00000000000000000000000000000001";
		c_i <= "00000000000000000000000000000010";
		sel_out <= "01";

      wait for 10 ns;
		
		a_i <= "00000000000000000000000000000000";
		b_i <= "00000000000000000000000000000001";
		c_i <= "00000000000000000000000000000010";
		sel_out <= "11";		
		
		wait;
   end process;

END;
