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

entity acumulador is
    generic (N : natural := 63);
    Port ( entrada : in STD_LOGIC_vector(N downto 0);
           salida : out STD_LOGIC);
end acumulador;

architecture Behavioral of acumulador is

signal temporal : std_logic_vector(31 downto 0);

begin
    process (entrada)
        variable j : integer := 0;
    begin
    --https://www.xilinx.com/support/answers/60073.html
    --Vivado Synthesis is not able to calculate the loop limit value from 
    --the dynamic variable.
        L1: for j in 0 to 64 loop
            exit L1 when j > N;
             temporal <= std_logic_vector(x"00000000" + unsigned( entrada(j downto j) ) + unsigned( temporal ));
        end loop;      
    end process;
    salida <= '1' when( temporal >= (N+1)/2) else '0';
end Behavioral;