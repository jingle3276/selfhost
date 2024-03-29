#!/bin/sh

# this is called by crontab 

HOSTS=$1
DOMAIN=wisemax.net
PASSWORD=$2

current_ip=$(curl ifconfig.io)

for HOSTNAME in $(echo $HOSTS | sed "s/,/ /g")
do

dyn_ip=$( host "$HOSTNAME.$DOMAIN" | tail -n1 | sed -e "s/.*\ //" )

if [ "$dyn_ip" != "$current_ip" ]; then
    curl --write-out "%{http_code}" --location "https://dynamicdns.park-your-domain.com/update?host=$HOSTNAME&domain=$DOMAIN&password=$PASSWORD"
    #if [ "$respond_code" = "200" ]; then
    #    echo "succesfully updated $HOSTNAME.$DOMAIN"
    #fi
fi

done
