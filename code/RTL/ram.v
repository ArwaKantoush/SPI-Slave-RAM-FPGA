module RAM (clk , rst_n , din , rx_valid , dout , tx_valid);
    parameter MEM_DEPTH = 256;
    parameter ADDR_SIZE = 8;
    input clk , rst_n , rx_valid;
    input [9:0] din;
    output reg [7:0] dout;
    output reg tx_valid;

    reg [7:0] mem [MEM_DEPTH - 1 : 0];
    reg [ADDR_SIZE-1:0] WR_address_bus; // Write address register
    reg [ADDR_SIZE-1:0] RD_address_bus; // Read address register

    reg flag_read;  // Flag to indicate a pending read operation
    reg flag_write; // Flag to indicate a pending write operatio

    always @(posedge clk) begin                   // synchronous reset
        if (~rst_n) begin
            WR_address_bus <= 0;
            RD_address_bus <= 0;
            flag_read <= 0;
            flag_write <= 0;
            dout <= 0;
            tx_valid <= 0;
        end
        else if (rx_valid) begin                // ram starts read/write only when rx_valid is HIGH
            case (din[9:8])
                2'b00: begin                   // when first 2 bits of din = 00 >> write address is saved
                    if (~flag_write) begin
                        WR_address_bus <= din[7:0];
                        tx_valid <= 0;
                        flag_write <= 1;
                    end
                end

                2'b01: begin                   // when first 2 bits = 01 >> din[7:0] is written in memory address
                    if (flag_write) begin
                       mem [WR_address_bus] <= din[7:0];
                        tx_valid <= 0;
                        flag_write <= 0;
                    end
                end

                2'b10: begin                    // when first 2 bits = 10 >> read address is saved
                    if (~flag_read) begin
                        RD_address_bus <= din[7:0];
                        tx_valid <= 0;
                        flag_read <= 1;
                    end
                end

                2'b11: begin                     // when first 2 bits = 11 >> dmemory is being read and tx_valid is set HIGH
                    if (flag_read) begin
                        dout <= mem [RD_address_bus];
                        tx_valid <= 1;
                        flag_read <= 0;
                    end
                end
            endcase
        end
    end
endmodule




