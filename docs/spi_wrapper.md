# 📦 SPI RAM Wrapper Specification

## Overview
The `SPI_RAM_wrapper` is the top-level module connecting the `SPI_Slave` module and the `RAM` memory block together.

## Top-Level Interface Ports

```verilog
module SPI_Wrapper (
    input  MOSI,
    input  SS_n,
    input  clk,
    input  rst_n,
    output MISO
);
Internal Signals Mapping
rx_data [9:0]: Output of SPI_Slave connected to din of RAM.

rx_valid: Output of SPI_Slave connected to rx_valid of RAM.

tx_data [7:0]: Output of RAM connected to tx_data of SPI_Slave.

tx_valid: Output of RAM connected to tx_valid of SPI_Slave.
