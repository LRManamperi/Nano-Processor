----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 01:30:46 PM
-- Design Name: 
-- Module Name: LUT_PR_Sim - Behavioral
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

entity LUT_PR_Sim is
end LUT_PR_Sim;

architecture Behavioral of LUT_PR_Sim is
    -- Component Declaration
    component LUT is
        Port ( In_MEM_SEL : in STD_LOGIC_VECTOR (2 downto 0);
               OUT_INSTRUCTION : out STD_LOGIC_VECTOR (11 downto 0));
    end component;

    -- Signal Declarations
    signal address_tb : STD_LOGIC_VECTOR (2 downto 0);
    signal data_tb : STD_LOGIC_VECTOR (11 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: LUT port map (In_MEM_SEL => address_tb, OUT_INSTRUCTION => data_tb);

    -- Stimulus Process
    stimulus: process
    begin
        -- Initialize inputs
        address_tb <= "000";
        
        -- Wait for some time
        wait for 10 ns;
        
        -- Change inputs
        address_tb <= "001";
        
        -- Wait for some time
        wait for 10 ns;
        
        -- Change inputs
        address_tb <= "010";
        
        -- Wait for some time
        wait for 10 ns;
        
        -- Change inputs
        address_tb <= "011";
        
        -- Wait for some time
        wait for 10 ns;
        
        -- Add more test cases as needed
        
        -- End the simulation
        wait;
    end process;

end Behavioral;
