library IEEE; use IEEE.STD_LOGIC_1164.all;

entity mux4 is
	port (
    d0, d1, d2, d3:  in   STD_LOGIC_VECTOR(3 downto 0);
    s:               in   STD_LOGIC_VECTOR(1 downto 0);
    y:               out  STD_LOGIC_VECTOR(3 downto 0)
	);
end;

-- we can emphasize that this structural in scope by naming it struct
architecture struct of mux4 is
  -- Note that here we need to (re)describe the interface of the components
  -- that we will be using. Must match the entity declaration given in some
  -- vhd file we've included
  component mux2
    port (
      d0, d1:   in  STD_LOGIC_VECTOR(3 downto 0);
      s:        in  STD_LOGIC;
      y:        out STD_LOGIC_VECTOR(3 downto 0)
    );
  end component;
  -- Like in previous files, we define some intermediate signals.
  signal low, high: STD_LOGIC_VECTOR(3 downto 0);
begin

  -- we define a named mux2 instance named lowmux and map the ports to 
  -- signals that are either our inputs, outputs, or intermediates
  lowmux: mux2 port map (
    d0, d1,
    s(0),
    low
  );
  
  highmux: mux2 port map (
    d2, d3,
    s(0),
    high
  );
  
  finalmux: mux2 port map (
    low, high,
    s(1),
    y
  );

end;
