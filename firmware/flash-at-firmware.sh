#!/bin/bash

confirm() {
    if [ "$FORCE" == '-y' ]; then
        true
    else
        read -r -p "$1 [y/N] " response < /dev/tty
        if [[ $response =~ ^(yes|y|Y)$ ]]; then
            true
        else
            false
        fi
    fi
}

success() {
    echo "$(tput setaf 2)$1$(tput sgr0)"
}

warning() {
    echo "$(tput setaf 1)$1$(tput sgr0)"
}

newline() {
    echo ""
}

check_network() {
    sudo ping -q -w 1 -c 1 `ip r | grep default | cut -d ' ' -f 3` &> /dev/null && return 0 || return 1
}

# download firmware if required

if [ -f ./at-esp8266-firmware-latest.bin ]; then
    echo "AT firmware found!"
else
    warning "AT firmware not found!"
    echo "Aborting..."
    exit 1
fi

# erasing flash

python ./espwrite.py
sleep 1
echo "Erasing flash"
esptool.py -p /dev/ttyAMA0 erase_flash
sleep 1

# programming flash

python ./espwrite.py
sleep 1
echo "Writing flash"
esptool.py -p /dev/ttyAMA0 -b 115200 write_flash --flash_size=8m 0 at-esp8266-firmware-latest.bin

# resetting chip

python ./espreset.py

exit 0
