----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.04.2018 13:48:13
-- Design Name: 
-- Module Name: unidad_general - Behavioral
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

-- reg0 vector n+1 dimensinal
-- reg1 resultado m+1 dimensional
-- reg2 nxM bits de entrada de la matriz (n+1 x m+1)-1

entity unidad_general is
    generic (N : natural := 63;
             M : natural := 9;
             NM : natural := 639); --// (n+1 x m+1)-1 bits
    Port ( reg2 : in STD_LOGIC_vector(NM downto 0);           
           reg0 : in STD_LOGIC_vector(N downto 0);
           reg1 : out STD_LOGIC_vector(M downto 0));
	
end unidad_general;

architecture Behavioral of unidad_general is

-- ////
component unidad_basica
    generic (N : natural := 63);
    Port ( in_unidad : in STD_LOGIC_vector(N downto 0);
           vector : in STD_LOGIC_vector(N downto 0);
           salida : out STD_LOGIC);
end component;

-- ////

signal salida_temp : std_logic_vector(M downto 0);

begin

GEN_UND: for i in 0 to M generate
    unidad_basicax: unidad_basica port map(in_unidad => reg2((i+1)*64-1 downto i*64 ), vector => reg0, salida => salida_temp(i));
end generate GEN_UND;
    
reg1 <= salida_temp;

    

end Behavioral;