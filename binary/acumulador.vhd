----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.04.2018 13:07:26
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity acumulador is
    Port ( entrada : in STD_LOGIC_vector(6 downto 0);
           salida : out STD_LOGIC);
end acumulador;

architecture Behavioral of acumulador is
signal temporal : std_logic_vector(31 downto 0);
begin
    if(entrada(0 downto 0)= '1') then
        temporal <= temporal + 1;
    else
        temporal <= temporal - 1;
    end if; 
    if(entrada(1 downto 1)= '1') then
        temporal <= temporal + 1;
    else
        temporal <= temporal - 1;
    end if; 
    if(entrada(2 downto 2)= '1') then
        temporal <= temporal + 1;
    else
        temporal <= temporal - 1;
    end if; 
    if(entrada(3 downto 3)= '1') then
        temporal <= temporal + 1;
    else
        temporal <= temporal - 1;
    end if; 
    if(entrada(4 downto 4)= '1') then
        temporal <= temporal + 1;
    else
        temporal <= temporal - 1;
    end if; 
    if(entrada(5 downto 5)= '1') then
        temporal <= temporal + 1;
    else
        temporal <= temporal - 1;           
    end if; 
    if(temporal >= 0) then
        salida <= '1';
    else
        salida <= '0';
    end if;  
end Behavioral;
