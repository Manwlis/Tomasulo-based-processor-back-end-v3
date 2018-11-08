--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:58:05 10/27/2018
-- Design Name:   
-- Module Name:   C:/arxitektonikh1/Qblock_test.vhd
-- Project Name:  arxitektonikh1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Q_block
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
 
ENTITY Qblock_test IS
END Qblock_test;
 
ARCHITECTURE behavior OF Qblock_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Q_block
    PORT(
         Clk : IN  std_logic;
         Ri : IN  std_logic_vector(4 downto 0);
         Rj : IN  std_logic_vector(4 downto 0);
         Rk : IN  std_logic_vector(4 downto 0);
         tag : IN  std_logic_vector(4 downto 0);
         Instr_valid : IN  std_logic;
         CDB_Q : IN  std_logic_vector(4 downto 0);
         CDB_valid : IN  std_logic;
         Qj : OUT  std_logic_vector(4 downto 0);
         Qk : OUT  std_logic_vector(4 downto 0);
         Value_WrEn : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Ri : std_logic_vector(4 downto 0) := (others => '0');
   signal Rj : std_logic_vector(4 downto 0) := (others => '0');
   signal Rk : std_logic_vector(4 downto 0) := (others => '0');
   signal tag : std_logic_vector(4 downto 0) := (others => '0');
   signal Instr_valid : std_logic := '0';
   signal CDB_Q : std_logic_vector(4 downto 0) := (others => '0');
   signal CDB_valid : std_logic := '0';

 	--Outputs
   signal Qj : std_logic_vector(4 downto 0);
   signal Qk : std_logic_vector(4 downto 0);
   signal Value_WrEn : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Q_block PORT MAP (
          Clk => Clk,
          Ri => Ri,
          Rj => Rj,
          Rk => Rk,
          tag => tag,
          Instr_valid => Instr_valid,
          CDB_Q => CDB_Q,
          CDB_valid => CDB_valid,
          Qj => Qj,
          Qk => Qk,
          Value_WrEn => Value_WrEn
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

	
   wait for 100ns;
	Ri <= "00000";
	Rj <= "00001";
	Rk <= "00010";
	tag <= "00011";
	Instr_valid <= '1';
	CDB_Q <= "11111";
	CDB_valid <= '0';
	
   wait for Clk_period;

	Ri <= "00000";
	Rj <= "00000";
	Rk <= "00010";
	tag <= "00011";
	Instr_valid <= '0';
	CDB_Q <= "00011";
	CDB_valid <= '1';
	
	wait for Clk_period;

	Ri <= "00000";
	Rj <= "00011";
	Rk <= "01110";
	tag <= "00111";
	Instr_valid <= '1';
	CDB_Q <= "00111";
	CDB_valid <= '0';
	
	wait for Clk_period;

	Ri <= "00000";
	Rj <= "00011";
	Rk <= "01110";
	tag <= "11111";
	Instr_valid <= '1';
	CDB_Q <= "00111";
	CDB_valid <= '1';
	
      -- insert stimulus here 

      wait;
   end process;

END;
