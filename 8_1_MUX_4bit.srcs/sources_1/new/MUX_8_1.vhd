----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 03:42:40 PM
-- Design Name: 
-- Module Name: MUX_8_4bit - Behavioral
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

entity MUX_8_1 is
    Port ( Reg_Sel : in STD_LOGIC_VECTOR (2 downto 0);
           D0 : in STD_LOGIC_VECTOR (3 downto 0);
           D1 : in STD_LOGIC_VECTOR (3 downto 0);
           D2 : in STD_LOGIC_VECTOR (3 downto 0);
           D3 : in STD_LOGIC_VECTOR (3 downto 0);
           D4 : in STD_LOGIC_VECTOR (3 downto 0);
           D5 : in STD_LOGIC_VECTOR (3 downto 0);
           D6 : in STD_LOGIC_VECTOR (3 downto 0);
           D7 : in STD_LOGIC_VECTOR (3 downto 0);
           Out_Mux_8_4 : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_8_1;

architecture Behavioral of MUX_8_1 is

begin
process (Reg_Sel, D0, D1, D2, D3, D4, D5, D6, D7)
begin 
    case Reg_Sel is
        when "000" =>
            Out_Mux_8_4 <= D0;
        when "001" =>
            Out_Mux_8_4 <= D1;
        when "010" =>
            Out_Mux_8_4 <= D2;
        when "011" =>
            Out_Mux_8_4 <= D3;
        when "100" =>
            Out_Mux_8_4 <= D4;
        when "101" =>
            Out_Mux_8_4 <= D5;
        when "110" =>
            Out_Mux_8_4 <= D6;
        when "111" =>
            Out_Mux_8_4 <= D7;
        when others =>
            Out_Mux_8_4 <= (others => 'U');
    end case;
end process;



end Behavioral;