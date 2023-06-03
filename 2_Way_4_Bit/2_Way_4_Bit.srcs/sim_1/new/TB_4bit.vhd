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

entity TB_4bit is
  --Port ();
end TB_4bit;

architecture Behavioral of TB_4bit is
component MUX_2_1_4bit is
    Port (
      Load_Sel : in std_logic;
      In_Imm_Val : in std_logic_vector(3 downto 0);
      In_Adder_4 : in std_logic_vector(3 downto 0);
      Out_Mux_2_4 : out std_logic_vector(3 downto 0)
    );
  end component;
 signal Load_Sel : std_logic;
 signal In_Imm_Val : std_logic_vector(3 downto 0);
 signal In_Adder_4 : std_logic_vector(3 downto 0);
 signal Out_Mux_2_4 : std_logic_vector(3 downto 0);
 

begin
 uut: MUX_2_1_4bit
   Port map (
     Load_Sel   => Load_Sel,
     In_Imm_Val => In_Imm_Val,
     In_Adder_4 => In_Adder_4,
     Out_Mux_2_4 => Out_Mux_2_4
   );

 -- Stimulus process
 stimulus_process: process
 begin
   -- Test case 1: Select input a
   Load_Sel   <= '0';
   In_Imm_Val <= "1111";
   In_Adder_4 <= "0010";
   wait for 10 ns;
   
   -- Test case 2: Select input b
   Load_Sel   <= '1';
   In_Imm_Val <= "1101";
   In_Adder_4 <= "0110";
   wait for 10 ns;
   
   -- Test case 3: Select input a again
   Load_Sel   <= '0';
   In_Imm_Val <= "1001";
   In_Adder_4 <= "1110";
   wait for 10 ns;
   
   -- Add more test cases as needed
   
   wait;
 end process;


end Behavioral;