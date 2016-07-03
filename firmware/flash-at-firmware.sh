#!/bin/bash

if ! [ -f ./at-esp8266-firmware-latest.bin ]; then
    echo "AT firmware not found!"
fi

# erasing flash
python ./espwrite.py
sleep 1
echo "Erasing flash"
esptool.py --port /dev/ttyAMA0 erase_flash

# programming flash
python ./espwrite.py
sleep 1
echo "Writing flash"
esptool.py --port /dev/ttyAMA0 --baud 460800 write_flash --flash_size=8m 0 at-esp8266-firmware-latest.bin

# resetting chip
python ./espreset.py

exit 0

