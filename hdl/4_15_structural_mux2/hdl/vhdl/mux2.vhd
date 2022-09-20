library IEEE; use IEEE.STD_LOGIC_1164.all;

entity mux2 is
	port (
		d0, d1:  in   STD_LOGIC_VECTOR(3 downto 0);
    s:       in   STD_LOGIC;
    y:       out  STD_LOGIC_VECTOR(3 downto 0)
	);
end;

-- we can emphasize that this structural in scope by naming it struct
architecture struct of mux2 is
  -- Note that here we need to (re)describe the interface of the components
  -- that we will be using. Must match the entity declaration given in some
  -- vhd file we've included
  component tristate
    port (
      a:  in  STD_LOGIC_VECTOR(3 downto 0);
      en: in  STD_LOGIC;
      y:  out STD_LOGIC_VECTOR(3 downto 0)
    );
  end component;
  -- Like in previous files, we define some intermediate signals.
  signal sbar: STD_LOGIC;
begin

  sbar <= not s;
  t0: tristate port map (d0, sbar, y);
  t1: tristate port map (d1, s, y);

end;
