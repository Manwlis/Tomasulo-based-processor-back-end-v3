library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Q_block is
	Port (
		Clk : in std_logic;
		Ri : in  STD_LOGIC_VECTOR (4 downto 0);
		Rj : in  STD_LOGIC_VECTOR (4 downto 0);
		Rk : in  STD_LOGIC_VECTOR (4 downto 0);
		tag : in  STD_LOGIC_VECTOR (4 downto 0);
		Instr_valid : in  STD_LOGIC;
		CDB_Q : in  STD_LOGIC_VECTOR (4 downto 0);
		CDB_valid : in  STD_LOGIC;
		Qj : out  STD_LOGIC_VECTOR (4 downto 0);
		Qk : out  STD_LOGIC_VECTOR (4 downto 0);
		Value_WrEn : out  STD_LOGIC_VECTOR (31 downto 0));
end Q_block;

architecture Behavioral of Q_block is


COMPONENT mux32to1_5Bit
	port( 
		in0 : in  STD_LOGIC_VECTOR (4 downto 0);
		in1 : in  STD_LOGIC_VECTOR (4 downto 0);
		in2 : in  STD_LOGIC_VECTOR (4 downto 0);
		in3 : in  STD_LOGIC_VECTOR (4 downto 0);
		in4 : in  STD_LOGIC_VECTOR (4 downto 0);
		in5 : in  STD_LOGIC_VECTOR (4 downto 0);
		in6 : in  STD_LOGIC_VECTOR (4 downto 0);
		in7 : in  STD_LOGIC_VECTOR (4 downto 0);
		in8 : in  STD_LOGIC_VECTOR (4 downto 0);
		in9 : in  STD_LOGIC_VECTOR (4 downto 0);
		in10 : in  STD_LOGIC_VECTOR (4 downto 0);
		in11 : in  STD_LOGIC_VECTOR (4 downto 0);
		in12 : in  STD_LOGIC_VECTOR (4 downto 0);
		in13 : in  STD_LOGIC_VECTOR (4 downto 0);
		in14 : in  STD_LOGIC_VECTOR (4 downto 0);
		in15 : in  STD_LOGIC_VECTOR (4 downto 0);
		in16 : in  STD_LOGIC_VECTOR (4 downto 0);
		in17 : in  STD_LOGIC_VECTOR (4 downto 0);
		in18 : in  STD_LOGIC_VECTOR (4 downto 0);
		in19 : in  STD_LOGIC_VECTOR (4 downto 0);
		in20 : in  STD_LOGIC_VECTOR (4 downto 0);
		in21 : in  STD_LOGIC_VECTOR (4 downto 0);
		in22 : in  STD_LOGIC_VECTOR (4 downto 0);
		in23 : in  STD_LOGIC_VECTOR (4 downto 0);
		in24 : in  STD_LOGIC_VECTOR (4 downto 0);
		in25 : in  STD_LOGIC_VECTOR (4 downto 0);
		in26 : in  STD_LOGIC_VECTOR (4 downto 0);
		in27 : in  STD_LOGIC_VECTOR (4 downto 0);
		in28 : in  STD_LOGIC_VECTOR (4 downto 0);
		in29 : in  STD_LOGIC_VECTOR (4 downto 0);
		in30 : in  STD_LOGIC_VECTOR (4 downto 0);
		in31 : in  STD_LOGIC_VECTOR (4 downto 0);
		sel : in  STD_LOGIC_VECTOR (4 downto 0);
		output : out  STD_LOGIC_VECTOR (4 downto 0));
end COMPONENT;

