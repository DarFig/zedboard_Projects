----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.05.2018 12:10:51
-- Design Name: 
-- Module Name: gestorRegistros - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity gestorRegistros is
Port ( 
    clk : in  STD_LOGIC;
    reset : in  STD_LOGIC;

	Din : in  STD_LOGIC_VECTOR (31 downto 0);
	number_of_received_words: in  STD_LOGIC_VECTOR (4 downto 0);
	word_count: in  STD_LOGIC_VECTOR (3 downto 0);
	-- 
    load : in  STD_LOGIC;
	-- 
	Dout : out  STD_LOGIC_VECTOR (31 downto 0);
    salida0 : out STD_LOGIC_vector(31 downto 0);--salida
    salida1 : out STD_LOGIC_vector(31 downto 0)--salida
    );
end gestorRegistros;

architecture Behavioral of gestorRegistros is

component reg_32
Port ( Din : in  STD_LOGIC_VECTOR (31 downto 0);
    clk : in  STD_LOGIC;
    reset : in  STD_LOGIC;
    load : in  STD_LOGIC;
    Dout : out  STD_LOGIC_VECTOR (31 downto 0)
    );
end component; 

component unidad_general
    generic (N : natural := 63;
             M : natural := 9;
             NM : natural := 639); --// (n+1 x m+1)-1 bits
    Port ( reg2 : in STD_LOGIC_vector(NM downto 0);           
           reg0 : in STD_LOGIC_vector(N downto 0);
           reg1 : out STD_LOGIC_vector(M downto 0));
	
end component;

-- de matriz tomar los NM bits para la unidad general 
signal matrix : STD_LOGIC_vector(639 downto 0);--tamaño total 64x64            
signal vector : STD_LOGIC_vector(63 downto 0);--vector
signal salida : STD_LOGIC_vector(63 downto 0);--salida
signal salidatemp : STD_LOGIC_vector(9 downto 0);--salida
	-- entradas
--signal Din0, Din1, Din2, Din3, Din4, Din5, Din6, Din7, Din8, Din9, Din10, Din11, Din12, Din13, Din14, Din15, Din16, Din17, Din18, Din19, Din20, Din21 :  STD_LOGIC_VECTOR (31 downto 0);
signal Dout0, Dout1, Dout2, Dout3, Dout4, Dout5, Dout6, Dout7, Dout8, Dout9, Dout10, Dout11, Dout12, Dout13, Dout14, Dout15, Dout16, Dout17, Dout18, Dout19, Dout20, Dout21 :  STD_LOGIC_VECTOR (31 downto 0);
signal load_reg0, load_reg1, load_reg2, load_reg3, load_reg4, load_reg5, load_reg6, load_reg7, load_reg8, load_reg9, load_reg10, load_reg11,
 load_reg12, load_reg13, load_reg14, load_reg15, load_reg16, load_reg17, load_reg18, load_reg19, load_reg20, load_reg21 : STD_LOGIC;
 
