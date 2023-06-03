library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_4bit_TB is
end Reg_4bit_TB;

architecture Behavioral of Reg_4bit_TB is

  -- Component declaration for the DUT (Design Under Test)
  component Reg_4bit is
    Port ( 
      D : in STD_LOGIC_VECTOR(3 downto 0);
      En : in STD_LOGIC;
      EN_STORE : in STD_LOGIC;
      RES : in STD_LOGIC;
      CLK : in STD_LOGIC;
      Q : out STD_LOGIC_VECTOR(3 downto 0)
    );
  end component;

  -- Signal declarations
  signal D_tb : STD_LOGIC_VECTOR(3 downto 0);
  signal En_tb : STD_LOGIC;
  signal EN_STORE_tb : STD_LOGIC;
  signal RES_tb : STD_LOGIC;
  signal CLK_tb : STD_LOGIC;
  signal Q_tb : STD_LOGIC_VECTOR(3 downto 0);

begin

  -- Instantiate the DUT
  UUT: Reg_4bit
    port map (
      D => D_tb,
      En => En_tb,
      EN_STORE => EN_STORE_tb,
      RES => RES_tb,
      CLK => CLK_tb,
      Q => Q_tb
    );

  -- Stimulus process
  stimulus_proc: process
  begin
    -- Initialize inputs
    D_tb <= "0000";
    En_tb <= '0';
    EN_STORE_tb <= '0';
    RES_tb <= '0';
    CLK_tb <= '0';

    -- Wait for a few clock cycles
    wait for 10 ns;
    
    -- Apply inputs
    D_tb <= "1100";
    En_tb <= '1';
    EN_STORE_tb <= '1';
    RES_tb <= '0';
    CLK_tb <= '0';

    -- Toggle the clock
    CLK_tb <= '1';
    wait for 10 ns;
    CLK_tb <= '0';
    wait for 10 ns;

    -- Apply new inputs
    D_tb <= "1010";
    En_tb <= '1';
    EN_STORE_tb <= '1';
    RES_tb <= '0';
    CLK_tb <= '0';

    -- Toggle the clock
    CLK_tb <= '1';
    wait for 10 ns;
    CLK_tb <= '0';
    wait for 10 ns;

    -- Apply new inputs
    D_tb <= "0101";
    En_tb <= '1';
    EN_STORE_tb <= '1';
    RES_tb <= '0';
    CLK_tb <= '0';

    -- Toggle the clock
    CLK_tb <= '1';
    wait for 10 ns;
    CLK_tb <= '0';
    wait for 10 ns;

    -- Apply new inputs
    D_tb <= "1111";
    En_tb <= '1';
    EN_STORE_tb <= '0';
    RES_tb <= '0';
    CLK_tb <= '0';

    -- Toggle the clock
    CLK_tb <= '1';
    wait for 10 ns;
    CLK_tb <= '0';
    wait for 10 ns;

    -- Apply new inputs
    D_tb <= "0000";
    En_tb <= '0';
    EN_STORE_tb <= '0';
    RES_tb <= '1';
    CLK_tb <= '0';

    -- Toggle the clock
    CLK_tb <= '1';
    wait for 10 ns;
    CLK_tb <= '0';
    wait for 10 ns;

    -- End of test
    wait;
  end process;
end behavioral;