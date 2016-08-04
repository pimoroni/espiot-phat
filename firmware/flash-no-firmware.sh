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

# erasing flash

newline
warning "This script will erase the ESP8266 chip"
warning "no new firmware will be flashed!"
newline
if confirm "Would you like to continue?"; then
    newline
    python ./espwrite.py
    sleep 1
    echo "Erasing flash"
    esptool.py -p /dev/ttyAMA0 erase_flash
    sleep 1
else
    echo "Aborting!"
    exit 1
fi

# resetting chip

python ./espreset.py
newline

exit 0
