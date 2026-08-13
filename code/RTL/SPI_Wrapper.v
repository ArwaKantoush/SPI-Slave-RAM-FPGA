module SPI_Wrapper (MOSI , SS_n , clk , rst_n , MISO);
    parameter MEM_DEPTH = 256;
    parameter ADDR_SIZE = 8;
    input MOSI;
    input SS_n;
    input clk;
    input rst_n;
    output MISO;

    wire tx_valid;
    wire [7:0] tx_data;
    wire rx_valid;
    wire [9:0] rx_data;

    SPI_SLAVE spi_inst (.MOSI(MOSI), .SS_n(SS_n), .clk(clk), .rst_n(rst_n), .tx_valid(tx_valid), .tx_data(tx_data), .rx_data(rx_data), .rx_valid(rx_valid), .MISO(MISO));
    RAM  #(.MEM_DEPTH(MEM_DEPTH),.ADDR_SIZE(ADDR_SIZE)) ram_inst ( .clk(clk) , .rst_n(rst_n) , .din(rx_data) , .rx_valid(rx_valid) , .dout(tx_data) , .tx_valid(tx_valid));

endmodule 
