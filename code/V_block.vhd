library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity V_block is
    Port ( CDB_value : in  STD_LOGIC_VECTOR (31 downto 0);
           Rj : in  STD_LOGIC_VECTOR (4 downto 0);
           Rk : in  STD_LOGIC_VECTOR (4 downto 0);
           Vj : out  STD_LOGIC_VECTOR (31 downto 0);
           Vk : out  STD_LOGIC_VECTOR (31 downto 0);
           V_WrEn : in  STD_LOGIC_VECTOR (31 downto 0);
			  Clk : in  STD_LOGIC);
end V_block;

architecture Behavioral of V_block is

COMPONENT Reg32BitR
	port(
		Clk,WrEn,Reset : in std_logic;
		Din : in  STD_LOGIC_VECTOR (31 downto 0);
		Dout : out std_logic_VECTOR (31 downto 0)); 
END COMPONENT;

COMPONENT mux32Bit
port
(sel : in  STD_LOGIC;
 A : in  STD_LOGIC_VECTOR (31 downto 0);
 B : in  STD_LOGIC_VECTOR (31 downto 0);
 Outt : out  STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

COMPONENT mux32to1_32Bit is
    Port ( 
		in0 : in  STD_LOGIC_VECTOR (31 downto 0);
		in1 : in  STD_LOGIC_VECTOR (31 downto 0);
		in2 : in  STD_LOGIC_VECTOR (31 downto 0);
		in3 : in  STD_LOGIC_VECTOR (31 downto 0);
		in4 : in  STD_LOGIC_VECTOR (31 downto 0);
		in5 : in  STD_LOGIC_VECTOR (31 downto 0);
		in6 : in  STD_LOGIC_VECTOR (31 downto 0);
		in7 : in  STD_LOGIC_VECTOR (31 downto 0);
		in8 : in  STD_LOGIC_VECTOR (31 downto 0);
		in9 : in  STD_LOGIC_VECTOR (31 downto 0);
		in10 : in  STD_LOGIC_VECTOR (31 downto 0);
		in11 : in  STD_LOGIC_VECTOR (31 downto 0);
		in12 : in  STD_LOGIC_VECTOR (31 downto 0);
		in13 : in  STD_LOGIC_VECTOR (31 downto 0);
		in14 : in  STD_LOGIC_VECTOR (31 downto 0);
		in15 : in  STD_LOGIC_VECTOR (31 downto 0);
		in16 : in  STD_LOGIC_VECTOR (31 downto 0);
		in17 : in  STD_LOGIC_VECTOR (31 downto 0);
		in18 : in  STD_LOGIC_VECTOR (31 downto 0);
		in19 : in  STD_LOGIC_VECTOR (31 downto 0);
		in20 : in  STD_LOGIC_VECTOR (31 downto 0);
		in21 : in  STD_LOGIC_VECTOR (31 downto 0);
		in22 : in  STD_LOGIC_VECTOR (31 downto 0);
		in23 : in  STD_LOGIC_VECTOR (31 downto 0);
		in24 : in  STD_LOGIC_VECTOR (31 downto 0);
		in25 : in  STD_LOGIC_VECTOR (31 downto 0);
		in26 : in  STD_LOGIC_VECTOR (31 downto 0);
		in27 : in  STD_LOGIC_VECTOR (31 downto 0);
		in28 : in  STD_LOGIC_VECTOR (31 downto 0);
		in29 : in  STD_LOGIC_VECTOR (31 downto 0);
		in30 : in  STD_LOGIC_VECTOR (31 downto 0);
		in31 : in  STD_LOGIC_VECTOR (31 downto 0);
		sel : in  STD_LOGIC_VECTOR (4 downto 0);
		output : out  STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

type array32_32 is array (0 to 31) of std_logic_vector(31 downto 0);
signal Vreg_out,Vreg_no_fw : array32_32;

begin

GEN : for i in 0 to 31 generate
	 
	Vreg : Reg32BitR
	port map (
		Clk => Clk,
		WrEn => V_WrEn(i),
		Reset => '0',
		Din => CDB_value,
		Dout => Vreg_no_fw(i));
		
mux_forward :mux32Bit
	port map(
		A => Vreg_no_fw(i),
		B => CDB_value,
		sel => V_WrEn(i),
		Outt => Vreg_out(i));

end generate GEN;

muxj : mux32to1_32Bit
port map( 
	in0 => Vreg_out(0),
	in1 => Vreg_out(1),
	in2 => Vreg_out(2),
	in3 => Vreg_out(3),
	in4 => Vreg_out(4),
	in5 => Vreg_out(5),
	in6 => Vreg_out(6),
	in7 => Vreg_out(7),
	in8 => Vreg_out(8),
	in9 => Vreg_out(9),
	in10 => Vreg_out(10),
	in11 => Vreg_out(11),
	in12 => Vreg_out(12),
	in13 => Vreg_out(13),
	in14 => Vreg_out(14),
	in15 => Vreg_out(15),
	in16 => Vreg_out(16),
	in17 => Vreg_out(17),
	in18 => Vreg_out(18),
	in19 => Vreg_out(19),
	in20 => Vreg_out(20),
	in21 => Vreg_out(21),
	in22 => Vreg_out(22),
	in23 => Vreg_out(23),
	in24 => Vreg_out(24),
	in25 => Vreg_out(25),
	in26 => Vreg_out(26),
	in27 => Vreg_out(27),
	in28 => Vreg_out(28),
	in29 => Vreg_out(29),
	in30 => Vreg_out(30),
	in31 => Vreg_out(31),
	sel => Rj,
	output => Vj);
	
muxk : mux32to1_32Bit
port map( 
	in0 => Vreg_out(0),
	in1 => Vreg_out(1),
	in2 => Vreg_out(2),
	in3 => Vreg_out(3),
	in4 => Vreg_out(4),
	in5 => Vreg_out(5),
	in6 => Vreg_out(6),
	in7 => Vreg_out(7),
	in8 => Vreg_out(8),
	in9 => Vreg_out(9),
	in10 => Vreg_out(10),
	in11 => Vreg_out(11),
	in12 => Vreg_out(12),
	in13 => Vreg_out(13),
	in14 => Vreg_out(14),
	in15 => Vreg_out(15),
	in16 => Vreg_out(16),
	in17 => Vreg_out(17),
	in18 => Vreg_out(18),
	in19 => Vreg_out(19),
	in20 => Vreg_out(20),
	in21 => Vreg_out(21),
	in22 => Vreg_out(22),
	in23 => Vreg_out(23),
	in24 => Vreg_out(24),
	in25 => Vreg_out(25),
	in26 => Vreg_out(26),
	in27 => Vreg_out(27),
	in28 => Vreg_out(28),
	in29 => Vreg_out(29),
	in30 => Vreg_out(30),
	in31 => Vreg_out(31),
	sel => Rk,
	output => Vk);

end Behavioral;

