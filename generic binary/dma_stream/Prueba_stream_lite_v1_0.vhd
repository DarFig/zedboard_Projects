library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Prueba_stream_lite_v1_0 is
		generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface S00_AXI
		C_S00_AXI_DATA_WIDTH	: integer	:= 32;
		C_S00_AXI_ADDR_WIDTH	: integer	:= 4;

		-- Parameters of Axi Slave Bus Interface S00_AXIS
		C_S00_AXIS_TDATA_WIDTH	: integer	:= 32;

		-- Parameters of Axi Master Bus Interface M00_AXIS
		C_M00_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M00_AXIS_START_COUNT	: integer	:= 32
	);
	port (
		-- Users to add ports here
		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface S00_AXI
		s00_axi_aclk	: in std_logic;
		s00_axi_aresetn	: in std_logic;
		s00_axi_awaddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_awprot	: in std_logic_vector(2 downto 0);
		s00_axi_awvalid	: in std_logic;
		s00_axi_awready	: out std_logic;
		s00_axi_wdata	: in std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_wstrb	: in std_logic_vector((C_S00_AXI_DATA_WIDTH/8)-1 downto 0);
		s00_axi_wvalid	: in std_logic;
		s00_axi_wready	: out std_logic;
		s00_axi_bresp	: out std_logic_vector(1 downto 0);
		s00_axi_bvalid	: out std_logic;
		s00_axi_bready	: in std_logic;
		s00_axi_araddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_arprot	: in std_logic_vector(2 downto 0);
		s00_axi_arvalid	: in std_logic;
		s00_axi_arready	: out std_logic;
		s00_axi_rdata	: out std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_rresp	: out std_logic_vector(1 downto 0);
		s00_axi_rvalid	: out std_logic;
		s00_axi_rready	: in std_logic;

		-- Ports of Axi Slave Bus Interface S00_AXIS
		s00_axis_aclk	: in std_logic;
		s00_axis_aresetn	: in std_logic;
		s00_axis_tready	: out std_logic;
		s00_axis_tdata	: in std_logic_vector(C_S00_AXIS_TDATA_WIDTH-1 downto 0);
		s00_axis_tstrb	: in std_logic_vector((C_S00_AXIS_TDATA_WIDTH/8)-1 downto 0);
		s00_axis_tlast	: in std_logic;
		s00_axis_tvalid	: in std_logic;

		-- Ports of Axi Master Bus Interface M00_AXIS
		m00_axis_aclk	: in std_logic;
		m00_axis_aresetn	: in std_logic;
		m00_axis_tvalid	: out std_logic;
		m00_axis_tdata	: out std_logic_vector(C_M00_AXIS_TDATA_WIDTH-1 downto 0);
		m00_axis_tstrb	: out std_logic_vector((C_M00_AXIS_TDATA_WIDTH/8)-1 downto 0);
		m00_axis_tlast	: out std_logic;
		m00_axis_tready	: in std_logic
	);
end Prueba_stream_lite_v1_0;

architecture arch_imp of Prueba_stream_lite_v1_0 is

