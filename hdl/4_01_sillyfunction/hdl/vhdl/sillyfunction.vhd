-- library use clause (need IEEE.STD_LOGIC_1164 for the STD_LOGIC type)
library IEEE; use IEEE.STD_LOGIC_1164.all;

-- entity declaration (lists the module name, inputs, and outputs))
entity sillyfunction is
  port (
    a, b, c:  in  STD_LOGIC;
    y:        out STD_LOGIC
  );
end;

-- architecture body (defines what the module does)
architecture synth of sillyfunction is
begin
  -- 1. due to lack of default order of operations between and and or,
  -- best practice is to specify explicitly using parentheses
  -- 2. <= is called a concurrent assignment statement
  -- 3. note that statements end with semicolons 
  y <= (not a and not b and not c) or
       (a and not b and not c) or
       (a and not b and c);
end;
