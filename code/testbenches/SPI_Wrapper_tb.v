module SPI_Wrapper_tb ();
reg clk;
reg rst_n;
reg SS_n;
reg MOSI;
wire MISO;
reg MISO_exp;

reg [10:0]data;
reg [7:0]expected;

SPI_Wrapper dut (.MOSI(MOSI),.SS_n(SS_n),.clk(clk),.rst_n(rst_n),.MISO(MISO));

initial begin
    clk = 1;
    forever begin
        #1 clk = ~clk;
    end
end

integer i;
initial begin
    $readmemb ("mem.dat",dut.ram_inst.mem);

    // RAM Write Command - Write Address

    rst_n = 0;
    SS_n = 1;
    MOSI = 0;
    MISO_exp = 0;
    @(negedge clk);
    @(negedge clk);
    rst_n = 1;
    @(negedge clk); // IDLE
    SS_n = 0;
    @(negedge clk); //CHK_CMD

    data = 10'b00_1111_1111;
    expected = 8'b0000_0000;
    for (i = 9 ; i >= 0 ; i = i - 1) begin
        MOSI = data[i];
        @(negedge clk);
    end

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

    wait (dut.tx_valid == 1);
    @(negedge clk);

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

    $stop;
end

initial begin
    $monitor("clk=%b,rst_n=%b,MOSI=%b,SS_n=%b,MISO=%b,MISO_exp=%b",clk,rst_n,MOSI,SS_n,MISO,MISO_exp);
end
endmodule //TB
