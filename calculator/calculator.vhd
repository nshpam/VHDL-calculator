library ieee;
use ieee.std_logic_1164.all;
use ieee.STD_LOGIC_ARITH.all;

entity calculator is
	generic ( N : integer :=5 );
	port( CLK_main, RST_main, START_main : in std_logic;
			input_A, input_B : in std_logic_vector( N-1 downto 0 ) := ( others => '0' );
			Operation : in std_logic_vector( 1 downto 0 );
			Result : out std_logic_vector( 2*N-1 downto 0 );
			Remainder : out std_logic_vector ( 2*N-1 downto 0 );

			--7 segment for result
			sevenseg_digit_0 : out std_logic_vector ( N+1 downto 0 );
			sevenseg_digit_1 : out std_logic_vector ( N+1 downto 0 );
			sevenseg_digit_2 : out std_logic_vector ( N+1 downto 0 );

			--7 segment for remainder
			sevenseg_digit_3 : out std_logic_vector ( N+1 downto 0 );
			sevenseg_digit_4 : out std_logic_vector ( N+1 downto 0 );
			sevenseg_digit_5 : out std_logic_vector ( N+1 downto 0 );
			COUT,DONE_main : out std_logic);
end calculator;

architecture Behaviral of calculator is

	--main
	type state_type is (S0, S1);
	signal state : state_type := S0;
	signal Op : std_logic_vector( 1 downto 0 );
	signal Mode : std_logic;
	signal Result_input : std_logic_vector( 2*N-1 downto 0 );
	signal Remainder_input : std_logic_vector ( 2*N-1 downto 0 );
	signal check_overflow : std_logic;
	signal check_zero_divisor : std_logic := '0';
	
	--adder and subtractor
	signal Data_A_aas : std_logic_vector(N-1 downto 0) := ( others => '0' );
	signal Data_B_aas : std_logic_vector(N-1 downto 0) := ( others => '0' );
	signal Result_aas : std_logic_vector( N downto 0 ) := ( others => '0' );
	signal C_out : std_logic;
	
	--multiplication
	signal Data_A_multi : std_logic_vector( N-1 downto 0 ) := ( others => '0' );
	signal Data_B_multi : std_logic_vector( N-1 downto 0 ) := ( others => '0' );
	signal Result_multi : std_logic_vector( 2*N-1 downto 0 ) := ( others => '0' );
	signal Start_multi : std_logic;
	signal DONE_multi : std_logic;
	
	--division
	signal Remainder_division : std_logic_vector(2*N downto 0):= (others => '0');
	signal Dividend_division : std_logic_vector(N-1 downto 0):= (others => '0'); --top
	signal Divisor_division : std_logic_vector(N-1 downto 0):= (others => '0'); --bottom
	signal Quotient_division : std_logic_vector(N-1 downto 0) := (others => '0');
	signal Start_division : std_logic;
	signal DONE_division : std_logic;
	
	--bcd to seven segment
	--data
	signal BCD_data_digit_1 : std_logic_vector( N-2 downto 0 ) := ( others => '0' );
	signal BCD_data_digit_2 : std_logic_vector( N-2 downto 0 ) := ( others => '0' );
	signal BCD_data_digit_3 : std_logic_vector( N-2 downto 0 ) := ( others => '0' );
	
	--remainder
	signal BCD_r_digit_1 : std_logic_vector( N-2 downto 0 ) := ( others => '0' );
	signal BCD_r_digit_2 : std_logic_vector( N-2 downto 0 ) := ( others => '0' );
	signal BCD_r_digit_3 : std_logic_vector( N-2 downto 0 ) := ( others => '0' );
	
