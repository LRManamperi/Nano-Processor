----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 02:35:34 PM
-- Design Name: 
-- Module Name: ID_Sim - Behavioral
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

entity Instruction_Decoder_TB is
end Instruction_Decoder_TB;

architecture Behavioral of Instruction_Decoder_TB is
    -- Component declaration
    component Instruction_Decoder is
        Port (
            instruction : in STD_LOGIC_VECTOR (11 downto 0);
            pc_reset : in STD_LOGIC;
            clk : in STD_LOGIC;
            data_bus : inout STD_LOGIC_VECTOR (11 downto 0);
            reg_enable : out STD_LOGIC_VECTOR (1 downto 0);
            reg_read : out STD_LOGIC_VECTOR (1 downto 0);
            alu_add_sub : out STD_LOGIC;
            alu_input_sel : out STD_LOGIC;
            output_reg_enable : out STD_LOGIC;
            pc_jump_enable : out STD_LOGIC;
            pc_jump_address : out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

    -- Signal declarations
    signal instruction_tb : STD_LOGIC_VECTOR (11 downto 0);
    signal pc_reset_tb : STD_LOGIC;
    signal clk_tb : STD_LOGIC;
    signal data_bus_tb : STD_LOGIC_VECTOR (11 downto 0);
    signal reg_enable_tb : STD_LOGIC_VECTOR (1 downto 0);
    signal reg_read_tb : STD_LOGIC_VECTOR (1 downto 0);
    signal alu_add_sub_tb : STD_LOGIC;
    signal alu_input_sel_tb : STD_LOGIC;
    signal output_reg_enable_tb : STD_LOGIC;
    signal pc_jump_enable_tb : STD_LOGIC;
    signal pc_jump_address_tb : STD_LOGIC_VECTOR (2 downto 0);

begin
    -- Instantiate the Instruction Decoder
    uut: Instruction_Decoder port map (
        instruction => instruction_tb,
        pc_reset => pc_reset_tb,
        clk => clk_tb,
        data_bus => data_bus_tb,
        reg_enable => reg_enable_tb,
        reg_read => reg_read_tb,
        alu_add_sub => alu_add_sub_tb,
        alu_input_sel => alu_input_sel_tb,
        output_reg_enable => output_reg_enable_tb,
        pc_jump_enable => pc_jump_enable_tb,
        pc_jump_address => pc_jump_address_tb
    );

    -- Stimulus process
    stim_proc: process
    begin
        -- Initialize inputs
        instruction_tb <= "100010001010"; -- MOVI R1, 10
        pc_reset_tb <= '0';
        clk_tb <= '0';
        
        -- Wait for a few clock cycles
        wait for 10 ns;
        
        -- Toggle clock
        clk_tb <= not clk_tb;
        wait for 10 ns;
        clk_tb <= not clk_tb;
        
        -- Change instruction and inputs
        instruction_tb <= "100100000001"; -- MOVI R2, 1
        wait for 10 ns;
        clk_tb <= not clk_tb;
        wait for 10 ns;
        clk_tb <= not clk_tb;
        
        -- Change instruction and inputs
        instruction_tb <= "010100000000"; -- NEG R2
        wait for 10 ns;
        clk_tb <= not clk_tb;
        wait for 10 ns;
        clk_tb <= not clk_tb;
        
        -- Change instruction and inputs
        instruction_tb <= "000010100000"; -- ADD R1, R2
        wait for 10 ns;
        clk_tb <= not clk_tb;
        wait for 10 ns;
        clk_tb <= not clk_tb;
        
        --
        end process;
end Behavioral;

