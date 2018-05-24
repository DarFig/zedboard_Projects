----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.05.2018 22:15:27
-- Design Name: 
-- Module Name: u_general - Behavioral
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

entity u_general is
    generic (N : natural := 7;
             M : natural := 7;
             NM : natural := 63); --// (n+1 x m+1)-1 bits
    Port ( in_general : in STD_LOGIC_vector(NM downto 0);           
           vector : in STD_LOGIC_vector(N downto 0);
           salida : out STD_LOGIC_vector(M downto 0));
end u_general;

architecture Behavioral of u_general is

-- ////
component u_basica
    generic (N : natural := 7);
    Port ( in_unidad : in STD_LOGIC_vector(N downto 0);
           vector : in STD_LOGIC_vector(N downto 0);
           salida : out STD_LOGIC);
end component;

-- ////
signal salida_temp : std_logic_vector(M downto 0);

begin

GEN_UND: for i in 0 to M generate
    unidad_basicax: u_basica port map(in_unidad => in_general( (i+1)*(N+1)-1 downto i*(N+1) ), vector => vector, salida => salida_temp(i));
end generate GEN_UND;

salida <= salida_temp;

end Behavioral;
