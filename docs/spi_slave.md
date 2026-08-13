# 📡 SPI Slave Specification

## Overview
The `SPI_Slave` module implements a synchronous SPI Slave interface that converts serial input data from `MOSI` into 10-bit parallel words for the RAM, and converts 8-bit parallel data from the RAM into serial output on `MISO`.

## Finite State Machine (FSM) States
- **`IDLE`**: Default state when `SS_n` is HIGH (`1`).
- **`CHK_CMD`**: Entered on falling edge of `SS_n`. Evaluates control bits to decide whether the operation is Write or Read.
- **`WRITE`**: Collects 10 serial bits from `MOSI` and forwards them to RAM.
- **`READ_ADD`**: Receives 10 serial bits containing the target Read address.
- **`READ_DATA`**: Waits for RAM read data, then converts parallel `tx_data` to serial stream on `MISO`.

## Port Description
| Port Name | Direction | Bit Width | Description |
| :--- | :---: | :---: | :--- |
| `clk` | Input | 1 | System Clock |
| `rst_n` | Input | 1 | Active-Low Asynchronous Reset |
| `MOSI` | Input | 1 | Master Out Slave In |
| `SS_n` | Input | 1 | Slave Select (Active Low) |
| `MISO` | Output | 1 | Master In Slave Out |
| `rx_valid`| Output | 1 | Flag indicating parallel data ready for RAM |
| `rx_data` | Output | 10 | Parallel output bus to RAM |
| `tx_valid`| Input | 1 | Flag from RAM indicating read data ready |
| `tx_data` | Input | 8 | Parallel data input from RAM |
