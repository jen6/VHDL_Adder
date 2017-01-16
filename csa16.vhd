library ieee;
use ieee.std_logic_1164.all;
--ripple carry adder
entity csa16 is
    port ( a, b : in std_logic_vector(15 downto 0);
                cin : in std_logic;
                s : out std_logic_vector(15 downto 0);
                cout : out std_logic);
end entity csa16;

architecture arch_csa16 of csa16 is
component fa is
    port ( a, b, cin : in std_logic;
            s, cout : out std_logic);
end component fa;

component mux2x1 is
    port (a,b,s : in std_logic;
                o : out std_logic);
end component mux2x1;

signal ctmp : std_logic_vector(15 downto 0);
signal ctmp0 : std_logic_vector(15 downto 0);
signal ctmp1 : std_logic_vector(15 downto 0);
signal stmp0 : std_logic_vector(15 downto 0);
signal stmp1 : std_logic_vector(15 downto 0);

begin
    stage0 : fa port map ( a(0), b(0), cin, s(0), ctmp(0));
    stage1 : fa port map ( a(1), b(1), ctmp(0),s(1),ctmp(1));
    -- Low 0,1 Full Adder and Select
    stage2_0 : fa port map ( a(2), b(2), '0', stmp0(2), ctmp0(2));
    stage3_0 : fa port map ( a(3), b(3), ctmp0(2), stmp0(3), ctmp0(3));

    stage2_1 : fa port map ( a(2), b(2), '1', stmp1(2), ctmp1(2));
    stage3_1 : fa port map ( a(3), b(3), ctmp1(2), stmp1(3), ctmp1(3));

    mux2_s : mux2x1 port map ( stmp0(2), stmp1(2), ctmp(1), s(2) );
    mux3_s : mux2x1 port map (  stmp0(3), stmp1(3), ctmp(1), s(3));
    mux_s2 : mux2x1 port map  ( ctmp0(3), ctmp1(3), ctmp(1), ctmp(3));
    -- Low 2, 3 Full Adder and Select

    stage4_0 : fa port map ( a(4), b(4), '0', stmp0(4), ctmp0(3));
    stage5_0 : fa port map ( a(5), b(5), ctmp0(3), stmp0(5), ctmp0(4));
    stage6_0 : fa port map ( a(6), b(6), ctmp0(4), stmp0(6), ctmp0(5));

    stage4_1 : fa port map ( a(4), b(4), '1', stmp1(4), ctmp1(3));
    stage5_1 : fa port map ( a(5), b(5), ctmp1(3), stmp1(5), ctmp1(4));
    stage6_1 : fa port map ( a(6), b(6), ctmp1(4), stmp1(6), ctmp1(5));

    
    mux4_s : mux2x1 port map ( stmp0(4), stmp1(4),  ctmp(3), s(4));
    mux5_s : mux2x1 port map (  stmp0(5), stmp1(5), ctmp(3), s(5));
    mux6_s : mux2x1 port map (  stmp0(6), stmp1(6), ctmp(3), s(6));
    mux_s3 : mux2x1 port map  ( ctmp0(6), ctmp1(6), ctmp(3), ctmp(6));
-- Low 4,5,6 full adder and Select


    stage7_0 : fa port map ( a(7), b(7), '0', stmp0(7), ctmp0(7));
    stage8_0 : fa port map ( a(8), b(8), ctmp0(7), stmp0(8), ctmp0(8));
    stage9_0 : fa port map ( a(9), b(9), ctmp0(8), stmp0(9), ctmp0(9));
    stage10_0 : fa port map ( a(10), b(10), ctmp0(9), stmp0(10), ctmp0(10));

    stage7_1 : fa port map ( a(7), b(7), '1', stmp1(7), ctmp1(7));
    stage8_1 : fa port map ( a(8), b(8), ctmp1(7), stmp1(8), ctmp1(8));
    stage9_1 : fa port map ( a(9), b(9), ctmp1(8), stmp1(9), ctmp1(9));
    stage10_1 : fa port map ( a(10), b(10), ctmp1(9), stmp1(10), ctmp1(10));
    
    mux7_s : mux2x1 port map ( stmp0(7), stmp1(7),  ctmp(6), s(7));
    mux8_s : mux2x1 port map (  stmp0(8), stmp1(8), ctmp(6), s(8));
    mux9_s : mux2x1 port map (  stmp0(9), stmp1(9), ctmp(6), s(9));
    mux10_s : mux2x1 port map (  stmp0(10), stmp1(10), ctmp(6), s(10));
    mux_s4 : mux2x1 port map  ( ctmp0(10), ctmp1(10), ctmp(6), ctmp(10));
-- Low 7,8,9,10 full adder and Select



    stage11_0 : fa port map ( a(11), b(11), '0', stmp0(11), ctmp0(11));
    stage12_0 : fa port map ( a(12), b(12), ctmp0(11), stmp0(12), ctmp0(12));
    stage13_0 : fa port map ( a(13), b(13), ctmp0(12), stmp0(13), ctmp0(13));
    stage14_0 : fa port map ( a(14), b(14), ctmp0(13), stmp0(14), ctmp0(14));
    stage15_0 : fa port map ( a(15), b(15), ctmp0(14), stmp0(15), ctmp0(15));

    stage11_1 : fa port map ( a(11), b(11), '1', stmp1(11), ctmp1(11));
    stage12_1 : fa port map ( a(12), b(12), ctmp1(11), stmp1(12), ctmp1(12));
    stage13_1 : fa port map ( a(13), b(13), ctmp1(12), stmp1(13), ctmp1(13));
    stage14_1 : fa port map ( a(14), b(14), ctmp1(13), stmp1(14), ctmp1(14));
    stage15_1 : fa port map ( a(15), b(15), ctmp1(14), stmp1(15), ctmp1(15));
    
    mux11_s : mux2x1 port map ( stmp0(11), stmp1(11),  ctmp(10), s(11));
    mux12_s : mux2x1 port map (  stmp0(12), stmp1(12), ctmp(10), s(12));
    mux13_s : mux2x1 port map (  stmp0(13), stmp1(13), ctmp(10), s(13));
    mux14_s : mux2x1 port map (  stmp0(14), stmp1(14), ctmp(10), s(14));
    mux15_s : mux2x1 port map (  stmp0(15), stmp1(15), ctmp(10), s(15));
    mux_s5 : mux2x1 port map  ( ctmp0(15), ctmp1(15), ctmp(10), ctmp(15));
-- Low 7,8,9,10 full adder and Select

    cout <= ctmp(15);
end arch_csa16;