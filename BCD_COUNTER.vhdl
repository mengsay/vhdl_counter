library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity BCD_COUNTER is
    port(
        clk     : in std_logic;
        res     : in std_logic;
        cnt     : out std_logic_vector(0 to 3)
    );
end BCD_COUNTER;

architecture BCD_COUNTER of BCD_COUNTER is
    component CLK_DIVISION
        port (
            clk_in : in  STD_LOGIC;
            reset  : in  STD_LOGIC;
            clk_out: out STD_LOGIC
        );
    end component;

    signal ck  : std_logic;
    signal q_reg    : std_logic_vector(0 to 3);

    begin 
        CLK_CVT: CLK_DIVISION port map(clk,res,ck);
        COUNTER: process(ck,res) begin
            if res='1' then q_reg<="0000";
            elsif ck'event and ck='1' then
                if q_reg=9 then 
                    q_reg<="0000";
                else 
                    q_reg<=q_reg+1;
                end if;
            end if;
        end process;
        cnt<=q_reg;
end BCD_COUNTER;