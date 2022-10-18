library IEEE; use IEEE.STD_LOGIC_1164.all;

entity lights is
	port (
		clk, reset:     in  STD_LOGIC;
    ta:             in  STD_LOGIC;
    tb:             in  STD_LOGIC;
    m:              in  STD_LOGIC;
    la:             out  STD_LOGIC_VECTOR(2 downto 0);
    lb:             out  STD_LOGIC_VECTOR(2 downto 0)
	);
end;

architecture synth of lights is
  constant RED    :   STD_LOGIC_VECTOR(2 downto 0) := "100";
  constant YELLOW :   STD_LOGIC_VECTOR(2 downto 0) := "010";
  constant GREEN  :   STD_LOGIC_VECTOR(2 downto 0) := "001";
  type statetype is (S0, S1, S2, S3);
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
        if (not ta) then
          nextstate <= S1;
        elsif (ta) then
          nextstate <= S0;
        end if;
      when S1 =>
        nextstate <= S2;
      when S2 =>
        if ((not m) and (not tb)) then
          nextstate <= S3;
        elsif (m or tb) then
          nextstate <= S2;
        end if;
      when S3 =>
        nextstate <= S0;
      when others =>
        nextstate <= S0;
    end case;
  end process;

  -- output logic
  la <= GREEN when state = S0 else
        YELLOW when state = S1 else
        RED when state = S2 else
        RED when state = S3 else
        RED;
  lb <= RED when state = S0 else
        RED when state = S1 else
        GREEN when state = S2 else
        YELLOW when state = S3 else
        RED;


end;
