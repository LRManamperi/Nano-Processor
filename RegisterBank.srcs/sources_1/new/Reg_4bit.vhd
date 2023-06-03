----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 08:40:26 AM
-- Design Name: 
-- Module Name: Reg_4bit - Behavioral
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

entity Reg_4bit is
  Port ( 
    D : in STD_LOGIC_VECTOR(3 downto 0);
    En : in STD_LOGIC;
    EN_STORE : in STD_LOGIC;
    RES : in STD_LOGIC;
    CLK : iN STD_LOGIC;
    Q : out STD_LOGIC_VECTOR(3 downto 0)
  );
end Reg_4bit;

architecture Behavioral of Reg_4bit is

begin
process (Clk) begin
    if (rising_edge(Clk)) then
        if Res = '1' then
            Q <= "0000";
        else
            if En = '1' then
                if En_Store = '1' then
                    Q <= D;
                end if;
            end if;
        end if;
    end if;
end process;

end Behavioral;
