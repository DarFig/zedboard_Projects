----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.04.2018 13:32:38
-- Design Name: 
-- Module Name: full_adder_ind - Behavioral
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

entity full_adder_ind is
    Port ( inA : in STD_LOGIC;
           inB : in STD_LOGIC;
           inCarry : in STD_LOGIC;
           salida : out STD_LOGIC;
           carry : out STD_LOGIC);
end full_adder_ind;

architecture Behavioral of full_adder_ind is

begin
    salida <= (inA xor inB) xor inCarry;
    carry <= inA and inB or (inA xor inB)and inCarry;

end Behavioral;
