library ieee;
use ieee.std_logic_1164.all;
use work.mux_p;

entity mux_generic is
  generic(
    NUM : natural);  -- Number of inputs
  port(
    v_i   : in  mux_p.slv_array_t(0 to NUM - 1);
    sel_i : in  natural range 0 to NUM - 1;
    z_o   : out std_logic_vector(31 downto 0));
end entity;

architecture Behavioral of mux_generic is
begin
  z_o <= v_i(sel_i);
end architecture;