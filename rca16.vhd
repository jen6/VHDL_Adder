library ieee;
use ieee.std_logic_1164.all;
--ripple carry adder
entity rca16 is
    port ( a, b : in std_logic_vector(15 downto 0);
                cin : in std_logic;
                s : out std_logic_vector(15 downto 0);
                cout : out std_logic);
end entity rca16;

architecture arch_rca16 of rca16 is

component fa is
    port ( a, b, cin : in std_logic;
            s, cout : out std_logic);
end component;

signal c_tmp : std_logic_vector(15 downto 0);

begin
     fa0 : fa port map ( a(1),b(1), cin, s(0), c_tmp(0) );
     fa_gen : for i in 15 downto 1 generate
        fa15 : fa port map ( a(i), b(i), c_tmp(i-1), s(i), c_tmp(i) );
    end generate;
    cout <= c_tmp(15);
end arch_rca16;

