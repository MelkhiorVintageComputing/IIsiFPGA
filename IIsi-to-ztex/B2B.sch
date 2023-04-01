EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 5
Title "nubus-to-ztex B2B connector"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:+5V #PWR0101
U 1 1 5F677F4B
P 2400 1000
F 0 "#PWR0101" H 2400 850 50  0001 C CNN
F 1 "+5V" H 2415 1173 50  0000 C CNN
F 2 "" H 2400 1000 50  0001 C CNN
F 3 "" H 2400 1000 50  0001 C CNN
	1    2400 1000
	1    0    0    -1  
$EndComp
Text Notes 9950 6500 0    50   ~ 0
Clock capable inputs (MRCC and SRCC, MRCC are multi-domain)\nFor 2.13:\nB9 G16~IO_L13N_T2_MRCC_15 G16\nB10 H16~IO_L13P_T2_MRCC_15 H16\nB11 F16~IO_L14N_T2_SRCC_15 F16\nB12 F15~IO_L14P_T2_SRCC_15 F15\nA19 E16~IO_L11N_T1_SRCC_15 E16\nB19 E15~IO_L11P_T1_SRCC_15 E15\nA22 C15~IO_L12N_T1_MRCC_15 C15\nB22 D15~IO_L12P_T1_MRCC_15 D15\nD8 T5~IO_L12P_T1_MRCC_34 T5\nD9 T4~IO_L12N_T1_MRCC_34 T4\nD14 T3~IO_L11N_T1_SRCC_34 T3\nD15 R3~IO_L11P_T1_SRCC_34 R3\nD19 P5~IO_L13N_T2_MRCC_34 P5\nD20 N5~IO_L13P_T2_MRCC_34 N5\nD21 P4~IO_L14P_T2_SRCC_34 P4\nD22 P3~IO_L14N_T2_SRCC_34 P3\n\nUnfortunately various 2.1x modules have different clock assignment. B22 hsould be a P-side MRCC for 2.14 (perhaps 2.18), but is a n-side SRCC on 2.16 so not usable there.
Wire Wire Line
	7150 2650 7150 2850
Wire Wire Line
	7150 2850 6700 2850
$Comp
L ztex_CD:ZTEX_CD JCD?
U 1 1 5F676F65
P 7600 2650
AR Path="/5F676F65" Ref="JCD?"  Part="1" 
AR Path="/5F67E4B9/5F676F65" Ref="JCD?"  Part="1" 
AR Path="/618E8C75/5F676F65" Ref="JCD1"  Part="1" 
AR Path="/631F3844/5F676F65" Ref="JCD1"  Part="1" 
AR Path="/6432B233/5F676F65" Ref="JCD1"  Part="1" 
F 0 "JCD1" H 7650 4375 50  0000 C CNN
F 1 "ZTEX_CD-ztex_CD" H 7650 4284 50  0000 C CNN
F 2 "For_SeeedStudio:PinHeader_2x32_P2.54mm_Vertical_For_SeeedStudio" H 7600 2650 50  0001 C CNN
F 3 "" H 7600 2650 50  0001 C CNN
F 4 "77313-824-64LF" H 7600 2650 50  0001 C CNN "MPN"
	1    7600 2650
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x07_Odd_Even J1
U 1 1 5F749BE1
P 3150 7250
F 0 "J1" H 3200 7767 50  0000 C CNN
F 1 "Conn_02x07_Odd_Even" H 3200 7676 50  0000 C CNN
F 2 "For_SeeedStudio:PinHeader_2x07_P2.00mm_Horizontal_For_SeeedStudio" H 3150 7250 50  0001 C CNN
F 3 "https://www.molex.com/pdm_docs/sd/878331420_sd.pdf" H 3150 7250 50  0001 C CNN
F 4 "87833-1420" H 3150 7250 50  0001 C CNN "MPN Right Angle"
F 5 "A2005WR-N-2X7P-B" H 3150 7250 50  0001 C CNN "MPN-ALT Right Angle"
F 6 "https://www2.mouser.com/ProductDetail/Molex/87833-1420?qs=%2Fha2pyFadujYFYCIYI1IvFCvLi7no9WQYzIL%2FpYxKhg%3D" H 3150 7250 50  0001 C CNN "URL Rihgt Angle"
F 7 "87831-1420" H 3150 7250 50  0001 C CNN "MPN"
F 8 "https://www2.mouser.com/ProductDetail/Molex/87831-1420?qs=QtQX4uD3c2VDCL534TqpVg%3D%3D" H 3150 7250 50  0001 C CNN "URL"
F 9 "https://datasheet.lcsc.com/lcsc/1811051309_MOLEX-878311420_C240854.pdf" H 3150 7250 50  0001 C CNN "Datasheet-ALT"
F 10 "87831-1419, 87831-1420, 87831-1421, 87831-1436 only change plating" H 3150 7250 50  0001 C CNN "Notes"
F 11 "DNP" H 3150 7250 50  0000 C CNN "DNP"
	1    3150 7250
	1    0    0    -1  
