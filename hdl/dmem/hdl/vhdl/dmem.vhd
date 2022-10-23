library IEEE;
use IEEE.STD_LOGIC_1164.all;
use STD.TEXTIO.all;
use IEEE.NUMERIC_STD_UNSIGNED.all;

entity dmem is
  port (
    clk:    in    STD_LOGIC;
    we:     in    STD_LOGIC;
    a:      in    STD_LOGIC_VECTOR(7 downto 0);
    wd:     in    STD_LOGIC_VECTOR(31 downto 0);
    rd:     out   STD_LOGIC_VECTOR(31 downto 0)
  );
end;

architecture behavioral of dmem is
begin
  
  process is
    type ramtype is array (63 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
    variable mem : ramtype;
  begin
    loop
      if clk'event and clk = '1' then
        if (we = '1') then
          mem(to_integer(a(7 downto 2))) := wd;  
        end if;
      end if;
      rd <= mem(to_integer(a(7 downto 2)));
      wait on clk, a;
    end loop;
  end process;

end;
