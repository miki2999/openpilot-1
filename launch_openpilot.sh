#!/usr/bin/bash

if [ ! -f "/data/no_ota_updates" ]; then
    /usr/bin/touch /data/no_ota_updates
fi

if [ ! -f "/system/fonts/opensans_regular.ttf" ]; then
    sleep 3
    mount -o remount,rw /system
  	cp -rf /data/openpilot/selfdrive/assets/fonts/opensans* /system/fonts/
    cp -rf /data/openpilot/kyd/fonts.xml /system/etc/fonts.xml
    chmod 644 /system/etc/fonts.xml
  	chmod 644 /system/fonts/opensans*
    mount -o remount,r /system
fi

export PASSIVE="0"
exec ./launch_chffrplus.sh