$EndComp
Text HLabel 1600 4250 0    50   Input ~ 0
JTAG_VIO
Text HLabel 3450 6950 2    50   Input ~ 0
JTAG_VIO
Wire Wire Line
	2950 6950 2950 7050
Connection ~ 2950 7050
Wire Wire Line
	2950 7050 2950 7150
Connection ~ 2950 7150
Wire Wire Line
	2950 7150 2950 7250
Connection ~ 2950 7250
Wire Wire Line
	2950 7250 2950 7350
Connection ~ 2950 7350
Wire Wire Line
	2950 7350 2950 7450
Connection ~ 2950 7450
$Comp
L power:GND #PWR0102
U 1 1 5F755CF4
P 2700 7550
F 0 "#PWR0102" H 2700 7300 50  0001 C CNN
F 1 "GND" H 2705 7377 50  0000 C CNN
F 2 "" H 2700 7550 50  0001 C CNN
F 3 "" H 2700 7550 50  0001 C CNN
	1    2700 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 7450 2700 7450
Wire Wire Line
	2700 7450 2700 7550
Text Notes 2850 7650 0    50   ~ 0
PGND
Text Notes 3500 7600 0    50   ~ 0
HALT
Text Notes 3500 7500 0    50   ~ 0
NC
Wire Wire Line
	2950 7550 2950 7450
Wire Wire Line
	7150 2650 7400 2650
Connection ~ 500  2650
Wire Wire Line
	500  4450 4100 4450
Wire Wire Line
	4100 4450 4100 4250
Wire Wire Line
	500  2650 500  4450
Wire Wire Line
	4100 4450 5800 4450
Wire Wire Line
	7400 4250 7400 4450
Connection ~ 4100 4450
Wire Wire Line
	7400 4450 9900 4450
Wire Wire Line
	9900 4450 9900 4250
Connection ~ 7400 4450
Connection ~ 5800 4450
Wire Wire Line
	5800 4450 7400 4450
$Comp
L power:GND #PWR0103
U 1 1 5F8F4D66
P 5800 4450
F 0 "#PWR0103" H 5800 4200 50  0001 C CNN
F 1 "GND" H 5805 4277 50  0000 C CNN
F 2 "" H 5800 4450 50  0001 C CNN
F 3 "" H 5800 4450 50  0001 C CNN
	1    5800 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 2650 5800 2650
Wire Wire Line
	5800 2650 5800 2750
Connection ~ 5800 2750
Wire Wire Line
	5800 2750 5800 4450
Wire Wire Line
	5800 1250 5800 2650
Connection ~ 5800 2650
Connection ~ 5800 1250
Wire Wire Line
	9900 1250 11000 1250
Connection ~ 9900 4450
Wire Wire Line
	4100 1150 4100 1000
Wire Wire Line
	4100 1000 2400 1000
Wire Wire Line
	2400 1000 1600 1000
Wire Wire Line
	1600 1000 1600 1150
