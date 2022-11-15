library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multiplication is
	generic ( N : integer :=5 );
	port( CLK_M, RST_M, START_N : in std_logic;
			A,B : in std_logic_vector( N-1 downto 0 ) := ( others => '0' );
			R : out std_logic_vector(2*N-1 downto 0) := ( others => '0' );
			DONE : out std_logic := '0');
end multiplication;

architecture behavioral of multiplication is
	type state_type is (S0, S1);
	signal Data_A : std_logic_vector( 2*N-1 downto 0 ) := ( others => '0' );
	signal Data_B : std_logic_vector( N-1 downto 0 ) := ( others => '0' );
	signal Data_Product : std_logic_vector( 2*N-1 downto 0 ) := ( others => '0' );
	signal bit_counter : integer := 0;
	signal state : state_type := S0;
	signal S_start : std_logic := '0';
begin
	S_Start <= START_N;
	
	process (RST_M, CLK_M, START_N)
	begin
		if RST_M = '0' then
			state <= S0;
			Data_A <= ( others => '0' );
			Data_B <= ( others => '0' );
			Data_Product <= ( others => '0' );
			R <= ( others => '0' );
		elsif rising_edge(CLK_M) then
			case state is
			
			when S0 =>
				if S_Start = '0' then
					Data_A ( N-1 downto 0 ) <= A;
					Data_B <= B;
					state <= S1;
				else
					state <= S0;
					DONE <= '0';
				end if;
			
			when S1 =>
				if ( bit_counter < (N+1) ) then
					state <= S1;
					if Data_B (bit_counter) = '1' then
						Data_Product <= Data_Product + Data_A;
						Data_A <= std_logic_vector(shift_left(unsigned(Data_A), 1));
						R <= Data_Product;
						bit_counter <= (bit_counter + 1);
					else
						Data_A <= std_logic_vector(shift_left(unsigned(Data_A), 1));
						R <= Data_Product;
						bit_counter <= (bit_counter + 1);
					end if;
				else
					bit_counter <= 0;
					Data_Product <= ( others => '0' );
					Data_A <= ( others => '0' );
					Data_B <= ( others => '0' );
					state <= S0;
					DONE <= '1';
				end if;
				
			when others =>
				state <= S0;
		end case;
	end if;
end process;
end behavioral;