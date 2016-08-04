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

newline
if ! check_network; then
    if [ -f ./mp-esp8266-firmware-latest.bin ]; then
        echo "You don't appear to be connected to the internet, but we can use a local file"
        if ! confirm "Do you wish to continue?"; then
            echo "Aborting..."
            exit 1
        fi
    else
        warning "You don't appear to be connected to the internet, please check your connection and try again!"
        echo "Aborting..."
        exit 1
    fi
else
    echo "Downloading firmware"
    newline
    rm -f ./mp-esp8266-firmware-latest.bin &> /dev/null
    wget http://kaltpost.de/~wendlers/micropython/mp-esp8266-firmware-latest.bin
fi

# erasing flash

echo "Ready to flash firmware"
if confirm "Would you like to erase the chip first?"; then
    newline
    python ./espwrite.py
    sleep 1
    echo "Erasing flash"
    esptool.py -p /dev/ttyAMA0 erase_flash
    sleep 1
fi

# programming flash

newline
python ./espwrite.py
sleep 1
echo "Writing flash"
esptool.py -p /dev/ttyAMA0 -b 115200 write_flash --flash_size=8m 0 mp-esp8266-firmware-latest.bin

# resetting chip

python ./espreset.py
newline

exit 0
