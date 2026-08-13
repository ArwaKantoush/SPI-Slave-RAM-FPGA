# 🧪 Verification Plan & Testbench

## Strategy
System-level verification is conducted using a SystemVerilog Testbench (`SPI_RAM_wrapper_tb.sv`) to simulate an SPI Master communicating with the wrapped system.

## Test Cases Covered
1. **Reset Verification**: Assert `rst_n` LOW and check all internal registers reset correctly.
2. **Write Address Test**: Send `10'b00_AAAA_AAAA` via `MOSI` and verify address latching.
3. **Write Data Test**: Send `10'b01_DDDD_DDDD` via `MOSI` and check memory content updating.
4. **Read Address Test**: Send `10'b10_AAAA_AAAA` via `MOSI`.
5. **Read Data Test**: Send `10'b11_0000_0000` via `MOSI` and capture response on `MISO`.

## Simulation Steps
To run the verification using QuestaSim:
1. Open QuestaSim Terminal.
2. Run script: `do ../Scripts/run.do`
