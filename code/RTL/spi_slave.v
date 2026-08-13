module SPI_SLAVE #(
parameter IDLE = 3'b000,
parameter WRITE = 3'b001,
parameter READ_DATA = 3'b010,
parameter CHK_CMD = 3'b011,
parameter READ_ADD = 3'b100
)
(
input MOSI,SS_n,clk,rst_n,
input tx_valid,
input [7:0]tx_data,
output reg [9:0]rx_data,
output reg rx_valid,
output reg MISO
);
reg rd_addr_received;
reg [9:0]rx_data_reg;
reg [3:0]counter_rx;
reg [3:0]counter_tx;
//only synthesis tool sees this
(* fsm_encoding = "gray" *) //change_conding_style_to_one hot_and_another time_to_sequential/binary
reg [2:0]cs,ns;
//state_memory
always@(posedge clk)begin
    if(!rst_n)begin
        cs <= IDLE;
    end
    else begin
        cs <= ns;
    end
end
//next_state_logic
always@(*)begin
    case(cs)
        IDLE:
            if(SS_n) begin
             ns = IDLE;
            end
            else begin
             ns = CHK_CMD;
            end
        WRITE:
            if(SS_n) begin
             ns = IDLE;
            end
            else begin
             ns = WRITE;
            end
        READ_DATA:
            if(SS_n) begin
             ns = IDLE;
            end
            else begin
             ns = READ_DATA;
            end
        CHK_CMD:
            if(SS_n) begin
              ns = IDLE;
            end
            else begin
                if(MOSI == 0)begin
                    ns = WRITE;
                end
                else begin
                    if(rd_addr_received)begin
                      ns = READ_DATA;
                    end
                     else begin
                      ns = READ_ADD;
                    end
                end
            end
        READ_ADD:
            if(SS_n) begin
              ns = IDLE;
            end
            else begin
              ns = READ_ADD;
            end
        default : ns = IDLE;
    endcase
end
//output_logic
always@(posedge clk)begin
  if(!rst_n)begin
    rx_data <= 10'b0;
    rx_valid <= 1'b0;
    MISO <= 1'b0;
    counter_rx <= 4'b0;
    counter_tx <= 4'b0;
    rd_addr_received <= 1'b0;
    rx_data_reg <= 10'b0;
  end
  else begin
    case(cs)
        IDLE:begin
          counter_rx <= 4'b0;  //Tracks the number of serial bits received over the MOSI pin during serial-to-parallel conversion
          counter_tx <= 4'b0; //Tracks the number of serial bits transmitted out over the MISO pin during parallel-to-serial conversion
          rx_valid <= 1'b0;
        end
        CHK_CMD:begin
          rx_data_reg <= {rx_data_reg[8:0],MOSI};
          counter_rx <= 4'b0001; //Preloads to 1 as in 9th cycle counter_rx increments from 9 to 10
          counter_tx <= 4'b0;
          rx_valid <= 1'b0;
        end
        WRITE:begin
          if(counter_rx < 10)begin
            rx_data_reg <= {rx_data_reg[8:0],MOSI}; //shift_left_serial_to_parallel
            counter_rx <= counter_rx + 1'b1 ;
            rx_valid <= 1'b0;
          end
          else if(counter_rx == 10) begin //1 bit from CHK_CMD + 9 bits from counter ----> all bits are sent serially over MISO
            rx_data <= rx_data_reg;      //then packed all into rx_data_reg
            rx_valid <= 1'b1;           //Data or address sent to RAM
            counter_rx <= counter_rx +1 ;
          end
          else begin
            rx_valid <= 0; //hold_state
          end
        end
        READ_ADD:begin
           if(counter_rx < 10)begin
            rx_data_reg <= {rx_data_reg[8:0],MOSI}; //shift_left_serial_to_parallel
            counter_rx <= counter_rx +1 ;
            rx_valid <= 1'b0;
          end
          else if(counter_rx == 10) begin
            rx_data <= rx_data_reg;
            rx_valid <= 1'b1;
            rd_addr_received <= 1'b1;
            counter_rx <= counter_rx +1 ;
          end
          else begin
            rx_valid <= 0; //hold_state
          end
        end
        READ_DATA:begin
          if(counter_rx < 10)begin
            rx_data_reg <= {rx_data_reg[8:0],MOSI}; // Shift in dummy bits
            counter_rx <= counter_rx + 1;
            rx_valid <= 1'b0;
          end
          else if(counter_rx == 10)begin
            rx_data  <= rx_data_reg;   //holds {2'b11, 8'b dummy}
            rx_valid <= 1'b1;         // pulse rx_valid to RAM
            counter_rx  <= counter_rx + 1;
          end
          else begin
            rx_valid <= 1;
            if(tx_valid)begin //data is ready
              rx_valid <= 0;
                if(counter_tx < 8)begin
                  MISO <=  tx_data[7-counter_tx]; //parallel_to_serial sending MSB first
                 counter_tx <= counter_tx + 1;
                end
                else if(counter_tx == 8)begin //all bits are transmitted serially over MISO
                 rd_addr_received <= 1'b0; //Reset read flag when complete
                end
            end
          end
        end
        default :begin
          MISO <= 0;
          rx_data <= 10'b0;
          rx_valid <= 1'b0;
        end
    endcase
  end
end
endmodule
