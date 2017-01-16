library ieee;
use ieee.std_logic_1164.all;

entity fa is 
port ( a, b, cin : in std_logic;
            s, cout : out std_logic);
end entity;
--전가산기
architecture arch_fa of fa is
    begin

        sumout : process
        begin
           wait for 20 ns;
           s <= a xor b xor cin;
             cout <= (a and b) or (b and cin) or (cin and a);
        end process sumout;
end arch_fa;
