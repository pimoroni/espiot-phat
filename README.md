# ESP IoT pHAT
https://shop.pimoroni.com/products/esp8266-phat

This repository presents a collection of tools and utility for the ESP IoT pHAT, an ESP8266 based breakout board for the Raspberry Pi.

## Installing

### Full install (recommended):

We've created an easy installation script that will install all pre-requisites and get your ESP IoT pHAT up and running with minimal efforts. To run it, fire up Terminal which you'll find in Menu -> Accessories -> Terminal
on your Raspberry Pi desktop, as illustrated below:

![Finding the terminal](http://get.pimoroni.com/resources/github-repo-terminal.png)

In the new terminal window type the command exactly as it appears below (check for typos) and follow the on-screen instructions:

```bash
curl https://get.pimoroni.com/espiotphat | bash
```

Alternatively, on Raspbian, you can download the `pimoroni-dashboard` and install your product by browsing to the relevant entry:

```bash
sudo apt-get install pimoroni
```
(you will find the Dashboard under 'Accessories' too, in the Pi menu - or just run `pimoroni-dashboard` at the command line)

If you choose to download firmwares you'll find them in `/home/pi/Pimoroni/espiotphat/`.

## Important note

The Raspberry Pi 3 and Raspberry Pi Zero W hijack the main UART interface to drive the bluetooth chip. This is problematic as  timing in communication is critical for programming microcontrolers over serial and the so-called mini-UART, active over the GPIO, leaves much to be desired in this respect.

If you ran the above one-line installer you should be all set, but if you decided to manually set up your tool chain then you will want to ensure that the correct UART interface is used for communication with your microcontroller. There are numerous ways to do that, but the easiest is to load a device tree overlay that disables bluetooth altogether, and switches UART communication over the GPIO to the main interface.

To do so, add the following to your `/boot/config.txt` file:

```
dtoverlay=pi3-disable-bt
```

## Firmware flashing

We have put together a collection of tools to help you flash the ESP8266 on board of the ESP IoT pHAT in the firmware folder. Check out the README in that location for details!

## Acknowledgement

Thanks to Richard Hayler, Paul Byford, Stefan Wendler, Fredrik Ahlberg and Andrew Cross for indirectly contributing to the utilities and documentation included in this repository.
