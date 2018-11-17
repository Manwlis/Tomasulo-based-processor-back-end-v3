--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:31:25 11/17/2018
-- Design Name:   
-- Module Name:   C:/arxitektonikh1/HRY415-project-2/code/entoles_se_mia_monada.vhd
-- Project Name:  arxitektonikh1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Back_end
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
 
ENTITY entoles_se_mia_monada IS
END entoles_se_mia_monada;
 
ARCHITECTURE behavior OF entoles_se_mia_monada IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Back_end
    PORT(
         issue : IN  std_logic;
         Clk : IN  std_logic;
         FU_type : IN  std_logic_vector(1 downto 0);
         IF_Fop : IN  std_logic_vector(1 downto 0);
         IF_Ri : IN  std_logic_vector(4 downto 0);
         IF_Rj : IN  std_logic_vector(4 downto 0);
         IF_Rk : IN  std_logic_vector(4 downto 0);
         accepted : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal issue : std_logic := '0';
   signal Clk : std_logic := '0';
   signal FU_type : std_logic_vector(1 downto 0) := (others => '0');
   signal IF_Fop : std_logic_vector(1 downto 0) := (others => '0');
   signal IF_Ri : std_logic_vector(4 downto 0) := (others => '0');
   signal IF_Rj : std_logic_vector(4 downto 0) := (others => '0');
   signal IF_Rk : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal accepted : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Back_end PORT MAP (
          issue => issue,
          Clk => Clk,
          FU_type => FU_type,
          IF_Fop => IF_Fop,
          IF_Ri => IF_Ri,
          IF_Rj => IF_Rj,
          IF_Rk => IF_Rk,
          accepted => accepted
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
	
	-- not arxikopoihshs
		wait for Clk_period/2;
			issue <= '1';
			FU_type <= "00";
			IF_Fop <= "10";
			IF_Ri <= "00000";
			IF_Rj <= "00010";
			IF_Rk <= "11010";
			 
      wait for Clk_period;
			issue <= '0';
	
      wait for Clk_period*3;
		
for i in 0 to 2 loop
		
          issue <= '1';
          FU_type <= "01";
          IF_Fop <= "10";
          IF_Ri <= "00001";
          IF_Rj <= "00000";
          IF_Rk <= "00000";
	
		-- shift sto apotelesma ths prwths
      wait for Clk_period;
          issue <= '1';
          FU_type <= "01";
          IF_Fop <= "10";
          IF_Ri <= "00010";
          IF_Rj <= "00000";
          IF_Rk <= "00000";
	
		-- shift sto apotelesma ths prwths
      wait for Clk_period;
          issue <= '1';
          FU_type <= "01";
          IF_Fop <= "10";
          IF_Ri <= "00011";
          IF_Rj <= "00000";
          IF_Rk <= "00000";
	
      wait for Clk_period*2;

		
end loop;
issue <= '0';

      wait;
   end process;

END;
