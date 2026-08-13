module RAM_tb ();

    reg clk;
    reg rst_n;
    reg [9:0] din;
    reg rx_valid;
    wire [7:0] dout;
    //reg [7:0]dout_exp;
    wire tx_valid;
    //reg tx_valid_exp;

    RAM dut ( .clk(clk), .rst_n(rst_n), .din(din), .rx_valid(rx_valid), .dout(dout), .tx_valid(tx_valid));

    initial begin
        clk = 1;
        forever begin
            #1 clk = ~clk;
        end
    end

    initial begin

        rst_n = 0;
        rx_valid = 0;
        din = 0;
        @(negedge clk);
        rst_n = 1;
        $readmemb ("mem.dat" , dut.mem);

        // WRITE ADDRESS
        // Command = 00
        // Address = 1111_1111

        din = 10'b00_1111_1111;
        rx_valid = 1;
        @(negedge clk);
        rx_valid = 0;
        @(negedge clk);

        // WRITE DATA
        // Command = 01
        // Data = 0111_1101

        din = 10'b01_0111_1101;
        rx_valid = 1;
        @(negedge clk);
        rx_valid = 0;
        @(negedge clk);

        // READ ADDRESS
        // Command = 10
        // Address = 1111_1111

        din = 10'b10_1111_1111;
        rx_valid = 1;
        @(negedge clk);
        rx_valid = 0;
        @(negedge clk);

        // READ DATA
        // Command = 11
        // Expected data = 0111_1101

        din = 10'b11_0000_0000;
        rx_valid = 1;
        @(negedge clk);
        if (~tx_valid || dout !== 8'b0111_1101) begin
            $display("ERROR!");
            $stop;
        end
        rx_valid = 0;
        @(negedge clk);



        din = 10'b00_1111_1111;
        rx_valid = 1;
        @(negedge clk);
        rx_valid = 0;
        @(negedge clk);
        $stop;

    end

    initial begin
    $monitor("clk=%b, rst_n=%b, din=%b, rx_valid=%b, dout=%b, tx_valid=%b",
    clk, rst_n, din, rx_valid, dout, tx_valid);
    end
endmodule
