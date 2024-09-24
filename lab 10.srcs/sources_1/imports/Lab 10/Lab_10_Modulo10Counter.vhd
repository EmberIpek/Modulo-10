------------------------------------------------------------------------------------------------------
-- Course: ECE 232 - Digital System Design Lab
-- Author: Ember Ipek
-- 
-- Create Date:  4/11/24
-- Experiment Name: Modulo-10 Counter in VHDL (using Block Design tool in Vivado) 
-- Design Name: Lab_10_Modulo10Counter
-- Project Name: Lab_10_Modulo10Counter
-- Target Devices: xc7a35t-1cpg236c
--
-- Description: This is the design of the Modulo-10 counter.
--				The design uses a PROCESS statement to describe the counter.
--				
--				This is one of two components used in the top-level design.
-- 
-- Basys 3 Board resources used to test this component:
--				1 slider switch for the counter enable input.
--				1 push button switch for the counter clock input.
------------------------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity lab_10_Modulo10Counter is
port(cnt_clk, cnt_en: in std_logic;
	 cnt_out : out std_logic_vector(3 downto 0);
	 cnt_tc : out std_logic);
end lab_10_Modulo10Counter;


architecture behavioral of lab_10_Modulo10Counter is
signal mid_out : std_logic_vector(3 downto 0) := "0000";
signal mid_tc : std_logic := '0';
begin
	process(cnt_clk)
	begin
		if(rising_edge(cnt_clk)) then
			if(cnt_en = '1') then 
			     if(mid_out = "1001") then
			     mid_out <= "0000";
			     mid_tc <= '0';
			     else
			      if(mid_out = "1000") then
			         mid_tc <= '1';
			      else
			      mid_tc <= '0';
				end if;
				mid_out <= mid_out + 1;
			end if;
		end if;
		end if;
	end process;
	cnt_out <= mid_out;
	cnt_tc <= mid_tc;
end behavioral;
