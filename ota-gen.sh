#!/bin/bash
#device=$1
device=fldc
cd ~/src/OTA
oldzip=$(grep "<Filename>RR-O" $device.xml  | sed -e 's|</\?Filename>||g')
newzip=$2
sed -i "s/$oldzip/$newzip/g" $device.xml
cd -
cd ~/src/OTA
echo "OTA Update for RR $device $(date +%Y%m%d) Build" > /tmp/rrota
git commit -as -F /tmp/rrota
git pull --no-edit origin master;
git push origin master
cd -
rm -fv /tmp/rrota
