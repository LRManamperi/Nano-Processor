library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Registerbank is
end TB_Registerbank;

architecture Behavioral of TB_Registerbank is

    -- Component declaration
    component RegisterBank is
        Port (
            In_Reg_Enable : in STD_LOGIC_VECTOR (2 downto 0);
            In_Data_In : in STD_LOGIC_VECTOR (3 downto 0);
            In_Reset : in STD_LOGIC;
            In_En_Store : in STD_LOGIC;
            In_Clk : in STD_LOGIC;
            Out_Data_out : out STD_LOGIC_VECTOR (31 downto 0)
        );
    end component;

    -- Test bench signals
    signal I_Reg_Enable_tb : STD_LOGIC_VECTOR (2 downto 0);
    signal I_Data_In_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal I_Reset_tb : STD_LOGIC;
    signal I_En_Store_tb : STD_LOGIC;
    signal I_Clk_tb : STD_LOGIC;
    signal Data_out_tb : STD_LOGIC_VECTOR (31 downto 0);

begin

    -- Instantiate the Reg_bank module
    uut: RegisterBank
        port map (
            In_Reg_Enable => I_Reg_Enable_tb,
            In_Data_In => I_Data_In_tb,
            In_Reset => I_Reset_tb,
            In_En_Store => I_En_Store_tb,
            In_Clk => I_Clk_tb,
            Out_Data_out => Data_out_tb
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Initialize inputs
        I_Reg_Enable_tb <= "000";
        I_Data_In_tb <= "0000";
        I_Reset_tb <= '0';
        I_En_Store_tb <= '0';
        I_Clk_tb <= '0';

        -- Wait for a few clock cycles
        wait for 10 ns;

        -- Apply stimulus values
        I_Reg_Enable_tb <= "001";
        I_Data_In_tb <= "1101";
        I_Reset_tb <= '0';
        I_En_Store_tb <= '1';

        -- Toggle clock
        I_Clk_tb <= '1';
        wait for 10 ns;
        I_Clk_tb <= '0';
        wait for 10 ns;

        -- Apply new stimulus values
        I_Reg_Enable_tb <= "010";
        I_Data_In_tb <= "0110";
        I_Reset_tb <= '1';
        I_En_Store_tb <= '0';

        -- Toggle clock
        I_Clk_tb <= '1';
        wait for 10 ns;
        I_Clk_tb <= '0';
        wait for 10 ns;
        
        I_Reset_tb <= '1';
        I_En_Store_tb <= '1';
        
        I_Reg_Enable_tb <= "010";
        I_Data_In_tb <= "0110";
        I_Reset_tb <= '1';
        I_En_Store_tb <= '1';
        
        -- Apply stimulus values
        I_Reg_Enable_tb <= "011";
        I_Data_In_tb <= "1011";
        I_Reset_tb <= '0';
        I_En_Store_tb <= '1';
        
        -- Toggle clock
        I_Clk_tb <= '1';
        wait for 10 ns;
        I_Clk_tb <= '0';
        wait for 10 ns;
        
        -- Apply new stimulus values
        I_Reg_Enable_tb <= "001";
        I_Data_In_tb <= "0101";
        I_Reset_tb <= '0';
        I_En_Store_tb <= '1';
        
        -- Toggle clock
        I_Clk_tb <= '1';
        wait for 10 ns;
        I_Clk_tb <= '0';
        wait for 10 ns;
        
        -- Apply new stimulus values
        I_Reg_Enable_tb <= "010";
        I_Data_In_tb <= "1111";
        I_Reset_tb <= '0';
        I_En_Store_tb <= '1';
        
        -- Toggle clock
        I_Clk_tb <= '1';
        wait for 10 ns;
        I_Clk_tb <= '0';
        wait for 10 ns;
        
        -- Apply new stimulus values
        I_Reg_Enable_tb <= "011";
        I_Data_In_tb <= "0010";
        I_Reset_tb <= '0';
        I_En_Store_tb <= '1';
        
        -- Toggle clock
        I_Clk_tb <= '1';
        wait for 10 ns;
        I_Clk_tb <= '0';
        wait for 10 ns;
        
        -- Apply new stimulus values
        I_Reg_Enable_tb <= "010";
        I_Data_In_tb <= "1010";
        I_Reset_tb <= '1';
        I_En_Store_tb <= '0';
        
        -- Toggle clock
        I_Clk_tb <= '1';
        wait for 10 ns;
        I_Clk_tb <= '0';
        wait for 10 ns;



        -- Continue with more test cases

        wait;
    end process;

end Behavioral;