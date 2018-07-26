library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity BCD_TENS_SHOW is
    port(
        clk     : in std_logic;
        res     : in std_logic;
        cnt0,cnt1     : out std_logic_vector(0 to 6)
    );
end BCD_TENS_SHOW;

architecture BCD_TENS_SHOW of BCD_TENS_SHOW is
    component BCD_TENS 
        port(
        clk          : in std_logic;
        res          : in std_logic;
        cnt0,cnt1    : out std_logic_vector(0 to 3)
    );
    end component;

    component SEG_DECODER
        port(
        in_bcd : in std_logic_vector(0 to 3);
        out_seg: out std_logic_vector(0 to 6)
    );
    end component;

    signal uni,tens : std_logic_vector(0 to 3);

    begin
        BCD_CNT : BCD_TENS port map(clk,res,uni,tens);
        SHOW_UNIT: SEG_DECODER port map(uni,cnt0);
        SHOW_TENS: SEG_DECODER port map(tens,cnt1);
end BCD_TENS_SHOW;