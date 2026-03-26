# IIsiA7 Mini

## Known issues in V3.0

* The JTAG header is not wired as intended (doesn't follow any pinouts I know), but the silkscreen is correct and it can be used just fine
* Pinout silkscreen for leds D4 and D5 is switched (D4 <=> D6), D6 is really top and D4 bottom)
* IRQs and CACHE should have had pull (up for IRQs, down for CACHE), the gateware currently enables pulling at the FPGA pins


