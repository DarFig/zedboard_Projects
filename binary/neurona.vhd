----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.04.2018 13:48:13
-- Design Name: 
-- Module Name: neurona - Behavioral
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

-- reg0 y reg1 64bits de entrada de la matriz n x m
-- reg2 vector n dimensinal
-- reg3 resultado m dimensional
entity neurona is
    Port ( reg0 : in STD_LOGIC_vector(32 downto 0);
           reg1 : in STD_LOGIC_vector(32 downto 0);
           reg2 : in STD_LOGIC_vector(32 downto 0);
           reg3 : out STD_LOGIC_vector(32 downto 0));
end neurona;

architecture Behavioral of neurona is
-- ///
component unidad_operacion
    Port ( in_unidad : in STD_LOGIC_vector(6 downto 0);
           vector : in STD_LOGIC_vector(6 downto 0);
           out_unidad : out STD_LOGIC);
end component;

-- ///
signal salida : std_logic_vector(8 downto 0);
signal vector_op : std_logic_vector(6 downto 0);
signal in0, in1, in2, in3, in4, in5, in6, in7, in8 : std_logic_vector(6 downto 0);
signal s0, s1, s2, s3, s4, s5, s6, s7, s8; 
begin
    vector_op <= reg2(6 downto 0);
    in0 <= reg1(31 downto 25);
    in1 <= reg1(24 downto 18);
    in2 <= reg1(17 downto 11);
    in3 <= reg1(10 downto 2);
    in4 <= reg1(3 downto 0) &  reg0(31 downto 29);;
    in5 <= reg0(28 downto 22);
    in6 <= reg0(21 downto 15);
    in7 <= reg0(14 downto 8);
    in8 <= reg0(7 downto 1);
    
    unidad0: unidad_operacion port map(in_unidad => in0, vector => vector_op, out_unidad => s0);
    unidad1: unidad_operacion port map(in_unidad => in1, vector => vector_op, out_unidad => s1);
    unidad2: unidad_operacion port map(in_unidad => in2, vector => vector_op, out_unidad => s2);
    unidad3: unidad_operacion port map(in_unidad => in3, vector => vector_op, out_unidad => s3);
    unidad4: unidad_operacion port map(in_unidad => in4, vector => vector_op, out_unidad => s4);
    unidad5: unidad_operacion port map(in_unidad => in5, vector => vector_op, out_unidad => s5);
    unidad6: unidad_operacion port map(in_unidad => in6, vector => vector_op, out_unidad => s6);
    unidad7: unidad_operacion port map(in_unidad => in7, vector => vector_op, out_unidad => s7);
    unidad8: unidad_operacion port map(in_unidad => in8, vector => vector_op, out_unidad => s8);
    
    salida <= s8 & s7 & s6 & s5 & s4 & s3 & s2 & s1 & s0;
    reg3 <= "00000000000000000000000" & salida; 

end Behavioral;
