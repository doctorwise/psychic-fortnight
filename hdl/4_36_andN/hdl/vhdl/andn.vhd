library IEEE; use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD_UNSIGNED.all;

entity andn is
  generic (width : integer:= 4);
	port (
	  a:    in    STD_LOGIC_VECTOR(width-1 downto 0);
    y:    out   STD_LOGIC
  );
end;

architecture synth of andn is
  signal x: STD_LOGIC_VECTOR(width-1 downto 0);
begin

  -- eww.... don't do it this way.
  -- this is only to demonstrate the generate functionality
  x(0) <= a(0);
  gen: for i in 1 to width-1 generate
    x(i) <= a(i) and x(i-1);
  end generate;
  y <= x(width-1);

end;
