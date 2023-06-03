----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 04:24:56 PM
-- Design Name: 
-- Module Name: Nano_Processor_TB - Behavioral
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Nano_Processor_tb is
end entity;

architecture tb_arch of Nano_Processor_tb is
    -- Component declarations
    component Nano_Processor
        Port (
            Clk : in std_logic;
            Res : in std_logic;
            Overflow_led : out std_logic;
            Zero_led : out std_logic;
            Reg_7 : out std_logic_vector(3 downto 0);
            Reg_1 : out std_logic_vector(3 downto 0);
            Seg7_Anode : out std_logic_vector(3 downto 0);
            Seg7_Out : out std_logic_vector(6 downto 0)
        );
    end component;

    -- Signal declarations
    signal Clk : std_logic := '0';
    signal Res : std_logic := '0';
    signal Overflow_led : std_logic;
    signal Zero_led : std_logic;
    signal Reg_7 : std_logic_vector(3 downto 0);
    signal Reg_1 : std_logic_vector(3 downto 0);
    signal Seg7_Anode : std_logic_vector(3 downto 0);
    signal Seg7_Out : std_logic_vector(6 downto 0);

begin

    -- DUT instantiation
    dut: Nano_Processor
        Port map (
            Clk => Clk,
            Res => Res,
            Overflow_led => Overflow_led,
            Zero_led => Zero_led,
            Reg_7 => Reg_7,
            Reg_1 => Reg_1,
            Seg7_Anode => Seg7_Anode,
            Seg7_Out => Seg7_Out
        );

    -- Clock process
    process
    begin
        while now < 1000 ns loop
            Clk <= '0';
            wait for 5 ns;
            Clk <= '1';
            wait for 5 ns;
        end loop;
        wait;
    end process;

    -- Stimulus process
    process
    begin
        -- Add your test stimuli here
        -- Set the appropriate input signals and observe the outputs
        
        -- Example:
        Res <= '1';  -- Set reset to active high
        wait for 10 ns;
        Res <= '0';  -- Release reset
        
        -- Wait for some time to observe the outputs
        wait for 100 ns;
        
        -- Add more test cases if needed
        
        wait;
    end process;

end architecture;