COMPONENT demux5to32
	Port ( 
		sel : in  STD_LOGIC_VECTOR (4 downto 0);
		input : in  STD_LOGIC;
		output : out  STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

COMPONENT mux5Bit
	port(
		sel : in  STD_LOGIC;
		A : in  STD_LOGIC_VECTOR (4 downto 0);
		B : in  STD_LOGIC_VECTOR (4 downto 0);
		Outt : out  STD_LOGIC_VECTOR (4 downto 0));
END COMPONENT;

COMPONENT Reg5BitR
	port(
		Clk,WrEn,Reset : in std_logic;
		Din : in  STD_LOGIC_VECTOR (4 downto 0);
		Dout : out std_logic_VECTOR (4 downto 0)); 
END COMPONENT;

signal demuxOut, reg_enable, comp_out : std_logic_VECTOR (31 downto 0); 

type array32_5 is array (0 to 31) of std_logic_vector(4 downto 0);
signal Qreq_in, Qreg_out, Qreg_no_fw : array32_5;

begin

GEN : for i in 0 to 31 generate

	muxQin : mux5Bit
	port map (
		A => "00000",
		B => tag,
		sel => demuxOut(i),
		Outt => Qreq_in(i));
	 
	Qreg : Reg5BitR
	port map (
		Clk => Clk,
		WrEn => reg_enable(i),
		Reset => '0',
		Din => Qreq_in(i),
		Dout => Qreg_no_fw(i));
		
	comp_out(i) <= 
		(Qreg_no_fw(i)(0) xnor CDB_Q(0)) and
		(Qreg_no_fw(i)(1) xnor CDB_Q(1)) and
		(Qreg_no_fw(i)(2) xnor CDB_Q(2)) and
		(Qreg_no_fw(i)(3) xnor CDB_Q(3)) and
		(Qreg_no_fw(i)(4) xnor CDB_Q(4))
		when CDB_valid = '1' else '0';
		
	reg_enable(i) <= comp_out(i) or demuxOut(i);
	Value_WrEn(i) <= comp_out(i);
	
	mux_forward : mux5Bit
	port map (
		A => Qreg_no_fw(i),
		B => Qreq_in(i),
		sel => comp_out(i),
		Outt => Qreg_out(i));
end generate GEN;

demuxQ : demux5to32
port map (
	sel => Ri,
	input => Instr_valid,
	output => demuxOut);
	
muxj : mux32to1_5Bit
port map( 
	in0 => Qreg_out(0),
	in1 => Qreg_out(1),
	in2 => Qreg_out(2),
	in3 => Qreg_out(3),
	in4 => Qreg_out(4),
	in5 => Qreg_out(5),
	in6 => Qreg_out(6),
	in7 => Qreg_out(7),
	in8 => Qreg_out(8),
	in9 => Qreg_out(9),
	in10 => Qreg_out(10),
	in11 => Qreg_out(11),
	in12 => Qreg_out(12),
	in13 => Qreg_out(13),
	in14 => Qreg_out(14),
	in15 => Qreg_out(15),
	in16 => Qreg_out(16),
	in17 => Qreg_out(17),
	in18 => Qreg_out(18),
	in19 => Qreg_out(19),
	in20 => Qreg_out(20),
	in21 => Qreg_out(21),
	in22 => Qreg_out(22),
	in23 => Qreg_out(23),
	in24 => Qreg_out(24),
	in25 => Qreg_out(25),
	in26 => Qreg_out(26),
	in27 => Qreg_out(27),
	in28 => Qreg_out(28),
	in29 => Qreg_out(29),
	in30 => Qreg_out(30),
	in31 => Qreg_out(31),
	sel => Rj,
	output => Qj);

muxk : mux32to1_5Bit
port map( 
	in0 => Qreg_out(0),
	in1 => Qreg_out(1),
	in2 => Qreg_out(2),
	in3 => Qreg_out(3),
	in4 => Qreg_out(4),
	in5 => Qreg_out(5),
	in6 => Qreg_out(6),
	in7 => Qreg_out(7),
	in8 => Qreg_out(8),
	in9 => Qreg_out(9),
	in10 => Qreg_out(10),
	in11 => Qreg_out(11),
	in12 => Qreg_out(12),
	in13 => Qreg_out(13),
	in14 => Qreg_out(14),
	in15 => Qreg_out(15),
	in16 => Qreg_out(16),
	in17 => Qreg_out(17),
	in18 => Qreg_out(18),
	in19 => Qreg_out(19),
	in20 => Qreg_out(20),
	in21 => Qreg_out(21),
	in22 => Qreg_out(22),
	in23 => Qreg_out(23),
	in24 => Qreg_out(24),
	in25 => Qreg_out(25),
	in26 => Qreg_out(26),
	in27 => Qreg_out(27),
	in28 => Qreg_out(28),
	in29 => Qreg_out(29),
	in30 => Qreg_out(30),
	in31 => Qreg_out(31),
	sel => Rk,
	output => Qk);
	
end Behavioral;

