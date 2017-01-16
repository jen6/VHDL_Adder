library ieee;
use ieee.std_logic_1164.all;

entity csa64 is
  port (
    a, b : in std_logic_vector(63 downto 0);
    cin : in std_logic;
    s : out std_logic_vector(63 downto 0);
    cout: out std_logic);
end  csa64;

architecture arch_csa64 of csa64 is

component csa16 is
    port( a,b : in std_logic_vector(15 downto 0);
                cin : in std_logic;
                s : out std_logic_vector(15 downto 0);
                cout : out std_logic);
end component csa16;

signal ctmp : std_logic_vector(2 downto 0);
signal stmp : std_logic_vector(63 downto 0);

alias s0 is s(15 downto 0);
alias s1 is s(31 downto 16);
alias s2 is s(47 downto 32);
alias s3 is s(63 downto 48);

alias stage0_a is a(15 downto 0);
alias stage1_a is a(31 downto 16);
alias stage2_a is a(47 downto 32);
alias stage3_a is a(63 downto 48);

alias stage0_b is b(15 downto 0);
alias stage1_b is b(31 downto 16);
alias stage2_b is b(47 downto 32);
alias stage3_b is b(63 downto 48);


begin

    stage0 : csa16 port map ( 
        stage0_a, stage0_b, cin, 
         s0, ctmp(0) );


    stage1 : csa16 port map ( 
        stage1_a, stage1_b, ctmp(0),  
         s1, ctmp(1) );

    stage2 : csa16 port map (
        stage2_a, stage2_b, ctmp(1),   
        s2, ctmp(2) );

    stage3 : csa16 port map ( 
        stage3_a, stage3_b, ctmp(2), 
         s3, cout );

end arch_csa64 ; 