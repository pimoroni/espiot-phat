# Flashing the ESP

This directory aims to provide useful utilities and tools to flash the ESP8266.

The following are currently available, and aimed at different purposes:

* espflash.py

This python script puts the ESP8266 into programming mode, and waits 60 seconds before resetting the chip. It can be used alongside the Arduino IDE for example to bring the chip in and out of bootloader mode.

* espwrite.py

This python script puts the ESP8266 into programming mode and exits. It can be used when you want to automate the process of flashing as part of your own scripts, or want unlimited time to flash the chip.

* espreset.py

This python script resets the ESP8266. It is usually used to bring the chip out of programming mode, but it can be called whenever you'd like to reboot the board without physically disconnecting the board.

* flash-at-firmware.sh

This shell script flashes the AT firmware originally found on the chip, or a newer version, depending on when you acquired the ESP IoT pHAT. It is useful either to return to the AT firmware after trying an alternative, or to upgrade the firmware.

* flash-mp-firmware.sh

This shell script downloads and flashes the latest ESP8266 micropython firmware (current release). The firmware itself is pulled from the official MicroPython download repository and is the current release at the time the script was last updated. Please check http://micropython.org/download/ to verify the script uses the current version.

* flash-no-firmware.sh

This shell script erases the chip without flashing a new firmware onto it. It is not normally require to run this script by itself but it is provided in case it proves useful in specific situations.


Note that all of these utilities require esptool to be installed. You may grab the latest version from: https://github.com/themadinventor/esptool

Disclaimer: all tools and utilities included herein should be safe to use and cause no harm to your hardware. We however can take no responsibilities should something untowards occur in the process of using them. Use at your own risk!
