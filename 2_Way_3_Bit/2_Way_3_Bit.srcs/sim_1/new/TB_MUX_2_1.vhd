----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 04:25:54 PM
-- Design Name: 
-- Module Name: TB_MUX_2_1 - Behavioral
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

entity TB_MUX_2_1 is
  --Port ();
end TB_MUX_2_1;

architecture Behavioral of TB_MUX_2_1 is
component MUX_2_1 is
    Port (
      Jump_Flag : in std_logic;
      In_Adder_3 : in std_logic_vector(2 downto 0);
      In_Jump_Add : in std_logic_vector(2 downto 0);
      Out_Mux_2_3 : out std_logic_vector(2 downto 0)
    );
  end component;
 signal Jump_Flag : std_logic;
 signal In_Adder_3 : std_logic_vector(2 downto 0);
 signal In_Jump_Add : std_logic_vector(2 downto 0);
 signal Out_Mux_2_3 : std_logic_vector(2 downto 0);
 

begin
 uut: MUX_2_1
   Port map (
     Jump_Flag => Jump_Flag,
     In_Adder_3 => In_Adder_3,
     In_Jump_Add => In_Jump_Add,
     Out_Mux_2_3 => Out_Mux_2_3
   );

 -- Stimulus process
 stimulus_process: process
 begin
   -- Test case 1: Select input a
   Jump_Flag <= '0';
   In_Adder_3<= "111";
   In_Jump_Add <= "001";
   wait for 10 ns;
   
   -- Test case 2: Select input b
   Jump_Flag <= '1';
   In_Adder_3 <= "110";
    In_Jump_Add <= "011";
   wait for 10 ns;
   
   -- Test case 3: Select input a again
   Jump_Flag <= '0';
   In_Adder_3 <= "101";
    In_Jump_Add <= "111";
   wait for 10 ns;
   
   -- Add more test cases as needed
   
   wait;
 end process;


end Behavioral;
