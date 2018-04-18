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
    salida <= entrada(0) xnor entrada(1) xnor entrada(2) xnor entrada(3) xnor entrada(4) xnor entrada(5) xnor entrada(6);
end Behavioral;
