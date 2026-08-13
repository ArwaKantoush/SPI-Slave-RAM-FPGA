// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Sun Aug  9 16:06:50 2026
// Host        : NADA running 64-bit major release  (build 9200)
// Command     : write_verilog {C:/Vivado projects/SPI_Project/SPI_netlist.v}
// Design      : SPI_Wrapper
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a35ticpg236-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module RAM
   (mem_reg_0,
    tx_valid,
    tx_valid_reg_0,
    MISO_reg,
    CLK,
    \rx_data_reg[9] ,
    rst_n,
    Q,
    rst_n_IBUF,
    rx_valid,
    rx_valid_reg,
    rx_valid_reg_0,
    rx_valid_reg_1,
    \counter_tx_reg[2] ,
    out,
    E,
    rx_valid_reg_2);
  output mem_reg_0;
  output tx_valid;
  output tx_valid_reg_0;
  output MISO_reg;
  input CLK;
  input \rx_data_reg[9] ;
  input rst_n;
  input [9:0]Q;
  input rst_n_IBUF;
  input rx_valid;
  input rx_valid_reg;
  input rx_valid_reg_0;
  input rx_valid_reg_1;
  input [2:0]\counter_tx_reg[2] ;
  input [0:0]out;
  input [0:0]E;
  input [0:0]rx_valid_reg_2;

  wire \<const0> ;
  wire \<const1> ;
  wire CLK;
  wire [0:0]E;
  wire MISO_i_3_n_0;
  wire MISO_i_4_n_0;
  wire MISO_reg;
  wire [9:0]Q;
  wire [7:0]RD_address_bus;
  wire [7:0]WR_address_bus;
  wire [2:0]\counter_tx_reg[2] ;
  wire mem;
  wire mem_reg_0;
  wire [0:0]out;
  wire rst_n;
  wire rst_n_IBUF;
  wire \rx_data_reg[9] ;
  wire rx_valid;
  wire rx_valid_reg;
  wire rx_valid_reg_0;
  wire rx_valid_reg_1;
  wire [0:0]rx_valid_reg_2;
  wire [7:0]tx_data;
  wire tx_valid;
  wire tx_valid_reg_0;

  GND GND
       (.G(\<const0> ));
  LUT4 #(
    .INIT(16'hE200)) 
    MISO_i_2
       (.I0(MISO_i_3_n_0),
        .I1(\counter_tx_reg[2] [2]),
        .I2(MISO_i_4_n_0),
        .I3(out),
        .O(MISO_reg));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    MISO_i_3
       (.I0(tx_data[4]),
        .I1(tx_data[5]),
        .I2(\counter_tx_reg[2] [1]),
        .I3(tx_data[6]),
        .I4(\counter_tx_reg[2] [0]),
        .I5(tx_data[7]),
        .O(MISO_i_3_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    MISO_i_4
       (.I0(tx_data[0]),
        .I1(tx_data[1]),
        .I2(\counter_tx_reg[2] [1]),
        .I3(tx_data[2]),
        .I4(\counter_tx_reg[2] [0]),
        .I5(tx_data[3]),
        .O(MISO_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \RD_address_bus_reg[0] 
       (.C(CLK),
        .CE(rx_valid_reg_2),
        .D(Q[0]),
        .Q(RD_address_bus[0]),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    \RD_address_bus_reg[1] 
       (.C(CLK),
        .CE(rx_valid_reg_2),
        .D(Q[1]),
        .Q(RD_address_bus[1]),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    \RD_address_bus_reg[2] 
       (.C(CLK),
        .CE(rx_valid_reg_2),
        .D(Q[2]),
        .Q(RD_address_bus[2]),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    \RD_address_bus_reg[3] 
       (.C(CLK),
        .CE(rx_valid_reg_2),
        .D(Q[3]),
        .Q(RD_address_bus[3]),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    \RD_address_bus_reg[4] 
       (.C(CLK),
        .CE(rx_valid_reg_2),
        .D(Q[4]),
        .Q(RD_address_bus[4]),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    \RD_address_bus_reg[5] 
       (.C(CLK),
        .CE(rx_valid_reg_2),
        .D(Q[5]),
        .Q(RD_address_bus[5]),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    \RD_address_bus_reg[6] 
       (.C(CLK),
        .CE(rx_valid_reg_2),
        .D(Q[6]),
        .Q(RD_address_bus[6]),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    \RD_address_bus_reg[7] 
       (.C(CLK),
        .CE(rx_valid_reg_2),
        .D(Q[7]),
        .Q(RD_address_bus[7]),
        .R(rst_n));
  VCC VCC
       (.P(\<const1> ));
  FDRE #(
    .INIT(1'b0)) 
    \WR_address_bus_reg[0] 
       (.C(CLK),
        .CE(E),
        .D(Q[0]),
        .Q(WR_address_bus[0]),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    \WR_address_bus_reg[1] 
       (.C(CLK),
        .CE(E),
        .D(Q[1]),
        .Q(WR_address_bus[1]),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    \WR_address_bus_reg[2] 
       (.C(CLK),
        .CE(E),
        .D(Q[2]),
        .Q(WR_address_bus[2]),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    \WR_address_bus_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(Q[3]),
        .Q(WR_address_bus[3]),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    \WR_address_bus_reg[4] 
       (.C(CLK),
        .CE(E),
        .D(Q[4]),
        .Q(WR_address_bus[4]),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    \WR_address_bus_reg[5] 
       (.C(CLK),
        .CE(E),
        .D(Q[5]),
        .Q(WR_address_bus[5]),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    \WR_address_bus_reg[6] 
       (.C(CLK),
        .CE(E),
        .D(Q[6]),
        .Q(WR_address_bus[6]),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    \WR_address_bus_reg[7] 
       (.C(CLK),
        .CE(E),
        .D(Q[7]),
        .Q(WR_address_bus[7]),
        .R(rst_n));
  LUT4 #(
    .INIT(16'h0800)) 
    \__1/i_ 
       (.I0(rst_n_IBUF),
        .I1(Q[8]),
        .I2(Q[9]),
        .I3(rx_valid),
        .O(mem));
  FDRE #(
    .INIT(1'b0)) 
    flag_read_reg
       (.C(CLK),
        .CE(\<const1> ),
        .D(rx_valid_reg_0),
        .Q(tx_valid_reg_0),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    flag_write_reg
       (.C(CLK),
        .CE(\<const1> ),
        .D(rx_valid_reg_1),
        .Q(mem_reg_0),
        .R(rst_n));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "2048" *) 
  (* RTL_RAM_NAME = "mem" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "1023" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "7" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    mem_reg
       (.ADDRARDADDR({\<const1> ,\<const1> ,WR_address_bus,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .ADDRBWRADDR({\<const1> ,\<const1> ,RD_address_bus,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .CLKARDCLK(CLK),
        .CLKBWRCLK(CLK),
        .DIADI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,Q[7:0]}),
        .DIBDI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .DIPADIP({\<const0> ,\<const0> }),
        .DIPBDIP({\<const0> ,\<const0> }),
        .DOBDO(tx_data),
        .ENARDEN(mem_reg_0),
        .ENBWREN(\rx_data_reg[9] ),
        .REGCEAREGCE(\<const0> ),
        .REGCEB(\<const0> ),
        .RSTRAMARSTRAM(\<const0> ),
        .RSTRAMB(rst_n),
        .RSTREGARSTREG(\<const0> ),
        .RSTREGB(\<const0> ),
        .WEA({mem,mem}),
        .WEBWE({\<const0> ,\<const0> ,\<const0> ,\<const0> }));
  FDRE #(
    .INIT(1'b0)) 
    tx_valid_reg
       (.C(CLK),
        .CE(\<const1> ),
        .D(rx_valid_reg),
        .Q(tx_valid),
        .R(rst_n));
endmodule

module SPI_SLAVE
   (out,
    rx_valid,
    SR,
    MISO_OBUF,
    Q,
    E,
    tx_valid_reg,
    \RD_address_bus_reg[7] ,
    tx_valid_reg_0,
    flag_read_reg,
    flag_write_reg,
    mem_reg,
    CLK,
    \counter_tx_reg[2]_0 ,
    tx_valid,
    SS_n_IBUF,
    flag_write_reg_0,
    flag_read_reg_0,
    rst_n_IBUF,
    MOSI_IBUF);
  output [0:0]out;
  output rx_valid;
  output [0:0]SR;
  output MISO_OBUF;
  output [2:0]Q;
  output [0:0]E;
  output [9:0]tx_valid_reg;
  output [0:0]\RD_address_bus_reg[7] ;
  output tx_valid_reg_0;
  output flag_read_reg;
  output flag_write_reg;
  output mem_reg;
  input CLK;
  input \counter_tx_reg[2]_0 ;
  input tx_valid;
  input SS_n_IBUF;
  input flag_write_reg_0;
  input flag_read_reg_0;
  input rst_n_IBUF;
  input MOSI_IBUF;

  wire \<const1> ;
  wire CLK;
  wire [0:0]E;
  wire \FSM_onehot_cs[0]_i_1_n_0 ;
  wire \FSM_onehot_cs[1]_i_1_n_0 ;
  wire \FSM_onehot_cs[2]_i_1_n_0 ;
  wire \FSM_onehot_cs[3]_i_1_n_0 ;
  wire \FSM_onehot_cs[4]_i_2_n_0 ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_cs_reg_n_0_[0] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_cs_reg_n_0_[1] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_cs_reg_n_0_[2] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_cs_reg_n_0_[4] ;
  wire MISO_OBUF;
  wire MISO_i_1_n_0;
  wire MOSI_IBUF;
  wire [2:0]Q;
  wire [0:0]\RD_address_bus_reg[7] ;
  wire [0:0]SR;
  wire SS_n_IBUF;
  wire counter_rx;
  wire \counter_rx[0]_i_1_n_0 ;
  wire \counter_rx[1]_i_1_n_0 ;
  wire \counter_rx[2]_i_1_n_0 ;
  wire \counter_rx[3]_i_2_n_0 ;
  wire \counter_rx[3]_i_3_n_0 ;
  wire \counter_rx[3]_i_4_n_0 ;
  wire \counter_rx_reg_n_0_[0] ;
  wire \counter_rx_reg_n_0_[1] ;
  wire \counter_rx_reg_n_0_[2] ;
  wire \counter_rx_reg_n_0_[3] ;
  wire counter_tx;
  wire \counter_tx[0]_i_1_n_0 ;
  wire \counter_tx[1]_i_1_n_0 ;
  wire \counter_tx[2]_i_1_n_0 ;
  wire \counter_tx[3]_i_2_n_0 ;
  wire \counter_tx[3]_i_3_n_0 ;
  wire \counter_tx_reg[2]_0 ;
  wire \counter_tx_reg_n_0_[3] ;
  wire flag_read_reg;
  wire flag_read_reg_0;
  wire flag_write_reg;
  wire flag_write_reg_0;
  wire mem_reg;
  (* RTL_KEEP = "yes" *) wire [0:0]out;
  wire rd_addr_received_i_1_n_0;
  wire rd_addr_received_i_2_n_0;
  wire rd_addr_received_reg_n_0;
  wire rst_n_IBUF;
  wire \rx_data[0]_i_1_n_0 ;
  wire \rx_data[1]_i_1_n_0 ;
  wire \rx_data[2]_i_1_n_0 ;
  wire \rx_data[3]_i_1_n_0 ;
  wire \rx_data[4]_i_1_n_0 ;
  wire \rx_data[5]_i_1_n_0 ;
  wire \rx_data[6]_i_1_n_0 ;
  wire \rx_data[7]_i_1_n_0 ;
  wire \rx_data[8]_i_1_n_0 ;
  wire \rx_data[9]_i_1_n_0 ;
  wire \rx_data[9]_i_2_n_0 ;
  wire [9:0]rx_data_reg;
  wire rx_data_reg__0;
  wire rx_valid;
  wire rx_valid_i_1_n_0;
  wire rx_valid_i_2_n_0;
  wire rx_valid_i_3_n_0;
  wire tx_valid;
  wire [9:0]tx_valid_reg;
  wire tx_valid_reg_0;

  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \FSM_onehot_cs[0]_i_1 
       (.I0(SS_n_IBUF),
        .I1(\FSM_onehot_cs_reg_n_0_[1] ),
        .I2(\FSM_onehot_cs_reg_n_0_[0] ),
        .I3(out),
        .I4(\FSM_onehot_cs_reg_n_0_[4] ),
        .I5(\FSM_onehot_cs_reg_n_0_[2] ),
        .O(\FSM_onehot_cs[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_onehot_cs[1]_i_1 
       (.I0(\FSM_onehot_cs_reg_n_0_[0] ),
        .I1(SS_n_IBUF),
        .O(\FSM_onehot_cs[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h4544)) 
    \FSM_onehot_cs[2]_i_1 
       (.I0(SS_n_IBUF),
        .I1(\FSM_onehot_cs_reg_n_0_[2] ),
        .I2(MOSI_IBUF),
        .I3(\FSM_onehot_cs_reg_n_0_[1] ),
        .O(\FSM_onehot_cs[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h55554000)) 
    \FSM_onehot_cs[3]_i_1 
       (.I0(SS_n_IBUF),
        .I1(rd_addr_received_reg_n_0),
        .I2(MOSI_IBUF),
        .I3(\FSM_onehot_cs_reg_n_0_[1] ),
        .I4(out),
        .O(\FSM_onehot_cs[3]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_onehot_cs[4]_i_1 
       (.I0(rst_n_IBUF),
        .O(SR));
  LUT5 #(
    .INIT(32'h45444444)) 
    \FSM_onehot_cs[4]_i_2 
       (.I0(SS_n_IBUF),
        .I1(\FSM_onehot_cs_reg_n_0_[4] ),
        .I2(rd_addr_received_reg_n_0),
        .I3(MOSI_IBUF),
        .I4(\FSM_onehot_cs_reg_n_0_[1] ),
        .O(\FSM_onehot_cs[4]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "CHK_CMD:00010,WRITE:00100,READ_DATA:01000,READ_ADD:10000,IDLE:00001" *) 
  (* KEEP = "yes" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_cs_reg[0] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\FSM_onehot_cs[0]_i_1_n_0 ),
        .Q(\FSM_onehot_cs_reg_n_0_[0] ),
        .S(SR));
  (* FSM_ENCODED_STATES = "CHK_CMD:00010,WRITE:00100,READ_DATA:01000,READ_ADD:10000,IDLE:00001" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_cs_reg[1] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\FSM_onehot_cs[1]_i_1_n_0 ),
        .Q(\FSM_onehot_cs_reg_n_0_[1] ),
        .R(SR));
  (* FSM_ENCODED_STATES = "CHK_CMD:00010,WRITE:00100,READ_DATA:01000,READ_ADD:10000,IDLE:00001" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_cs_reg[2] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\FSM_onehot_cs[2]_i_1_n_0 ),
        .Q(\FSM_onehot_cs_reg_n_0_[2] ),
        .R(SR));
  (* FSM_ENCODED_STATES = "CHK_CMD:00010,WRITE:00100,READ_DATA:01000,READ_ADD:10000,IDLE:00001" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_cs_reg[3] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\FSM_onehot_cs[3]_i_1_n_0 ),
        .Q(out),
        .R(SR));
  (* FSM_ENCODED_STATES = "CHK_CMD:00010,WRITE:00100,READ_DATA:01000,READ_ADD:10000,IDLE:00001" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_cs_reg[4] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\FSM_onehot_cs[4]_i_2_n_0 ),
        .Q(\FSM_onehot_cs_reg_n_0_[4] ),
        .R(SR));
  LUT2 #(
    .INIT(4'h2)) 
    MISO_i_1
       (.I0(\counter_tx[3]_i_3_n_0 ),
        .I1(\counter_tx_reg_n_0_[3] ),
        .O(MISO_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    MISO_reg
       (.C(CLK),
        .CE(MISO_i_1_n_0),
        .D(\counter_tx_reg[2]_0 ),
        .Q(MISO_OBUF),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \RD_address_bus[7]_i_1 
       (.I0(rx_valid),
        .I1(flag_read_reg_0),
        .I2(tx_valid_reg[9]),
        .I3(tx_valid_reg[8]),
        .O(\RD_address_bus_reg[7] ));
  VCC VCC
       (.P(\<const1> ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    \WR_address_bus[7]_i_1 
       (.I0(rx_valid),
        .I1(flag_write_reg_0),
        .I2(tx_valid_reg[9]),
        .I3(tx_valid_reg[8]),
        .O(E));
  LUT6 #(
    .INIT(64'hAAAAAAAAFBFBFBBB)) 
    \counter_rx[0]_i_1 
       (.I0(\FSM_onehot_cs_reg_n_0_[1] ),
        .I1(\counter_rx_reg_n_0_[0] ),
        .I2(\counter_rx_reg_n_0_[3] ),
        .I3(\counter_rx_reg_n_0_[2] ),
        .I4(\counter_rx_reg_n_0_[1] ),
        .I5(\counter_rx[3]_i_3_n_0 ),
        .O(\counter_rx[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h55541414)) 
    \counter_rx[1]_i_1 
       (.I0(\counter_rx[3]_i_3_n_0 ),
        .I1(\counter_rx_reg_n_0_[0] ),
        .I2(\counter_rx_reg_n_0_[1] ),
        .I3(\counter_rx_reg_n_0_[2] ),
        .I4(\counter_rx_reg_n_0_[3] ),
        .O(\counter_rx[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00001444)) 
    \counter_rx[2]_i_1 
       (.I0(\counter_rx_reg_n_0_[3] ),
        .I1(\counter_rx_reg_n_0_[2] ),
        .I2(\counter_rx_reg_n_0_[1] ),
        .I3(\counter_rx_reg_n_0_[0] ),
        .I4(\counter_rx[3]_i_3_n_0 ),
        .O(\counter_rx[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF000007FF)) 
    \counter_rx[3]_i_1 
       (.I0(\counter_rx_reg_n_0_[1] ),
        .I1(\counter_rx_reg_n_0_[0] ),
        .I2(\counter_rx_reg_n_0_[2] ),
        .I3(\counter_rx_reg_n_0_[3] ),
        .I4(\counter_rx[3]_i_3_n_0 ),
        .I5(\counter_rx[3]_i_4_n_0 ),
        .O(counter_rx));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h55554000)) 
    \counter_rx[3]_i_2 
       (.I0(\counter_rx[3]_i_3_n_0 ),
        .I1(\counter_rx_reg_n_0_[1] ),
        .I2(\counter_rx_reg_n_0_[0] ),
        .I3(\counter_rx_reg_n_0_[2] ),
        .I4(\counter_rx_reg_n_0_[3] ),
        .O(\counter_rx[3]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \counter_rx[3]_i_3 
       (.I0(out),
        .I1(\FSM_onehot_cs_reg_n_0_[4] ),
        .I2(\FSM_onehot_cs_reg_n_0_[2] ),
        .O(\counter_rx[3]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \counter_rx[3]_i_4 
       (.I0(\FSM_onehot_cs_reg_n_0_[1] ),
        .I1(\FSM_onehot_cs_reg_n_0_[0] ),
        .O(\counter_rx[3]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_rx_reg[0] 
       (.C(CLK),
        .CE(counter_rx),
        .D(\counter_rx[0]_i_1_n_0 ),
        .Q(\counter_rx_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \counter_rx_reg[1] 
       (.C(CLK),
        .CE(counter_rx),
        .D(\counter_rx[1]_i_1_n_0 ),
        .Q(\counter_rx_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \counter_rx_reg[2] 
       (.C(CLK),
        .CE(counter_rx),
        .D(\counter_rx[2]_i_1_n_0 ),
        .Q(\counter_rx_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \counter_rx_reg[3] 
       (.C(CLK),
        .CE(counter_rx),
        .D(\counter_rx[3]_i_2_n_0 ),
        .Q(\counter_rx_reg_n_0_[3] ),
        .R(SR));
  LUT2 #(
    .INIT(4'h2)) 
    \counter_tx[0]_i_1 
       (.I0(out),
        .I1(Q[0]),
        .O(\counter_tx[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_tx[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(out),
        .O(\counter_tx[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h2A80)) 
    \counter_tx[2]_i_1 
       (.I0(out),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .O(\counter_tx[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFF4)) 
    \counter_tx[3]_i_1 
       (.I0(\counter_tx_reg_n_0_[3] ),
        .I1(\counter_tx[3]_i_3_n_0 ),
        .I2(\FSM_onehot_cs_reg_n_0_[0] ),
        .I3(\FSM_onehot_cs_reg_n_0_[1] ),
        .O(counter_tx));
  LUT5 #(
    .INIT(32'h7F800000)) 
    \counter_tx[3]_i_2 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(\counter_tx_reg_n_0_[3] ),
        .I4(out),
        .O(\counter_tx[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8880808000000000)) 
    \counter_tx[3]_i_3 
       (.I0(out),
        .I1(\counter_rx_reg_n_0_[3] ),
        .I2(\counter_rx_reg_n_0_[2] ),
        .I3(\counter_rx_reg_n_0_[0] ),
        .I4(\counter_rx_reg_n_0_[1] ),
        .I5(tx_valid),
        .O(\counter_tx[3]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_tx_reg[0] 
       (.C(CLK),
        .CE(counter_tx),
        .D(\counter_tx[0]_i_1_n_0 ),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \counter_tx_reg[1] 
       (.C(CLK),
        .CE(counter_tx),
        .D(\counter_tx[1]_i_1_n_0 ),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \counter_tx_reg[2] 
       (.C(CLK),
        .CE(counter_tx),
        .D(\counter_tx[2]_i_1_n_0 ),
        .Q(Q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \counter_tx_reg[3] 
       (.C(CLK),
        .CE(counter_tx),
        .D(\counter_tx[3]_i_2_n_0 ),
        .Q(\counter_tx_reg_n_0_[3] ),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h72F0)) 
    flag_read_i_1
       (.I0(rx_valid),
        .I1(tx_valid_reg[8]),
        .I2(flag_read_reg_0),
        .I3(tx_valid_reg[9]),
        .O(flag_read_reg));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hDF02)) 
    flag_write_i_1
       (.I0(rx_valid),
        .I1(tx_valid_reg[9]),
        .I2(tx_valid_reg[8]),
        .I3(flag_write_reg_0),
        .O(flag_write_reg));
  LUT5 #(
    .INIT(32'h8000FFFF)) 
    mem_reg_i_1
       (.I0(tx_valid_reg[9]),
        .I1(tx_valid_reg[8]),
        .I2(flag_read_reg_0),
        .I3(rx_valid),
        .I4(rst_n_IBUF),
        .O(mem_reg));
  LUT5 #(
    .INIT(32'hFCFF4C44)) 
    rd_addr_received_i_1
       (.I0(rx_valid_i_2_n_0),
        .I1(\FSM_onehot_cs_reg_n_0_[4] ),
        .I2(rd_addr_received_i_2_n_0),
        .I3(\counter_tx[3]_i_3_n_0 ),
        .I4(rd_addr_received_reg_n_0),
        .O(rd_addr_received_i_1_n_0));
  LUT4 #(
    .INIT(16'hFFEF)) 
    rd_addr_received_i_2
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(\counter_tx_reg_n_0_[3] ),
        .I3(Q[2]),
        .O(rd_addr_received_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rd_addr_received_reg
       (.C(CLK),
        .CE(\<const1> ),
        .D(rd_addr_received_i_1_n_0),
        .Q(rd_addr_received_reg_n_0),
        .R(SR));
  LUT4 #(
    .INIT(16'hAAA8)) 
    \rx_data[0]_i_1 
       (.I0(rx_data_reg[0]),
        .I1(\FSM_onehot_cs_reg_n_0_[2] ),
        .I2(\FSM_onehot_cs_reg_n_0_[4] ),
        .I3(out),
        .O(\rx_data[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hAAA8)) 
    \rx_data[1]_i_1 
       (.I0(rx_data_reg[1]),
        .I1(\FSM_onehot_cs_reg_n_0_[2] ),
        .I2(\FSM_onehot_cs_reg_n_0_[4] ),
        .I3(out),
        .O(\rx_data[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hAAA8)) 
    \rx_data[2]_i_1 
       (.I0(rx_data_reg[2]),
        .I1(\FSM_onehot_cs_reg_n_0_[2] ),
        .I2(\FSM_onehot_cs_reg_n_0_[4] ),
        .I3(out),
        .O(\rx_data[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hAAA8)) 
    \rx_data[3]_i_1 
       (.I0(rx_data_reg[3]),
        .I1(\FSM_onehot_cs_reg_n_0_[2] ),
        .I2(\FSM_onehot_cs_reg_n_0_[4] ),
        .I3(out),
        .O(\rx_data[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hAAA8)) 
    \rx_data[4]_i_1 
       (.I0(rx_data_reg[4]),
        .I1(\FSM_onehot_cs_reg_n_0_[2] ),
        .I2(\FSM_onehot_cs_reg_n_0_[4] ),
        .I3(out),
        .O(\rx_data[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hAAA8)) 
    \rx_data[5]_i_1 
       (.I0(rx_data_reg[5]),
        .I1(\FSM_onehot_cs_reg_n_0_[2] ),
        .I2(\FSM_onehot_cs_reg_n_0_[4] ),
        .I3(out),
        .O(\rx_data[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hAAA8)) 
    \rx_data[6]_i_1 
       (.I0(rx_data_reg[6]),
        .I1(\FSM_onehot_cs_reg_n_0_[2] ),
        .I2(\FSM_onehot_cs_reg_n_0_[4] ),
        .I3(out),
        .O(\rx_data[6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hAAA8)) 
    \rx_data[7]_i_1 
       (.I0(rx_data_reg[7]),
        .I1(\FSM_onehot_cs_reg_n_0_[2] ),
        .I2(\FSM_onehot_cs_reg_n_0_[4] ),
        .I3(out),
        .O(\rx_data[7]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hAAA8)) 
    \rx_data[8]_i_1 
       (.I0(rx_data_reg[8]),
        .I1(\FSM_onehot_cs_reg_n_0_[2] ),
        .I2(\FSM_onehot_cs_reg_n_0_[4] ),
        .I3(out),
        .O(\rx_data[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000200)) 
    \rx_data[9]_i_1 
       (.I0(\counter_rx_reg_n_0_[1] ),
        .I1(\counter_rx_reg_n_0_[0] ),
        .I2(\counter_rx_reg_n_0_[2] ),
        .I3(\counter_rx_reg_n_0_[3] ),
        .I4(\counter_rx[3]_i_3_n_0 ),
        .O(\rx_data[9]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hAAA8)) 
    \rx_data[9]_i_2 
       (.I0(rx_data_reg[9]),
        .I1(\FSM_onehot_cs_reg_n_0_[2] ),
        .I2(\FSM_onehot_cs_reg_n_0_[4] ),
        .I3(out),
        .O(\rx_data[9]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[0] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(\rx_data[0]_i_1_n_0 ),
        .Q(tx_valid_reg[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[1] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(\rx_data[1]_i_1_n_0 ),
        .Q(tx_valid_reg[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[2] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(\rx_data[2]_i_1_n_0 ),
        .Q(tx_valid_reg[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[3] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(\rx_data[3]_i_1_n_0 ),
        .Q(tx_valid_reg[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[4] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(\rx_data[4]_i_1_n_0 ),
        .Q(tx_valid_reg[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[5] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(\rx_data[5]_i_1_n_0 ),
        .Q(tx_valid_reg[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[6] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(\rx_data[6]_i_1_n_0 ),
        .Q(tx_valid_reg[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[7] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(\rx_data[7]_i_1_n_0 ),
        .Q(tx_valid_reg[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[8] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(\rx_data[8]_i_1_n_0 ),
        .Q(tx_valid_reg[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[9] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(\rx_data[9]_i_2_n_0 ),
        .Q(tx_valid_reg[9]),
        .R(SR));
  LUT5 #(
    .INIT(32'hAAABBBBB)) 
    \rx_data_reg[9]_i_1 
       (.I0(\FSM_onehot_cs_reg_n_0_[1] ),
        .I1(\counter_rx[3]_i_3_n_0 ),
        .I2(\counter_rx_reg_n_0_[1] ),
        .I3(\counter_rx_reg_n_0_[2] ),
        .I4(\counter_rx_reg_n_0_[3] ),
        .O(rx_data_reg__0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg_reg[0] 
       (.C(CLK),
        .CE(rx_data_reg__0),
        .D(MOSI_IBUF),
        .Q(rx_data_reg[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg_reg[1] 
       (.C(CLK),
        .CE(rx_data_reg__0),
        .D(rx_data_reg[0]),
        .Q(rx_data_reg[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg_reg[2] 
       (.C(CLK),
        .CE(rx_data_reg__0),
        .D(rx_data_reg[1]),
        .Q(rx_data_reg[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg_reg[3] 
       (.C(CLK),
        .CE(rx_data_reg__0),
        .D(rx_data_reg[2]),
        .Q(rx_data_reg[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg_reg[4] 
       (.C(CLK),
        .CE(rx_data_reg__0),
        .D(rx_data_reg[3]),
        .Q(rx_data_reg[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg_reg[5] 
       (.C(CLK),
        .CE(rx_data_reg__0),
        .D(rx_data_reg[4]),
        .Q(rx_data_reg[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg_reg[6] 
       (.C(CLK),
        .CE(rx_data_reg__0),
        .D(rx_data_reg[5]),
        .Q(rx_data_reg[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg_reg[7] 
       (.C(CLK),
        .CE(rx_data_reg__0),
        .D(rx_data_reg[6]),
        .Q(rx_data_reg[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg_reg[8] 
       (.C(CLK),
        .CE(rx_data_reg__0),
        .D(rx_data_reg[7]),
        .Q(rx_data_reg[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg_reg[9] 
       (.C(CLK),
        .CE(rx_data_reg__0),
        .D(rx_data_reg[8]),
        .Q(rx_data_reg[9]),
        .R(SR));
  LUT6 #(
    .INIT(64'h00FC55FF00FC00FC)) 
    rx_valid_i_1
       (.I0(tx_valid),
        .I1(\FSM_onehot_cs_reg_n_0_[4] ),
        .I2(\FSM_onehot_cs_reg_n_0_[2] ),
        .I3(rx_valid_i_2_n_0),
        .I4(rx_valid_i_3_n_0),
        .I5(out),
        .O(rx_valid_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFDFF)) 
    rx_valid_i_2
       (.I0(\counter_rx_reg_n_0_[3] ),
        .I1(\counter_rx_reg_n_0_[2] ),
        .I2(\counter_rx_reg_n_0_[0] ),
        .I3(\counter_rx_reg_n_0_[1] ),
        .O(rx_valid_i_2_n_0));
  LUT3 #(
    .INIT(8'h1F)) 
    rx_valid_i_3
       (.I0(\counter_rx_reg_n_0_[1] ),
        .I1(\counter_rx_reg_n_0_[2] ),
        .I2(\counter_rx_reg_n_0_[3] ),
        .O(rx_valid_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rx_valid_reg
       (.C(CLK),
        .CE(\<const1> ),
        .D(rx_valid_i_1_n_0),
        .Q(rx_valid),
        .R(SR));
  LUT6 #(
    .INIT(64'hF7D7FDDD80008000)) 
    tx_valid_i_1
       (.I0(rx_valid),
        .I1(tx_valid_reg[8]),
        .I2(tx_valid_reg[9]),
        .I3(flag_read_reg_0),
        .I4(flag_write_reg_0),
        .I5(tx_valid),
        .O(tx_valid_reg_0));
endmodule

(* ADDR_SIZE = "8" *) (* MEM_DEPTH = "256" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module SPI_Wrapper
   (MOSI,
    SS_n,
    clk,
    rst_n,
    MISO);
  input MOSI;
  input SS_n;
  input clk;
  input rst_n;
  output MISO;

  wire MISO;
  wire MISO_OBUF;
  wire MOSI;
  wire MOSI_IBUF;
  wire SS_n;
  wire SS_n_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire ram_inst_n_0;
  wire ram_inst_n_2;
  wire ram_inst_n_3;
  wire rst_n;
  wire rst_n_IBUF;
  wire [9:0]rx_data;
  wire rx_valid;
  wire spi_inst_n_0;
  wire spi_inst_n_18;
  wire spi_inst_n_19;
  wire spi_inst_n_2;
  wire spi_inst_n_20;
  wire spi_inst_n_21;
  wire spi_inst_n_22;
  wire spi_inst_n_4;
  wire spi_inst_n_5;
  wire spi_inst_n_6;
  wire spi_inst_n_7;
  wire tx_valid;

  OBUF MISO_OBUF_inst
       (.I(MISO_OBUF),
        .O(MISO));
  IBUF MOSI_IBUF_inst
       (.I(MOSI),
        .O(MOSI_IBUF));
  IBUF SS_n_IBUF_inst
       (.I(SS_n),
        .O(SS_n_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  RAM ram_inst
       (.CLK(clk_IBUF_BUFG),
        .E(spi_inst_n_7),
        .MISO_reg(ram_inst_n_3),
        .Q(rx_data),
        .\counter_tx_reg[2] ({spi_inst_n_4,spi_inst_n_5,spi_inst_n_6}),
        .mem_reg_0(ram_inst_n_0),
        .out(spi_inst_n_0),
        .rst_n(spi_inst_n_2),
        .rst_n_IBUF(rst_n_IBUF),
        .\rx_data_reg[9] (spi_inst_n_22),
        .rx_valid(rx_valid),
        .rx_valid_reg(spi_inst_n_19),
        .rx_valid_reg_0(spi_inst_n_20),
        .rx_valid_reg_1(spi_inst_n_21),
        .rx_valid_reg_2(spi_inst_n_18),
        .tx_valid(tx_valid),
        .tx_valid_reg_0(ram_inst_n_2));
  IBUF rst_n_IBUF_inst
       (.I(rst_n),
        .O(rst_n_IBUF));
  SPI_SLAVE spi_inst
       (.CLK(clk_IBUF_BUFG),
        .E(spi_inst_n_7),
        .MISO_OBUF(MISO_OBUF),
        .MOSI_IBUF(MOSI_IBUF),
        .Q({spi_inst_n_4,spi_inst_n_5,spi_inst_n_6}),
        .\RD_address_bus_reg[7] (spi_inst_n_18),
        .SR(spi_inst_n_2),
        .SS_n_IBUF(SS_n_IBUF),
        .\counter_tx_reg[2]_0 (ram_inst_n_3),
        .flag_read_reg(spi_inst_n_20),
        .flag_read_reg_0(ram_inst_n_2),
        .flag_write_reg(spi_inst_n_21),
        .flag_write_reg_0(ram_inst_n_0),
        .mem_reg(spi_inst_n_22),
        .out(spi_inst_n_0),
        .rst_n_IBUF(rst_n_IBUF),
        .rx_valid(rx_valid),
        .tx_valid(tx_valid),
        .tx_valid_reg(rx_data),
        .tx_valid_reg_0(spi_inst_n_19));
endmodule