-- component declaration
	component Prueba_stream_lite_v1_0_S00_AXI is
		generic (
            C_S_AXI_DATA_WIDTH	: integer	:= 32;
            C_S_AXI_ADDR_WIDTH	: integer	:= 4
		);
		port (
			--user ports
			 -- Timer
            number_cycles           : in STD_LOGIC_VECTOR(32-1 downto 0);
            salida0           : in STD_LOGIC_VECTOR(32-1 downto 0);
            salida1           : in STD_LOGIC_VECTOR(32-1 downto 0);
            -- end user ports
            S_AXI_ACLK	: in std_logic;
            S_AXI_ARESETN	: in std_logic;
            S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
            S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
            S_AXI_AWVALID	: in std_logic;
            S_AXI_AWREADY	: out std_logic;
            S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
            S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
            S_AXI_WVALID	: in std_logic;
            S_AXI_WREADY	: out std_logic;
            S_AXI_BRESP	: out std_logic_vector(1 downto 0);
            S_AXI_BVALID	: out std_logic;
            S_AXI_BREADY	: in std_logic;
            S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
            S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
            S_AXI_ARVALID	: in std_logic;
            S_AXI_ARREADY	: out std_logic;
            S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
            S_AXI_RRESP	: out std_logic_vector(1 downto 0);
            S_AXI_RVALID	: out std_logic;
            S_AXI_RREADY	: in std_logic
		);
	end component;

	component Prueba_stream_lite_v1_0_S00_AXIS is
		generic (
		  C_S_AXIS_TDATA_WIDTH	: integer	:= 32
		);
		port (
            S_AXIS_ACLK	    : in std_logic;
            S_AXIS_ARESETN	: in std_logic;
            S_AXIS_TREADY	: out std_logic;
            S_AXIS_TDATA	: in std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
            S_AXIS_TSTRB	: in std_logic_vector((C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
            S_AXIS_TLAST	: in std_logic;
            S_AXIS_TVALID	: in std_logic;
            -- Added ports
            data_stream_in	 : OUT STD_LOGIC_VECTOR(C_S_AXIS_TDATA_WIDTH-1 downto 0);
            new_data : OUT STD_LOGIC
		);
	end component;

	component Prueba_stream_lite_v1_0_M00_AXIS is
		generic (
            C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
            C_M_START_COUNT	: integer	:= 32
		);
		port (
            M_AXIS_ACLK	: in std_logic;
            M_AXIS_ARESETN	: in std_logic;
            M_AXIS_TVALID	: out std_logic;
            M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
            M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
            M_AXIS_TLAST	: out std_logic;
            M_AXIS_TREADY	: in std_logic;
            -- Added ports
            --datos a enviar
            data_stream_out : in std_logic_vector(31 downto 0);        
            -- send data indica que hay que enviar los datos
            send_data        : in STD_LOGIC;
            -- para saber qué palabra queremos enviar 
            word_count: out std_logic_vector(3 downto 0) 
		);
	end component;
	
	
    component counter
        generic (bits: positive);
        port (clk, rst: in STD_LOGIC;
              rst2 : in STD_LOGIC;
              inc : in STD_LOGIC;
              count : out STD_LOGIC_VECTOR(bits-1 downto 0)
        );
    end component;
    
    component reg_32 is
        Port ( Din : in  STD_LOGIC_VECTOR (31 downto 0);
               clk : in  STD_LOGIC;
                  reset : in  STD_LOGIC;
               load : in  STD_LOGIC;
               Dout : out  STD_LOGIC_VECTOR (31 downto 0));
    end component; 
    
    component u_externa
        Port ( reg0 : in STD_LOGIC_vector(31 downto 0); --// entrada1
               reg1 : in STD_LOGIC_vector(31 downto 0); --// entrada2
               reg2 : in STD_LOGIC_vector(31 downto 0); --// vector
               reg3 : out STD_LOGIC_vector(31 downto 0)--// salida     
        );
    end component;
    
    signal clk, rst: std_logic;
    -- Time measurement
    signal number_cycles: STD_LOGIC_VECTOR(32-1 downto 0);
    -- datos de entrada y salida del stream
     signal data_stream_in, data_stream_out: std_logic_vector(31 downto 0);
     signal new_data: std_logic;
    -- contador de palabras recibidas
    signal rst_received, inc_received: STD_LOGIC;
    signal number_of_received_words: std_logic_vector(3 downto 0);
    -- registros de datos
    signal Reg0_out, Reg1_out, Reg2_out, Reg3_out, Reg4_out, dataX4: STD_LOGIC_VECTOR(32-1 downto 0);
    signal load_reg0, load_reg1, load_reg2, load_reg3: STD_LOGIC;
    signal send_data: std_logic;
    signal word_count: std_logic_vector(3 downto 0);
    
begin
    -- Instantiation of Axi Bus Interface S00_AXI
    Prueba_S00_AXI_inst : Prueba_stream_lite_v1_0_S00_AXI
        generic map (
            C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
            C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
        )
        port map (
            S_AXI_ACLK	=> s00_axi_aclk,
            S_AXI_ARESETN	=> s00_axi_aresetn,
            S_AXI_AWADDR	=> s00_axi_awaddr,
            S_AXI_AWPROT	=> s00_axi_awprot,
            S_AXI_AWVALID	=> s00_axi_awvalid,
            S_AXI_AWREADY	=> s00_axi_awready,
            S_AXI_WDATA	=> s00_axi_wdata,
            S_AXI_WSTRB	=> s00_axi_wstrb,
            S_AXI_WVALID	=> s00_axi_wvalid,
            S_AXI_WREADY	=> s00_axi_wready,
            S_AXI_BRESP	=> s00_axi_bresp,
            S_AXI_BVALID	=> s00_axi_bvalid,
            S_AXI_BREADY	=> s00_axi_bready,
            S_AXI_ARADDR	=> s00_axi_araddr,
            S_AXI_ARPROT	=> s00_axi_arprot,
            S_AXI_ARVALID	=> s00_axi_arvalid,
            S_AXI_ARREADY	=> s00_axi_arready,
            S_AXI_RDATA	=> s00_axi_rdata,
            S_AXI_RRESP	=> s00_axi_rresp,
            S_AXI_RVALID	=> s00_axi_rvalid,
            S_AXI_RREADY	=> s00_axi_rready,
			-- Added ports
			-- Es un contador de 32 bits que no para nunca
			-- nos permite medir tiempos
			salida0                => Reg3_out,
            salida1                => Reg3_out,
			number_cycles        => number_cycles
	     );
    
    -- Instantiation of Axi Bus Interface S00_AXIS
    Prueba_S00_AXIS_inst : Prueba_stream_lite_v1_0_S00_AXIS
        generic map (
            C_S_AXIS_TDATA_WIDTH	=> C_S00_AXIS_TDATA_WIDTH
        )
        port map (
            S_AXIS_ACLK	=> s00_axis_aclk,
            S_AXIS_ARESETN	=> s00_axis_aresetn,
            S_AXIS_TREADY	=> s00_axis_tready,
            S_AXIS_TDATA	=> s00_axis_tdata,
            S_AXIS_TSTRB	=> s00_axis_tstrb,
            S_AXIS_TLAST	=> s00_axis_tlast,
            S_AXIS_TVALID	=> s00_axis_tvalid,
            -- Added ports
            data_stream_in      => data_stream_in,
            new_data  => new_data
        );
    
    -- Instantiation of Axi Bus Interface M00_AXIS
    Prueba_M00_AXIS_inst : Prueba_stream_lite_v1_0_M00_AXIS
        generic map (
            C_M_AXIS_TDATA_WIDTH	=> C_M00_AXIS_TDATA_WIDTH,
            C_M_START_COUNT	=> C_M00_AXIS_START_COUNT
        )
        port map (
            M_AXIS_ACLK	    => m00_axis_aclk,
            M_AXIS_ARESETN	=> m00_axis_aresetn,
            M_AXIS_TVALID	=> m00_axis_tvalid,
            M_AXIS_TDATA	=> m00_axis_tdata,
            M_AXIS_TSTRB	=> m00_axis_tstrb,
            M_AXIS_TLAST	=> m00_axis_tlast,
            M_AXIS_TREADY	=> m00_axis_tready,
            -- Added ports
            data_stream_out         => data_stream_out,
            send_data       => send_data,
            word_count      => word_count 
        );

	-- Add user logic here
	-- pasamos el reloj y a reset a nuestros módulos. Usamos los que nos da el bus
    -- clk <= s00_axis_aclk;
       
    rst <= NOT(s00_axi_aresetn);
    
      -- Time measurement
    -- este contador gestiona dos señales de reset pero ahora no se usa la segunda
    -- cuenta todos los ciclos
    timer: counter generic map(32)
        port map(clk => s00_axi_aclk, rst => rst, rst2 => '0', inc => '1', count => number_cycles);
   
   -- cuenta cuantas palabras se han recibido. 
    received_words: counter generic map(4)
          port map(clk => s00_axi_aclk, rst => rst, rst2 => rst_received, inc => inc_received, count => number_of_received_words);
    inc_received <= new_data;
    -- en este ejemplo recibimos paquetes de 4 palabras y las guardamos en 3 registros
    reg0: reg_32 port map (	Din => data_stream_in, clk => s00_axi_aclk, reset => rst, load => load_reg0, Dout => Reg0_out);
    reg1: reg_32 port map (	Din => data_stream_in, clk => s00_axi_aclk, reset => rst, load => load_reg1, Dout => Reg1_out);
    reg2: reg_32 port map (	Din => data_stream_in, clk => s00_axi_aclk, reset => rst, load => load_reg2, Dout => Reg2_out);
    reg3: reg_32 port map (	Din => data_stream_in, clk => s00_axi_aclk, reset => rst, load => load_reg3, Dout => Reg4_out);
    
    load_reg0 <= new_data when number_of_received_words="0000" else '0';
    load_reg1 <= new_data when number_of_received_words="0001" else '0';
    load_reg2 <= new_data when number_of_received_words="0010" else '0';
    load_reg3 <= new_data when number_of_received_words="0011" else '0';
    
    u_e : u_externa port map(reg0 => Reg0_out, reg1 => Reg1_out, reg2 => Reg2_out, reg3 => Reg3_out);
      --cuando tenemos 3 palabras reseteamos el contador y las mandamos de vuelta
    rst_received <= '1' when number_of_received_words ="0100" else '0';
    
    -- sen_data indica que queremos enviar los datos
    send_data <=  rst_received; 
    
     --word_count indica que palabra hay que enviar
    
    data_stream_out <=      Reg0_out when word_count= "0000" else
                            Reg1_out when word_count= "0001" else
                            Reg2_out when word_count= "0010" else
                            Reg4_out when word_count= "0011" else
                            x"0000ffff";
end arch_imp;
