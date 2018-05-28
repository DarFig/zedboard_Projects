library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Prueba_stream_lite_v1_0_M00_AXIS is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line

		-- Width of S_AXIS address bus. The slave accepts the read and write addresses of width C_M_AXIS_TDATA_WIDTH.
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		-- Start count is the numeber of clock cycles the master will wait before initiating/issuing any transaction.
		--C_M_START_COUNT	: integer	:= 32
		C_M_START_COUNT	: integer	:= 32
	);
	port (
		-- Users to add ports here
        -- data_in es la entrada de datos
        data_stream_out : in std_logic_vector(31 downto 0);        
        -- send data indica que hay que enviar los datos
        send_data        : in STD_LOGIC;
        -- para saber qué palabra queremos enviar 
        word_count: out std_logic_vector(3 downto 0); 
          
		-- User ports ends
		-- Do not modify the ports beyond this line

		-- Global ports
		M_AXIS_ACLK	: in std_logic;
		-- 
		M_AXIS_ARESETN	: in std_logic;
		-- Master Stream Ports. TVALID indicates that the master is driving a valid transfer, A transfer takes place when both TVALID and TREADY are asserted. 
		M_AXIS_TVALID	: out std_logic;
		-- TDATA is the primary payload that is used to provide the data that is passing across the interface from the master.
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		-- TSTRB is the byte qualifier that indicates whether the content of the associated byte of TDATA is processed as a data byte or a position byte.
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		-- TLAST indicates the boundary of a packet.
		M_AXIS_TLAST	: out std_logic;
		-- TREADY indicates that the slave can accept a transfer in the current cycle.
		M_AXIS_TREADY	: in std_logic
	);
end Prueba_stream_lite_v1_0_M00_AXIS;

architecture implementation of Prueba_stream_lite_v1_0_M00_AXIS is
	signal data: STD_LOGIC_VECTOR(32*7-1 downto 0);
	--signal send_data: std_logic;
	type state is (INIT, INIT_2, IDLE, SENDING);                              
	signal fsm_cs, fsm_ns: state;
		
    signal count_cs, count_ns: STD_LOGIC_VECTOR(3 downto 0);
begin
  
    word_count <= count_cs; -- count_cs indica cuantas palabras se han enviado
    -- I/O Connections assignments
	M_AXIS_TSTRB <= (others => '1');--usamos toda la palabra
	--M_AXIS_TDATA <= x"00000008";--enviamos siempre lo mismo
    M_AXIS_TDATA <=  data_stream_out; --enviamos la palabra que indica el contador 
    process(count_cs, fsm_cs, M_AXIS_TREADY)                                                                        
    begin
        M_AXIS_TVALID <= '0';
        M_AXIS_TLAST  <= '0';
        count_ns <= count_cs;
        fsm_ns <= fsm_cs;
                                                                                               
        case fsm_cs is                                                              
            when INIT =>
                -- Send four dummy data beats
                -- es necesario para que el dma se inicialice correctamente
                if M_AXIS_TREADY = '1' then
                    M_AXIS_TVALID <= '1';
                    count_ns <= count_cs + 1;             
                    fsm_ns <= INIT_2;
                end if;
                
            when INIT_2=>
                M_AXIS_TVALID <= '1';
                if conv_integer(count_cs) < 3 then
                    count_ns <= count_cs + 1;
                else
                    count_ns <= (others => '0');
                    fsm_ns <= IDLE;
                end if;
            
            when IDLE =>
                if send_data = '1' then
                    fsm_ns <= SENDING;
                end if;
            
            when SENDING =>
                if M_AXIS_TREADY = '1' then
                    M_AXIS_TVALID <= '1';
                    if count_cs = 3 then
                        M_AXIS_TLAST <= '1';
                        count_ns <= (others => '0');
                        fsm_ns <= IDLE;
                    else
                        count_ns <= count_cs + 1;                        
                    end if;
                end if;     
            when others =>           
        end case;
    end process;
    
    process(M_AXIS_ACLK)                                                                        
    begin                                                                                       
        if rising_edge(M_AXIS_ACLK) then                                                       
            if M_AXIS_ARESETN = '0' then                         
                fsm_cs <= INIT;
                count_cs <= (others => '0');
            else
                fsm_cs <= fsm_ns;
                count_cs <= count_ns;
            end if;
        end if;
    end process;
end implementation;
