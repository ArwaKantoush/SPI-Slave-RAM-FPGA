# 🚀 SPI Slave with Single-Port RAM (FPGA Implementation)

![Verilog](https://img.shields.io/badge/RTL-Verilog%20%7C%20SystemVerilog-blue?style=for-the-badge&logo=IEEE)
![Tools](https://img.shields.io/badge/Simulation-QuestaSim%20%2F%20ModelSim-orange?style=for-the-badge)
![Synthesis](https://img.shields.io/badge/Synthesis-Xilinx%20Vivado-red?style=for-the-badge)
![Hardware](https://img.shields.io/badge/Target-Artix--7%20FPGA-green?style=for-the-badge)

A robust, fully verified, and modular hardware implementation of an **SPI Slave Interface** integrated with a **Single-Port RAM** block. Designed in Verilog HDL, verified via SystemVerilog, and optimized for FPGA synthesis and hardware deployment.

---

## 👥 Team: SPI Trio

| Member Name | Role / Focus Area | GitHub Profile |
| :--- | :--- | :--- |
| **Arwa Kantoush** | Digital IC Design & Integration | [ArwaKantoush](https://github.com/ArwaKantoush) |
| **Haneen Shahin** | RTL Design & FSM Logic | [HaneenShahin](https://github.com/Haneen-Shahin) |
| **Nada Abdelmotlb**| Verification & Testbench Strategy | [NadaAbdelmotlb](https://github.com/NadaAbdelmotlb) |

---

## 📌 Detailed Project Overview

The main objective of this project is to implement a synchronous **SPI (Serial Peripheral Interface)** subsystem operating as a **Slave device** interfaced directly with a **Single-Port RAM**. The design allows an external SPI Master device to write to and read from specific addresses inside the memory via a standardized serial bus.

### Key Architecture Features
* **10-bit Serial Transmission:** Each incoming frame via `MOSI` consists of 2 control bits followed by an 8-bit payload (Address or Data).
* **FSM-Driven SPI Slave:** Robust Finite State Machine controlling serial-to-parallel conversion, handshake signals (`rx_valid`, `tx_valid`), and parallel-to-serial data output.
* **Synchronous Single-Port Memory:** 256-location memory depth (`ADDR_SIZE = 8`) with 8-bit data width (`DATA_WIDTH = 8`).
* **Active-Low Asynchronous Reset:** Ensures immediate initialization of state registers and memory flags.
* **Automated Toolchain:** Tcl and DO automation scripts provided for 1-click simulation runs and Vivado synthesis.

---

## 🏛️ Hardware Architecture & Bus Protocol

```text
 +--------------------------------------------------------------------------------+
 |                               SPI_RAM_wrapper                                  |
 |                                                                                |
 |   +----------------------+   rx_data [9:0]   +-----------------------------+   |
 |   |                      |------------------>|                             |   |
 |   |                      |   rx_valid        |                             |   |
 |   |                      |------------------>|                             |   |
 |   |      SPI Slave       |                   |       Single-Port RAM       |   |
 |   |    Control Module    |   tx_data [7:0]   |           Memory            |   |
 |   |                      |<------------------|                             |   |
 |   |                      |   tx_valid        |                             |   |
 |   |                      |<------------------|                             |   |
 |   +----------------------+                   +-----------------------------+   |
 +--------------------------------------------------------------------------------+
     ^          ^         ^        ^         ^
     |          |         |        |         |
    MOSI       SS_n      clk     rst_n     MISO

```

### Protocol Frame Breakdown (`din[9:0]`)

The Master communicates by pulling `SS_n` LOW and shifting 10 bits sequentially over `MOSI`. The highest two bits (`din[9:8]`) determine the operation mode:

| Control Bits `din[9:8]` | Operation | Bus Behavior & Action |
| --- | --- | --- |
| **`2'b00`** | **Write Address** | Stores `din[7:0]` into the internal write address register. |
| **`2'b01`** | **Write Data** | Writes `din[7:0]` into RAM at the previously stored write address. |
| **`2'b10`** | **Read Address** | Stores `din[7:0]` into the internal read address register. |
| **`2'b11`** | **Read Data** | Reads data from target read address and shifts out `8-bit` payload via `MISO`. |

---

## 🧱 RTL Submodules Specification

### 1. SPI Slave (`RTL/SPI_Slave.v`)

* **States:** `IDLE`, `CHK_CMD`, `WRITE`, `READ_ADD`, `READ_DATA`.
* Converts incoming serial stream (`MOSI`) into parallel word (`rx_data[9:0]`).
* Asserts `rx_valid` flag to notify RAM that valid parallel command is ready.
* Converts parallel memory data (`tx_data[7:0]`) back to serial stream (`MISO`) during read data mode.

### 2. Single-Port RAM (`RTL/RAM.v`)

* Memory matrix: `reg [7:0] memory [255:0]`.
* Internal registers to store Write Address (`wr_addr`) and Read Address (`rd_addr`).
* Asserts `tx_valid` when requested read data is retrieved and available on `tx_data`.

### 3. Top Wrapper (`RTL/SPI_RAM_wrapper.v`)

* Encapsulates `SPI_Slave` and `RAM` modules.
* Exposes external SPI pins: `MOSI`, `MISO`, `SS_n`, `clk`, `rst_n`.

---

## 📂 Repository Structure

```text
SPI-Slave-RAM-FPGA/
├── RTL/                  # Production RTL Verilog Source Code
│   ├── SPI_Slave.v       # SPI Slave Controller & FSM
│   ├── RAM.v             # Single-Port Memory Array
│   └── SPI_RAM_wrapper.v # Top-Level System Wrapper
├── Testbench/            # SystemVerilog Test Environment
│   ├── SPI_RAM_wrapper_tb.sv # Automated Self-Checking Testbench
│   └── ram.dat           # Initial Memory Values Datafile
├── Scripts/              # Automation Scripts
│   ├── run.do            # ModelSim / QuestaSim Simulation Script
│   └── run.tcl           # Vivado Synthesis & Bitstream Script
├── docs/                 # Detailed Engineering Specifications
│   ├── architecture.md   # System Architecture & Signal Interconnects
│   ├── spi_slave.md      # FSM State Diagrams & Port Mapping
│   ├── ram.md            # RAM Protocol & Operation Modes
│   ├── spi_wrapper.md    # Top Module Parameters
│   └── verification.md   # Verification Plan & Coverage Metrics
├── standards/            # Coding & Repository Guidelines
│   ├── coding_style.md   # Verilog/SV Naming & Style Rules
│   ├── git_workflow.md   # Branching & Commit Message Rules
│   └── code_review_checklist.md # Quality Checklist
├── questa_projects/      # Local Compilation Workspaces
├── .gitignore            # Clean Repo Rule File
└── README.md             # Main Repository Gateway

```

---

## 🧪 Verification & Simulation Strategy

Comprehensive functional verification is performed using SystemVerilog testbenches (`Testbench/SPI_RAM_wrapper_tb.sv`).

### Tested Scenarios:

1. **Reset Behavior:** Verify all internal registers reset to `0` upon `rst_n = 0`.
2. **Write Sequence Flow:** Test latching write address followed by writing data to memory.
3. **Read Sequence Flow:** Test setting read address and inspecting multi-bit serial data shifted out on `MISO`.
4. **Boundary & Corner Cases:** Consecutive writes/reads, rapid `SS_n` toggling, and random payload checks.

---

## 🛠️ How to Execute

### 1. Run Simulation (QuestaSim / ModelSim)

Launch your simulator terminal, navigate to `Scripts/`, and execute:

```tcl
cd Scripts/
do run.do

```

### 2. Run Synthesis & Generate Schematics (Xilinx Vivado)

Open Vivado Tcl Console, navigate to `Scripts/`, and run:

```tcl
cd Scripts/
source run.tcl

```

*(This script builds the project, synthesizes RTL, exports PDF schematics to `docs/`, and generates resource utilization reports).*

---

## 🔗 Technical Documentation Links

For further details, check our project guidelines and design specs:

* 📖 [System Architecture Specs](https://www.google.com/search?q=docs/architecture.md)
* 📖 [SPI Slave Specification](https://www.google.com/search?q=docs/spi_slave.md)
* 📖 [RAM Protocol Specification](https://www.google.com/search?q=docs/ram.md)
* 📖 [Verification Strategy](https://www.google.com/search?q=docs/verification.md)
* 📏 [Coding Style Standard](https://www.google.com/search?q=standards/coding_style.md)
* 🔀 [Git Workflow & Branching](https://www.google.com/search?q=standards/git_workflow.md)

```

```
