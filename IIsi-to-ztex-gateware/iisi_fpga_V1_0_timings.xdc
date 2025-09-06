# distance + skew + source delay (?) [input]
# distance + skew + (setup|hold) [output] (negative hold for min?)
# sterm setup/hold 4/12
# min: 2-2-4
# max: 4+2+12


#set data_idelay_min 1.000
#set data_idelay_max 7.000
#set data_odelay_min -1.500
#set data_odelay_max 8.500

#set_input_delay  -clock cpu_clk -min ${data_idelay_min} [get_ports {sterm_3v3_n}]
#set_input_delay  -clock cpu_clk -max ${data_idelay_max} [get_ports {sterm_3v3_n}]
#set_output_delay -clock cpu_clk -min ${data_odelay_min} [get_ports {sterm_3v3_n}]
#set_output_delay -clock cpu_clk -max ${data_odelay_max} [get_ports {sterm_3v3_n}]

#set_output_delay -clock cpu_clk -min -4 [get_ports {sterm_3v3_n}]
#set_output_delay -clock cpu_clk -max 18 [get_ports {sterm_3v3_n}]
##set_output_delay -clock cpu_clk -min -4.5 [get_ports {sterm_3v3_n}]
##set_output_delay -clock cpu_clk -max 24 [get_ports {sterm_3v3_n}]
