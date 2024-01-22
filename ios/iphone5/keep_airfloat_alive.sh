#!/bin/bash

#ssh -t root@192.168.3.156 "/etc/rc.d/check_wake_airfloat.sh 30 &"
#ssh -t root@192.168.3.156 "nohup /etc/rc.d/check_wake_airfloat.sh 30 > /dev/null 2>&1 &"

HOST=192.168.3.156
WAITTIME=$1

while true
do
  ping -q -c1 ${HOST}
  if [ $? == 0 ]; then
    ssh -t root@${HOST} "/etc/rc.d/wake_airfloat.sh"
  fi
  sleep $WAITTIME
done
