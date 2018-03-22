----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/01/2018 05:15:10 PM
-- Design Name: 
-- Module Name: basic_cell - Behavioral
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

entity basic_cell is
    Port ( info_in : in STD_LOGIC_VECTOR (1 downto 0);
           my_input : in STD_LOGIC_VECTOR (1 downto 0);
           info_out : out STD_LOGIC_VECTOR (1 downto 0);
           my_output : out STD_LOGIC);
end basic_cell;

architecture Behavioral of basic_cell is

begin
    my_output <= '1' when (info_in = "11" and my_input= "00") else '0';
    info_out <= "10" when (my_input = "10") else
                "11" when (my_input = "01" and (info_in = "10" or info_in = "11" )) else
                "00";
    
end Behavioral;
