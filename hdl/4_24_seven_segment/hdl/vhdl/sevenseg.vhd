library IEEE; use IEEE.STD_LOGIC_1164.all;

entity sevenseg is
	port (
		data:     in  STD_LOGIC_VECTOR(3 downto 0);
		segments: out STD_LOGIC_VECTOR(6 downto 0)
	);
end;

architecture synth of sevenseg is
begin
  process(all)
  begin
    case data is -- can appear outside processes, so less of a reason to need
                 -- a process statement here to describe combinational logic
      when X"0" => segments <= "1111110";
      when X"1" => segments <= "0110000";
      when X"2" => segments <= "1101101";
      when X"3" => segments <= "1111001";
      when X"4" => segments <= "0110011";
      when X"5" => segments <= "1011011";
      when X"6" => segments <= "1011111";
      when X"7" => segments <= "1110000";
      when X"8" => segments <= "1111111";
      when X"9" => segments <= "1110011";
      when others => segments <= (others => '0');
    end case;
  end process;
end;
