----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.04.2018 13:07:26
-- Design Name: 
-- Module Name: acumulador - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity acumulador is
    generic (N : natural := 63);
    Port ( entrada : in STD_LOGIC_vector(N downto 0);
           salida : out STD_LOGIC);
end acumulador;

architecture Behavioral of acumulador is

--signal temporal : std_logic_vector(31 downto 0);

begin
    --temporal <= x"00000000";
    process (entrada)
        variable c : integer := 0;
        variable j : integer := 0;
    begin
      while(j < N) loop
      if (entrada(j) = '1') then
        c := c + 1;
        --temporal <= temporal + x"00000001";
      end if;
        j := j + 1;
      end loop;
      --if temporal >= ((N+1)/2) then
      if c >= ((N+1)/2) then
          salida <= '1';
      else
          salida <= '0';
      end if;
end process;

end Behavioral;