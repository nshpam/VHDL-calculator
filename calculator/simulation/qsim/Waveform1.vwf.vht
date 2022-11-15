-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "11/15/2022 12:07:48"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          calculator
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY calculator_vhd_vec_tst IS
END calculator_vhd_vec_tst;
ARCHITECTURE calculator_arch OF calculator_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK_main : STD_LOGIC;
SIGNAL COUT : STD_LOGIC;
SIGNAL DONE_main : STD_LOGIC;
SIGNAL input_A : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL input_B : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL Operation : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL Remainder : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL Result : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL RST_main : STD_LOGIC;
SIGNAL sevenseg_digit_0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL sevenseg_digit_1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL sevenseg_digit_2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL sevenseg_digit_3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL sevenseg_digit_4 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL sevenseg_digit_5 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL START_main : STD_LOGIC;
COMPONENT calculator
	PORT (
	CLK_main : IN STD_LOGIC;
	COUT : OUT STD_LOGIC;
	DONE_main : OUT STD_LOGIC;
	input_A : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	input_B : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	Operation : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	Remainder : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
	Result : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
	RST_main : IN STD_LOGIC;
	sevenseg_digit_0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	sevenseg_digit_1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	sevenseg_digit_2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	sevenseg_digit_3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	sevenseg_digit_4 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	sevenseg_digit_5 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	START_main : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : calculator
	PORT MAP (
-- list connections between master ports and signals
	CLK_main => CLK_main,
	COUT => COUT,
	DONE_main => DONE_main,
	input_A => input_A,
	input_B => input_B,
	Operation => Operation,
	Remainder => Remainder,
	Result => Result,
	RST_main => RST_main,
	sevenseg_digit_0 => sevenseg_digit_0,
	sevenseg_digit_1 => sevenseg_digit_1,
	sevenseg_digit_2 => sevenseg_digit_2,
	sevenseg_digit_3 => sevenseg_digit_3,
	sevenseg_digit_4 => sevenseg_digit_4,
	sevenseg_digit_5 => sevenseg_digit_5,
	START_main => START_main
	);

-- CLK_main
t_prcs_CLK_main: PROCESS
BEGIN
LOOP
	CLK_main <= '0';
	WAIT FOR 5000 ps;
	CLK_main <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLK_main;
-- input_A[4]
t_prcs_input_A_4: PROCESS
BEGIN
	input_A(4) <= '1';
WAIT;
END PROCESS t_prcs_input_A_4;
-- input_A[3]
t_prcs_input_A_3: PROCESS
BEGIN
	input_A(3) <= '1';
WAIT;
END PROCESS t_prcs_input_A_3;
-- input_A[2]
t_prcs_input_A_2: PROCESS
BEGIN
	input_A(2) <= '1';
WAIT;
END PROCESS t_prcs_input_A_2;
-- input_A[1]
t_prcs_input_A_1: PROCESS
BEGIN
	input_A(1) <= '1';
WAIT;
END PROCESS t_prcs_input_A_1;
-- input_A[0]
t_prcs_input_A_0: PROCESS
BEGIN
	input_A(0) <= '1';
WAIT;
END PROCESS t_prcs_input_A_0;
-- input_B[4]
t_prcs_input_B_4: PROCESS
BEGIN
	input_B(4) <= '1';
WAIT;
END PROCESS t_prcs_input_B_4;
-- input_B[3]
t_prcs_input_B_3: PROCESS
BEGIN
	input_B(3) <= '1';
WAIT;
END PROCESS t_prcs_input_B_3;
-- input_B[2]
t_prcs_input_B_2: PROCESS
BEGIN
	input_B(2) <= '1';
WAIT;
END PROCESS t_prcs_input_B_2;
-- input_B[1]
t_prcs_input_B_1: PROCESS
BEGIN
	input_B(1) <= '1';
WAIT;
END PROCESS t_prcs_input_B_1;
-- input_B[0]
t_prcs_input_B_0: PROCESS
BEGIN
	input_B(0) <= '1';
WAIT;
END PROCESS t_prcs_input_B_0;
-- Operation[1]
t_prcs_Operation_1: PROCESS
BEGIN
	Operation(1) <= '1';
	WAIT FOR 250000 ps;
	Operation(1) <= '0';
	WAIT FOR 500000 ps;
	Operation(1) <= '1';
WAIT;
END PROCESS t_prcs_Operation_1;
-- Operation[0]
t_prcs_Operation_0: PROCESS
BEGIN
LOOP
	Operation(0) <= '1';
	WAIT FOR 250000 ps;
	Operation(0) <= '0';
	WAIT FOR 250000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_Operation_0;

-- RST_main
t_prcs_RST_main: PROCESS
BEGIN
	RST_main <= '1';
WAIT;
END PROCESS t_prcs_RST_main;

-- START_main
t_prcs_START_main: PROCESS
BEGIN
	START_main <= '1';
	WAIT FOR 20000 ps;
	START_main <= '0';
	WAIT FOR 20000 ps;
	START_main <= '1';
	WAIT FOR 740000 ps;
	START_main <= '0';
	WAIT FOR 30000 ps;
	START_main <= '1';
WAIT;
END PROCESS t_prcs_START_main;
END calculator_arch;
