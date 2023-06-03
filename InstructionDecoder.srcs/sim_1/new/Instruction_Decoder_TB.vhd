----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 02:36:52 PM
-- Design Name: 
-- Module Name: Instruction_Decoder_TB - Behavioral
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Instruction_Decoder_TB is
end Instruction_Decoder_TB;

architecture Behavioral of Instruction_Decoder_TB is

    -- Constants
    constant CLK_PERIOD: time := 10 ns;
    
    -- Component declaration
    component Instruction_Decoder is
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
    end component;

    -- Signals
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal instruction : STD_LOGIC_VECTOR(11 downto 0);
    signal jump_check : STD_LOGIC_VECTOR(3 downto 0);
    signal reg_enable : STD_LOGIC_VECTOR(2 downto 0);
    signal reg_sel_a : STD_LOGIC_VECTOR(2 downto 0);
    signal reg_sel_b : STD_LOGIC_VECTOR(2 downto 0);
    signal en_pc : STD_LOGIC;
    signal en_store : STD_LOGIC;
    signal add_sub_sel : STD_LOGIC;
    signal jump_flag : STD_LOGIC;
    signal jump_addr : STD_LOGIC_VECTOR(2 downto 0);
    signal load_sel : STD_LOGIC;
    signal imm_val : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- Instantiate the Instruction_Decoder component
    UUT: Instruction_Decoder
        Port Map (
            In_Instruction => instruction,
            In_Jump_Check => jump_check,
            In_Clk => clk,
            In_Reset => reset,
            Out_Reg_Enable => reg_enable,
            Out_Reg_Sel_A => reg_sel_a,
            Out_Reg_Sel_B => reg_sel_b,
            Out_EN_PC => en_pc,
            Out_EN_Store => en_store,
            Out_Add_Sub_Sel => add_sub_sel,
            Out_Jump_Flag => jump_flag,
            Out_Jump_Addr => jump_addr,
            Out_Load_Sel => load_sel,
            Out_Imm_Val => imm_val
        );

    -- Clock process
    clk_process: process
    begin
        while now < 100 ns loop
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stimulus_process: process
    begin
        -- Reset
        reset <= '1';
        wait for CLK_PERIOD;
        reset <= '0';
        wait for CLK_PERIOD;

        -- Test case 1
        instruction <= "000000000000";
        jump_check <= "0000";
        wait for CLK_PERIOD;

        -- Test case 2
        instruction <= "000100000000";
        jump_check <= "0000";
        wait for CLK_PERIOD;

        -- Add more test cases as needed

        wait;
    end process;

end Behavioral;
