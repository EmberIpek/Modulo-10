-------------------------------------------------------------------------------------------------------
-- Course: ECE 232 - Digital System Design Lab
-- Author: Ember Ipek
-- 
-- Create Date: 4/11/24
-- Experiment Name: Modulo-10 Counter in VHDL (using Block Design tool in Vivado) 
-- Design Name: Lab_10_Modulo10Counter
-- Project Name: Lab_10_Modulo10Counter
--
-- Description:	Test bench for the Modulo-10 Counter (Lab #10).
--				The test bench should cover all test conditions (i.e. an "exhaustive" test).
--				The Modulo-10 counter counts from zero (0000) to nine (1001). 
--				The two inputs to the counter are Enable and Clock.
--				Your testbench simply needs to test whether or not the counter counts from zero to nine 
--				and then returns to zero, when the Enable signal is high, and does not count when the 
-- 				Enable signal is low.
--------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity Lab_10_Modulo10Counter_tb is
end Lab_10_Modulo10Counter_tb;

architecture behavior of Lab_10_Modulo10Counter_tb is

-- component declaration for unit under test
component Lab_10_Modulo10Counter is
port(cnt_clk, cnt_en: in std_logic;
	 cnt_out : out std_logic_vector(3 downto 0);
	 cnt_tc : out std_logic);
end component;

-- signals declared for use in the testbench 
signal cnt_clk_tb, cnt_en_tb, cnt_tc_tb : std_logic;
signal cnt_out_tb : std_logic_vector(3 downto 0);

begin

	-- instantiate the unit under test (uut)
	uut : Lab_10_Modulo10Counter port map(
		cnt_clk => cnt_clk_tb,
		cnt_en => cnt_en_tb,
		cnt_out => cnt_out_tb,
		cnt_tc => cnt_tc_tb
		);

	Clock_signal : process
	begin
		clk_tb <= '0';
		wait for 10ns;
		clk_tb <= '1';
		wait for 10ns;
	end process Clock_signal;

	Counter_simulation: process
	begin
		wait for 40ns;
		cnt_en_tb <= '1';
		wait for 140ns;
		cnt_en_tb <= '0';
	end process Counter_simulation;
	
end behavior;
