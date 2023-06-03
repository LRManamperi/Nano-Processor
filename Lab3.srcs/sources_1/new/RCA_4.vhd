----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/14/2023 10:53:18 PM
-- Design Name: 
-- Module Name: RCA_4 - Behavioral
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

entity RCA_4 is
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
           --C_in : in STD_LOGIC;
           CTRL : in STD_LOGIC;
           S0 : inout STD_LOGIC;
           S1 : inout STD_LOGIC;
           S2 : inout STD_LOGIC;
           S3 : inout STD_LOGIC;
           --C_out : out STD_LOGIC;
           Out_Overflow : out STD_LOGIC;
           Out_Zero : out STD_LOGIC);
end RCA_4;

architecture Behavioral of RCA_4 is
component FA
port (
    A: in std_logic;
    B: in std_logic;
    C_in: in std_logic;
    S: out std_logic;
    C_out: out std_logic);
end component;

SIGNAL FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C,B0_S,B1_S,B2_S,B3_S
: std_logic;

begin

    B0_S<=B0 XOR CTRL;
    B1_S<=B1 XOR CTRL;
    B2_S<=B2 XOR CTRL;
    B3_S<=B3 XOR CTRL;  

FA_0 : FA
port map (
    A => A0,
    B =>B0_S,
    C_in => CTRL, -- Set to ground C_in => C_in,
    S => S0,
    C_out => FA0_C);
FA_1 : FA
port map (
    A => A1,
    B => B1_S,
    C_in => FA0_C,
    S => S1,
    C_out => FA1_C);
FA_2 : FA
port map (
    A => A2,
    B => B2_S,
    C_in => FA1_C,
    S => S2,
    C_out => FA2_C);
FA_3 : FA
port map (
    A => A3,
    B => B3_S,
    C_in => FA2_C,
    S => S3,
    C_out =>  Out_Overflow);
    
    Out_Zero <= not(S0 or S1 or S2 or S3);
    

end Behavioral;
