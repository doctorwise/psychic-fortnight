-- needed for STD_LOGIC_VECTOR
library IEEE; use IEEE.STD_LOGIC_1164.all;

entity gates is
	port (
		a, b:               in  STD_LOGIC_VECTOR(3 downto 0);
		y1, y2, y3, y4, y5: out STD_LOGIC_VECTOR(3 downto 0)
	);
end;

architecture synth of gates is
begin
	y1 <= a and b;
	y2 <= a or b;
	y3 <= a xor b;
	y4 <= a nand b;
	y5 <= a nor b;
end;
