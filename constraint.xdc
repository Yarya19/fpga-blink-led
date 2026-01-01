# Constraint code for it on virtex-7 FPGA 
# Differential Clock (200 MHz)
set_property PACKAGE_PIN H19 [get_ports clk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports clk_p]
set_property PACKAGE_PIN G18 [get_ports clk_n]
set_property IOSTANDARD DIFF_SSTL15 [get_ports clk_n]
create_clock -period 5.000 -name sys_clk [get_ports clk_p]

# Reset Button
set_property PACKAGE_PIN AV40 [get_ports rst]
set_property IOSTANDARD LVCMOS18 [get_ports rst]

# Push Button
set_property PACKAGE_PIN AV39 [get_ports push]
set_property IOSTANDARD LVCMOS18 [get_ports push]

# LED Output
set_property PACKAGE_PIN AM39 [get_ports led_on]
set_property IOSTANDARD LVCMOS18 [get_ports led_on]
set_property SLEW SLOW [get_ports led_on]
set_property DRIVE 4 [get_ports led_on]