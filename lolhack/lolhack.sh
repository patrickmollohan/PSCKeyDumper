#!/bin/sh
# Author: Patrick Mollohan (keybase.io/patrickmollohan)
# Date: 06/24/2019
# Purpose:
# This script will dump the PlayStation Classic encryption keys into the loot
# folder of your USB storage media. The PlayStation Classic will shut down after
# the operation is complete.
# Credits:
# justMaku (gpghax)

led_flash_success() {
  for ((i = 0; i < 3; i++)); do
    echo 1 > /sys/class/leds/red/brightness
    echo 0 > /sys/class/leds/green/brightness
    sleep $1
    echo 1 > /sys/class/leds/red/brightness
    echo 1 > /sys/class/leds/green/brightness
    sleep $1
    echo 0 > /sys/class/leds/red/brightness
    echo 1 > /sys/class/leds/green/brightness
    sleep $1
  done
  echo 0 > /sys/class/leds/red/brightness
  echo 0 > /sys/class/leds/green/brightness
}

killall -KILL sonyapp

cp -r /home/root /media/loot
sync

umount /media
led_flash_success 1
shutdown -h now
exit 0

