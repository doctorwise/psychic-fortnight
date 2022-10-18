library IEEE; use IEEE.STD_LOGIC_1164.all;

entity controller is
	port (
	  clk, reset: in STD_LOGIC;
    p, r, ta, tb: in STD_LOGIC;
    la, lb: out STD_LOGIC_VECTOR(2 downto 0)
  );
end;

architecture struct of controller is
  component mode
    port (
      clk, reset:     in  STD_LOGIC;
      p:              in  STD_LOGIC;
      r:              in  STD_LOGIC;
      m:              out STD_LOGIC
    );
  end component;
  component lights
    port (
      clk, reset:     in  STD_LOGIC;
      ta:             in  STD_LOGIC;
      tb:             in  STD_LOGIC;
      m:              in  STD_LOGIC;
      la:             out  STD_LOGIC_VECTOR(2 downto 0);
      lb:             out  STD_LOGIC_VECTOR(2 downto 0)
    );
  end component;
  signal m: STD_LOGIC;
begin

  modeFSM : mode port map (
    clk,
    reset,
    p,
    r,
    m 
  );

  lightsFSM : lights port map (
    clk,
    reset,
    ta,
    tb,
    m,
    la,
    lb
  );

end;
