library IEEE;
use IEEE.std_logic_1164.all;

entity seg_decoder is 
    port(
        in_bcd : in std_logic_vector(0 to 3);  --input
        out_seg: out std_logic_vector(0 to 6)  --output
    );
end seg_decoder;

architecture seg_decoder of seg_decoder is
begin
    process(in_bcd)
        constant seg_out_0 : std_logic_vector(0 to 6):="0111111";
        constant seg_out_1 : std_logic_vector(0 to 6):="0000110";
        constant seg_out_2 : std_logic_vector(0 to 6):="1011011";
        constant seg_out_3 : std_logic_vector(0 to 6):="1001111";
        constant seg_out_4 : std_logic_vector(0 to 6):="1100110";
        constant seg_out_5 : std_logic_vector(0 to 6):="1101101";
        constant seg_out_6 : std_logic_vector(0 to 6):="1111101";
        constant seg_out_7 : std_logic_vector(0 to 6):="0100111";
        constant seg_out_8 : std_logic_vector(0 to 6):="1111111";
        constant seg_out_9 : std_logic_vector(0 to 6):="1101111";
        constant seg_out_E : std_logic_vector(0 to 6):="1111001";
    begin
        case in_bcd is
            when "0000" => out_seg <= seg_out_0;
            when "0001" => out_seg <= seg_out_1;
            when "0010" => out_seg <= seg_out_2;
            when "0011" => out_seg <= seg_out_3;
            when "0100" => out_seg <= seg_out_4;
            when "0101" => out_seg <= seg_out_5;
            when "0110" => out_seg <= seg_out_6;
            when "0111" => out_seg <= seg_out_7;
            when "1000" => out_seg <= seg_out_8;
            when "1001" => out_seg <= seg_out_9;
            when others => out_seg <= seg_out_E;
        end case;
    end process;
end seg_decoder;