Connection ~ 2400 1000
Wire Wire Line
	2900 2550 2900 2750
Connection ~ 2900 2550
Connection ~ 2900 2750
Wire Wire Line
	9900 2850 8550 2850
Wire Wire Line
	7400 2850 7150 2850
Connection ~ 7400 2850
Connection ~ 7150 2850
Wire Wire Line
	7400 2650 8550 2650
Connection ~ 7400 2650
Wire Wire Line
	9900 2750 11000 2750
Wire Wire Line
	8550 2650 8550 2850
Connection ~ 8550 2650
Wire Wire Line
	8550 2650 9900 2650
Connection ~ 8550 2850
Wire Wire Line
	8550 2850 7400 2850
Wire Wire Line
	6250 2550 6250 2700
Wire Wire Line
	6250 2700 6700 2700
Wire Wire Line
	6700 2700 6700 2850
$Comp
L power:+3V3 #PWR0104
U 1 1 5F90D7B8
P 6250 2550
F 0 "#PWR0104" H 6250 2400 50  0001 C CNN
F 1 "+3V3" H 6265 2723 50  0000 C CNN
F 2 "" H 6250 2550 50  0001 C CNN
F 3 "" H 6250 2550 50  0001 C CNN
	1    6250 2550
	1    0    0    -1  
$EndComp
Connection ~ 6250 2550
Wire Wire Line
	11000 2750 11000 4450
Wire Wire Line
	11000 4450 9900 4450
$Comp
L power:GND #PWR0105
U 1 1 5F912C94
P 11000 4450
F 0 "#PWR0105" H 11000 4200 50  0001 C CNN
F 1 "GND" H 11005 4277 50  0000 C CNN
F 2 "" H 11000 4450 50  0001 C CNN
F 3 "" H 11000 4450 50  0001 C CNN
	1    11000 4450
	1    0    0    -1  
$EndComp
Connection ~ 11000 4450
$Comp
L power:GND #PWR0106
U 1 1 5F912D7C
P 500 4450
F 0 "#PWR0106" H 500 4200 50  0001 C CNN
F 1 "GND" H 505 4277 50  0000 C CNN
F 2 "" H 500 4450 50  0001 C CNN
F 3 "" H 500 4450 50  0001 C CNN
	1    500  4450
	1    0    0    -1  
$EndComp
Connection ~ 500  4450
Wire Wire Line
	11000 1250 11000 2750
$Comp
L Device:C C?
U 1 1 61B7E3FB
P 3000 6050
AR Path="/618F532C/61B7E3FB" Ref="C?"  Part="1" 
AR Path="/618E8C75/61B7E3FB" Ref="C1"  Part="1" 
AR Path="/631F3844/61B7E3FB" Ref="C1"  Part="1" 
AR Path="/6432B233/61B7E3FB" Ref="C1"  Part="1" 
F 0 "C1" H 3025 6150 50  0000 L CNN
F 1 "100nF" H 3025 5950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3038 5900 50  0001 C CNN
F 3 "" H 3000 6050 50  0000 C CNN
F 4 "www.yageo.com" H 3000 6050 50  0001 C CNN "MNF1_URL"
F 5 "CC0603KRX7R9BB104" H 3000 6050 50  0001 C CNN "MPN"
F 6 "603-CC603KRX7R8BB104" H 3000 6050 50  0001 C CNN "Mouser"
F 7 "?" H 3000 6050 50  0001 C CNN "Digikey"
F 8 "?" H 3000 6050 50  0001 C CNN "LCSC"
F 9 "?" H 3000 6050 50  0001 C CNN "Koncar"
F 10 "TB" H 3000 6050 50  0001 C CNN "Side"
F 11 "https://www.lcsc.com/product-detail/Multilayer-Ceramic-Capacitors-MLCC-SMD-SMT_YAGEO-CC0603KRX7R9BB104_C14663.html" H 3000 6050 50  0001 C CNN "URL"
	1    3000 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 61B81B34
