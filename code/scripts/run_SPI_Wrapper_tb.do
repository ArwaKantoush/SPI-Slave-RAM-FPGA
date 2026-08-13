vlib work
vlog RAM.v SPI_SLAVE.v SPI_Wrapper.v SPI_Wrapper_tb.v
vsim -voptargs=+acc work.SPI_Wrapper_tb
add wave -position insertpoint  \
sim:/SPI_Wrapper_tb/dut/clk \
sim:/SPI_Wrapper_tb/dut/rst_n \
sim:/SPI_Wrapper_tb/dut/SS_n \
sim:/SPI_Wrapper_tb/dut/MOSI \
sim:/SPI_Wrapper_tb/dut/MISO \
sim:/SPI_Wrapper_tb/MISO_exp \
sim:/SPI_Wrapper_tb/data \
sim:/SPI_Wrapper_tb/expected \
sim:/SPI_Wrapper_tb/dut/tx_data \
sim:/SPI_Wrapper_tb/dut/rx_data \
sim:/SPI_Wrapper_tb/dut/rx_valid \
sim:/SPI_Wrapper_tb/dut/tx_valid \
sim:SPI_Wrapper_tb/dut/ram_inst/mem
run -all
#quit -sim
