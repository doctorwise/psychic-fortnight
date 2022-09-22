library IEEE; use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD_UNSIGNED.all;

entity decoder is
  generic (N : integer:= 3);
	port (
	  a:    in    STD_LOGIC_VECTOR(N-1 downto 0);
    y:    out   STD_LOGIC_VECTOR(2**N-1 downto 0)
  );
end;

architecture synth of decoder is
begin

  process (all)
  begin
    y <= (others => '0');
    y(to_integer(a)) <= '1';
  end process;

end;
