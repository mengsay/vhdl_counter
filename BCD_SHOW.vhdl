library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity BCD_SHOW is
    port(
        clk     : in std_logic;
        res     : in std_logic;
        cnt     : out std_logic_vector(0 to 6)
    );
end BCD_SHOW;

architecture BCD_SHOW of BCD_SHOW is
    component BCD_COUNTER
        port(
            clk     : in std_logic;
            res     : in std_logic;
            cnt     : out std_logic_vector(0 to 3)
        );
    end component;

    component SEG_DECODER 
        port(
            in_bcd : in std_logic_vector(0 to 3);
            out_seg: out std_logic_vector(0 to 6)
        );
    end component;

    signal counter : std_logic_vector(0 to 3);

    begin
        BCD  : BCD_COUNTER port map(clk,res,counter);
        SHOW : SEG_DECODER port map(counter,cnt);
end BCD_SHOW;