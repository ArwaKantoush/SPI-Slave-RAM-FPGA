### 2. `docs/ram.md`
> **المضمون:** مواصفات ذاكرة الـ RAM وقواعد القراءة والكتابة فيها.

```markdown
# 💾 Single-Port RAM Specification

## Overview
The RAM module is a single-port memory block that stores 8-bit data words and supports both Write and Read operations based on the control bits received from the SPI Slave.

## Specifications
- **Memory Depth:** 256 locations (`MEM_DEPTH = 256`)
- **Data Width:** 8 bits (`ADDR_SIZE = 8`, `DATA_WIDTH = 8`)
- **Address Bus Width:** 8 bits

## Bus Protocol & Command Formats
The RAM receives a 10-bit input packet (`din[9:0]`) from the SPI Slave:
- **`din[9:8]`**: Control bits (Command Mode).
- **`din[7:0]`**: Address or Data payload.

| Control Bits `din[9:8]` | Operation | Action Description |
| :---: | :--- | :--- |
| `2'b00` | Write Address | Stores internal write address. |
| `2'b01` | Write Data | Writes `din[7:0]` into the previously stored write address. |
| `2'b10` | Read Address | Stores internal read address. |
| `2'b11` | Read Data | Reads data from stored read address and asserts `tx_valid`. |
