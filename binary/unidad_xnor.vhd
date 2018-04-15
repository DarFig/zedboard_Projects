----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.04.2018 12:48:10
-- Design Name: 
-- Module Name: unidad_xnor - Behavioral
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

entity unidad_xnor is
    Port ( in_a : in STD_LOGIC;
           in_b : in STD_LOGIC;
           salida : out STD_LOGIC);
end unidad_xnor;

architecture Behavioral of unidad_xnor is

begin
salida <= in_a xnor in_b;

end Behavioral;
