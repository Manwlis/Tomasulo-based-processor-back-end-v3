library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CDB_control is
    Port ( request : in  STD_LOGIC_VECTOR (2 downto 0);
           grant : out  STD_LOGIC_VECTOR (2 downto 0);
           CDBvalid : out  STD_LOGIC;
           sel : out  STD_LOGIC_VECTOR (1 downto 0);
			  Clk : in STD_LOGIC);
end CDB_control;

architecture Behavioral of CDB_control is

signal sig_grant : STD_LOGIC_VECTOR (2 downto 0);

type state is (grantA, grantB, grantC, grant0);
signal currentState, nextState: state;

begin

	control: process (request,currentState)
	begin
		case request is
			
			--	xwris sigkrouseis
			when "100" =>
				sel <= "00";
				sig_grant <= "100";
				CDBvalid <= '1';

			when "010" =>
				sel <= "01";
				sig_grant <= "010";
				CDBvalid <= '1';
				
			when "001" =>
				sel <= "10";
				sig_grant <= "001";
				CDBvalid <= '1';
				
			--	me sigkrouseis	
			when "011" =>
				if currentState = grantB then 
					sel <= "10";
					sig_grant <= "001";
					CDBvalid <= '1';	
				else 
					sel <= "01";
					sig_grant <= "010";
					CDBvalid <= '1';
				end if;
					
			when "101" =>
				if currentState = grantA then 
					sel <= "10";
					sig_grant <= "001";
					CDBvalid <= '1';
				else 
					sel <= "00";
					sig_grant <= "100";
					CDBvalid <= '1';
				end if;
				
			when "110" =>
				if currentState = grantA then 
					sel <= "01";
					sig_grant <= "010";
					CDBvalid <= '1';
				else 
					sel <= "00";
					sig_grant <= "100";
					CDBvalid <= '1';					
				end if;
				
			when "111" =>
				if currentState = grantA then 
					sel <= "01";
					sig_grant <= "010";
					CDBvalid <= '1';
				elsif currentState = grantB then
					sel <= "10";
					sig_grant <= "001";
					CDBvalid <= '1';					
				else 
					sel <= "00";
					sig_grant <= "100";
					CDBvalid <= '1';					
				end if;
				
			--	kanenas	
			when others =>
				sel <= "11";
				sig_grant <= "000";
				CDBvalid <= '0';
		end case;	
	end process;

	-- 8imatai piws xrhsimopoihse to cdb ton proigoumeno kuklo
	round_robbing_mem: process (currentState,sig_grant)
	begin

		if sig_grant = "100" then
			nextState <= grantA;
		elsif sig_grant = "010" then
			nextState <= grantB;
		elsif sig_grant = "001" then
			nextState <= grantC;
		else 
			nextState <= grant0;
		end if;

	end process;
	
	-- roloi
	FSM_CLOCK:  PROCESS (Clk)
	begin
		if (rising_edge(Clk)) then 
			currentState <= nextState;
		end if;
	end process;
	
grant <= sig_grant;

end Behavioral;

