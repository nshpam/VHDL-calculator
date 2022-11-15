library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity division is
 generic ( N : integer := 5 );
 port( CLK, RST_N, START : in std_logic;
   A : in std_logic_vector(N-1 downto 0):= (others => '0'); -- Input for dividend
   B : in std_logic_vector(N-1 downto 0):= (others => '0'); -- Input for divisor
   Q : out std_logic_vector(N-1 downto 0):= (others => '0'); -- Output for quotient
   R : out std_logic_vector(2*N downto 0):= (others => '0'); -- Output for remainder
   DONE : out std_logic :='0' ); -- Indicates end of algorithm and overflow condition
end division;

architecture behavioral of division is
 type state_type is (s0, s1, s2);-- Type for the FSM states
-- Inputs/outputs of the state register
 signal Remainder : std_logic_vector(2*N downto 0) := (others => '0');
 signal Divisor : std_logic_vector(2*N downto 0) := (others => '0');
 signal Quotient : std_logic_vector(N-1 downto 0) := (others => '0');
 signal bit_counter : integer := 0;
 signal state : state_type := s0;
 signal P_done : std_logic := '0';
 signal S_start : std_logic := '0';
 
begin 
 S_start <= START;
 
 process (RST_N, CLK, START)
 begin
  if RST_N = '0' then --async. reset (active-low)
   state <= s0;
   Remainder <= (others => '0');
   Divisor <= (others => '0');
   Quotient <= (others => '0');
   R <= (others => '0');
   Q <= (others => '0');
   
  elsif rising_edge(CLK) then
   case state is
    when s0 =>
     if S_start = '0' then
      Remainder (N-1 downto 0) <= A;
      Divisor (2*N-1 downto N)<= B;
      state <= s1;
     else
      state <= s0;
      DONE <= '0';
     end if;
     
    when s1 => 
     if (bit_counter < (N+1)) then
      Remainder <= Remainder - Divisor;
      state <= s2;
     else 
      DONE <= '1';
      bit_counter <= 0;
      Q <= Quotient;
      R <= Remainder;
      state <= s0;
      
     end if;
    
    when s2 => 
     if Remainder(2*N) = '1' then
      Remainder <= Remainder + Divisor;
      Divisor <= '0' & Divisor(2*N downto 1);
      Quotient <= Quotient(N-2 downto 0) & '0';
      bit_counter <= (bit_counter + 1);
      state <= s1;
      Q <= Quotient;
      R <= Remainder;
     else
      Divisor <= '0' & Divisor(2*N downto 1);
      Quotient <= Quotient(N-2 downto 0) & '1';
      bit_counter <= (bit_counter + 1);
      state <= s1;
      DONE <= '0';
      Q <= Quotient;
      R <= Remainder;
     end if;
    end case;
  end if;
 end process;
end behavioral;