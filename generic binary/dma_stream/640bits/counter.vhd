library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter is
	generic (bits: positive);
   port (clk, rst: in STD_LOGIC;
         rst2 : in STD_LOGIC;
         inc : in STD_LOGIC;
			count : out STD_LOGIC_VECTOR(bits-1 downto 0));
end counter;

architecture counterArch of counter is	
	signal cs, ns : STD_LOGIC_VECTOR(bits-1 downto 0);
begin	
	state:
	process (clk)		
	begin		
		if clk'event and clk='1' then
			if rst = '1' then 
				cs <= (OTHERS=>'0');
			else			 
				cs <= ns;
			end if;
		end if;
	end process; 
	
	next_state:
   process(cs, rst2, inc)
      begin
			if rst2 = '1' then
				ns <= (OTHERS=>'0');
         elsif inc = '1' then 
			  ns <= cs + 1;
         else 
			  ns <= cs;
         end if;
   end process;

   moore_output: count <= cs;
end counterArch;