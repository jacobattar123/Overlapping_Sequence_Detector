library ieee;
use ieee.std_logic_1164.all;

entity Overlapping_Seq_Detector_tb is
end entity Overlapping_Seq_Detector_tb;

architecture behavior of Overlapping_Seq_Detector_tb is
    component Overlapping_Seq_Detector is
        port (
            clk: in std_logic;
            reset: in std_logic;
            input_bit: in std_logic;
            output: out std_logic
        );
    end component Overlapping_Seq_Detector;
    
    signal clk: std_logic := '0';
    signal reset: std_logic := '0';
    signal input_bit: std_logic := '0';
    signal output: std_logic := '0';
    
    constant clk_period: time := 10 ns;
begin
    dut: Overlapping_Seq_Detector
        port map (
            clk => clk,
            reset => reset,
            input_bit => input_bit,
            output => output
        );
        
    clk_gen: process
    begin
        clk <= '1';
        wait for clk_period/2;
        clk <= '0';
        wait for clk_period/2;
    end process;
    
    test: process
    begin
        reset <= '1';
        wait for clk_period;
        reset <= '0';
        input_bit <= '1';
        wait for clk_period;
        input_bit <= '0';
        wait for clk_period;
        input_bit <= '1';
        wait for clk_period;
        input_bit <= '0';
        wait for clk_period;
        input_bit <= '1';
        wait for clk_period;
        input_bit <= '0';
        wait for clk_period;
        input_bit <= '0';
        wait for clk_period;
        input_bit <= '1';
        wait for clk_period;
        input_bit <= '0';
        wait for clk_period;
        input_bit <= '1';
        wait for clk_period;
        wait;
    end process;
end architecture behavior;

