----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.05.2018 18:34:04
-- Design Name: 
-- Module Name: counter8 - Behavioral
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

entity counter8 is
    Port ( entrada : in STD_LOGIC_vector(7 downto 0);
           salida : out STD_LOGIC_vector(3 downto 0));
end counter8;

architecture Behavioral of counter8 is

signal s5,s6 : std_logic_vector(1 downto 0);
signal s7: std_logic_vector(3 downto 0);
signal s1, s2, s3, s4, c1, c2, c3,c4, c5 , c6 : std_logic;

begin

s1 <= entrada(1) xor entrada(0);
s2 <= entrada(3) xor entrada(2);
s3 <= entrada(5) xor entrada(4);
s4 <= entrada(7) xor entrada(6);

c1 <= entrada(1) and entrada(0);
c2 <= entrada(3) and entrada(2);
c3 <= entrada(5) and entrada(4);
c4 <= entrada(7) and entrada(6);

s5 <= ((c2 xor c1) xor (s1 and s2)) & (s2 xor s1); 
s6 <= ((c4 xor c3) xor (s4 and s3)) & (s4 xor s3);
c5 <= c2 and c1; 
c6 <= c4 and c3;

s7 <=(c6 and c5) & ( (c5 xor c6) or ( s6(1) and s5(1) and s6(0) and s5(1)) or ((s6(0) and s5(1) and s5(0) ) or (s6(1) and ((s5(1) and s5(0)) or (s6(1) and s5(1))or (s6(1) and s5(0)) )) )  ) & ( ( s6(1) xor s5(1) ) xor ( s6(0) and s5(0) ) ) & ( s6(0) xor s5(0) );

--
salida <= s7;
end Behavioral;
