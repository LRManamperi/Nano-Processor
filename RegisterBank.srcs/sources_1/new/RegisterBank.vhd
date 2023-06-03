----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 08:55:36 AM
-- Design Name: 
-- Module Name: RegisterBank - Behavioral
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

entity RegisterBank is
  Port ( 
  In_Clk : in STD_LOGIC;
  In_Reg_Enable : in STD_LOGIC_VECTOR (2 downto 0);
  In_Data_In : in STD_LOGIC_VECTOR (3 downto 0);
  In_Reset : in STD_LOGIC;
  In_EN_Store : in STD_LOGIC;
  Out_Data_Out : out STD_LOGIC_VECTOR (31 downto 0)
  );
end RegisterBank;

architecture Behavioral of RegisterBank is

Component Reg_4bit
    Port (  D : in STD_LOGIC_VECTOR (3 downto 0);
            En : in STD_LOGIC;
            EN_STORE : in STD_LOGIC;
            RES : in STD_LOGIC;
            CLK : in STD_LOGIC;
            Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

Component Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
End component;

signal Reg_Sel : STD_LOGIC_VECTOR (7 downto 0);
signal En : STD_LOGIC; --Not sure
  
begin

Decoder_3_to_8_0 : Decoder_3_to_8
port map(
    I => In_Reg_Enable, --Not sure
    EN => In_EN_Store, --Not sure
    Y => Reg_sel
);
    Out_Data_Out(31 downto 28) <= "0000";
-- Reg_0 : Reg
-- port map(
-- D => I_Data_In,
-- En => Reg_Sel(0),
-- Clk => I_Clk,
-- Q => O_Data_Out(31 downto 28)
-- ); --need to hardcode to store all 0s
Reg_1 : Reg_4bit
    port map(
        D => In_Data_In,
        En => Reg_Sel(1),
        En_Store => In_EN_Store,
        Res => In_Reset,
        Clk => In_Clk,
        Q => Out_Data_Out(27 downto 24)
);
Reg_2 : Reg_4bit
    port map(
        D => In_Data_In,
        En => Reg_Sel(2),
        En_Store => In_EN_Store,
        Res => In_Reset,
        Clk => In_Clk,
        Q => Out_Data_Out(23 downto 20)
);
Reg_3 : Reg_4bit
    port map(
        D => In_Data_In,
        En => Reg_Sel(3),
        En_Store => In_EN_Store,
        Res => In_Reset,
        Clk => In_Clk,
        Q => Out_Data_Out(19 downto 16)
);
Reg_4 : Reg_4bit
    port map(
        D => In_Data_In,
        En => Reg_Sel(4),
        En_Store => In_EN_Store,
        Res => In_Reset,
        Clk => In_Clk,
        Q => Out_Data_Out(15 downto 12)
);
Reg_5 : Reg_4bit
    port map(
        D => In_Data_In,
        En => Reg_Sel(5),
        En_Store => In_EN_Store,
        Res => In_Reset,
        Clk => In_Clk,
        Q => Out_Data_Out(11 downto 8)
);
Reg_6 : Reg_4bit
    port map(
        D => In_Data_In,
        En => Reg_Sel(6),
        En_Store => In_EN_Store,
        Res => In_Reset,
        Clk => In_Clk,
        Q => Out_Data_Out(7 downto 4)
);
Reg_7 : Reg_4bit
   port map(
        D => In_Data_In,
        En => Reg_Sel(7),
        En_Store => In_EN_Store,
        Res => In_Reset,
        Clk => In_Clk,
        Q => Out_Data_Out(3 downto 0)
);

end Behavioral;
