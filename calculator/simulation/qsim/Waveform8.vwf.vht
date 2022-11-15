-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "11/14/2022 22:53:26"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          bcdthreedigittosevensegment
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY bcdthreedigittosevensegment_vhd_vec_tst IS
END bcdthreedigittosevensegment_vhd_vec_tst;
ARCHITECTURE bcdthreedigittosevensegment_arch OF bcdthreedigittosevensegment_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL BCD_digit_1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL BCD_digit_2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL BCD_digit_3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL check_negative : STD_LOGIC;
SIGNAL clk_i : STD_LOGIC;
SIGNAL data : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL data_remainder : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL R_digit_1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL R_digit_2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL R_digit_3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL rst_i : STD_LOGIC;
SIGNAL start : STD_LOGIC;
COMPONENT bcdthreedigittosevensegment
	PORT (
	BCD_digit_1 : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	BCD_digit_2 : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	BCD_digit_3 : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	check_negative : IN STD_LOGIC;
	clk_i : IN STD_LOGIC;
	data : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
	data_remainder : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
	R_digit_1 : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	R_digit_2 : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	R_digit_3 : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	rst_i : IN STD_LOGIC;
	start : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : bcdthreedigittosevensegment
	PORT MAP (
-- list connections between master ports and signals
	BCD_digit_1 => BCD_digit_1,
	BCD_digit_2 => BCD_digit_2,
	BCD_digit_3 => BCD_digit_3,
	check_negative => check_negative,
	clk_i => clk_i,
	data => data,
	data_remainder => data_remainder,
	R_digit_1 => R_digit_1,
	R_digit_2 => R_digit_2,
	R_digit_3 => R_digit_3,
	rst_i => rst_i,
	start => start
	);

-- check_negative
t_prcs_check_negative: PROCESS
BEGIN
	check_negative <= '0';
WAIT;
END PROCESS t_prcs_check_negative;

-- clk_i
t_prcs_clk_i: PROCESS
BEGIN
LOOP
	clk_i <= '0';
	WAIT FOR 5000 ps;
	clk_i <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk_i;
-- data[9]
t_prcs_data_9: PROCESS
BEGIN
	data(9) <= '0';
WAIT;
END PROCESS t_prcs_data_9;
-- data[8]
t_prcs_data_8: PROCESS
BEGIN
	data(8) <= '0';
WAIT;
END PROCESS t_prcs_data_8;
-- data[7]
t_prcs_data_7: PROCESS
BEGIN
	data(7) <= '0';
WAIT;
END PROCESS t_prcs_data_7;
-- data[6]
t_prcs_data_6: PROCESS
BEGIN
	data(6) <= '0';
WAIT;
END PROCESS t_prcs_data_6;
-- data[5]
t_prcs_data_5: PROCESS
BEGIN
	data(5) <= '0';
WAIT;
END PROCESS t_prcs_data_5;
-- data[4]
t_prcs_data_4: PROCESS
BEGIN
	data(4) <= '0';
WAIT;
END PROCESS t_prcs_data_4;
-- data[3]
t_prcs_data_3: PROCESS
BEGIN
	data(3) <= '1';
WAIT;
END PROCESS t_prcs_data_3;
-- data[2]
t_prcs_data_2: PROCESS
BEGIN
	data(2) <= '1';
WAIT;
END PROCESS t_prcs_data_2;
-- data[1]
t_prcs_data_1: PROCESS
BEGIN
	data(1) <= '1';
WAIT;
END PROCESS t_prcs_data_1;
-- data[0]
t_prcs_data_0: PROCESS
BEGIN
	data(0) <= '0';
WAIT;
END PROCESS t_prcs_data_0;
-- data_remainder[9]
t_prcs_data_remainder_9: PROCESS
BEGIN
	data_remainder(9) <= '0';
WAIT;
END PROCESS t_prcs_data_remainder_9;
-- data_remainder[8]
t_prcs_data_remainder_8: PROCESS
BEGIN
	data_remainder(8) <= '0';
WAIT;
END PROCESS t_prcs_data_remainder_8;
-- data_remainder[7]
t_prcs_data_remainder_7: PROCESS
BEGIN
	data_remainder(7) <= '0';
WAIT;
END PROCESS t_prcs_data_remainder_7;
-- data_remainder[6]
t_prcs_data_remainder_6: PROCESS
BEGIN
	data_remainder(6) <= '0';
WAIT;
END PROCESS t_prcs_data_remainder_6;
-- data_remainder[5]
t_prcs_data_remainder_5: PROCESS
BEGIN
	data_remainder(5) <= '0';
WAIT;
END PROCESS t_prcs_data_remainder_5;
-- data_remainder[4]
t_prcs_data_remainder_4: PROCESS
BEGIN
	data_remainder(4) <= '0';
WAIT;
END PROCESS t_prcs_data_remainder_4;
-- data_remainder[3]
t_prcs_data_remainder_3: PROCESS
BEGIN
	data_remainder(3) <= '0';
WAIT;
END PROCESS t_prcs_data_remainder_3;
-- data_remainder[2]
t_prcs_data_remainder_2: PROCESS
BEGIN
	data_remainder(2) <= '0';
WAIT;
END PROCESS t_prcs_data_remainder_2;
-- data_remainder[1]
t_prcs_data_remainder_1: PROCESS
BEGIN
	data_remainder(1) <= '0';
WAIT;
END PROCESS t_prcs_data_remainder_1;
-- data_remainder[0]
t_prcs_data_remainder_0: PROCESS
BEGIN
	data_remainder(0) <= '0';
WAIT;
END PROCESS t_prcs_data_remainder_0;

-- rst_i
t_prcs_rst_i: PROCESS
BEGIN
	rst_i <= '0';
WAIT;
END PROCESS t_prcs_rst_i;

-- start
t_prcs_start: PROCESS
BEGIN
	start <= '0';
	WAIT FOR 10000 ps;
	start <= '1';
	WAIT FOR 50000 ps;
	start <= '0';
WAIT;
END PROCESS t_prcs_start;
END bcdthreedigittosevensegment_arch;
