#!/bin/bash

GERBER_FILES="IIsi-to-ztex-B_Cu.gbr IIsi-to-ztex-B_Mask.gbr IIsi-to-ztex-B_Paste.gbr IIsi-to-ztex-B_SilkS.gbr IIsi-to-ztex-Edge_Cuts.gbr IIsi-to-ztex-F_Cu.gbr IIsi-to-ztex-F_Mask.gbr IIsi-to-ztex-F_Paste.gbr IIsi-to-ztex-F_SilkS.gbr IIsi-to-ztex-In1_Cu.gbr IIsi-to-ztex-In2_Cu.gbr"

POS_FILES="IIsi-to-ztex-bottom.pos IIsi-to-ztex-top.pos"

DRL_FILES="IIsi-to-ztex-NPTH.drl IIsi-to-ztex-PTH.drl IIsi-to-ztex-PTH-drl_map.ps IIsi-to-ztex-NPTH-drl_map.ps"

FILES="${GERBER_FILES} ${POS_FILES} ${DRL_FILES} top.pdf IIsi-to-ztex.d356 IIsi-to-ztex.csv"

echo $FILES

KICAD_PCB=IIsi-to-ztex.kicad_pcb

ABORT=no
for F in $FILES; do 
    if test \! -f $F || test $KICAD_PCB -nt $F; then
	echo "Regenerate file $F"
	ABORT=yes
    fi
done

if test $ABORT == "yes"; then
    exit -1;
fi

zip IIsi-to-ztex.zip $FILES top.jpg bottom.jpg
