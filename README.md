# 🚀 SPI Slave with Single-Port RAM (FPGA Implementation)

![Verilog](https://img.shields.io/badge/RTL-Verilog-blue?style=for-the-badge&logo=IEEE)
![Tools](https://img.shields.io/badge/Simulation-QuestaSim%20%2F%20ModelSim-orange?style=for-the-badge)
![Synthesis](https://img.shields.io/badge/Synthesis-Xilinx%20Vivado-red?style=for-the-badge)
![Hardware](https://img.shields.io/badge/Target-FPGA-green?style=for-the-badge)

A robust, fully verified, and modular hardware implementation of an **SPI Slave Interface** integrated with a **Single-Port RAM** block. Designed in Verilog HDL and optimized for FPGA synthesis and hardware deployment.

---

## 👥 Team: SPI Trio

| Member Name | Role & Primary Contributions | Deliverables | GitHub Profile |
| :--- | :--- | :--- | :--- |
| **Arwa Kantoush** | Verification & Integration Lead | `SPI_SLAVE_tb.v`, `SPI_Wrapper_tb.v` | [ArwaKantoush](https://github.com/ArwaKantoush) |
| **Haneen Shahin** | RTL Design Lead | `SPI_SLAVE.v`, `SPI_Wrapper.v` | [HaneenShahin](https://github.com/Haneen-Shahin) |
| **Nada Abdelmoteleb**| Memory Subsystem Lead | `RAM.v`, `RAM_tb.v` | [NadaAbdelmotlb](https://github.com/Nada-Abdelmoteleb) |

---

## 📌 Detailed Project Overview

The main objective of this project is to implement a synchronous **SPI (Serial Peripheral Interface)** subsystem operating as a **Slave device** interfaced directly with a **Single-Port RAM**. The design allows an external SPI Master device to write to and read from specific addresses inside the memory via a standardized serial bus.

### Key Architecture Features
* **10-bit Serial Transmission:** Each incoming frame via `MOSI` consists of 2 control bits followed by an 8-bit payload (Address or Data).
* **FSM-Driven SPI Slave:** Finite State Machine controlling serial-to-parallel conversion, handshake signals (`rx_valid`, `tx_valid`), and parallel-to-serial data output via `MISO`.
* **Synchronous Single-Port Memory:** 256-location memory depth (`ADDR_SIZE = 8`) with 8-bit data width (`DATA_WIDTH = 8`).
* **Active-Low Asynchronous Reset:** Ensures immediate initialization of state registers and memory flags (`rst_n`).
* **Automated Workflow:** Dedicated Tcl and DO automation scripts provided for individual module testbenches as well as top-level synthesis.

---

## 🏛️ Hardware Architecture & Bus Protocol

```text
 +--------------------------------------------------------------------------------+
 |                                  SPI_Wrapper                                   |
 |                                                                                |
 |   +----------------------+   rx_data [9:0]   +-----------------------------+   |
 |   |                      |------------------>|                             |   |
 |   |                      |   rx_valid        |                             |   |
 |   |                      |------------------>|                             |   |
 |   |      SPI_SLAVE       |                   |             RAM             |   |
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

## 📂 Repository Structure

```text
SPI-Slave-RAM-FPGA/
├── code/
│   ├── RTL/                     # Verilog RTL Source Code
│   │   ├── RAM.v                # Developed by Nada
│   │   ├── SPI_SLAVE.v          # Developed by Haneen
│   │   └── SPI_Wrapper.v        # Developed by Haneen
│   ├── constraints/             # FPGA Design Constraints
│   │   └── SPI_Wrapper.xdc      # Xilinx Pin Mapping & Timing Constraints
│   ├── scripts/                 # Simulation & Synthesis Automation
│   │   ├── run_RAM_tb.do        
│   │   ├── run_SPI_SLAVE_tb.do  
│   │   ├── run_SPI_Wrapper_tb.do
│   │   └── vivado_script.tcl    
│   └── testbenches/             # Test Environments
│       ├── RAM_tb.v             # Developed by Nada
│       ├── SPI_SLAVE_tb.v       # Developed by Arwa
│       └── SPI_Wrapper_tb.v     # Developed by Arwa
├── docs/                        # Architectural Specifications & Reports
│   ├── architecture.md          # System Architecture & Signal Interconnects
│   ├── ram.md                   # RAM Memory Specifications
│   ├── spi_slave.md             # FSM State Diagrams & Port Mapping
│   ├── spi_wrapper.md           # Top Module Parameters
│   └── verification.md          # Verification Plan & Scenarios
├── standards/                   # Team Coding & Project Standards
│   ├── code_review_checklist.md # Quality Checklist
│   ├── coding_style.md          # Verilog Naming & Style Rules
│   ├── documentation_standards.md
│   ├── git_workflow.md          # Git Branching & Commit Guidelines
│   └── repository_structure.md
├── questa_projects/             # Local Simulation Output Folder
├── .gitignore                   # Tool Build Exclusion Rules
└── README.md                    # Main Landing Page

```

---

## 🧪 Simulation & Verification

Individual block verification as well as full top-level integration testing is supported:

1. **RAM Block (`RAM_tb.v`)**: Tests independent memory read/write operations and address registers.
2. **SPI Slave Block (`SPI_SLAVE_tb.v`)**: Tests FSM state transitions, serial-to-parallel conversion, and `MISO` shifting logic.
3. **Top Wrapper (`SPI_Wrapper_tb.v`)**: Verifies end-to-end integration of serial commands driving memory operations.

---

## 🛠️ How to Execute

### 1. Run Simulation (QuestaSim / ModelSim)

Launch your simulator, navigate to `code/scripts/`, and run any of the simulation DO scripts:

```tcl
cd code/scripts/

# To test Top Wrapper integration:
do run_SPI_Wrapper_tb.do

# To test individual modules:
do run_SPI_SLAVE_tb.do
do run_RAM_tb.do

```

### 2. Run Synthesis & FPGA Implementation (Xilinx Vivado)

Open Vivado Tcl Console, navigate to `code/scripts/`, and run:

```tcl
cd code/scripts/
source vivado_script.tcl

```

*(This script builds the project, runs elaboration & synthesis, applies `SPI_Wrapper.xdc` constraints, and exports reports into `docs/`).*

---

## 🔗 Technical Documentation Links

* 📖 [System Architecture Document](https://www.google.com/search?q=docs/architecture.md)
* 📖 [SPI Slave Specification](https://www.google.com/search?q=docs/spi_slave.md)
* 📖 [RAM Protocol Specification](https://www.google.com/search?q=docs/ram.md)
* 📖 [Verification Plan](https://www.google.com/search?q=docs/verification.md)
* 📏 [Coding Style Standard](https://www.google.com/search?q=standards/coding_style.md)
* 🔀 [Git Workflow Guidelines](https://www.google.com/search?q=standards/git_workflow.md)

```

```
