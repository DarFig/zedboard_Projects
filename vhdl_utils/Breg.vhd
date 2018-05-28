----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.05.2018 12:10:51
-- Design Name: 
-- Module Name: Breg - Behavioral
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Breg is
Port ( 
    clk : in  STD_LOGIC;
    reset : in  STD_LOGIC;
    dir : in STD_LOGIC_VECTOR (3 downto 0);
    Din : in  STD_LOGIC_VECTOR (31 downto 0);
    load : in  STD_LOGIC;
    Dout : out  STD_LOGIC_VECTOR (31 downto 0)
    );
end Breg;

architecture Behavioral of Breg is

type reg_array is array (0 to 15) of std_logic_vector(31 downto 0);
signal reg_file : reg_array;

begin
    process(clk)
    begin
        if (clk'event and clk = '1') then
           if (reset = '1') then
                for i in 0 to 15 loop
                    reg_file(i) <= "00000000000000000000000000000000";
                end loop;
           else
              if (load='1') then 
                      reg_file(conv_integer(dir)) <= Din;
              end if;    
           end if;        
        end if;        

    end process;
    
    Dout <= reg_file(conv_integer(dir));
    
end Behavioral;
