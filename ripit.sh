#!/bin/bash
LOGFILE=/var/log/cdrip.log

finish() {
    eject
    pumount /media/music
}
trap finish EXIT

echo "$(date)" >> $LOGFILE
( 
    pmount /dev/sda1 music || pmount /dev/sdb1 music
    time PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin abcde -GN

) >> $LOGFILE 2>&1 
exit
