----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 02:54:58 PM
-- Design Name: 
-- Module Name: NanoProcessor - Behavioral
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

entity Nano_Processor is
  Port (
    Clk : in STD_LOGIC;
    Res : in STD_LOGIC;
    Overflow_led : out STD_LOGIC;
    Zero_led : out STD_LOGIC;
    Reg_7 : out std_logic_vector(3 downto 0);
    Reg_1 : out std_logic_vector(3 downto 0);
    Seg7_Anode : out STD_LOGIC_VECTOR(3 downto 0);
    Seg7_Out : out STD_LOGIC_VECTOR(6 downto 0)
  );
end Nano_Processor;

architecture Behavioral of Nano_Processor is

component Instruction_Decoder
    Port ( -- the instruction from the PC register address
        In_Instruction : in STD_LOGIC_VECTOR (11 downto 0);
        -- for the JZR instruction
        In_Jump_Check : in STD_LOGIC_VECTOR (3 downto 0);
        In_Clk : in STD_LOGIC;
        In_Reset: in STD_LOGIC;
        -- enabling the relevant register in register bank
        Out_Reg_Enable : out STD_LOGIC_VECTOR (2 downto 0);
        -- selecting the relevant register input A for Add/Sub unit
        Out_Reg_Sel_A : out STD_LOGIC_VECTOR (2 downto 0);
        -- selecting the relevant register input B for Add/Sub unit
        Out_Reg_Sel_B : out STD_LOGIC_VECTOR (2 downto 0);
        -- enable writing to PC register
        Out_EN_PC : out STD_LOGIC;
        -- enable writing to register bank registers
        Out_EN_Store : out STD_LOGIC;
        -- add or sub for Add/Sub unit (1 for subtraction)
        Out_Add_Sub_Sel : out STD_LOGIC;
        -- to determine if PC is incremented normally or by address from JZR instruction (1 to jump)
        Out_Jump_Flag : out STD_LOGIC;
        -- jump address from JZR instruction
        Out_Jump_Addr : out STD_LOGIC_VECTOR (2 downto 0);
        -- load immediate value or add/sub result (0 for imm, 1 for add/sub)
        Out_Load_Sel : out STD_LOGIC;
        -- immediate value passed from instruction
        Out_Imm_Val : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Program_Counter
    Port ( 
        In_Reset : in STD_LOGIC;
        In_Clk : in STD_LOGIC;
        In_ENABLE_PC: in STD_LOGIC;
        In_A_In : in STD_LOGIC_VECTOR (2 downto 0);
        Out_MEM_SEL : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component LUT
     Port ( 
        In_MEM_SEL : in STD_LOGIC_VECTOR (2 downto 0);
        OUT_Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component RegisterBank
Port ( 
    In_Clk : in STD_LOGIC;
    In_Reg_Enable : in STD_LOGIC_VECTOR (2 downto 0);
    In_Data_In : in STD_LOGIC_VECTOR (3 downto 0);
    In_Reset : in STD_LOGIC;
    In_EN_Store : in STD_LOGIC;
    Out_Data_Out : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component RCA3
    Port ( 
        A0 : in STD_LOGIC;
        A1 : in STD_LOGIC;
        A2 : in STD_LOGIC;
        B0 : in STD_LOGIC;
        B1 : in STD_LOGIC;
        B2 : in STD_LOGIC;
        --C_in : in STD_LOGIC;
        S0 : out STD_LOGIC;
        S1 : out STD_LOGIC;
        S2 : out STD_LOGIC;
        Adder_3_out : out STD_LOGIC);
end component;

component RCA_4
    Port ( 
        A0 : in STD_LOGIC;
        A1 : in STD_LOGIC;
        A2 : in STD_LOGIC;
        A3 : in STD_LOGIC;
        B0 : in STD_LOGIC;
        B1 : in STD_LOGIC;
        B2 : in STD_LOGIC;
        B3 : in STD_LOGIC;
        CTRL : in STD_LOGIC;
        S0 : inout STD_LOGIC;
        S1 : inout STD_LOGIC;
        S2 : inout STD_LOGIC;
        S3 : inout STD_LOGIC;
        Out_Overflow : out STD_LOGIC;
        Out_Zero : out STD_LOGIC);
end component;

component MUX_8_1
    Port ( 
        Reg_Sel : in STD_LOGIC_VECTOR (2 downto 0);
        D0 : in STD_LOGIC_VECTOR (3 downto 0);
        D1 : in STD_LOGIC_VECTOR (3 downto 0);
        D2 : in STD_LOGIC_VECTOR (3 downto 0);
        D3 : in STD_LOGIC_VECTOR (3 downto 0);
        D4 : in STD_LOGIC_VECTOR (3 downto 0);
        D5 : in STD_LOGIC_VECTOR (3 downto 0);
        D6 : in STD_LOGIC_VECTOR (3 downto 0);
        D7 : in STD_LOGIC_VECTOR (3 downto 0);
        Out_Mux_8_4 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Slow_Clk
    Port (
        Clk_in : in STD_LOGIC;
        Clk_out : out STD_LOGIC);
end component;

component MUX_2_1_4bit
    Port ( 
        In_Imm_Val : in STD_LOGIC_VECTOR (3 downto 0);
        In_Adder_4 : in STD_LOGIC_VECTOR (3 downto 0);
        Load_Sel : in STD_LOGIC;
        Out_MUX_2_4 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component MUX_2_1
    Port ( 
        In_Adder_3 : in STD_LOGIC_VECTOR (2 downto 0);
        In_Jump_Add : in STD_LOGIC_VECTOR (2 downto 0);
        Jump_Flag : in STD_LOGIC;
        Out_MUX_2_3 : out STD_LOGIC_VECTOR (2 downto 0)
);
end component;

component LUT_16_7
    Port ( 
        In_address : in STD_LOGIC_VECTOR (3 downto 0);
        Out_data : out STD_LOGIC_VECTOR (6 downto 0)
);
end component;

signal EN_PC, Add_Sub_Sel, jmpflg, Load_Sel, EN_Store,S_Clk: STD_LOGIC;
signal Data_Out : STD_LOGIC_VECTOR(31 downto 0);
signal Mem_Sel, Mux_2_3_out,Reg_Sel_A, Reg_Sel_B,jmpaddr: STD_LOGIC_VECTOR(2 downto 0);
signal Mux_8_4_A_out, Mux_8_4_B_out : STD_LOGIC_VECTOR(3 downto 0);
signal Imm_Val : STD_LOGIC_VECTOR (3 downto 0);
signal Adder_4 : STD_LOGIC_VECTOR(3 downto 0);
signal Data_In : STD_LOGIC_VECTOR(3 downto 0);
signal Reg_Enable : STD_LOGIC_VECTOR(2 downto 0);
signal Instruction : STD_LOGIC_VECTOR(11 downto 0);
signal bit_3_out : STD_LOGIC_VECTOR(2 downto 0);
signal led_address : STD_LOGIC_VECTOR (3 downto 0);
signal led_data : STD_LOGIC_VECTOR (6 downto 0);


begin

Slow_Clk_0: Slow_Clk
    port map( 
        Clk_in=>Clk,
        Clk_out=>S_Clk
);

Instruction_Decoder_0 : Instruction_Decoder
    Port map ( 
        In_Instruction => Instruction,
        In_Jump_Check => Mux_8_4_A_out,
        In_Clk => S_Clk,
        In_Reset=> Res,
        Out_Reg_Enable => Reg_Enable,
        Out_Reg_Sel_A => Reg_Sel_A,
        Out_Reg_Sel_B => Reg_Sel_B,
        Out_EN_PC => EN_PC,
        Out_EN_Store => EN_Store,
        Out_Add_Sub_Sel => Add_Sub_Sel,
        Out_Jump_Flag => jmpflg,
        Out_Jump_Addr =>jmpaddr ,
        Out_Load_Sel => Load_Sel,
        Out_Imm_Val => Imm_Val
);

Program_Counter_0 : Program_Counter
    port map(
        In_Reset => Res,
        In_Clk => S_Clk,
        In_ENABLE_PC => EN_PC,
        In_A_In => Mux_2_3_out,
        Out_Mem_Sel => Mem_Sel
);

Program_ROM_0 : LUT
    Port map(
        In_MEM_SEL => Mem_Sel,
        Out_Instruction => Instruction
);

Reg_Bank_0 : RegisterBank
    Port map (
        In_Clk => S_Clk,
        In_Reg_Enable => Reg_Enable,
        In_Data_In => Data_In,
        In_EN_Store => EN_store,
        Out_Data_Out => Data_Out,
        In_Reset => Res
);

Adder_3_0 : RCA3
    Port map(
        A0 => Mem_Sel(0),
        A1 => Mem_Sel(1), 
        A2 => Mem_Sel(2),       
        B0 => '0',
        B1 => '0',
        B2 => '1',
        S0 => bit_3_out(0),
        S1 => bit_3_out(1),
        S2 => bit_3_out(2)
        );
        
Add_Sub_4_0 : RCA_4
    Port map( 
        A0=> Mux_8_4_A_out(0),
        A1=> Mux_8_4_A_out(1),
        A2=> Mux_8_4_A_out(2),
        A3=> Mux_8_4_A_out(3),
        B0 => Mux_8_4_B_out(0),
        B1 => Mux_8_4_B_out(1),
        B2 => Mux_8_4_B_out(2),
        B3 => Mux_8_4_B_out(3),
        CTRL => Add_Sub_Sel,
        S0 => Adder_4(0),
        S1 => Adder_4(1),
        S2 => Adder_4(2),
        Out_Overflow => Overflow_led,
        Out_Zero => Zero_led
);


MUX_8_4_A : MUX_8_1
    Port map( 
        D0 => Data_Out(31 downto 28) ,
        D1 => Data_Out(27 downto 24),
        D2 => Data_Out(23 downto 20),
        D3 => Data_Out(19 downto 16),
        D4 => Data_Out(15 downto 12),
        D5 => Data_Out(11 downto 8),
        D6 => Data_Out(7 downto 4),
        D7 => Data_Out(3 downto 0),
        Reg_Sel => Reg_Sel_A,
        Out_MUX_8_4 => Mux_8_4_A_out
);

MUX_8_4_B : MUX_8_1
    Port map(
        D0 => Data_Out(31 downto 28) ,
        D1 => Data_Out(27 downto 24),
        D2 => Data_Out(23 downto 20),
        D3 => Data_Out(19 downto 16),
        D4 => Data_Out(15 downto 12),
        D5 => Data_Out(11 downto 8),
        D6 => Data_Out(7 downto 4),
        D7 => Data_Out(3 downto 0),
        Reg_Sel => Reg_Sel_B,
        Out_MUX_8_4 => Mux_8_4_B_out
);

MUX_2_4_4bit_0 : MUX_2_1_4bit
    Port map( 
        In_Imm_Val => Imm_Val,
        In_Adder_4 => Adder_4,
        Load_Sel => Load_Sel,
        Out_MUX_2_4 => Data_In
);

MUX_2_3_0 : MUX_2_1
    Port map( 
        In_Adder_3 => bit_3_out,
        In_Jump_Add=> jmpaddr ,
        Jump_Flag => jmpflg,
        Out_Mux_2_3 => Mux_2_3_out
);

LUT_16_7_0 : LUT_16_7
    port map(
        In_address => led_address,
        Out_data => Seg7_Out
);

Reg_7<=Data_Out(3 downto 0);
Reg_1<=Data_Out(27 downto 24);
led_address <= Data_Out(3 downto 0);
Seg7_Anode <= "1110";


end Behavioral;
