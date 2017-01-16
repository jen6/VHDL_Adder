library ieee;
use ieee.std_logic_1164.all;

entity tb_fa is
    end entity;

architecture arch_tb_fa of tb_fa is

component fa is
    port (a, b, cin : in std_logic;
                s, cout : out std_logic);
end component;

signal a_in, b_in, c_in, s_out, c_out : std_logic;

begin
    fa_map : fa  port map(a_in, b_in, c_in, s_out, c_out);

    a_input : process
    begin
        a_in <= '0';
        wait for 80 ns;
        a_in <= '1';
        wait for 80 ns;
    end process;

    b_input : process
    begin
        b_in <= '0';
        wait for 40 ns;
        b_in <= '1';
        wait for 40 ns;
    end process;

    c_input : process
    begin
        c_in <= '0';
        wait for 20 ns;
        c_in <= '1';
        wait for 20 ns;
    end process;
end arch_tb_fa;