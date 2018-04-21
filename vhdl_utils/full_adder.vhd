----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.04.2018 13:11:34
-- Design Name: 
-- Module Name: full_adder - Behavioral
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

entity full_adder is
    Port ( inA : in STD_LOGIC;
           inB : in STD_LOGIC;
           inCarry : in STD_LOGIC;
           salida : out STD_LOGIC;
           carry : out STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is

component half_adder
    Port ( inA : in STD_LOGIC;
           inB : in STD_LOGIC;
           carry : out STD_LOGIC;
           salida : out STD_LOGIC);
end component;

signal salida_pri, carry_pri, carry_duo : std_logic; 

begin
    halfadder0: half_adder port map(inA =>inA, inB=>inB, carry=>carry_pri, salida=>salida_pri);
    halfadder1: half_adder port map(inA =>salida_pri, inB=>inCarry, carry=>carry_duo, salida=>salida);
    carry <= carry_pri or carry_duo;


end Behavioral;
