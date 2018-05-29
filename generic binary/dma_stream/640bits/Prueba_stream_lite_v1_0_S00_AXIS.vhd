library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Prueba_stream_lite_v1_0_S00_AXIS is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line

		-- AXI4Stream sink: Data Width
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
	);
	port (
		-- Users to add ports here
		data_stream_in	 : OUT STD_LOGIC_VECTOR(C_S_AXIS_TDATA_WIDTH-1 downto 0);
        new_data : OUT STD_LOGIC;

		-- User ports ends
		-- Do not modify the ports beyond this line

		-- AXI4Stream sink: Clock
		S_AXIS_ACLK	: in std_logic;
		-- AXI4Stream sink: Reset
		S_AXIS_ARESETN	: in std_logic;
		-- Ready to accept data in
		S_AXIS_TREADY	: out std_logic;
		-- Data in
		S_AXIS_TDATA	: in std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
		-- Byte qualifier
		S_AXIS_TSTRB	: in std_logic_vector((C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
		-- Indicates boundary of last packet
		S_AXIS_TLAST	: in std_logic;
		-- Data is in valid
		S_AXIS_TVALID	: in std_logic
	);
end Prueba_stream_lite_v1_0_S00_AXIS;

architecture arch_imp of Prueba_stream_lite_v1_0_S00_AXIS is
begin	
    -- I/O Connections assignments
    -- Always ready to accept data since they are passed-by to the accelerator
    S_AXIS_TREADY <= '1';
    data_stream_in <= S_AXIS_TDATA;
    new_data <= S_AXIS_TVALID;
end arch_imp;
