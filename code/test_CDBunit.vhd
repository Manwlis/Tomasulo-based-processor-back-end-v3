--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:49:30 10/23/2018
-- Design Name:   
-- Module Name:   C:/arxitektonikh1/test_CDBunit.vhd
-- Project Name:  arxitektonikh1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CDBunit
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
 
ENTITY test_CDBunit IS
END test_CDBunit;
 
ARCHITECTURE behavior OF test_CDBunit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CDBunit
    PORT(
         Clk : IN  std_logic;
         CDBout : OUT  std_logic_vector(37 downto 0);
         grant : OUT  std_logic_vector(2 downto 0);
         request : IN  std_logic_vector(2 downto 0);
         Q1 : IN  std_logic_vector(4 downto 0);
         Q2 : IN  std_logic_vector(4 downto 0);
         Q3 : IN  std_logic_vector(4 downto 0);
         Value1 : IN  std_logic_vector(31 downto 0);
         Value2 : IN  std_logic_vector(31 downto 0);
         Value3 : IN  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal request : std_logic_vector(2 downto 0) := (others => '0');
   signal Q1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Q2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Q3 : std_logic_vector(4 downto 0) := (others => '0');
   signal Value1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Value2 : std_logic_vector(31 downto 0) := (others => '0');
   signal Value3 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal CDBout : std_logic_vector(37 downto 0);
   signal grant : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CDBunit PORT MAP (
          Clk => Clk,
          CDBout => CDBout,
          grant => grant,
          request => request,
          Q1 => Q1,
          Q2 => Q2,
          Q3 => Q3,
          Value1 => Value1,
          Value2 => Value2,
          Value3 => Value3
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
		request <= "100";
      wait for Clk_period;
		Q1 <= "00001";
		Q2 <= "00010";
		Q3 <= "00100";
		Value1 <= "00000000000000000000000000001001";
		Value2 <= "00000000000000000000000000001010";
		Value3 <= "00000000000000000000000000001100";
		request <= "010";
		
      wait for Clk_period;
		Q1 <= "00001";
		Q2 <= "00010";
		Q3 <= "00100";
		Value1 <= "00000000000000000000000000001001";
		Value2 <= "00000000000000000000000000001010";
		Value3 <= "00000000000000000000000000001100";
		request <= "001";
		
		wait for Clk_period;

		request <= "101";
		wait for Clk_period;

		request <= "111";
		wait for Clk_period*2;
		request<="000";
      wait;
   end process;

END;
