library IEEE; use IEEE.STD_LOGIC_1164.all;

entity mux2 is
  -- here's where we parameterize our width
  generic (width : integer := 8);
	port (
		d0, d1:  in   STD_LOGIC_VECTOR(width-1 downto 0);
    s:       in   STD_LOGIC;
    y:       out  STD_LOGIC_VECTOR(width-1 downto 0)
	);
end;

-- we can emphasize that this structural in scope by naming it struct
architecture struct of mux2 is
begin

  y <= d1 when s else d0;

end;
