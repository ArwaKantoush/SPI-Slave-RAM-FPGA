module SPI_SLAVE_tb ();
reg clk,rst_n,SS_n;
reg [7:0]tx_data;
reg tx_valid;
reg MOSI;
wire MISO;
reg MISO_exp;
reg [7:0]expected;
wire [9:0]rx_data;
reg [9:0]rx_data_exp;
reg [9:0]data;
wire rx_valid;
reg rx_valid_exp;

SPI_SLAVE dut (.clk(clk),.rst_n(rst_n),.SS_n(SS_n),.tx_data(tx_data),.tx_valid(tx_valid),.MOSI(MOSI),.MISO(MISO),.rx_data(rx_data),.rx_valid(rx_valid));

initial begin
    clk = 1;
    forever begin
        #1 clk = ~clk;
    end
end

integer i;
initial begin
    rst_n = 0;
    SS_n = 1;
    MOSI = 0;
    MISO_exp = 0;
    tx_valid = 1;
    tx_data = 8'b0000_0000;
    rx_data_exp = 10'b00_0000_0000;
    rx_valid_exp = 0;
    @(negedge clk);
    @(negedge clk);
    rst_n = 1;
    @(negedge clk);
    SS_n = 0;
    @(negedge clk);


    data = 10'b00_1111_1111;
    expected = 8'b0000_0000;
    for (i = 9 ; i >= 0 ; i = i - 1) begin
        MOSI = data[i];
        @(negedge clk);
    end

    tx_valid = 0;
    tx_data = 8'b0000_0000;
    rx_data_exp = 10'b00_1111_1111;
    rx_valid_exp = 1;
    @(negedge clk);

    rx_valid_exp = 0;

    SS_n = 1;
    @(negedge clk);
    @(negedge clk);

    // RAM Write Command - Write Data

    SS_n = 0;
    @(negedge clk);

    data = 10'b01_0111_1101;
    expected = 8'b0000_0000;
    for (i = 9 ; i >= 0 ; i = i - 1) begin
        MOSI = data[i];
        @(negedge clk);
    end

    tx_valid = 0;
    tx_data = 8'b0000_0000;
    rx_data_exp = 10'b01_0111_1101;
    rx_valid_exp = 1;
    @(negedge clk);

    rx_valid_exp = 0;

    SS_n = 1;
    @(negedge clk);
    @(negedge clk);

    // RAM Write Command - Read Address

    SS_n = 0;
    @(negedge clk);

    data = 10'b10_1111_1111;
    expected = 8'b0000_0000;
    for (i = 9 ; i >= 0 ; i = i - 1) begin
        MOSI = data[i];
        @(negedge clk);
    end

    tx_valid = 0;
    tx_data = 8'b0000_0000;
    rx_data_exp = 10'b10_1111_1111;
    rx_valid_exp = 1;
    @(negedge clk);

    rx_valid_exp = 0;

    SS_n = 1;
    @(negedge clk);
    @(negedge clk);

    // RAM Write Command - Read Data

    SS_n = 0;
    @(negedge clk);

    data = 10'b11_0000_0000;
    expected = 8'b0111_1101;
    for (i = 9 ; i >= 0 ; i = i - 1) begin
        MOSI = data[i];
        @(negedge clk);
    end

    tx_valid = 1;
    tx_data = 8'b0111_1101;
    rx_data_exp = 10'b11_0111_1101;
    rx_valid_exp = 1;
    @(negedge clk);

    rx_valid_exp = 0;

    for (i = 7 ; i >= 0 ; i = i - 1) begin
        MISO_exp = expected[i];
        @(negedge clk);
        if (MISO !== MISO_exp) begin
            $display("ERROR!");
            $stop;
        end
    end

    SS_n = 1;
    @(negedge clk);
    @(negedge clk);

    $stop;end

initial begin
    $monitor("clk=%b,rst_n=%b,SS_n=%b,tx_data=%b,tx_valid=%b,MOSI=%b,MISO=%b,MISO_exp=%b,rx_data=%b,rx_data_exp=%b,rx_valid=%b,rx_valid_exp=%b",clk,rst_n,SS_n,tx_data,tx_valid,MOSI,MISO,MISO_exp,rx_data,rx_data_exp,rx_valid,rx_valid_exp);
end
endmodule //SPI_SLAVE_tb
