----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.05.2018 22:18:04
-- Design Name: 
-- Module Name: u_basica - Behavioral
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
--use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity u_basica is
    generic (N : natural := 7);
    Port ( in_unidad : in STD_LOGIC_vector(N downto 0);
           vector : in STD_LOGIC_vector(N downto 0);
           salida : out STD_LOGIC);
end u_basica;

architecture Behavioral of u_basica is

component counter8 is
    Port ( entrada : in STD_LOGIC_vector(7 downto 0);
           salida : out STD_LOGIC_vector(3 downto 0));  
end component;

signal temporal : std_logic_vector(N downto 0);
signal counttemp : std_logic_vector(7 downto 0);
signal count : std_logic_vector(7 downto 0);


begin
   temporal <= in_unidad xnor vector; 
   
   GEN_UNDB: for i in 1 to (N+1)/8 generate
        bitcountx: counter8 port map (entrada => temporal(i*8-1 downto (i-1)*8), salida => counttemp(i*4-1 downto (i-1)*4));            
   end generate GEN_UNDB; 
   
   --// Para N = 8
   count <= std_logic_vector(x"00" + unsigned(counttemp(3 downto 0))); 
   --// Para N = 16 
   --count <= std_logic_vector(x"00"+ unsigned(counttemp(7 downto 4)) + unsigned(counttemp(3 downto 0)) );
    
    salida <= '1' when( count >= (N+1)/2) else '0';

end Behavioral;