begin
	--import adderandsubtractor file
	addandsub_function : entity work.adderandsubtractor(behavioral)
								port map(
									A => Data_A_aas,
									B => Data_B_aas,
									ctrl_M => Mode,
									s => Result_aas,
									C => C_out);
									
	--import multiplication file
	multiplication_function : entity work.multiplication(behavioral)
								port map(
									A => Data_A_multi,
									B => Data_B_multi,
									R => Result_multi,
									DONE => DONE_multi,
									CLK_M => CLK_main,
									RST_M =>RST_main,
									START_N =>Start_multi);
									
	--import division file
	division_function : entity work.division(behavioral)
								port map(
									A => Dividend_division,
									B => Divisor_division,
									Q => Quotient_division,
									R => Remainder_division,
									DONE => DONE_division,
									CLK => CLK_main,
									RST_N =>RST_main,
									START =>Start_division);
									
	
	process (RST_main, CLK_main, START_main, Operation)
	
	begin
		if RST_main = '0' then --reset all data
		
			--reset adderandsubtractor input
			Data_A_aas <= ( others => '0' );
			Data_B_aas <= ( others => '0' );
			
			--reset multiple input
			Data_A_multi <= ( others => '0' );
			Data_B_multi <= ( others => '0' );
			
			--reset division input
			Remainder <= ( others => '0' );
			Remainder_input <= ( others => '0' );
			Dividend_division <= ( others => '0' );
			Divisor_division <= ( others => '0' );
			check_zero_divisor <= '0';
			
			Result <= ( others => '0' );
			Result_input <= ( others => '0' );
			
			--change state
			state <= S0;
			
		elsif rising_edge(CLK_main) then
			case state is
				
			when S0 => --waiting state
				
				if START_main = '0' then --acive low

					--collect operation
					Op <= Operation;

					--reset all data
					Result <= ( others => '0' );
					Remainder <= ( others => '0' );
					Result_input <= (others => '0' );
					
					--adder and subtractor
					Data_A_aas <= input_A;
					Data_B_aas <= input_B;

					--multiple
					Data_A_multi <= input_A;
					Data_B_multi <= input_B;

					--division
					Dividend_division <= input_A;
					Divisor_division <= input_B;
					
					--start division and multiple
					Start_division <= '1';
					Start_multi <= '1';

					--change state
					state <= S1;
					
				  else
					state <= S0;
					DONE_main <= '0';
				  end if;
			
			when S1 => --calculate process
					state <= S1;
					Start_division <= '0';
					Start_multi <= '0';

					--adder
					if Operation = "11" then 
						Result(N downto 0) <= Result_aas;
						Result_input(N downto 0) <= Result_aas;
						COUT <= C_out;
						check_overflow <= C_out;
						Mode <= '0';
						DONE_main <= '1';
						state <= S0;
					
					--subtractor
					elsif Operation = "10" then 
						
						--check negative
						if ( input_A < input_B ) then
							Mode <= '1';
							Result(N downto 0) <= Result_aas;
							Result_input(N downto 0) <= Result_aas;
							COUT <= C_out;
							check_overflow <= C_out;
							DONE_main <= '1';
							state <= S0;
						else
							Mode <= '1';
							Result(N-1 downto 0) <= Result_aas(N-1 downto 0);
							Result_input(N-1 downto 0) <= Result_aas(N-1 downto 0); --remove the sign digit
							COUT <= C_out;
							check_overflow <= C_out;
							DONE_main <= '1';
							state <= S0;
						end if;
					
					--multiplication
					elsif Operation = "01" then 
						Result <= Result_multi;
						Result_input <= Result_multi;
						DONE_main <= DONE_multi;
					
					--wait until finish multiple
						if DONE_multi = '1' then
							state <= S0;
						end if;
					
					--divisor
					elsif Operation = "00" then

						--check zero divisor
						if input_B = "00000" then
							check_zero_divisor <= '1';
							Result(N-1 downto 0) <= Quotient_division;
							Result_input(N-1 downto 0) <= Quotient_division;
							Remainder <= Remainder_division( 2*N-1 downto 0 );
							Remainder_input <= Remainder_division( 2*N-1 downto 0 );
						else
							Result(N-1 downto 0) <= Quotient_division;
							Result_input(N-1 downto 0) <= Quotient_division;
							Remainder <= Remainder_division( 2*N-1 downto 0 );
							Remainder_input <= Remainder_division( 2*N-1 downto 0 );
						end if;
						
						--wait until finish division
						if DONE_division = '1' then
							DONE_main <= DONE_division;
							state <= S0;
						end if;
					end if;
				end case;
		end if;
		
	end process;
	
		--convert binary 5 bits to BCD 4 bits
		convert_binary:		entity work.bcdthreedigittosevensegment(Behavioral)
										port map(
											clk_i => CLK_main,
											rst_i => RST_main,
											start => START_main,
											data  => Result_input,
											data_remainder => Remainder_input,
											check_negative => check_overflow,
											check_operation => Op,
											check_zero => check_zero_divisor,
											BCD_digit_1 => BCD_data_digit_1,
											BCD_digit_2 => BCD_data_digit_2,
											BCD_digit_3 => BCD_data_digit_3,
											R_digit_1 => BCD_r_digit_1,
											R_digit_2 => BCD_r_digit_2,
											R_digit_3 => BCD_r_digit_3
											);
	
		--seven segment
						
		--display result digit 1
		seven_seg_display_1: entity work. bcdtosevensegment(data_process)
									port map(
										clk_i => CLK_main,
										BCD_i  => BCD_data_digit_1,
										seven_seg  =>sevenseg_digit_0 );
		
		--display result digit 2
		seven_seg_display_2: entity work. bcdtosevensegment(data_process)
									port map(
										clk_i => CLK_main,
										BCD_i  => BCD_data_digit_2,
										seven_seg  =>sevenseg_digit_1 );
		
		--display result digit 3
		seven_seg_display_3: entity work. bcdtosevensegment(data_process)
									port map(
										clk_i => CLK_main,
										BCD_i  => BCD_data_digit_3,
										seven_seg  =>sevenseg_digit_2 );
		
		--display remainder digit 1
		seven_seg_display_4: entity work. bcdtosevensegment(data_process)
									port map(
										clk_i => CLK_main,
										BCD_i  => BCD_r_digit_1,
										seven_seg  =>sevenseg_digit_3 );
		
		--display remainder digit 2
		seven_seg_display_5: entity work. bcdtosevensegment(data_process)
									port map(
										clk_i => CLK_main,
										BCD_i  => BCD_r_digit_2,
										seven_seg  =>sevenseg_digit_4 );
		
		--display remainder digit 3
		seven_seg_display_6: entity work. bcdtosevensegment(data_process)
									port map(
										clk_i => CLK_main,
										BCD_i  => BCD_r_digit_3,
										seven_seg  =>sevenseg_digit_5 );
		
end Behaviral;