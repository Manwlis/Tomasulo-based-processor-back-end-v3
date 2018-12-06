library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity V_block is
    Port ( -- commit
           commit : in  STD_LOGIC;
           commit_reg : in  STD_LOGIC_VECTOR (4 downto 0);
           commit_data : in  STD_LOGIC_VECTOR (31 downto 0);
			  -- diavasma kataxwrhtwn
			  Rj : in  STD_LOGIC_VECTOR (4 downto 0);
           Rk : in  STD_LOGIC_VECTOR (4 downto 0);
           forward_data_j : in  STD_LOGIC_VECTOR (31 downto 0);
           forward_data_k : in  STD_LOGIC_VECTOR (31 downto 0);
			  forward_control_j : in  STD_LOGIC;
			  forward_control_k : in  STD_LOGIC;
           Vj : out  STD_LOGIC_VECTOR (31 downto 0);
           Vk : out  STD_LOGIC_VECTOR (31 downto 0);
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

COMPONENT demux5to32 is
	Port ( 
		sel : in  STD_LOGIC_VECTOR (4 downto 0);
		input : in  STD_LOGIC;
		output : out  STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

type array32_32 is array (0 to 31) of std_logic_vector(31 downto 0);
signal Vreg_out : array32_32;

signal reg_enable, Vk_no_fw, Vj_no_fw : std_logic_vector(31 downto 0);
begin

demux_commit : demux5to32
	port map(
		sel => commit_reg,
		input => commit,
		output => reg_enable);

GEN : for i in 0 to 31 generate
	 
	Vreg : Reg32BitR
	port map (
		Clk => Clk,
		WrEn => reg_enable(i),
		Reset => '0',
		Din => commit_data,
		Dout => Vreg_out(i));

end generate GEN;

-- read port 1
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
	output => Vj_no_fw);
	
-- read port 2
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
	output => Vk_no_fw);

-- forward apo buffers ---------------------------------------------

forward_mux_j : mux32Bit
	port map(
		sel => forward_control_j,
		A => Vj_no_fw,
		B => forward_data_j,
		Outt => Vj);

forward_mux_k : mux32Bit
	port map(
		sel => forward_control_k,
		A => Vk_no_fw,
		B => forward_data_k,
		Outt => Vk);

end Behavioral;