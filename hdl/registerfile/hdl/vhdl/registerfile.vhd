library IEEE; use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD_UNSIGNED.ALL;

entity registerfile is
  port (
    clk:            in  STD_LOGIC;
    we3:            in  STD_LOGIC;
    ra1, ra2, wa3:  in  STD_LOGIC_VECTOR(3 downto 0);
    wd3, r15:       in  STD_LOGIC_VECTOR(31 downto 0);
    rd1, rd2:       out STD_LOGIC_VECTOR(31 downto 0)
  );
end;

architecture behavioral of registerfile is
  type ramtype is
    array (14 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
  signal mem : ramtype := (others => (others => '0'));
begin

  process (clk) begin
    if rising_edge(clk) then
      if we3 = '1' and to_integer(wa3) < 15 then
        mem(to_integer(wa3)) <= wd3; 
      end if;
    end if;
  end process;

  process (all) begin
    if (to_integer(ra1) = 15) then
      rd1 <= r15;
    else
      rd1 <= mem(to_integer(ra1));
    end if;
    if (to_integer(ra2) = 15) then
      rd2 <= r15;
    else
      rd2 <= mem(to_integer(ra2));
    end if;
  end process;

end;
