library IEEE; use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD_UNSIGNED.ALL;

entity ram is
  port (
    clk:  in  STD_LOGIC;
    we:   in  STD_LOGIC;
    a:  in  STD_LOGIC_VECTOR(31 downto 0);
    wd:   in  STD_LOGIC_VECTOR(31 downto 0);
    rd:   out STD_LOGIC_VECTOR(31 downto 0)
  );
end;

architecture behavioral of ram is
  type mem_array is
    array (63 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
  signal mem : mem_array;
begin

  process (clk) begin
    if rising_edge(clk) then
      if we then 
        mem(TO_INTEGER(a(7 downto 2))) <= wd;
      end if;
    end if;
  end process;

  rd <= mem(TO_INTEGER(a(7 downto 2)));

end;
