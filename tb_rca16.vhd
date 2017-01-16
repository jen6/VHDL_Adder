library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--ripple carry adder

entity tb_rca16 is
end entity tb_rca16;

architecture arch_tb_rca16 of tb_rca16 is

component rca16 is
    port ( a, b : in std_logic_vector(15 downto 0);
                cin : in std_logic;
                s : out std_logic_vector(15 downto 0);
                cout : out std_logic);
end component rca16;

signal a_in, b_in, s_out : std_logic_vector(15 downto 0);
signal c_in, c_out : std_logic;

begin  
    rca16_map : rca16  port map(a_in, b_in, c_in, s_out, c_out);

    a_in_proc : process
    variable tmp_a : integer := 4;
    begin  
        a_in <= std_logic_vector(to_unsigned(tmp_a, 16));
        wait for 340 ns;
        tmp_a := tmp_a + 1;
    end process;

    
    b_in_proc : process
    variable tmp_b : integer := 0;
    begin
        b_in <= std_logic_vector(to_unsigned(tmp_b, 16));
        wait for 680 ns;
        tmp_b := tmp_b + 10;
    end process;

    c_in_proc : process
    begin
        c_in <= '0';
        wait for 1360 ns;
        c_in <= '1';
        wait for 1360 ns;
    end process;

end arch_tb_rca16;