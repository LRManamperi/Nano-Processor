----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 04:20:17 PM
-- Design Name: 
-- Module Name: MUX_2_1 - Behavioral
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

entity MUX_2_1_4bit is
  Port ( 
  In_Imm_Val : in std_logic_vector(3 downto 0);
  In_Adder_4 : in std_logic_vector(3 downto 0);
  Load_Sel : in std_logic;
  Out_Mux_2_4 : out std_logic_vector(3 downto 0)
  );
end MUX_2_1_4bit;

architecture Behavioral of MUX_2_1_4bit is

begin
process(Load_Sel, In_Imm_Val, In_Adder_4)
    begin
        if Load_Sel = '0' then
            Out_Mux_2_4 <= In_Imm_Val;
        else 
            Out_Mux_2_4 <= In_Adder_4;
        end if;
 end process;              

end Behavioral;