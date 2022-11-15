library ieee;
use ieee.std_logic_1164.ALL;
use ieee.STD_LOGIC_ARITH.all;

entity bcdthreedigittosevensegment is
		Port ( 	clk_i  : in  std_logic;		-- system clock
             	rst_i  : in  std_logic; 	-- synchronous reset, active-low
				start : in std_logic;		-- active-low
				 
				--data
				data, data_remainder	: in  std_logic_vector (9 downto 0);

				--check error case
				check_negative, check_zero : in std_logic;
				check_operation : in std_logic_vector ( 1 downto 0 );
				
				--BCD 4 bit
				--result
				BCD_digit_1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
				BCD_digit_2 : out STD_LOGIC_VECTOR ( 3 downto 0 );
				BCD_digit_3 : out STD_LOGIC_VECTOR ( 3 downto 0 );

				--remainder
				R_digit_1 : out std_logic_vector ( 3 downto 0 );
				R_digit_2 : out std_logic_vector ( 3 downto 0 );
				R_digit_3 : out std_logic_vector ( 3 downto 0 ));
					  
end bcdthreedigittosevensegment;

architecture Behavioral of bcdthreedigittosevensegment is
	
	--result
	signal int_data_1 : integer := 0;
	signal int_data_2 : integer:= 0;
	signal int_data_3 : integer := 0;

	--remainder
	signal int_r_1 : integer := 0;
	signal int_r_2 : integer := 0;
	signal int_r_3 : integer := 0;

	begin
		process(clk_i, rst_i, data, start)
			begin
				if (rst_i='0' ) then 
					--reset the data
					int_data_1 <= 0;
					int_data_2 <= 0;
					int_data_3 <= 0;
					int_r_1 <= 0;
					int_r_2 <= 0;
					int_r_3 <= 0;

				elsif (clk_i'event and clk_i='1') then  
						--check negative case
						if  check_negative = '0' and check_operation = "10"  then --negative subtractor case

							--assign every data to EEEEE
							int_data_1 <= 10;
							int_data_2 <= 10;
							int_data_3 <= 10;
							
							int_r_1 <= 10;
							int_r_2 <= 10;
							int_r_3 <= 10;
					
						--remove overflow of adder operation 
						
						--check zero divisor
						elsif check_zero = '1' and check_operation = "00" then
							
							--assign every data to EEEEE
							int_data_1 <= 10;
							int_data_2 <= 10;
							int_data_3 <= 10;
							
							int_r_1 <= 10;
							int_r_2 <= 10;
							int_r_3 <= 10;
						
						else
							
							--get number of each digit
							--convert 5-bits binary to decimal

							--result
							int_data_1 <= conv_integer(unsigned(data)) mod 10;
							int_data_2 <= ((conv_integer(unsigned(data))/ 10) mod 10 );
							int_data_3 <= (conv_integer(unsigned(data))/ 100 );
							
							--remainder
							int_r_1 <= conv_integer(unsigned(data_remainder)) mod 10;
							int_r_2 <= ((conv_integer(unsigned(data_remainder))/ 10) mod 10 );
							int_r_3 <= (conv_integer(unsigned(data_remainder))/ 100 );
						end if;
				end if;

					--convert decimal to 4-bits binary
					--caution!!! BCD can be only 4-bits
					BCD_digit_1 <= conv_std_logic_vector(int_data_1, 4);
					BCD_digit_2 <= conv_std_logic_vector(int_data_2, 4);
					BCD_digit_3 <= conv_std_logic_vector(int_data_3, 4);
					
					R_digit_1 <= conv_std_logic_vector(int_r_1, 4);
					R_digit_2 <= conv_std_logic_vector(int_r_2, 4);
					R_digit_3 <= conv_std_logic_vector(int_r_3, 4);
				
		end process;
		
end Behavioral;