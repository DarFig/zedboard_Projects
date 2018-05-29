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
	Dout : out  STD_LOGIC_VECTOR (31 downto 0)
	
    );
end registros;

architecture Behavioral of gestorRegistros is

component reg_32 
	Port ( Din : in  STD_LOGIC_VECTOR (31 downto 0);
		   clk : in  STD_LOGIC;
			reset : in  STD_LOGIC;
		   load : in  STD_LOGIC;
		   Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end component; 

	-- entradas
    Din0, Din2, Din3, Din4, Din5, Din6, Din7, Din8, Din9, Din10, Din11, Din12, Din13, Din14, Din16, Din17, Din18, Din19, Din20, Din21 :  STD_LOGIC_VECTOR (31 downto 0);
	Dout0 , Dout1 , Dout2, Dout3, Dout4, Dout5, Dout6, Dout7, Dout8, Dout9, Dout10, Dout11, Dout12, Dout13, Dout14, Dout15, Dout16, Dout17, Dout18, Dout20, Dout21 :  STD_LOGIC_VECTOR (31 downto 0);

	begin
	reg0: reg_32 port map (	Din => Din0, clk => clk, reset => reset, load => load_reg0, Dout => Dout0);
	reg1: reg_32 port map (	Din => Din1, clk => clk, reset => reset, load => load_reg1, Dout => Dout1);
	reg2: reg_32 port map (	Din => Din2, clk => clk, reset => reset, load => load_reg2, Dout => Dout2);
	reg3: reg_32 port map (	Din => Din3, clk => clk, reset => reset, load => load_reg3, Dout => Dout3);
	reg4: reg_32 port map (	Din => Din4, clk => clk, reset => reset, load => load_reg4, Dout => Dout4);
	reg5: reg_32 port map (	Din => Din5, clk => clk, reset => reset, load => load_reg5, Dout => Dout5);
	reg6: reg_32 port map (	Din => Din6, clk => clk, reset => reset, load => load_reg6, Dout => Dout6);
	reg7: reg_32 port map (	Din => Din7, clk => clk, reset => reset, load => load_reg7, Dout => Dout7);
	reg8: reg_32 port map (	Din => Din8, clk => clk, reset => reset, load => load_reg8, Dout => Dout8);
	reg9: reg_32 port map (	Din => Din9, clk => clk, reset => reset, load => load_reg9, Dout => Dout9);
	reg10: reg_32 port map (	Din => Din10, clk => clk, reset => reset, load => load_reg10, Dout => Dout10);
	reg11: reg_32 port map (	Din => Din11, clk => clk, reset => reset, load => load_reg11, Dout => Dout11);
	reg12: reg_32 port map (	Din => Din12, clk => clk, reset => reset, load => load_reg12, Dout => Dout12);
	reg13: reg_32 port map (	Din => Din13, clk => clk, reset => reset, load => load_reg13, Dout => Dout13);
	reg14: reg_32 port map (	Din => Din14, clk => clk, reset => reset, load => load_reg14, Dout => Dout14);
	reg15: reg_32 port map (	Din => Din15, clk => clk, reset => reset, load => load_reg15, Dout => Dout15);
	reg16: reg_32 port map (	Din => Din16, clk => clk, reset => reset, load => load_reg16, Dout => Dout16);
	reg17: reg_32 port map (	Din => Din17, clk => clk, reset => reset, load => load_reg17, Dout => Dout17);
	reg18: reg_32 port map (	Din => Din18, clk => clk, reset => reset, load => load_reg18, Dout => Dout18);
	reg19: reg_32 port map (	Din => Din19, clk => clk, reset => reset, load => load_reg19, Dout => Dout19);
	reg20: reg_32 port map (	Din => Din20, clk => clk, reset => reset, load => load_reg20, Dout => Dout20);
	reg21: reg_32 port map (	Din => Din21, clk => clk, reset => reset, load => load_reg21, Dout => Dout21);
	
	Din0  <= Din when number_of_received_words="00000" else '0';
    Din1  <= Din when number_of_received_words="00001" else '0';
    Din2  <= Din when number_of_received_words="00010" else '0';
    Din3  <= Din when number_of_received_words="00011" else '0';
	Din4  <= Din when number_of_received_words="00100" else '0';
    Din5  <= Din when number_of_received_words="00101" else '0';
    Din6  <= Din when number_of_received_words="00110" else '0';
    Din7  <= Din when number_of_received_words="00111" else '0';
	Din8  <= Din when number_of_received_words="01000" else '0';
    Din9  <= Din when number_of_received_words="01001" else '0';
	Din10 <= Din when number_of_received_words="01010" else '0';
    Din11 <= Din when number_of_received_words="01011" else '0';
    Din12 <= Din when number_of_received_words="01100" else '0';
    Din13 <= Din when number_of_received_words="01101" else '0';
	Din14 <= Din when number_of_received_words="01110" else '0';
    Din15 <= Din when number_of_received_words="01111" else '0';
    Din16 <= Din when number_of_received_words="10000" else '0';
    Din17 <= Din when number_of_received_words="10001" else '0';
	Din18 <= Din when number_of_received_words="10010" else '0';
    Din19 <= Din when number_of_received_words="10011" else '0';
    Din20 <= Din when number_of_received_words="10100" else '0';
	Din21 <= Din when number_of_received_words="10101" else '0';
	
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
	
	data_stream_out <=      Reg0_out when word_count= "0000" else
                            Reg1_out when word_count= "0001" else
                            Reg2_out when word_count= "0010" else
                            Reg4_out when word_count= "0011" else
                            x"0000ffff";
	
end Behavioral;
