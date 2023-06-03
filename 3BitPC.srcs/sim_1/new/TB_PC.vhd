library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Program_Counter_TB is
end Program_Counter_TB;

architecture Behavioral of Program_Counter_TB is
    -- Constants for simulation
    constant CLK_PERIOD: time := 10 ns;
    
    -- Component declaration
    component Program_Counter
        port (
            I_CLK : in STD_LOGIC;
            I_RESET : in STD_LOGIC;
            I_ENABLE_PC : in STD_LOGIC;
            I_A_In : in STD_LOGIC_VECTOR (2 downto 0);
            OUT_MEM_SEL : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;

    -- Signals for test bench
    signal tb_CLK: STD_LOGIC := '0';
    signal tb_RESET: STD_LOGIC := '0';
    signal tb_ENABLE_PC: STD_LOGIC := '0';
    signal tb_A_In: STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal tb_OUT_MEM_SEL: STD_LOGIC_VECTOR(2 downto 0);

begin

    -- Instantiate the DUT (Device Under Test)
    DUT: Program_Counter
        port map (
            I_CLK => tb_CLK,
            I_RESET => tb_RESET,
            I_ENABLE_PC => tb_ENABLE_PC,
            I_A_In => tb_A_In,
            OUT_MEM_SEL => tb_OUT_MEM_SEL
        );

    -- Clock process
    process
    begin
        while now < 100 ns loop
            tb_CLK <= '0';
            wait for CLK_PERIOD / 2;
            tb_CLK <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    process
    begin
        tb_RESET <= '1';  -- Reset initially
        wait for 20 ns;
        tb_RESET <= '0';  -- Release reset
        wait for 10 ns;
        
        -- Test case 1: Enable PC, provide input
        tb_ENABLE_PC <= '1';
        tb_A_In <= "010";
        wait for 20 ns;
        
        -- Test case 2: Disable PC
        tb_ENABLE_PC <= '0';
        wait for 10 ns;
        
        -- Test case 3: Enable PC, change input
        tb_ENABLE_PC <= '1';
        tb_A_In <= "101";
        wait for 20 ns;
        
        -- Test case 4: Reset
        tb_RESET <= '1';
        wait for 10 ns;
        
        -- Test case 5: Release reset
        tb_RESET <= '0';
        wait for 10 ns;
        
        -- Add more test cases if needed
        
        wait;
    end process;

end Behavioral;
