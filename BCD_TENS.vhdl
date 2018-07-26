library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity BCD_TENS is
    port(
        clk          : in std_logic;
        res          : in std_logic;
        cnt0,cnt1    : out std_logic_vector(0 to 3)
    );
end BCD_TENS;

architecture BCD_TENS of BCD_TENS is
    component CLK_DIVISION
        port (
            clk_in : in  STD_LOGIC;
            reset  : in  STD_LOGIC;
            clk_out: out STD_LOGIC
        );
    end component;

    signal ck               : std_logic;
    signal q_reg0,q_reg1    : std_logic_vector(0 to 3);

    begin 
        CLK_CVT: CLK_DIVISION port map(clk,res,ck);
        COUNTER: process(ck,res) begin
            if res='1' then q_reg0<="0000"; q_reg1<="0000";
            elsif ck'event and ck='1' then
                if q_reg0=9 then 
                    q_reg0<="0000";
                    if q_reg1=9 then 
                        q_reg1<="0000";
                    else
                        q_reg1<=q_reg1+1;
                    end if;
                else 
                    q_reg0<=q_reg0+1;
                end if;
            end if;
        end process;
        cnt0<=q_reg0;
        cnt1<=q_reg1;
end BCD_TENS;