# set pin Clock 50MHz on AX7010 (pin U18)
set_property PACKAGE_PIN U18 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 20.000 -name sys_clk_pin [get_ports clk]

# defind Reset (button KEY1 on AX7010 - pin N15)
set_property PACKAGE_PIN N15 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

# pin Dedicated Analog VP/VN dont have ti bind with PACKAGE_PIN 
# Cause its analog pin for chip Zynq (pin K9/L10) thats hardware already connected (Pre-Connect)