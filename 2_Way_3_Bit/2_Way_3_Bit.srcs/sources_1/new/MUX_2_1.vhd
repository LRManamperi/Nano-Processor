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

entity MUX_2_1 is
  Port ( 
  In_Adder_3 : in std_logic_vector(2 downto 0);
  In_Jump_Add : in std_logic_vector(2 downto 0);
  Jump_Flag : in std_logic;
  Out_Mux_2_3 : out std_logic_vector(2 downto 0)
  );
end MUX_2_1;

architecture Behavioral of MUX_2_1 is

begin
process(Jump_Flag, In_Adder_3, In_Jump_Add)
    begin
        if Jump_Flag = '0' then
           Out_Mux_2_3  <= In_Adder_3;
        else 
            Out_Mux_2_3 <= In_Jump_Add;
        end if;
 end process;              

end Behavioral;
