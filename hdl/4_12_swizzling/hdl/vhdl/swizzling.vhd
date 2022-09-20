library IEEE; use IEEE.STD_LOGIC_1164.all;

entity swizzling is
	port (
		y: out STD_LOGIC_VECTOR(7 downto 0)
	);
end;

architecture synth of swizzling is
begin
	y <= (7 => '1', 6 => '0', 5 => '1', 4 downto 1 => '0', others => '1');
end;
