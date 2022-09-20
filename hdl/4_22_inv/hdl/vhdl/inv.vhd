library IEEE; use IEEE.STD_LOGIC_1164.all;

entity inv is
  port (
    a: in STD_LOGIC_VECTOR(3 downto 0);
    y: out STD_LOGIC_VECTOR(3 downto 0)
  );
end;

architecture synth of inv is
begin
  -- process(all) reevaluates the statements inside the process any time
  -- any of the signals in the process change. Better than just process(a)
  -- since we don't miss any signals we might add later.
  process(all) begin
    y <= not a;
  end process;
end;