P 3000 6200
F 0 "#PWR0107" H 3000 5950 50  0001 C CNN
F 1 "GND" H 3005 6027 50  0000 C CNN
F 2 "" H 3000 6200 50  0001 C CNN
F 3 "" H 3000 6200 50  0001 C CNN
	1    3000 6200
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0108
U 1 1 61B81BD5
P 3000 5900
F 0 "#PWR0108" H 3000 5750 50  0001 C CNN
F 1 "+3V3" H 3015 6073 50  0000 C CNN
F 2 "" H 3000 5900 50  0001 C CNN
F 3 "" H 3000 5900 50  0001 C CNN
	1    3000 5900
	1    0    0    -1  
$EndComp
Text GLabel 3450 7050 2    50   Input ~ 0
FPGA_JTAG_TMS
Text GLabel 3450 7150 2    50   Input ~ 0
FPGA_JTAG_TCK
Text GLabel 9900 4150 2    50   Input ~ 0
FPGA_JTAG_TMS
Text GLabel 4100 4150 2    50   Input ~ 0
FPGA_JTAG_TCK
Text GLabel 7400 4150 0    50   Input ~ 0
FPGA_JTAG_TDO
Text GLabel 1600 4150 0    50   Input ~ 0
FPGA_JTAG_TDI
Text GLabel 3450 7350 2    50   Input ~ 0
FPGA_JTAG_TDI
Text GLabel 3450 7250 2    50   Input ~ 0
FPGA_JTAG_TDO
NoConn ~ 3450 7550
NoConn ~ 3450 7450
$Comp
L Device:C C?
U 1 1 61F08531
P 3400 6050
AR Path="/618F532C/61F08531" Ref="C?"  Part="1" 
AR Path="/618E8C75/61F08531" Ref="C2"  Part="1" 
AR Path="/631F3844/61F08531" Ref="C2"  Part="1" 
AR Path="/6432B233/61F08531" Ref="C2"  Part="1" 
F 0 "C2" H 3425 6150 50  0000 L CNN
F 1 "100nF" H 3425 5950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3438 5900 50  0001 C CNN
F 3 "" H 3400 6050 50  0000 C CNN
F 4 "www.yageo.com" H 3400 6050 50  0001 C CNN "MNF1_URL"
F 5 "CC0603KRX7R9BB104" H 3400 6050 50  0001 C CNN "MPN"
F 6 "603-CC603KRX7R8BB104" H 3400 6050 50  0001 C CNN "Mouser"
F 7 "?" H 3400 6050 50  0001 C CNN "Digikey"
F 8 "?" H 3400 6050 50  0001 C CNN "LCSC"
F 9 "?" H 3400 6050 50  0001 C CNN "Koncar"
F 10 "TB" H 3400 6050 50  0001 C CNN "Side"
F 11 "https://www.lcsc.com/product-detail/Multilayer-Ceramic-Capacitors-MLCC-SMD-SMT_YAGEO-CC0603KRX7R9BB104_C14663.html" H 3400 6050 50  0001 C CNN "URL"
	1    3400 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 61F08538
P 3400 6200
F 0 "#PWR0109" H 3400 5950 50  0001 C CNN
F 1 "GND" H 3405 6027 50  0000 C CNN
F 2 "" H 3400 6200 50  0001 C CNN
F 3 "" H 3400 6200 50  0001 C CNN
	1    3400 6200
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0110
U 1 1 61F0853E
P 3400 5900
F 0 "#PWR0110" H 3400 5750 50  0001 C CNN
F 1 "+3.3V" H 3415 6073 50  0000 C CNN
F 2 "" H 3400 5900 50  0001 C CNN
F 3 "" H 3400 5900 50  0001 C CNN
	1    3400 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 5250 7600 5250
Wire Wire Line
	7600 5250 7600 5450
Wire Wire Line
	8050 5250 8450 5250
