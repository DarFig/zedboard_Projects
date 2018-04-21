# VHDL UTILS

## Adders

- half_adder: semi sumador

	inA : in STD_LOGIC;
    nB : in STD_LOGIC;
    carry : out STD_LOGIC;
    salida : out STD_LOGIC;

- full_adder: sumador completo a partir del half_adder
	
	inA : in STD_LOGIC;
	inB : in STD_LOGIC;
	inCarry : in STD_LOGIC;
	salida : out STD_LOGIC;
	carry : out STD_LOGIC;
		
- full_adder_ind: sumador completo independiente del half_adder

	inA : in STD_LOGIC;
	inB : in STD_LOGIC;
	inCarry : in STD_LOGIC;
	salida : out STD_LOGIC;
	carry : out STD_LOGIC;