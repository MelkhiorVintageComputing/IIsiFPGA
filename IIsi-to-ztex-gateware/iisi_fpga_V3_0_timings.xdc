# IIsiA7 Mini (V3.0): I/O timing of the MC68030 PDS bus, for cpu_clk.
#
# pds_to_fpga_soc.py only copies lines starting with "set" into the build
# (and doubles the braces), so every command here is a single "set..." line;
# comments are for people.
#
# Sources:
#  - MC68030EC/D rev. 1, AC electrical specifications, 20 MHz column
#    (MC68030_Doc_More_Readable/MC68030EC_split/ac-electrical-specifications.csv),
#    and figure 6 (synchronous write) / figure 5 (synchronous read);
#  - MC68030UM section 7.3.4/7.3.5 (synchronous read/write cycles).
# The Macintosh IIsi runs its MC68030 at 20 MHz: cpu_clk must be created with a
# 50 ns period (pds_to_fpga_soc.py) for these numbers to mean anything.
#
# Board: every bus signal, CPUCLK included (PDS A38 -> IC3 -> N11, not inverted
# despite the "_n" in the port name), crosses the same kind of 74CB3T16211 bus
# switch (always on) and similar traces on the IIsiA7 Mini; the IIsi's own
# traces from the CPU to the PDS are unknown. The skew of a signal relative to
# CPUCLK at the FPGA pins is therefore taken as -1 .. +2 ns (an allowance, not a
# measurement).
set pds_brd_min -1.0
set pds_brd_max 2.0

# ---------------------------------------------------------------- inputs
# Address, function codes, size, R/W, CIOUT: valid at most 25 ns after the
# rising edge starting S0 (spec 6, 18, 20), invalid no earlier than that edge of
# the next cycle (spec 8: 0 ns).
set pds_adr_in [get_ports {A_3v3[*] fc_3v3[*] siz_3v3[*] rw_3v3_n ciout_3v3_n}]
set_input_delay -clock cpu_clk -max [expr {25.0 + $pds_brd_max}] $pds_adr_in
set_input_delay -clock cpu_clk -min [expr {0.0 + $pds_brd_min}] $pds_adr_in
# ...and they are only looked at while AS is asserted (mc68030_fsm.py, Idle:
# every decision is qualified by ~AS_i_n), i.e. at the rising edge starting S2
# and at wait-state edges, never at the edge starting S0 where they change: the
# hold check against that edge is meaningless, and fixing it would only slow the
# combinational decode feeding STERM.
set_false_path -hold -from $pds_adr_in

# AS, DS, CBREQ: asserted and negated 0..20 ns after a falling edge (spec 9,
# 12: 3..20 and 0..20 ns), sampled on the following rising edge.
set pds_strobe_in [get_ports {as_3v3_n ds_3v3_n cbreq_3v3_n}]
set_input_delay -clock cpu_clk -clock_fall -max [expr {20.0 + $pds_brd_max}] $pds_strobe_in
set_input_delay -clock cpu_clk -clock_fall -min [expr {0.0 + $pds_brd_min}] $pds_strobe_in

# Write data: valid at most 25 ns after the rising edge starting S2 (spec 23),
# held at least 3 ns after the rising edge ending S3 (spec 53) -- the edge on
# which FinishWrite writes it into the write FIFO. This is the path that must be
# checked for hold: the FPGA's clock reaches its flops several ns after the pin
# edge, through the BUFG.
set pds_data_in [get_ports {D_3v3[*]}]
set_input_delay -clock cpu_clk -max [expr {25.0 + $pds_brd_max}] $pds_data_in
set_input_delay -clock cpu_clk -min [expr {3.0 + $pds_brd_min}] $pds_data_in

# --------------------------------------------------------------- outputs
# STERM, CBACK, BERR are the MC68030's synchronous inputs: setup 4 ns before the
# rising edge (spec 60). Spec 61 also asks for 12 ns of hold after that edge;
# the FSM changes these on the rising edge after the one the CPU samples, so
# that hold is not achievable from a flop (and has evidently never been met):
# it is deliberately not modelled here (min 0), rather than letting the hold
# fixer delay STERM.
set pds_sync_out [get_ports {sterm_3v3_n cback_3v3_n berr_3v3_n}]
set_output_delay -clock cpu_clk -max [expr {4.0 + $pds_brd_max}] $pds_sync_out
set_output_delay -clock cpu_clk -min 0.0 $pds_sync_out

# Read data: latched by the CPU on the falling edge after STERM is recognised
# (spec 27: 4 ns setup to clock low; spec 30: 12 ns hold from clock low). The
# default rise-to-next-fall relationship is the burst case (Burst0..3 drive a new
# long word every rising edge); single reads have a full extra period.
set pds_data_out [get_ports {D_3v3[*]}]
set_output_delay -clock cpu_clk -clock_fall -max [expr {4.0 + $pds_brd_max}] $pds_data_out
set_output_delay -clock cpu_clk -clock_fall -min -12.0 $pds_data_out

# The Idle state asserts STERM (and CBACK/BERR) combinationally from AS and the
# address decode. From the address (valid 27 ns after the rising edge starting
# S0) to STERM (due 6 ns before the rising edge starting S2), the default
# analysis above is the right one: 17 ns.
# From AS it is not: the MC68030's worst case (AS 20 ns after the falling edge
# in S1, STERM 4 ns before the next rising one) leaves no time at all
# (MC68030UM 7.3.5: "there is no time from the latest assertion of AS and the
# required assertion of STERM for any two-clock synchronous bus cycle"); the
# design relies on AS arriving earlier, and every ns of pin-to-pin delay here
# narrows the range of AS timings for which the CPU and the FSM agree on the
# edge that ends the cycle. Rather than report a permanent violation, bound the
# pin-to-pin delay itself: Vivado still subtracts the I/O delays from a
# -datapath_only max delay, so the requirement is the target plus both of them.
set pds_as_sterm_target 10.0
set_max_delay -datapath_only [expr {$pds_as_sterm_target + 20.0 + $pds_brd_max + 4.0 + $pds_brd_max}] -from [get_ports {as_3v3_n cbreq_3v3_n}] -to [get_ports {sterm_3v3_n cback_3v3_n berr_3v3_n}]
