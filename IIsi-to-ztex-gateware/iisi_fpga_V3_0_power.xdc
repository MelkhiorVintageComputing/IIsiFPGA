
set_switching_activity -static_probability 0.5 -signal_rate 50 [get_ports {*3v3*}] 

set_switching_activity -static_probability 0 -signal_rate 0 [get_ports {reset_3v3_n}]
