library IEEE; use IEEE.STD_LOGIC_1164.all;

entity fulladder is
	port (
		a, b, cin: in STD_LOGIC;
		s, cout: out STD_LOGIC
	);
end;

architecture synth of fulladder is
begin
  process(all) -- prevents us from missing a signal
    variable p, g: STD_LOGIC; -- because these are on the left of a blocking
                              -- assignment in a process statement, we must
                              -- define them as variable (only ever within 
                              -- process statements)
  begin
    p := a xor b; -- blocking
    g := a and b; -- blocking
    s <= p xor cin; -- nonblocking / concurrent
    cout <= g or (p and cin); -- nonblocking / concurrent
  end process;
end;
