# Nexus-SPI-Slave-RAM — Team Nexus

Verilog implementation of an SPI Slave interfaced with a Single-Port RAM on FPGA. The project covers FSM state encoding comparisons (Gray, One-Hot, Sequential), timing/slack analysis, QuestaSim simulation, Vivado ILA debug core integration, and bitstream generation.

---

# Hardware Mappings (XDC Constraints)

- **`rst_n`**: On-board Switch
- **`SS_n`**: On-board Switch
- **`MOSI`**: On-board Switch
- **`MISO`**: On-board LED

---

# Repository Structure

```text
SPI_RAM_Project/
├── code/
│   ├── RTL/
│   ├── constraints/
│   ├── scripts/
│   │   └── waveforms/
│   └── testbenches/
├── docs/
└── questa_projects/
```
---

# Repository Navigation

| Directory | Description |
| :--- | :--- |
| `code/RTL` | Synthesizable Verilog modules (SPI Slave, RAM, Top Module) |
| `code/testbenches` | Verification testbenches verifying state transitions |
| `code/constraints` | FPGA XDC constraint files |
| `code/scripts` | Simulation `.do` scripts for QuestaSim |
| `code/scripts/waveforms` | Waveform configuration files |
| `code/synthesis_reports` | Synthesis reports, elaboration schematics, and critical path analysis |
| `code/implementation` | Utilization reports, timing reports, and generated `.bit` file |
| `docs` | Final PDF report with waveforms, QuestaLint results, and synthesis/implementation metrics |

---

# Key Project Deliverables

1. **RTL & Testbenches:** Full Verilog design and self-checking testbench.
2. **Simulation Script:** Functional QuestaSim `.do` script.
3. **Linting Verification:** QuestaLint analysis with zero linting errors/warnings.
4. **FSM Encoding Evaluation:** Comparative setup/hold slack and timing analysis across **Gray**, **One-Hot**, and **Sequential** state encodings.
5. **Hardware Debug & Bitstream:** Integrated Vivado ILA core analyzing internal signals (`MISO`, `MOSI`, `SS_n`, `rst_n`, `clk`) and final bitstream generation.
6. **Project Submission:** Complete submission package `<TEAM_NAME>_Project2.rar`.
