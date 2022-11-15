library ieee;
use ieee.std_logic_1164.ALL;

--full adder function

--assign ports
entity fulladder is
    port(
        A,B,C_in : in std_logic;
        sum,C_out : out std_logic);
end fulladder;

--process full adder
architecture data_flow of fulladder is 
    begin
        sum <= (A xor B) xor C_in;
        C_out <= ((A xor B) and C_in) or (B and A);
end data_flow;

--end full addder function

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.STD_LOGIC_ARITH.all;


--adder and subtractor function

--assign ports
entity adderandsubtractor is
    generic (N : integer := 5);
    port(A,B : in std_logic_vector (N-1 downto 0);
        ctrl_M : in std_logic;
        s : out std_logic_vector (N downto 0);
        C : out std_logic);
    
end adderandsubtractor;

--process adderandsubtractor
architecture behavioral of adderandsubtractor is
    component fulladder is
        port(
            A,B,C_in : in std_logic;
            sum,C_out : out std_logic);
    end component;

    signal x : std_logic_vector(N downto 0);
  
    begin
        x(0) <= ctrl_M ;

        --use fulladder entity
        --B(i) xor ctrl_M will replace every B in port of fulladder
        --s(i) collect data from port sum in fulladder
        --x(i+1) collect data from port C_out in fulladder
        eq_compar : for i in 0 to N-1 generate
                    sum : fulladder port map( A(i),B(i) xor ctrl_M,x(i),s(i),x(i+1) );
        end generate;
	s(N) <= x(N); -- sign bit
    C <= x(N); --carry out use for validate overflow
	 
end behavioral;