--------------------------------------------------------------------------------------------
-- Course: ECE 232 - Digital System Design Lab
-- Author: Ember Ipek
-- 
-- Create Date: 4/12/24
-- Experiment Name: Modulo-10 Counter in VHDL (using Block Design tool in Vivado) 
-- Design Name: Lab_10_BCDtoSevenSegment
-- Project Name: 
-- Target Devices: xc7a35t-1cpg236c
--
-- Description: This is the design of the BCD to Seven-segment Converter using a 'with select when' statement.
--				You can copy the VHDL description for the BCD to Seven-segment converter from Lab #7.
--				Be sure to change the port names to match those specified in the lab document.
--
--				This is one of two components used in the top-level design.
--				
---------------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab_10_BCDtoSevenSegment is
port (B3, B2, B1, B0 : in STD_LOGIC;
      a, b, c, d, e, f, g : out STD_LOGIC;
	  disp_right, disp_left, disp_midright, disp_midleft : out STD_LOGIC
	  );
end lab_10_BCDtoSevenSegment;

architecture behavioral of lab_10_BCDtoSevenSegment is
signal BBBB : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal segments : STD_LOGIC_VECTOR(1 to 7);
begin

BBBB <= B3&B2&B1&B0;

WITH BBBB SELECT
	segments <= "0000001" WHEN "0000",
	"1001111" WHEN "0001",
	"0010010" WHEN "0010",
	"0000110" WHEN "0011",
	"1001100" WHEN "0100",
	"0100100" WHEN "0101",
	"0100000" WHEN "0110",
	"0001111" WHEN "0111",
    "0000000" WHEN "1000",
	"0000100" WHEN "1001",
	"0001000" WHEN "1010",
	"1100000" WHEN "1011",
	"0110001" WHEN "1100",
	"1000010" WHEN "1101",
	"0110000" WHEN "1110",
	"0111000" WHEN "1111",
	"0000000" when others;
a <= segments(1);
b <= segments(2);
c <= segments(3);
d <= segments(4);
e <= segments(5);
f <= segments(6);
g <= segments(7);


disp_right <= '0';		-- turn the seven-segment display on
disp_left <= '1';		-- turn the seven-segment display off
disp_midright <= '1';	-- turn the seven-segment display off
disp_midleft <= '1';	-- turn the seven-segment display off 

end behavioral;
