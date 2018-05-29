----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.04.2018 13:07:26
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
--use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity acumulador is
    generic (N : natural := 63);
    Port ( entrada : in STD_LOGIC_vector(N downto 0);
           salida : out STD_LOGIC);
end acumulador;

architecture Behavioral of acumulador is
component counter8
    Port ( entrada : in STD_LOGIC_vector(7 downto 0);
           salida : out STD_LOGIC_vector(3 downto 0));
end component;

--signal temporal : std_logic_vector(N downto 0);
signal counttemp : std_logic_vector(31 downto 0);
signal count : std_logic_vector(31 downto 0);

begin
    GEN_UNDB: for i in 1 to (N+1)/8 generate
        bitcountx: counter8 port map (entrada => entrada(i*8-1 downto (i-1)*8), salida => counttemp(i*4-1 downto (i-1)*4));            
    end generate GEN_UNDB;
    count <= std_logic_vector(x"00000000"+ unsigned( counttemp(31 downto 28)) + unsigned(counttemp(27 downto 24)) 
    + unsigned(counttemp(23 downto 20)) + unsigned(counttemp(19 downto 16)) 
    + unsigned(counttemp(15 downto 12)) + unsigned(counttemp(11 downto 8)) + unsigned(counttemp(7 downto 4)) + unsigned(counttemp(3 downto 0)));
    salida <= '1' when( count >= (N+1)/2) else '0';
end Behavioral;