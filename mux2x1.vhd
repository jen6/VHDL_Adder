library ieee;
use ieee.std_logic_1164.all;

entity mux2x1 is
    port (a,b,s : in std_logic;
                o : out std_logic);
end mux2x1;

architecture arch_mux2x1 of mux2x1 is
begin
    o <= ( a and not s ) or ( b and s);
end arch_mux2x1;