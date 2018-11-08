--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:33:07 10/27/2018
-- Design Name:   
-- Module Name:   C:/arxitektonikh1/V_block_test.vhd
-- Project Name:  arxitektonikh1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: V_block
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
 
ENTITY V_block_test IS
END V_block_test;
 
ARCHITECTURE behavior OF V_block_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT V_block
    PORT(
         CDB_value : IN  std_logic_vector(31 downto 0);
         Rj : IN  std_logic_vector(4 downto 0);
         Rk : IN  std_logic_vector(4 downto 0);
         Vj : OUT  std_logic_vector(31 downto 0);
         Vk : OUT  std_logic_vector(31 downto 0);
         V_WrEn : IN  std_logic_vector(31 downto 0);
         Clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CDB_value : std_logic_vector(31 downto 0) := (others => '0');
   signal Rj : std_logic_vector(4 downto 0) := (others => '0');
   signal Rk : std_logic_vector(4 downto 0) := (others => '0');
   signal V_WrEn : std_logic_vector(31 downto 0) := (others => '0');
   signal Clk : std_logic := '0';

 	--Outputs
   signal Vj : std_logic_vector(31 downto 0);
   signal Vk : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: V_block PORT MAP (
          CDB_value => CDB_value,
          Rj => Rj,
          Rk => Rk,
          Vj => Vj,
          Vk => Vk,
          V_WrEn => V_WrEn,
          Clk => Clk
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '1';
		wait for Clk_period/2;
		Clk <= '0';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
		Rj <= "00000";
		Rk <= "00000";
		V_WrEn <= "00000000000000000000000000000001";
		CDB_value <= "11111111111111111111111111111111";

      wait for Clk_period*10;
		
	
		Rj <= "00001";
		Rk <= "00000";
		V_WrEn <= "00000000000000000000000000000010";
		CDB_value <= "11111111111111111111111111111110";
		
      wait for Clk_period*10;


      wait;
   end process;

END;
