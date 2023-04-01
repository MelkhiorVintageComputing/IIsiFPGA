#!/bin/bash

cat IIsi-to-ztex-all-pos.csv | awk -F, '{ print $1","$4,","$5","$7","$6 }' | sed -e 's/bottom/Bottom/' -e 's/top/Top/' -e 's/Ref/Designator/' -e 's/PosX/"Mid X"/' -e 's/PosY/"Mid Y"/' -e 's/Side/Layer/' -e 's/Rot/Rotation/' >| IIsi-to-ztex-all-pos-jlcpcb.csv
