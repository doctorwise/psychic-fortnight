-- library use clause
library IEEE; use IEEE.STD_LOGIC_1164.all;

-- entity declaration (module name, input, and outputs)
entity inv is
  port (
    a: in STD_LOGIC_VECTOR(3 downto 0);
    y: out STD_LOGIC_VECTOR(3 downto 0)
  );
end;

-- architecture body (what the module does)
architecture synth of inv is
begin
  y <= not a;
end;