begin
	reg0: reg_32 port map (	Din => Din, clk => clk, reset => reset, load => load_reg0, Dout => Dout0);
	reg1: reg_32 port map (	Din => Din, clk => clk, reset => reset, load => load_reg1, Dout => Dout1);
	reg2: reg_32 port map (	Din => Din, clk => clk, reset => reset, load => load_reg2, Dout => Dout2);
	reg3: reg_32 port map (	Din => Din, clk => clk, reset => reset, load => load_reg3, Dout => Dout3);
	reg4: reg_32 port map (	Din => Din, clk => clk, reset => reset, load => load_reg4, Dout => Dout4);
	reg5: reg_32 port map (	Din => Din, clk => clk, reset => reset, load => load_reg5, Dout => Dout5);
	reg6: reg_32 port map (	Din => Din, clk => clk, reset => reset, load => load_reg6, Dout => Dout6);
	reg7: reg_32 port map (	Din => Din, clk => clk, reset => reset, load => load_reg7, Dout => Dout7);
	reg8: reg_32 port map (	Din => Din, clk => clk, reset => reset, load => load_reg8, Dout => Dout8);
	reg9: reg_32 port map (	Din => Din, clk => clk, reset => reset, load => load_reg9, Dout => Dout9);
	reg10: reg_32 port map (Din => Din, clk => clk, reset => reset, load => load_reg10, Dout => Dout10);
	reg11: reg_32 port map (Din => Din, clk => clk, reset => reset, load => load_reg11, Dout => Dout11);
	reg12: reg_32 port map (Din => Din, clk => clk, reset => reset, load => load_reg12, Dout => Dout12);
	reg13: reg_32 port map (Din => Din, clk => clk, reset => reset, load => load_reg13, Dout => Dout13);
	reg14: reg_32 port map (Din => Din, clk => clk, reset => reset, load => load_reg14, Dout => Dout14);
	reg15: reg_32 port map (Din => Din, clk => clk, reset => reset, load => load_reg15, Dout => Dout15);
	reg16: reg_32 port map (Din => Din, clk => clk, reset => reset, load => load_reg16, Dout => Dout16);
	reg17: reg_32 port map (Din => Din, clk => clk, reset => reset, load => load_reg17, Dout => Dout17);
	reg18: reg_32 port map (Din => Din, clk => clk, reset => reset, load => load_reg18, Dout => Dout18);
	reg19: reg_32 port map (Din => Din, clk => clk, reset => reset, load => load_reg19, Dout => Dout19);
	reg20: reg_32 port map (Din => Din, clk => clk, reset => reset, load => load_reg20, Dout => Dout20);
	reg21: reg_32 port map (Din => Din, clk => clk, reset => reset, load => load_reg21, Dout => Dout21);
	
	load_reg0  <= load when number_of_received_words="00000" else '0';
    load_reg1  <= load when number_of_received_words="00001" else '0';
    load_reg2  <= load when number_of_received_words="00010" else '0';
    load_reg3  <= load when number_of_received_words="00011" else '0';
	load_reg4  <= load when number_of_received_words="00100" else '0';
    load_reg5  <= load when number_of_received_words="00101" else '0';
    load_reg6  <= load when number_of_received_words="00110" else '0';
    load_reg7  <= load when number_of_received_words="00111" else '0';
	load_reg8  <= load when number_of_received_words="01000" else '0';
    load_reg9  <= load when number_of_received_words="01001" else '0';
	load_reg10 <= load when number_of_received_words="01010" else '0';
    load_reg11 <= load when number_of_received_words="01011" else '0';
    load_reg12 <= load when number_of_received_words="01100" else '0';
    load_reg13 <= load when number_of_received_words="01101" else '0';
	load_reg14 <= load when number_of_received_words="01110" else '0';
    load_reg15 <= load when number_of_received_words="01111" else '0';
    load_reg16 <= load when number_of_received_words="10000" else '0';
    load_reg17 <= load when number_of_received_words="10001" else '0';
	load_reg18 <= load when number_of_received_words="10010" else '0';
    load_reg19 <= load when number_of_received_words="10011" else '0';
    load_reg20 <= load when number_of_received_words="10100" else '0';
	load_reg21 <= load when number_of_received_words="10101" else '0';

    vector(63 downto 32)<= Dout21;
    vector(31 downto 0) <= Dout20;
    
    matrix(639 downto 608) <= Dout19;
    matrix(607 downto 576) <= Dout18;
    matrix(575 downto 544) <= Dout17;
    matrix(543 downto 512) <= Dout16;
    matrix(511 downto 480) <= Dout15;
    matrix(479 downto 448) <= Dout14;
    matrix(447 downto 416) <= Dout13;
    matrix(415 downto 384) <= Dout12;
    matrix(383 downto 352) <= Dout11;
    matrix(351 downto 320) <= Dout10;
    matrix(319 downto 288) <= Dout9;
    matrix(287 downto 256) <= Dout8;
    matrix(255 downto 224) <= Dout7;
    matrix(223 downto 192) <= Dout6;
    matrix(191 downto 160) <= Dout5;
    matrix(159 downto 128) <= Dout4;
    matrix(127 downto 96) <= Dout3;
    matrix(95 downto 64) <= Dout2;
    matrix(63 downto 32) <= Dout1;
    matrix(31 downto 0) <= Dout0;
	
	unidad_g: unidad_general port map (reg2 => matrix, reg0 => vector, reg1 => salidatemp);
    salida <= "000000000000000000000000000000000000000000000000000000" & salidatemp; 
	salida1 <= salida(63 downto 32);
	salida0 <= salida(31 downto 0);
	
	Dout <= Dout0 when word_count= "0000" else
            Dout20 when word_count= "0001" else
            Dout21 when word_count= "0010" else
            salida(31 downto 0) when word_count= "0011" else
            x"0000ffff";
end Behavioral;
