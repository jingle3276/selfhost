#!/bin/bash

# To run this script, the user's ssh public key must be added to the ios device's known-host list
# the ios device must be in static DHCP table with the HOST value
# IOS device must be jailbroken and have these dependencies: ssh, activator, AirFloat, stouch 
# the IOS device must the check_wake_airfloat.sh installed on /etc/rc.d/wake_airfloat.sh 


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
