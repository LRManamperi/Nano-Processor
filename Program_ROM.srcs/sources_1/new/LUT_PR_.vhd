----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 09:39:51 AM
-- Design Name: 
-- Module Name: LUT_PR - Behavioral
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
use ieee.numeric_std.all; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LUT_PR is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end LUT_PR;

architecture Behavioral of LUT_PR is
type rom_type is array (0 to 15) of std_logic_vector(11 downto 0);
    signal assemblyInstructions_ROM : rom_type := (
                            "100010001010", --MOVI R1, 10 ; R1 ? 10
                            "100100000001", --MOVI R2, 1 ; R2 ? 1
                            "010100000000", --NEG R2 ; R2 ? -R2
                            "000010100000", --ADD R1, R2 ; R1 ? R1 + R2
                            "110010000111", --JZR R1, 7 ; If R1 = 0 jump to line 7
                            "110000000011"  --JZR R0, 3 ; If R0 = 0 jump to line 3
          
    );

begin
data <= assemblyInstructions_ROM(to_integer(unsigned(address)));


end Behavioral;