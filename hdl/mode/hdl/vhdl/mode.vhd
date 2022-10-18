library IEEE; use IEEE.STD_LOGIC_1164.all;

entity mode is
	port (
		clk, reset:     in  STD_LOGIC;
    p:              in  STD_LOGIC;
    r:              in  STD_LOGIC;
    m:              out STD_LOGIC
	);
end;

architecture synth of mode is
  type statetype is (S0, S1);
  signal state, nextstate: statetype;
begin

  -- state register
  process (clk, reset) begin
    if reset then
      state <= S0;
    elsif rising_edge(clk) then
      state <= nextstate;
    end if;
  end process;

  -- next state logic
  process (all) begin
    case state is
      when S0 =>
        if p then
          nextstate <= S1;
        else 
          nextstate <= S0;
        end if;
      when S1 =>
        if r then
          nextstate <= S0;
        else
          nextstate <= S1;
        end if;
      when others =>
        nextstate <= S0;
    end case;
  end process;

  -- output logic
  m <= '1' when state = S1 else '0';


end;
