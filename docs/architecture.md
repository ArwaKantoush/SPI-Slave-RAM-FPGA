# 🏛️ System Architecture

This document describes the high-level architecture of the **SPI-Slave-RAM** subsystem.

## System Overview
The system consists of two main hardware modules wrapped inside a single top-level module (`SPI_RAM_wrapper`):
1. **SPI Slave Interface (`SPI_Slave`)**: Handles serial-to-parallel and parallel-to-serial data conversion using a Finite State Machine (FSM).
2. **Single-Port RAM (`RAM`)**: Provides internal data storage for read and write operations.

## Subsystem Interaction Flow
```text
 +-------------------------------------------------------------------+
 |                        SPI_RAM_wrapper                            |
 |                                                                   |
 |   +-----------------+   rx_data [9:0]   +---------------------+   |
 |   |                 |------------------>|                     |   |
 |   |                 |   rx_valid        |                     |   |
 |   |                 |------------------>|                     |   |
 |   |    SPI Slave    |                   |   Single-Port RAM   |   |
 |   |     Module      |   tx_data [7:0]   |       Module        |   |
 |   |                 |<------------------|                     |   |
 |   |                 |   tx_valid        |                     |   |
 |   |                 |<------------------|                     |   |
 |   +-----------------+                   +---------------------+   |
 +-------------------------------------------------------------------+
     ^       ^      ^     ^
     |       |      |     |
    MOSI    SS_n   clk  rst_n
Control & Data Protocol
Communication is initiated when SS_n goes LOW (0).

Input frame length: 10 bits via MOSI.

Output frame length: 8 bits via MISO.
