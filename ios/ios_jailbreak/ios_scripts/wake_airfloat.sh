#!/bin/bash

# This script should be put in jailbroken ios device directory location: etc/rc.d/ 
# This script will automatically invoke AirFloat app if it is not open or it is not in foreground
# The way it invoke the app is to simulate touch buttons: 1) touch home button 2) touch wipe to leave the home screen 3) open AirFloat app
isAirfloat=$(activator current-app)

if [ "$isAirfloat" != "com.tren.AirFloat" ]
then
activator send libactivator.system.homebutton && sleep 1 && stouch swipe 200 300 700 300 0.5 1 && sleep 1 && open com.tren.AirFloat
fi