$Comp
L Device:LED_ALT D?
U 1 1 621E3C57
P 7900 5250
AR Path="/5F6B165A/621E3C57" Ref="D?"  Part="1" 
AR Path="/5F67E4B9/621E3C57" Ref="D?"  Part="1" 
AR Path="/618E8C75/621E3C57" Ref="D3"  Part="1" 
AR Path="/631F3844/621E3C57" Ref="D3"  Part="1" 
AR Path="/6432B233/621E3C57" Ref="D1"  Part="1" 
F 0 "D1" H 7900 5350 50  0000 C CNN
F 1 "RED LED 0603" H 7950 5100 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 7900 5250 50  0001 C CNN
F 3 "" H 7900 5250 50  0001 C CNN
F 4 "KT-0603R" H 7900 5250 60  0001 C CNN "MPN"
	1    7900 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 621E3C5E
P 7600 5450
F 0 "#PWR0111" H 7600 5200 50  0001 C CNN
F 1 "GND" H 7605 5277 50  0000 C CNN
F 2 "" H 7600 5450 50  0001 C CNN
F 3 "" H 7600 5450 50  0001 C CNN
	1    7600 5450
	1    0    0    -1  
$EndComp
Text Notes 8100 5000 0    50   ~ 0
Power  Signal
$Comp
L power:+3V3 #PWR0112
U 1 1 621E6233
P 8750 5250
F 0 "#PWR0112" H 8750 5100 50  0001 C CNN
F 1 "+3V3" H 8765 5423 50  0000 C CNN
F 2 "" H 8750 5250 50  0001 C CNN
F 3 "" H 8750 5250 50  0001 C CNN
	1    8750 5250
	1    0    0    -1  
$EndComp
Text Notes 3650 5550 2    50   ~ 0
Close to pwr output pins\n(3.3V / VCCO_{AB,CD})
$Comp
L Device:C C?
U 1 1 621FCA7B
P 4000 6050
AR Path="/5F69F4EF/621FCA7B" Ref="C?"  Part="1" 
AR Path="/5F6B165A/621FCA7B" Ref="C?"  Part="1" 
AR Path="/61B99D2C/621FCA7B" Ref="C?"  Part="1" 
AR Path="/618E8C75/621FCA7B" Ref="C3"  Part="1" 
AR Path="/631F3844/621FCA7B" Ref="C3"  Part="1" 
AR Path="/6432B233/621FCA7B" Ref="C3"  Part="1" 
F 0 "C3" H 4025 6150 50  0000 L CNN
F 1 "47uF 10V+" H 4025 5950 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4038 5900 50  0001 C CNN
F 3 "" H 4000 6050 50  0000 C CNN
F 4 "CL31A476MPHNNNE" H 4000 6050 50  0001 C CNN "MPN"
F 5 "https://www.lcsc.com/product-detail/Multilayer-Ceramic-Capacitors-MLCC-SMD-SMT_Samsung-Electro-Mechanics-CL31A476MPHNNNE_C96123.html" H 4000 6050 50  0001 C CNN "URL"
	1    4000 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 621FE55C
P 4000 6200
F 0 "#PWR0113" H 4000 5950 50  0001 C CNN
F 1 "GND" H 4005 6027 50  0000 C CNN
F 2 "" H 4000 6200 50  0001 C CNN
F 3 "" H 4000 6200 50  0001 C CNN
	1    4000 6200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0114
U 1 1 621FE5E5
P 4000 5900
F 0 "#PWR0114" H 4000 5750 50  0001 C CNN
F 1 "+5V" H 4015 6073 50  0000 C CNN
F 2 "" H 4000 5900 50  0001 C CNN
F 3 "" H 4000 5900 50  0001 C CNN
	1    4000 5900
	1    0    0    -1  
$EndComp
Text Notes 4250 5600 2    50   ~ 0
Close to VIN\npins on AB
Wire Wire Line
	500  1250 500  2650
Connection ~ 4100 2550
Connection ~ 1600 2750
Connection ~ 1600 2550
Wire Wire Line
	4100 2550 6250 2550
Connection ~ 4100 1250
Wire Wire Line
	4100 1250 5800 1250
