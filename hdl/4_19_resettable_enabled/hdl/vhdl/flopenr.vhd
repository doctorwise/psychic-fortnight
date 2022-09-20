library IEEE; use IEEE.STD_LOGIC_1164.all;

entity flopenr is
	port (
		clk:    in   STD_LOGIC;
    reset:  in   STD_LOGIC;
    en:     in   STD_LOGIC;
    d:      in   STD_LOGIC_VECTOR(3 downto 0);
    q:      out  STD_LOGIC_VECTOR(3 downto 0)
	);
end;

architecture asynchronous of flopenr is
begin

  -- asynchronous reset
  process (clk, reset) begin
    if (reset) then
      q <= "0000";
    elsif rising_edge(clk) then
      if en then
        q <= d;
      end if;
    end if;
  end process;

end;
