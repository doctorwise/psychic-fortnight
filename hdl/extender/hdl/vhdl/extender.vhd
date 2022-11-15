library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity extender is
  port (
    instr:    in    STD_LOGIC_VECTOR(23 downto 0);
    immsrc:   in    STD_LOGIC_VECTOR(1  downto 0);
    extimm:   out   STD_LOGIC_VECTOR(31 downto 0)
  );
end;

architecture behavioral of extender is
begin
  process (all) begin
    case immsrc is
      when "00" =>
        extimm <= (x"000000", instr(7 downto 0));
      when "01" =>
        extimm <= (x"00000", instr(11 downto 0));
      when "10" =>
        extimm <= (
                    instr(23),
                    instr(23),
                    instr(23),
                    instr(23),
                    instr(23),
                    instr(23),
                    instr(23 downto 0),
                    "00"
                  );
      when others =>
        extimm <= x"--------";
    end case;
  end process;
end;
