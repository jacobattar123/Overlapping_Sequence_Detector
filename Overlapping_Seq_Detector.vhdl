library ieee;
use ieee.std_logic_1164.all;

entity Overlapping_Seq_Detector is
    port (
        clk: in std_logic;
        reset: in std_logic;
        input_bit: in std_logic;
        output: out std_logic
    );
end entity Overlapping_Seq_Detector;

architecture behavior of Overlapping_Seq_Detector is
    type state_type is (s0, s1, s2);
    signal current_state, next_state: state_type;
begin
    process(clk, reset)
    begin
        if (reset = '1') then
            current_state <= s0;
        elsif (rising_edge(clk)) then
            current_state <= next_state;
        end if;
    end process;

    state_machine: process(current_state, input_bit)
    begin
        output <= '0';
        case current_state is
            when s0 =>
                if (input_bit = '1') then
                    next_state <= s1;
                else
                    next_state <= s0;
                end if;
            when s1 =>
                if (input_bit = '1') then
                    next_state <= s1;
                else
                    next_state <= s2;
                end if;
            when s2 =>
                if (input_bit = '1') then
                    next_state <= s1;
                    output <= '1';
                else
                    next_state <= s0;
                end if;
        end case;
    end process;
end architecture behavior;
