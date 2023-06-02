#!/bin/sh

PUMPKIN=

DIR=$PUMPKIN/sys.s
DMP=$PUMPKIN/sys.s/waits.dmp/.729.

# Files from SYS.CMD[S,SYS]
FILES="head outer netdef
   jobdat cacdat uncdat p2comm lowcor parser sysini mpxser klser
   comcss clkser pagser uuocon spwser schedu swpser core dpyser ttyser
   vdpser lined dlnser dskser dtcser mtcser tvser lptser elfser carser
   xgpser ptpser ptrser impser pupser domser nulser tail oncend
   macsym.mac monsym.mac phypar.mac prolog.mac bugs.mac globs.mac
   phydat.mac physio.mac phyp4.mac phyh2.mac phym78.mac
   netmac.mac impddb
   netsub.mac impint.mac ipser.mac udpser.mac tcpser.mac impmac.mac
   p1end chkend ddt once"

for i in $FILES; do
    older=`find $DIR/$i \! -newer $DMP`
    newest=`ls -Lt $older | head -1`
    timestamp=`TZ=GMT stat -L $newest | grep Modify: | cut -c9-24`
    echo $i -- $timestamp -- $newest
    cp $newest S,SYS/$i
    echo $timestamp $i >> timestamps.txt
done
