#!/bin/bash
LOGFILE=/var/log/cdrip.log

finish() {
    (
      echo "Unmounting"
      umount /media/music
      sleep 20
      echo "Done, ejecting CD"
      eject
      RET=$?
      echo "Exit with: $RET"
    ) >> $LOGFILE 2>&1
}
trap finish EXIT

echo "$(date)" >> $LOGFILE
(
    umount /media/music
    mount /dev/sda1 /media/music || mount /dev/sdb1 /media/music
    RET=$?
    if [ $RET -ne 0 ]; then
       echo "Failed to mount, exiting."
       eject
       exit 1
    fi
    MPOINT=$(mount | grep /media/music)
    echo "Mounted /media/music: $MPOINT"

    time PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin abcde -GN
    RET=$?
    if [ $RET -eq 0 ]; then
        echo "Successfully ripped CD"
    else
        echo "Rip failed!"
    fi
    sleep 5
) >> $LOGFILE 2>&1 
exit