Connection ~ 1600 1250
Wire Wire Line
	1600 2750 2900 2750
Wire Wire Line
	1450 2750 1600 2750
Wire Wire Line
	2900 2550 1600 2550
Wire Wire Line
	1450 2550 1600 2550
Connection ~ 11000 2750
Wire Wire Line
	7400 1250 5800 1250
Wire Wire Line
	7400 2750 5800 2750
Wire Wire Line
	1600 1250 4100 1250
Wire Wire Line
	2900 2750 4100 2750
Wire Wire Line
	4100 2550 2900 2550
Wire Wire Line
	1600 1250 500  1250
Wire Wire Line
	500  2650 1600 2650
Wire Wire Line
	1450 2550 1450 2750
$Comp
L Device:R R?
U 1 1 621E3C4D
P 8600 5250
AR Path="/5F6B165A/621E3C4D" Ref="R?"  Part="1" 
AR Path="/5F67E4B9/621E3C4D" Ref="R?"  Part="1" 
AR Path="/618E8C75/621E3C4D" Ref="R3"  Part="1" 
AR Path="/631F3844/621E3C4D" Ref="R3"  Part="1" 
AR Path="/6432B233/621E3C4D" Ref="R1"  Part="1" 
F 0 "R1" V 8680 5250 50  0000 C CNN
F 1 "560" V 8600 5250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8530 5250 50  0001 C CNN
F 3 "" H 8600 5250 50  0000 C CNN
F 4 "0603WAF5600T5E" V 8600 5250 50  0001 C CNN "MPN"
F 5 "https://www.lcsc.com/product-detail/Chip-Resistor-Surface-Mount_UNI-ROYAL-Uniroyal-Elec-0603WAF5600T5E_C23204.html" V 8600 5250 50  0001 C CNN "URL"
	1    8600 5250
	0    1    1    0   
