----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/01/2018 06:26:18 PM
-- Design Name: 
-- Module Name: macro_celda - Behavioral
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

entity macro_celda is
Port ( up_in : in STD_LOGIC_VECTOR (1 downto 0);
           down_in : in STD_LOGIC_VECTOR (1 downto 0);
           left_in : in STD_LOGIC_VECTOR (1 downto 0);
           right_in : in STD_LOGIC_VECTOR (1 downto 0);
           up_left_in : in STD_LOGIC_VECTOR (1 downto 0);
           up_right_in : in STD_LOGIC_VECTOR (1 downto 0);
           down_left_in : in STD_LOGIC_VECTOR (1 downto 0);
           down_right_in : in STD_LOGIC_VECTOR (1 downto 0);
           up_out : out STD_LOGIC_VECTOR (1 downto 0);
           down_out : out STD_LOGIC_VECTOR (1 downto 0);
           left_out : out STD_LOGIC_VECTOR (1 downto 0);
           right_out : out STD_LOGIC_VECTOR (1 downto 0);
           up_left_out : out STD_LOGIC_VECTOR (1 downto 0);
           up_right_out : out STD_LOGIC_VECTOR (1 downto 0);
           down_left_out : out STD_LOGIC_VECTOR (1 downto 0);
           down_right_out : out STD_LOGIC_VECTOR (1 downto 0);
           input : in STD_LOGIC_VECTOR (1 downto 0);
           output : out std_logic);
end macro_celda;



architecture Behavioral of macro_celda is
component  basic_cell is
   Port ( info_in : in STD_LOGIC_VECTOR (1 downto 0);
          my_input : in STD_LOGIC_VECTOR (1 downto 0);
          info_out : out STD_LOGIC_VECTOR (1 downto 0);
          my_output : out STD_LOGIC);
end component;

signal my_output_up_left, my_output_up_right, my_output_up, my_output_left, my_output_right, my_output_down_left, my_output_down_right, my_output_down: STD_LOGIC;

begin
esq_sup_izq: basic_cell port map (info_in => up_left_in, my_input => input, info_out => down_left_out, my_output => my_output_up_left);
esq_sup_drc: basic_cell port map (info_in => up_right_in, my_input => input, info_out => down_right_out,my_output => my_output_up_right);
sup: basic_cell port map (info_in => up_in, my_input => input, info_out => down_out, my_output => my_output_up);
drc: basic_cell port map (info_in => right_in, my_input => input, info_out => left_out, my_output => my_output_right);
izq: basic_cell port map (info_in => left_in, my_input => input, info_out => right_out, my_output => my_output_left);
esq_inf_izq: basic_cell port map (info_in => down_left_in, my_input => input, info_out => up_left_out, my_output => my_output_down_left);
esq_inf_drc: basic_cell port map (info_in => down_right_in, my_input => input, info_out => up_right_out, my_output => my_output_down_right);
inf: basic_cell port map (info_in => down_in, my_input => input, info_out => up_out, my_output => my_output_down);

output <= (my_output_up_left or my_output_up_right or my_output_up or my_output_left or my_output_right or my_output_down_left or my_output_down_right or my_output_down); 
end Behavioral;
