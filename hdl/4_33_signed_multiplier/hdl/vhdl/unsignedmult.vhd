library IEEE; use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD_UNSIGNED.all;

entity unsignedmult is
	port (
	  a, b: in  STD_LOGIC_VECTOR(3 downto 0);
    y:    out STD_LOGIC_VECTOR(7 downto 0)
  );
end;

architecture synth of unsignedmult is
begin

  y <= a * b;

end;
