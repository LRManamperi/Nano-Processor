----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/14/2023 06:25:16 PM
-- Design Name: 
-- Module Name: TB_HA - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_HA is
--  Port ( );
end TB_HA;

architecture Behavioral of TB_HA is
COMPONENT HA
   PORT( A	:	IN	STD_LOGIC; 
          B	:	IN	STD_LOGIC; 
          S	:	OUT	STD_LOGIC; 
          C	:	OUT	STD_LOGIC);
   END COMPONENT;

   SIGNAL A	:	STD_LOGIC;
   SIGNAL B	:	STD_LOGIC;
   SIGNAL S	:	STD_LOGIC;
   SIGNAL C	:	STD_LOGIC;


begin
UUT: HA PORT MAP(
		A => A, 
		B => B, 
		S => S, 
		C => C
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
		A <= '0';
		B <= '0';
		wait for 5ns;
		B <= '1';
		wait for 5ns;
		A <='1';
		B<='0';
		wait for 5ns;
		B<='1';
	
   END PROCESS;


end Behavioral;
