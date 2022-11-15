library IEEE; use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.NUMERIC_STD_UNSIGNED.all;

entity alu is
  port (
    a, b          :   in    STD_LOGIC_VECTOR(31 downto  0);
    alucontrol    :   in    STD_LOGIC_VECTOR(1  downto  0);
    result        :   out   STD_LOGIC_VECTOR(31 downto  0);
    aluflags      :   out   STD_LOGIC_VECTOR(3  downto  0)
  );
end;

architecture behavioral of alu is
  signal neg      : STD_LOGIC;
  signal zero     : STD_LOGIC;
  signal carry    : STD_LOGIC;
  signal overflow : STD_LOGIC;
  signal condinvb : STD_LOGIC_VECTOR(31 downto 0);
  signal sum      : STD_LOGIC_VECTOR(32 downto 0);
begin

  condinvb <= (not b) when (alucontrol(0)) else b;
  sum <= ('0' & a) + ('0' & condinvb) + ('0' & alucontrol(0));

  process (all)
  begin
    case alucontrol is 
        when "00" =>
          result <= sum(31 downto 0);
        when "01" =>
          result <= sum(31 downto 0);
        when "10" =>
          result <= (a and b);
        when "11" =>
          result <= (a or b);
        when others =>
          result <= (others => '0');
    end case;
  end process;

  neg   <= result(31);
  zero  <= '1' when (unsigned(result) = 0) else '0';
  carry <= ((not alucontrol(1)) and sum(32));
  overflow <= (not alucontrol(1)) and
                (not ((a(31) xor  b(31)) xor alucontrol(0))) and
                (a(31) xor sum(31));
  aluflags <= (neg, zero, carry, overflow);

end;
