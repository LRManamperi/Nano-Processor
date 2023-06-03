----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 02:33:05 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
    Port (
        In_Instruction : in STD_LOGIC_VECTOR (11 downto 0);
        In_Jump_Check : in STD_LOGIC_VECTOR (3 downto 0);
        In_Clk : in STD_LOGIC;
        In_Reset : in STD_LOGIC;
        Out_Reg_Enable : out STD_LOGIC_VECTOR (2 downto 0);
        Out_Reg_Sel_A : out STD_LOGIC_VECTOR (2 downto 0);
        Out_Reg_Sel_B : out STD_LOGIC_VECTOR (2 downto 0);
        Out_EN_PC : out STD_LOGIC;
        Out_EN_Store : out STD_LOGIC;
        Out_Add_Sub_Sel : out STD_LOGIC;
        Out_Jump_Flag : out STD_LOGIC;
        Out_Jump_Addr : out STD_LOGIC_VECTOR (2 downto 0);
        Out_Load_Sel : out STD_LOGIC;
        Out_Imm_Val : out STD_LOGIC_VECTOR (3 downto 0)
    );
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is
begin
    Out_Load_Sel <= NOT(In_Instruction(11));
    Out_Reg_Enable <= In_Instruction(9 downto 7);
    Out_Reg_Sel_A <= In_Instruction(9 downto 7);
    Out_Reg_Sel_B <= In_Instruction(6 downto 4);
    Out_Jump_Addr <= In_Instruction(2 downto 0);

    Out_Jump_Flag <= '1' when (In_Instruction(11) = '1' and In_Instruction(10) = '1' and In_Jump_Check = "0000") else '0';
    Out_Add_Sub_Sel <= '1' when (NOT In_Instruction(11) = '1' and In_Instruction(10) = '1') else '0';
    Out_Imm_Val <= In_Instruction(3 downto 0);

    Out_EN_Store <= '1' when (In_Instruction(11) = '0' and In_Instruction(10) = '0') else '0';
    Out_EN_PC <= '1' when (In_Instruction(11) = '1' and In_Instruction(10) = '0') else '0';

end Behavioral;