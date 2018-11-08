library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mdl is
  port(
    a_i   : in  std_logic_vector(31 downto 0);
    b_i   : in  std_logic_vector(31 downto 0);
    c_i   : in  std_logic_vector(31 downto 0);
    sel_out : in  std_logic_vector(1 downto 0);
    z_o   : out std_logic_vector(31 downto 0));
end entity;

architecture syn of mdl is

signal sel_sign : natural range 0 to 1;
begin
sel_sign <= to_integer(unsigned(sel_out));

  mux_e : entity work.mux_generic
    generic map(
      NUM => 3)
    port map(
      v_i(0) => a_i,
      v_i(1) => b_i,
      v_i(2) => c_i,
      sel_i  =>  sel_sign,
      z_o    => z_o);
end architecture;