$EndComp
Text GLabel 9900 4050 2    50   Input ~ 0
~IRQ1_3V3
Text GLabel 7400 3950 0    50   Input ~ 0
~DSACK1_3V3
Text GLabel 9900 3950 2    50   Input ~ 0
~STERM_3V3
Text GLabel 7400 4050 0    50   Input ~ 0
~DS_3V3
Text GLabel 7400 3850 0    50   Input ~ 0
~RW_3V3
Text GLabel 9900 3850 2    50   Input ~ 0
~DSACK0_3V3
Text GLabel 9900 3750 2    50   Input ~ 0
SIZ1_3V3
Text GLabel 7400 3750 0    50   Input ~ 0
SIZ0_3V3
Text GLabel 1600 3950 0    50   Input ~ 0
~HALT_3V3
Text GLabel 9900 3450 2    50   Input ~ 0
D0_3V3
Text GLabel 4100 4050 2    50   Input ~ 0
~BERR_3V3
Text GLabel 7400 3550 0    50   Input ~ 0
~RESET_3V3
Text GLabel 9900 3550 2    50   Input ~ 0
FC1_3V3
Text GLabel 7400 3650 0    50   Input ~ 0
FC2_3V3
Text GLabel 1600 4050 0    50   Input ~ 0
FC0_3V3
Text GLabel 9900 3650 2    50   Input ~ 0
~AS_3V3
Text GLabel 4100 3750 2    50   Input ~ 0
D7_3V3
Text GLabel 9900 3350 2    50   Input ~ 0
D5_3V3
Text GLabel 1600 3750 0    50   Input ~ 0
D6_3V3
Text GLabel 7400 3350 0    50   Input ~ 0
D8_3V3
Text GLabel 4100 3950 2    50   Input ~ 0
D1_3V3
Text GLabel 4100 3850 2    50   Input ~ 0
D4_3V3
Text GLabel 7400 3450 0    50   Input ~ 0
D2_3V3
Text GLabel 1600 3850 0    50   Input ~ 0
D3_3V3
Text GLabel 1600 3450 0    50   Input ~ 0
D15_3V3
Text GLabel 4100 3450 2    50   Input ~ 0
D16_3V3
Text GLabel 4100 3550 2    50   Input ~ 0
D13_3V3
Text GLabel 7400 3250 0    50   Input ~ 0
D14_3V3
Text GLabel 1600 3550 0    50   Input ~ 0
D12_3V3
Text GLabel 1600 3650 0    50   Input ~ 0
D9_3V3
Text GLabel 4100 3650 2    50   Input ~ 0
D10_3V3
Text GLabel 9900 3250 2    50   Input ~ 0
D11_3V3
Text GLabel 7400 3150 0    50   Input ~ 0
D20_3V3
Text GLabel 9900 3150 2    50   Input ~ 0
D17_3V3
Text GLabel 4100 3350 2    50   Input ~ 0
D19_3V3
Text GLabel 1600 3350 0    50   Input ~ 0
D18_3V3
Text GLabel 1600 3150 0    50   Input ~ 0
D23_3V3
Text GLabel 4100 3250 2    50   Input ~ 0
D22_3V3
Text GLabel 4100 3150 2    50   Input ~ 0
D24_3V3
Text GLabel 1600 3250 0    50   Input ~ 0
D21_3V3
Text GLabel 7400 2550 0    50   Input ~ 0
D31_3V3
Text GLabel 4100 2850 2    50   Input ~ 0
D30_3V3
Text GLabel 4100 2450 2    50   Input ~ 0
A31_3V3
Text GLabel 1600 2850 0    50   Input ~ 0
D29_3V3
Text GLabel 4100 2950 2    50   Input ~ 0
D28_3V3
Text GLabel 1600 3050 0    50   Input ~ 0
D25_3V3
Text GLabel 1600 2950 0    50   Input ~ 0
D27_3V3
Text GLabel 4100 3050 2    50   Input ~ 0
D26_3V3
Text GLabel 7400 1350 0    50   Input ~ 0
A1_3V3
Text GLabel 9900 1350 2    50   Input ~ 0
A0_3V3
Text GLabel 4100 2050 2    50   Input ~ 0
CPUCLK_3V3
Text GLabel 9900 1450 2    50   Input ~ 0
A2_3V3
Text GLabel 9900 1550 2    50   Input ~ 0
A4_3V3
Text GLabel 9900 1650 2    50   Input ~ 0
A6_3V3
Text GLabel 7400 1450 0    50   Input ~ 0
A3_3V3
Text GLabel 7400 1550 0    50   Input ~ 0
A5_3V3
Text GLabel 4100 1450 2    50   Input ~ 0
A11_3V3
Text GLabel 1600 1450 0    50   Input ~ 0
A12_3V3
Text GLabel 1600 1550 0    50   Input ~ 0
A14_3V3
Text GLabel 4100 1550 2    50   Input ~ 0
A13_3V3
Text GLabel 1600 1850 0    50   Input ~ 0
A20_3V3
Text GLabel 4100 1850 2    50   Input ~ 0
A19_3V3
Text GLabel 4100 1950 2    50   Input ~ 0
A21_3V3
Text GLabel 1600 1650 0    50   Input ~ 0
A16_3V3
Text GLabel 4100 1750 2    50   Input ~ 0
A17_3V3
Text GLabel 1600 1750 0    50   Input ~ 0
A18_3V3
Text GLabel 4100 1650 2    50   Input ~ 0
A15_3V3
Text GLabel 1600 2350 0    50   Input ~ 0
A28_3V3
Text GLabel 4100 2250 2    50   Input ~ 0
A27_3V3
Text GLabel 1600 2150 0    50   Input ~ 0
A25_3V3
Text GLabel 4100 2150 2    50   Input ~ 0
A24_3V3
Text GLabel 1600 2250 0    50   Input ~ 0
A26_3V3
Text GLabel 4100 1350 2    50   Input ~ 0
A9_3V3
Text GLabel 9900 1750 2    50   Input ~ 0
A8_3V3
Text GLabel 7400 1650 0    50   Input ~ 0
A7_3V3
Text GLabel 1600 1350 0    50   Input ~ 0
A10_3V3
Text GLabel 7400 2150 0    50   Input ~ 0
HDMI_CLK+
Text GLabel 7400 2250 0    50   Input ~ 0
HDMI_CLK-
Text GLabel 9900 2050 2    50   Input ~ 0
HDMI_D0+
Text GLabel 9900 2150 2    50   Input ~ 0
HDMI_D0-
Text GLabel 7400 1950 0    50   Input ~ 0
HDMI_D1+
Text GLabel 7400 2050 0    50   Input ~ 0
HDMI_D1-
Text GLabel 9900 1850 2    50   Input ~ 0
HDMI_D2+
Text GLabel 9900 1950 2    50   Input ~ 0
HDMI_D2-
Text GLabel 4100 2350 2    50   Input ~ 0
A29_3V3
Text GLabel 1600 2450 0    50   Input ~ 0
A30_3V3
Text GLabel 1600 1950 0    50   Input ~ 0
A22_3V3
Text GLabel 1600 2050 0    50   Input ~ 0
A23_3V3
$Comp
L ztex_AB:ZTEX_AB JAB?
U 1 1 5F676E85
P 1800 2650
AR Path="/5F676E85" Ref="JAB?"  Part="1" 
AR Path="/5F67E4B9/5F676E85" Ref="JAB?"  Part="1" 
AR Path="/618E8C75/5F676E85" Ref="JAB1"  Part="1" 
AR Path="/631F3844/5F676E85" Ref="JAB1"  Part="1" 
AR Path="/6432B233/5F676E85" Ref="JAB1"  Part="1" 
F 0 "JAB1" H 1825 4375 50  0000 C CNN
F 1 "ZTEX_AB-ztex_AB" H 1825 4284 50  0000 C CNN
F 2 "For_SeeedStudio:PinHeader_2x32_P2.54mm_Vertical_For_SeeedStudio" H 1800 2650 50  0001 C CNN
F 3 "" H 1800 2650 50  0001 C CNN
F 4 "77313-824-64LF" H 1800 2650 50  0001 C CNN "MPN"
	1    1800 2650
	1    0    0    -1  
