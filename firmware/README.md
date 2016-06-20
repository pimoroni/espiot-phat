# Flashing the ESP

This directory aims to provide useful utilities and tools to flash the ESP8266.

The following are currently available, and aimed at different purposes:

* espflash.py

this python script puts the ESP8266 into programming mode, and waits 60 seconds before resetting the chip. It can be used alongside the Arduino IDE (for example) to bring the chip in and out of bootloader mode.

* espwrite.py

this python script puts the ESP8266 into programming mode and exits. It can be used when you want to automate the process of flashing as part of your pwn scripts, or want as long as you wish to flash the chip.

* espreset.py

this python script resets the ESP8266. It is usually used to bring the chip out of programming mode, but it can be called whenever you'd like to reboot the board without physically disconnecting the board.

* flash-mp-firmware.sh

this shell script downloads and flashes the latest ESP8266 micropython firmware. The firmware itself is pulled from http://www.kaltpost.de/~wendlers/micropython/ and is an unofficial nightly build. Please ensure you review the information in the README available there for further details.

Note that all of these utilties require esptool to be installed. You may grab the latest version from: https://github.com/themadinventor/esptool

Disclaimer: all tools and utilities included herein should be safe to use and cause no harm to your hardware. We however can take no responsibilities should something untowards occur in the process of using them. Use at your own risk!