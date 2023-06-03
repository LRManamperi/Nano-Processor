library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Program_Counter is
    port (
        In_CLK : in STD_LOGIC;
        In_RESET : in STD_LOGIC;
        In_ENABLE_PC: in STD_LOGIC;
        In_A_In : in STD_LOGIC_VECTOR (2 downto 0);
        OUT_MEM_SEL : out STD_LOGIC_VECTOR(2 downto 0)
    );
end Program_Counter;


architecture Behavioral of Program_Counter is
begin
    process (In_Clk) begin
        if (rising_edge(In_Clk)) then
            if In_RESET = '1' then
                OUT_MEM_SEL <= "000";
            else
                if In_ENABLE_PC = '1' then
                    OUT_MEM_SEL <= In_A_In;
                end if;
            end if;
        end if ;
end process;
--to here
end Behavioral;
