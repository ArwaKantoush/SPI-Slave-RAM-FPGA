vlib work
vlog SPI_SLAVE.v SPI_SLAVE_tb.v
vsim -voptargs=+acc work.SPI_SLAVE_tb
add wave *
run -all
#quit -sim
