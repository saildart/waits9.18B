set cr disable
set cp disable
set dpa disable
set dpb disable
set rpa disable
set rpb disable
set tua disable
set dt disable
set dc disable
set mta disable
;set mtc enable
;set dtc enable
;set dcs enable
;set dct enable
;set dkb enable
;set mtc dct=02
;set dtc dct=01
set imp waits
;at dcs 2040
set rpa enabled rh20
set rpa0 rp06
set rpa1 rp06
attach rpa0 RP06.0
load -d WAITS.DMP.114
expect "mm-dd-yy:" send "01-13-88\r"; continue
expect "format:" send "1200\r"; continue
go 200
