library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CLK_DIVISION is
    port (
        clk_in : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        clk_out: out STD_LOGIC
    );
end CLK_DIVISION;

architecture CLK_DIVISION of CLK_DIVISION is
    signal temporal: STD_LOGIC;
    signal counter : integer range 0 to 24999 := 0;
begin
    frequency_divider: process (reset, clk_in) begin
        if (reset = '1') then
            temporal <= '0';
            counter <= 0;
        elsif rising_edge(clk_in) then
            if (counter = 24999) then
                temporal <= NOT(temporal);
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    
    clk_out <= temporal;
end CLK_DIVISION;