$EndComp
Text GLabel 9900 2350 2    50   Input ~ 0
PMOD-56-
Text GLabel 9900 2550 2    50   Input ~ 0
PMOD-78-
Text GLabel 9900 3050 2    50   Input ~ 0
PMOD-910-
Text GLabel 7400 2950 0    50   Input ~ 0
PMOD-1112-
Text GLabel 7400 3050 0    50   Input ~ 0
PMOD-1112+
Text GLabel 9900 2250 2    50   Input ~ 0
PMOD-56+
Text GLabel 9900 2450 2    50   Input ~ 0
PMOD-78+
Text GLabel 9900 2950 2    50   Input ~ 0
PMOD-910+
Text GLabel 7400 1850 0    50   Input ~ 0
~CBREQ_3V3
Text GLabel 7400 1750 0    50   Input ~ 0
~CBACK_3V3
Text GLabel 7400 2450 0    50   Input ~ 0
CACHE_3V3
Text GLabel 7400 2350 0    50   Input ~ 0
~CIOUT_3V3
Text GLabel 10525 2950 2    50   Input ~ 0
~BGACK_3V3
Text GLabel 6750 2950 0    50   Input ~ 0
~BG_3V3
Text GLabel 6750 3050 0    50   Input ~ 0
~BR_3V3
Text GLabel 10525 2550 2    50   Input ~ 0
~FPU_3V3
Wire Wire Line
	10525 2950 9900 2950
Wire Wire Line
	10525 3050 9900 3050
Wire Wire Line
	6750 3050 7400 3050
Wire Wire Line
	6750 2950 7400 2950
Text GLabel 10525 3050 2    50   Input ~ 0
C16M_3V3
Wire Wire Line
	9900 2550 10525 2550
$EndSCHEMATC
