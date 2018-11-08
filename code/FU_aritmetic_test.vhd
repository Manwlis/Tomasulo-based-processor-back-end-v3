--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:08:37 10/24/2018
-- Design Name:   
-- Module Name:   C:/arxitektonikh1/FU_aritmetic_test.vhd
-- Project Name:  arxitektonikh1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FU_arithmetic
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
 
ENTITY FU_aritmetic_test IS
END FU_aritmetic_test;
 
ARCHITECTURE behavior OF FU_aritmetic_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FU_arithmetic
    PORT(
         tag : IN  std_logic_vector(4 downto 0);
         op : IN  std_logic_vector(1 downto 0);
         value_in1 : IN  std_logic_vector(31 downto 0);
         value_in2 : IN  std_logic_vector(31 downto 0);
         ready : OUT  std_logic;
         value_out : OUT  std_logic_vector(31 downto 0);
         Q : OUT  std_logic_vector(4 downto 0);
         request : OUT  std_logic;
         grant : IN  std_logic;
         Clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal tag : std_logic_vector(4 downto 0) := (others => '0');
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal value_in1 : std_logic_vector(31 downto 0) := (others => '0');
   signal value_in2 : std_logic_vector(31 downto 0) := (others => '0');
   signal grant : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal ready : std_logic;
   signal value_out : std_logic_vector(31 downto 0);
   signal Q : std_logic_vector(4 downto 0);
   signal request : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FU_arithmetic PORT MAP (
          tag => tag,
          op => op,
          value_in1 => value_in1,
          value_in2 => value_in2,
          ready => ready,
          value_out => value_out,
          Q => Q,
          request => request,
          grant => grant,
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
	
		wait for Clk_period;
		tag <= "00001";
		op <= "00";
		value_in1 <= "00000000000000000000000000000000";
		value_in2 <= "00000000000000000000000000000001";
		
      wait for Clk_period;
		grant <= '1';
		
      wait;
   end process;

END;
