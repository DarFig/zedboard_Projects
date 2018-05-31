----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.05.2018 00:35:21
-- Design Name: 
-- Module Name: u_externa - Behavioral
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
--//
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity u_externa is
    Port ( reg0 : in STD_LOGIC_vector(31 downto 0); --// entrada1
           reg1 : in STD_LOGIC_vector(31 downto 0); --// entrada2
           reg2 : in STD_LOGIC_vector(31 downto 0); --// vector
           reg3 : out STD_LOGIC_vector(31 downto 0)); --// salida
end u_externa;

architecture Behavioral of u_externa is

-- ///
component u_general
    generic ( N : natural := 7;
              M : natural := 7;
             NM : natural := 63); --// (n+1 x m+1)-1 bits
    Port ( in_general : in STD_LOGIC_vector(NM downto 0);           
           vector : in STD_LOGIC_vector(N downto 0);
           salida : out STD_LOGIC_vector(M downto 0));
end component;
-- ///

signal salida : std_logic_vector(7 downto 0);
-- signal vector_op : std_logic_vector(7 downto 0);
signal in_op: std_logic_vector(63 downto 0);


begin

    in_op <= reg1 & reg0;
    
    u_g : u_general port map(in_general => in_op, vector => reg2(7 downto 0), salida => salida);

    --// salida 8x8
    --reg3 <= x"000000" & salida;
    --// salida 16x16
    --reg3 <= x"0000" & salida;
    --// salida comun 8x8 16x16 32x32
    reg3 <= std_logic_vector(x"00000000" + unsigned(salida));
end Behavioral;
