library IEEE; use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity signedmult is
	port (
	  a, b: in  SIGNED(3 downto 0);
    y:    out SIGNED(7 downto 0)
  );
end;

architecture synth of signedmult is
begin

  y <= a * b;

end;
