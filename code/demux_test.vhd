LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY demux_test IS
END demux_test;
 
ARCHITECTURE behavior OF demux_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT demux5to32
    PORT(
         sel : IN  std_logic_vector(4 downto 0);
         input : IN  std_logic;
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal sel : std_logic_vector(4 downto 0) := (others => '0');
   signal input : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: demux5to32 PORT MAP (
          sel => sel,
          input => input,
          output => output
        );


   -- Stimulus process
   stim_proc: process
   begin		
      
		sel <= "00000";
		input <= '1';
		
      wait for 100 ns;	
		sel <= "00001";
		input <= '1';
		
      wait for 100 ns;	
		sel <= "00001";
		input <= '0';
		
      wait;
   end process;

END;
