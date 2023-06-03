----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/14/2023 11:09:39 PM
-- Design Name: 
-- Module Name: TB_4_RCA - Behavioral
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

entity TB_RCA3 is
--  Port ( );
end TB_RCA3;

architecture Behavioral of TB_RCA3 is
COMPONENT RCA3
   PORT( A0	:	IN	STD_LOGIC; 
          A1	:	IN	STD_LOGIC; 
          A2	:	IN	STD_LOGIC; 
          B0	:	IN	STD_LOGIC; 
          B1    :    IN    STD_LOGIC; 
          B2    :    IN    STD_LOGIC; 
          C_in   :   IN STD_LOGIC;
          S0	:	OUT	STD_LOGIC; 
          S1    :    OUT    STD_LOGIC; 
          S2    :    OUT    STD_LOGIC; 
          Adder_3_out    :    OUT    STD_LOGIC
          );
   END COMPONENT;

   SIGNAL A0	:	STD_LOGIC;
   SIGNAL A1	:	STD_LOGIC;
   SIGNAL A2	:	STD_LOGIC;
   SIGNAL B0	:	STD_LOGIC;
   SIGNAL B1    :    STD_LOGIC;
   SIGNAL B2    :    STD_LOGIC;
   SIGNAL C_in	:	STD_LOGIC;
   SIGNAL S0    :    STD_LOGIC;
   SIGNAL S1    :    STD_LOGIC;
   SIGNAL S2    :    STD_LOGIC;
   SIGNAL Adder_3_out    :    STD_LOGIC;

begin
UUT: RCA3 PORT MAP(
		A0 => A0,
		A1 => A1,
		A2 => A2,
		B0 => B0,
		B1 =>B1,
		B2 => B2,
		C_in => C_in,
		S0 => S0,
		S1 => S1,
		S2 => S2,
		Adder_3_out => Adder_3_out
	);
   tb : process
              BEGIN
              for i in 0 to 1 loop
                   if i= 0 then
                      C_in <= '0';
                   else                   
                      C_in <= '1';
                   end if;
                   
                   A0 <= '0';
                   B0 <= '0';
                   A1 <= '0';
                   B1 <= '0';
                   A2 <= '0';
                   B2 <= '0';
                        
                   
               
                --ID No: 210364 = 11 0011 0101 1011 1100
                 -- 1100 + 1011
                   WAIT for 5 ns;
                   A2 <= '1';
                   B0 <= '1';
                   B1 <= '1';
                 -- 0011 + 0101
                   WAIT for 5 ns;
                   A2 <= '0';
                   A1 <= '1';
                   A0 <= '1';
                   B1 <= '0';
                   B2 <= '1';
                   
                 -- 0101 + 1011
                   WAIT for 5 ns;
                   A1 <= '0';
                   A2 <= '1';
                   B1 <= '1';
                   B0 <= '1';
                 -- 0111 + 1111
                   WAIT for 5 ns;
                   A1 <= '1';
                   B2 <= '1';
                   
                 -- 0110 + 1011
                   WAIT for 5 ns;
                   A0 <= '1';
                   B2 <= '0';
                 -- 0010 + 1010
                   Wait for 5 ns;
                   A2 <= '0';
                   B0 <= '0';
                   
                 -- 0001 + 0101 
                   WAIT for 5 ns;
                   A0 <= '1';
                   A1 <= '0';
                   B0 <= '1';
                   B1 <= '0';
                   B2 <= '1';
                  
                 -- 1100 + 1101 
                   WAIT for 5 ns;
                   A2 <= '1';
                   A0 <= '0';
                 -- 0000 + 0000
                   WAIT for 5 ns;
                   A2 <= '0';
                   B2 <= '0';
                   B0 <= '0';
                   --C_in <= CTRL;
               end loop;
                 WAIT; -- will wait forever
              END PROCESS;    
end Behavioral;
