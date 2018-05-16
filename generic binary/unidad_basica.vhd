----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.04.2018 12:53:35
-- Design Name: 
-- Module Name: unidad_basica - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity unidad_basica is
    generic (N : natural := 63);
    Port ( in_unidad : in STD_LOGIC_vector(N downto 0);
           vector : in STD_LOGIC_vector(N downto 0);
           salida : out STD_LOGIC);
end unidad_basica;

architecture Behavioral of unidad_basica is

component acumulador
    generic (N : natural := 63);
    Port ( entrada : in STD_LOGIC_vector(N downto 0);
           salida : out STD_LOGIC);
end component;

signal temporal : std_logic_vector(63 downto 0);
begin
    temporal <= in_unidad xnor vector; 
    bitcount: acumulador port map (
        entrada => temporal,
        salida => salida
    );


end Behavioral;
